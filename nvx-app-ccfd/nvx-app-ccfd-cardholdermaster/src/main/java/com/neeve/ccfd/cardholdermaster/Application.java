package com.neeve.ccfd.cardholdermaster;

import java.text.ParseException;
import java.util.Date;
import java.util.Iterator;

import com.neeve.aep.AepEngine;
import com.neeve.aep.AepMessageSender;
import com.neeve.aep.IAepApplicationStateFactory;
import com.neeve.aep.annotations.EventHandler;
import com.neeve.ccfd.cardholdermaster.state.CardHolder;
import com.neeve.ccfd.cardholdermaster.state.IPaymentTransaction;
import com.neeve.ccfd.cardholdermaster.state.PaymentTransaction;
import com.neeve.ccfd.cardholdermaster.state.Repository;
import com.neeve.ccfd.messages.AuthorizationDeclinedMessage;
import com.neeve.ccfd.messages.AuthorizationRequestMessage;
import com.neeve.ccfd.messages.FraudAnalysisRequestMessage;
import com.neeve.ccfd.messages.NewCardHolderMessage;
import com.neeve.ccfd.messages.PaymentTransactionDTO;
import com.neeve.ccfd.util.TestDataGenerator;
import com.neeve.cli.annotations.Command;
import com.neeve.cli.annotations.Configured;
import com.neeve.cli.annotations.Option;
import com.neeve.ods.IStoreQueryEngine;
import com.neeve.ods.IStoreQueryResultSet;
import com.neeve.server.app.annotations.AppHAPolicy;
import com.neeve.server.app.annotations.AppInjectionPoint;
import com.neeve.server.app.annotations.AppStat;
import com.neeve.server.app.annotations.AppStateFactoryAccessor;
import com.neeve.sma.MessageView;
import com.neeve.stats.IStats.Counter;
import com.neeve.stats.IStats.Latencies;
import com.neeve.stats.StatsFactory;
import com.neeve.util.UtlTime;

@AppHAPolicy(value = AepEngine.HAPolicy.StateReplication)
public class Application {

    private final TestDataGenerator testDataGenerator = new TestDataGenerator(100);
    private AepMessageSender _messageSender;
    private IStoreQueryEngine queryEngine;

    @AppStat
    private final Counter authorizationRequestCount = StatsFactory.createCounterStat("Authorization Request Received Count");
    @AppStat
    private final Counter newCardHolderRequestCount = StatsFactory.createCounterStat("New CardHolder Request Received Count");
    @AppStat
    private final Counter unknownCardHolderRequestCount = StatsFactory.createCounterStat("Unknown CardHolder Request Received Count");
    @AppStat
    private final Latencies authorizationProcessingLatencies = StatsFactory.createLatencyStat("Authorization Processing Time");
    private volatile long lastCardHolderSeededTime = 0;

    @AppStat(name = "Txn Query Enabled")
    @Configured(property = "cardholdermaster.queryTransactions", defaultValue = "false")
    private boolean queryTransactions;

    private boolean isTransactionFraudulent(final CardHolder cardholder, final AuthorizationRequestMessage authRequest) {
        long ts = System.nanoTime();

        boolean invalid = false;

        if (cardholder != null) {
            if (!queryTransactions) {
                final Iterator<PaymentTransaction> transactions = cardholder.getHistory().iterator();
                while (transactions.hasNext()) {
                    @SuppressWarnings("unused")
                    IPaymentTransaction transaction = transactions.next();

                    // TODO: Here is where business specific fraud check 
                    // logic would be inserted. For now we are just iterating
                    // all of the transactions, and simulating the cost of 
                    // business logic by spinning for 100us below.
                    //
                    // During this phase you would likely also be computing
                    // features to pass on to the the Machine Learning check
                    // further on in the pipeling. For example, you might have
                    // defined a feature based on whether the card holder has
                    // made a purchase from this vendor in the past, or perhaps
                    // percentiles in the card holder's transaction amount. 
                    //
                    // Having all of the transaction history in memory is what
                    // makes this sort of processsing possible directly within
                    // the transaction processing stream!
                }
            }
            else {
                // It is also possible that rather than raw iteration,
                // one might use the platform's SQL query semantics to 
                // query the transactions in memory. 
                //
                final IStoreQueryResultSet results = queryEngine.execute("SELECT PaymentTransaction FROM store where PaymentTransaction.cardNumber = '" + authRequest.getNewTransaction().getCardNumber() + "'");
                while (results.next()) {
                    @SuppressWarnings("unused")
                    IPaymentTransaction transaction = (IPaymentTransaction)results.getStoreObject();
                }
            }

            invalid = false;
        }
        else {
            unknownCardHolderRequestCount.increment();
            invalid = true;
        }

        // busy spin to simulate additional work. 
        while ((System.nanoTime() - ts) < 100000) {}
        return invalid;
    }

    @AppStateFactoryAccessor
    final public IAepApplicationStateFactory getStateFactory() {
        return new IAepApplicationStateFactory() {
            @Override
            final public Repository createState(MessageView view) {
                return Repository.create();
            }
        };
    }

    @AppInjectionPoint
    final public void setMessageSender(AepMessageSender messageSender) {
        _messageSender = messageSender;
    }

    @AppInjectionPoint
    final public void setEngine(AepEngine engine) {
        if (queryTransactions) {
            this.queryEngine = engine.getStore().getQueryEngine();
        }
    }

    @EventHandler
    final public void handleNewCardHolder(NewCardHolderMessage message, Repository repository) throws Exception {
        // stats
        newCardHolderRequestCount.increment();
        lastCardHolderSeededTime = System.currentTimeMillis();

        // add card holder
        CardHolder cardHolder = CardHolder.create();
        cardHolder.setCardHolderIdFrom(message.getCardHolderIdUnsafe());
        Iterator<PaymentTransactionDTO> transactions = message.getHistoryIterator();
        while (transactions.hasNext()) {
            PaymentTransactionDTO dto = transactions.next();
            PaymentTransaction transaction = PaymentTransaction.create();
            transaction.setCardNumberFrom(dto.getCardNumberUnsafe());
            transaction.setPaymentTransactionIdFrom(dto.getTransactionIdUnsafe());
            transaction.setMerchantIdFrom(dto.getMerchantIdUnsafe());
            transaction.setMerchantStoreIdFrom(dto.getMerchantStoreIdUnsafe());
            cardHolder.getHistory().add(transaction);
        }
        repository.getCardHolders().put(cardHolder.getCardHolderId(), cardHolder);
    }

    @EventHandler
    final public void onAuthorizationRequest(AuthorizationRequestMessage authRequest, Repository repository) {
        // stats
        authorizationRequestCount.increment();
        long start = UtlTime.now();

        final CardHolder cardholder = repository.getCardHolders().get(authRequest.getCardHolderId());

        /****
         * This is where one would do the non-hardware accelerated fraud checks. 
         * In the code here, we simulate the fraud check by iterating the through all
         * the entire transaction history and add a busy spin to simulate actual detection
         * logic cpu usage:  
         ****/
        if (!isTransactionFraudulent(cardholder, authRequest)) {
            FraudAnalysisRequestMessage outboundMessage = FraudAnalysisRequestMessage.create();
            outboundMessage.setRequestIdFrom(authRequest.getRequestIdUnsafe());
            outboundMessage.setFlowStartTs(authRequest.getFlowStartTs());
            outboundMessage.setNewTransaction(testDataGenerator.generateTransformedTransactionMessage(authRequest.getNewTransaction()));
            outboundMessage.setCardHolderIdFrom(authRequest.getCardHolderIdUnsafe());
            outboundMessage.setMerchantStoreCountryCodeFrom(authRequest.getMerchantStoreCountryCodeUnsafe());
            outboundMessage.setMerchantStorePostcodeFrom(authRequest.getMerchantStorePostcodeUnsafe());

            // Fraud Analyzer has no partitioned state. We know that in our demo it will have same number of shards for 
            // cardholdermaster and fraudanalyzer, so we will use cardholder ID to make shard key for fraud analyzer. 
            // We could choose anything to make fraudanalyzer shard key, including generating with RNG,
            // as long as it will result in spreading the message load evenly across fraud analyzer instances. 
            _messageSender.sendMessage("authreq4", outboundMessage);
            authorizationProcessingLatencies.add(UtlTime.now() - start);
        }
        else {
            AuthorizationDeclinedMessage authorizationResponseMessage = AuthorizationDeclinedMessage.create();
            authorizationResponseMessage.setFlowStartTs(authRequest.getFlowStartTs());
            authorizationResponseMessage.setRequestIdFrom(authRequest.getRequestIdUnsafe());
            authorizationResponseMessage.setDecisionScore(0);
            authorizationResponseMessage.setCardHolderIdFrom(authRequest.getCardHolderIdUnsafe());
            authorizationResponseMessage.setNewTransaction(authRequest.getNewTransaction().copy());
            _messageSender.sendMessage("authresp", authorizationResponseMessage);
            authorizationProcessingLatencies.add(UtlTime.now() - start);
        }
    }

    @Command(name = "newCardHoldersSeededSince", description = "Checks if new card holders have been seeded since the given time")
    public boolean newCardHoldersSeededSince(@Option(shortForm = 's', longForm = "since", description = "Specifies the duration over which to check if a new card holder has been seeded") Date since) throws ParseException {
        return new Date(lastCardHolderSeededTime).after(since);
    }
}
