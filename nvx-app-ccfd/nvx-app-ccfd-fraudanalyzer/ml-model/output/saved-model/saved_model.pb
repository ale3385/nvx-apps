На
╬д
:
Add
x"T
y"T
z"T"
Ttype:
2	
ю
	ApplyAdam
var"TА	
m"TА	
v"TА
beta1_power"T
beta2_power"T
lr"T

beta1"T

beta2"T
epsilon"T	
grad"T
out"TА" 
Ttype:
2	"
use_lockingbool( "
use_nesterovbool( 
Ы
ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
x
Assign
ref"TА

value"T

output_ref"TА"	
Ttype"
validate_shapebool("
use_lockingbool(Ш
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
8
Const
output"dtype"
valuetensor"
dtypetype
B
Equal
x"T
y"T
z
"
Ttype:
2	
Р
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
,
Floor
x"T
y"T"
Ttype:
2
.
Identity

input"T
output"T"	
Ttype
,
Log
x"T
y"T"
Ttype:

2
p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
Н
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(И
=
Mul
x"T
y"T
z"T"
Ttype:
2	Р
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	И
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
5

Reciprocal
x"T
y"T"
Ttype:

2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
=
SigmoidGrad
y"T
dy"T
z"T"
Ttype:

2
9
Softmax
logits"T
softmax"T"
Ttype:
2
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
М
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
А
TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	И
s

VariableV2
ref"dtypeА"
shapeshape"
dtypetype"
	containerstring "
shared_namestring И"serve*1.8.02b'v1.8.0-0-g93bc2e2072'Яь
F
pkeepPlaceholder*
dtype0*
_output_shapes
: *
shape: 
l
	inputdataPlaceholder*
dtype0*'
_output_shapes
:         %*
shape:         %
g
truncated_normal/shapeConst*
valueB"%      *
dtype0*
_output_shapes
:
Z
truncated_normal/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
\
truncated_normal/stddevConst*
valueB
 *ЪЩ>*
dtype0*
_output_shapes
: 
Ъ
 truncated_normal/TruncatedNormalTruncatedNormaltruncated_normal/shape*
T0*
dtype0*
_output_shapes

:%*
seed2 *

seed 

truncated_normal/mulMul truncated_normal/TruncatedNormaltruncated_normal/stddev*
T0*
_output_shapes

:%
m
truncated_normalAddtruncated_normal/multruncated_normal/mean*
T0*
_output_shapes

:%
|
Variable
VariableV2*
dtype0*
_output_shapes

:%*
shared_name *
	container *
shape
:%
д
Variable/AssignAssignVariabletruncated_normal*
T0*
_output_shapes

:%*
use_locking(*
validate_shape(*
_class
loc:@Variable
i
Variable/readIdentityVariable*
T0*
_output_shapes

:%*
_class
loc:@Variable
R
zerosConst*
valueB*    *
dtype0*
_output_shapes
:
v

Variable_1
VariableV2*
dtype0*
_output_shapes
:*
shared_name *
	container *
shape:
Ы
Variable_1/AssignAssign
Variable_1zeros*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_1
k
Variable_1/readIdentity
Variable_1*
T0*
_output_shapes
:*
_class
loc:@Variable_1
В
MatMulMatMul	inputdataVariable/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         
U
addAddMatMulVariable_1/read*
T0*'
_output_shapes
:         
I
SigmoidSigmoidadd*
T0*'
_output_shapes
:         
i
truncated_normal_1/shapeConst*
valueB"      *
dtype0*
_output_shapes
:
\
truncated_normal_1/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
^
truncated_normal_1/stddevConst*
valueB
 *ЪЩ>*
dtype0*
_output_shapes
: 
Ю
"truncated_normal_1/TruncatedNormalTruncatedNormaltruncated_normal_1/shape*
T0*
dtype0*
_output_shapes

:*
seed2 *

seed 
Е
truncated_normal_1/mulMul"truncated_normal_1/TruncatedNormaltruncated_normal_1/stddev*
T0*
_output_shapes

:
s
truncated_normal_1Addtruncated_normal_1/multruncated_normal_1/mean*
T0*
_output_shapes

:
~

Variable_2
VariableV2*
dtype0*
_output_shapes

:*
shared_name *
	container *
shape
:
м
Variable_2/AssignAssign
Variable_2truncated_normal_1*
T0*
_output_shapes

:*
use_locking(*
validate_shape(*
_class
loc:@Variable_2
o
Variable_2/readIdentity
Variable_2*
T0*
_output_shapes

:*
_class
loc:@Variable_2
T
zeros_1Const*
valueB*    *
dtype0*
_output_shapes
:
v

Variable_3
VariableV2*
dtype0*
_output_shapes
:*
shared_name *
	container *
shape:
Э
Variable_3/AssignAssign
Variable_3zeros_1*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_3
k
Variable_3/readIdentity
Variable_3*
T0*
_output_shapes
:*
_class
loc:@Variable_3
Д
MatMul_1MatMulSigmoidVariable_2/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         
Y
add_1AddMatMul_1Variable_3/read*
T0*'
_output_shapes
:         
M
	Sigmoid_1Sigmoidadd_1*
T0*'
_output_shapes
:         
i
truncated_normal_2/shapeConst*
valueB"   (   *
dtype0*
_output_shapes
:
\
truncated_normal_2/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
^
truncated_normal_2/stddevConst*
valueB
 *ЪЩ>*
dtype0*
_output_shapes
: 
Ю
"truncated_normal_2/TruncatedNormalTruncatedNormaltruncated_normal_2/shape*
T0*
dtype0*
_output_shapes

:(*
seed2 *

seed 
Е
truncated_normal_2/mulMul"truncated_normal_2/TruncatedNormaltruncated_normal_2/stddev*
T0*
_output_shapes

:(
s
truncated_normal_2Addtruncated_normal_2/multruncated_normal_2/mean*
T0*
_output_shapes

:(
~

Variable_4
VariableV2*
dtype0*
_output_shapes

:(*
shared_name *
	container *
shape
:(
м
Variable_4/AssignAssign
Variable_4truncated_normal_2*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_4
o
Variable_4/readIdentity
Variable_4*
T0*
_output_shapes

:(*
_class
loc:@Variable_4
T
zeros_2Const*
valueB(*    *
dtype0*
_output_shapes
:(
v

Variable_5
VariableV2*
dtype0*
_output_shapes
:(*
shared_name *
	container *
shape:(
Э
Variable_5/AssignAssign
Variable_5zeros_2*
T0*
_output_shapes
:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_5
k
Variable_5/readIdentity
Variable_5*
T0*
_output_shapes
:(*
_class
loc:@Variable_5
Ж
MatMul_2MatMul	Sigmoid_1Variable_4/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         (
Y
add_2AddMatMul_2Variable_5/read*
T0*'
_output_shapes
:         (
M
	Sigmoid_2Sigmoidadd_2*
T0*'
_output_shapes
:         (
V
dropout/ShapeShape	Sigmoid_2*
T0*
out_type0*
_output_shapes
:
_
dropout/random_uniform/minConst*
valueB
 *    *
dtype0*
_output_shapes
: 
_
dropout/random_uniform/maxConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ь
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape*
T0*
dtype0*'
_output_shapes
:         (*
seed2 *

seed 
z
dropout/random_uniform/subSubdropout/random_uniform/maxdropout/random_uniform/min*
T0*
_output_shapes
: 
Х
dropout/random_uniform/mulMul$dropout/random_uniform/RandomUniformdropout/random_uniform/sub*
T0*'
_output_shapes
:         (
З
dropout/random_uniformAdddropout/random_uniform/muldropout/random_uniform/min*
T0*'
_output_shapes
:         (
c
dropout/addAddpkeepdropout/random_uniform*
T0*'
_output_shapes
:         (
U
dropout/FloorFloordropout/add*
T0*'
_output_shapes
:         (
Z
dropout/divRealDiv	Sigmoid_2pkeep*
T0*'
_output_shapes
:         (
`
dropout/mulMuldropout/divdropout/Floor*
T0*'
_output_shapes
:         (
i
truncated_normal_3/shapeConst*
valueB"(      *
dtype0*
_output_shapes
:
\
truncated_normal_3/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
^
truncated_normal_3/stddevConst*
valueB
 *ЪЩ>*
dtype0*
_output_shapes
: 
Ю
"truncated_normal_3/TruncatedNormalTruncatedNormaltruncated_normal_3/shape*
T0*
dtype0*
_output_shapes

:(*
seed2 *

seed 
Е
truncated_normal_3/mulMul"truncated_normal_3/TruncatedNormaltruncated_normal_3/stddev*
T0*
_output_shapes

:(
s
truncated_normal_3Addtruncated_normal_3/multruncated_normal_3/mean*
T0*
_output_shapes

:(
~

Variable_6
VariableV2*
dtype0*
_output_shapes

:(*
shared_name *
	container *
shape
:(
м
Variable_6/AssignAssign
Variable_6truncated_normal_3*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_6
o
Variable_6/readIdentity
Variable_6*
T0*
_output_shapes

:(*
_class
loc:@Variable_6
T
zeros_3Const*
valueB*    *
dtype0*
_output_shapes
:
v

Variable_7
VariableV2*
dtype0*
_output_shapes
:*
shared_name *
	container *
shape:
Э
Variable_7/AssignAssign
Variable_7zeros_3*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_7
k
Variable_7/readIdentity
Variable_7*
T0*
_output_shapes
:*
_class
loc:@Variable_7
И
MatMul_3MatMuldropout/mulVariable_6/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         
Y
add_3AddMatMul_3Variable_7/read*
T0*'
_output_shapes
:         
K
SoftmaxSoftmaxadd_3*
T0*'
_output_shapes
:         
x
normal_fraud_featuresPlaceholder*
dtype0*'
_output_shapes
:         *
shape:         
E
LogLogSoftmax*
T0*'
_output_shapes
:         
X
mulMulnormal_fraud_featuresLog*
T0*'
_output_shapes
:         
V
ConstConst*
valueB"       *
dtype0*
_output_shapes
:
T
SumSummulConst*
	keep_dims( *
T0*
_output_shapes
: *

Tidx0
0
NegNegSum*
T0*
_output_shapes
: 
R
gradients/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
X
gradients/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
o
gradients/FillFillgradients/Shapegradients/grad_ys_0*
T0*
_output_shapes
: *

index_type0
N
gradients/Neg_grad/NegNeggradients/Fill*
T0*
_output_shapes
: 
q
 gradients/Sum_grad/Reshape/shapeConst*
valueB"      *
dtype0*
_output_shapes
:
Ц
gradients/Sum_grad/ReshapeReshapegradients/Neg_grad/Neg gradients/Sum_grad/Reshape/shape*
T0*
Tshape0*
_output_shapes

:
[
gradients/Sum_grad/ShapeShapemul*
T0*
out_type0*
_output_shapes
:
Щ
gradients/Sum_grad/TileTilegradients/Sum_grad/Reshapegradients/Sum_grad/Shape*
T0*'
_output_shapes
:         *

Tmultiples0
m
gradients/mul_grad/ShapeShapenormal_fraud_features*
T0*
out_type0*
_output_shapes
:
]
gradients/mul_grad/Shape_1ShapeLog*
T0*
out_type0*
_output_shapes
:
┤
(gradients/mul_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_grad/Shapegradients/mul_grad/Shape_1*
T0*2
_output_shapes 
:         :         
m
gradients/mul_grad/MulMulgradients/Sum_grad/TileLog*
T0*'
_output_shapes
:         
Я
gradients/mul_grad/SumSumgradients/mul_grad/Mul(gradients/mul_grad/BroadcastGradientArgs*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
Ч
gradients/mul_grad/ReshapeReshapegradients/mul_grad/Sumgradients/mul_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         
Б
gradients/mul_grad/Mul_1Mulnormal_fraud_featuresgradients/Sum_grad/Tile*
T0*'
_output_shapes
:         
е
gradients/mul_grad/Sum_1Sumgradients/mul_grad/Mul_1*gradients/mul_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
Э
gradients/mul_grad/Reshape_1Reshapegradients/mul_grad/Sum_1gradients/mul_grad/Shape_1*
T0*
Tshape0*'
_output_shapes
:         
g
#gradients/mul_grad/tuple/group_depsNoOp^gradients/mul_grad/Reshape^gradients/mul_grad/Reshape_1
┌
+gradients/mul_grad/tuple/control_dependencyIdentitygradients/mul_grad/Reshape$^gradients/mul_grad/tuple/group_deps*
T0*'
_output_shapes
:         *-
_class#
!loc:@gradients/mul_grad/Reshape
р
-gradients/mul_grad/tuple/control_dependency_1Identitygradients/mul_grad/Reshape_1$^gradients/mul_grad/tuple/group_deps*
T0*'
_output_shapes
:         */
_class%
#!loc:@gradients/mul_grad/Reshape_1
Ц
gradients/Log_grad/Reciprocal
ReciprocalSoftmax.^gradients/mul_grad/tuple/control_dependency_1*
T0*'
_output_shapes
:         
Э
gradients/Log_grad/mulMul-gradients/mul_grad/tuple/control_dependency_1gradients/Log_grad/Reciprocal*
T0*'
_output_shapes
:         
t
gradients/Softmax_grad/mulMulgradients/Log_grad/mulSoftmax*
T0*'
_output_shapes
:         
v
,gradients/Softmax_grad/Sum/reduction_indicesConst*
valueB:*
dtype0*
_output_shapes
:
╢
gradients/Softmax_grad/SumSumgradients/Softmax_grad/mul,gradients/Softmax_grad/Sum/reduction_indices*
	keep_dims( *
T0*#
_output_shapes
:         *

Tidx0
u
$gradients/Softmax_grad/Reshape/shapeConst*
valueB"       *
dtype0*
_output_shapes
:
л
gradients/Softmax_grad/ReshapeReshapegradients/Softmax_grad/Sum$gradients/Softmax_grad/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:         
Л
gradients/Softmax_grad/subSubgradients/Log_grad/mulgradients/Softmax_grad/Reshape*
T0*'
_output_shapes
:         
z
gradients/Softmax_grad/mul_1Mulgradients/Softmax_grad/subSoftmax*
T0*'
_output_shapes
:         
b
gradients/add_3_grad/ShapeShapeMatMul_3*
T0*
out_type0*
_output_shapes
:
f
gradients/add_3_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
║
*gradients/add_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_3_grad/Shapegradients/add_3_grad/Shape_1*
T0*2
_output_shapes 
:         :         
й
gradients/add_3_grad/SumSumgradients/Softmax_grad/mul_1*gradients/add_3_grad/BroadcastGradientArgs*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
Э
gradients/add_3_grad/ReshapeReshapegradients/add_3_grad/Sumgradients/add_3_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         
н
gradients/add_3_grad/Sum_1Sumgradients/Softmax_grad/mul_1,gradients/add_3_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
Ц
gradients/add_3_grad/Reshape_1Reshapegradients/add_3_grad/Sum_1gradients/add_3_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
m
%gradients/add_3_grad/tuple/group_depsNoOp^gradients/add_3_grad/Reshape^gradients/add_3_grad/Reshape_1
т
-gradients/add_3_grad/tuple/control_dependencyIdentitygradients/add_3_grad/Reshape&^gradients/add_3_grad/tuple/group_deps*
T0*'
_output_shapes
:         */
_class%
#!loc:@gradients/add_3_grad/Reshape
█
/gradients/add_3_grad/tuple/control_dependency_1Identitygradients/add_3_grad/Reshape_1&^gradients/add_3_grad/tuple/group_deps*
T0*
_output_shapes
:*1
_class'
%#loc:@gradients/add_3_grad/Reshape_1
└
gradients/MatMul_3_grad/MatMulMatMul-gradients/add_3_grad/tuple/control_dependencyVariable_6/read*
T0*
transpose_b(*
transpose_a( *'
_output_shapes
:         (
╡
 gradients/MatMul_3_grad/MatMul_1MatMuldropout/mul-gradients/add_3_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes

:(
t
(gradients/MatMul_3_grad/tuple/group_depsNoOp^gradients/MatMul_3_grad/MatMul!^gradients/MatMul_3_grad/MatMul_1
ь
0gradients/MatMul_3_grad/tuple/control_dependencyIdentitygradients/MatMul_3_grad/MatMul)^gradients/MatMul_3_grad/tuple/group_deps*
T0*'
_output_shapes
:         (*1
_class'
%#loc:@gradients/MatMul_3_grad/MatMul
щ
2gradients/MatMul_3_grad/tuple/control_dependency_1Identity gradients/MatMul_3_grad/MatMul_1)^gradients/MatMul_3_grad/tuple/group_deps*
T0*
_output_shapes

:(*3
_class)
'%loc:@gradients/MatMul_3_grad/MatMul_1
k
 gradients/dropout/mul_grad/ShapeShapedropout/div*
T0*
out_type0*
_output_shapes
:
o
"gradients/dropout/mul_grad/Shape_1Shapedropout/Floor*
T0*
out_type0*
_output_shapes
:
╠
0gradients/dropout/mul_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/dropout/mul_grad/Shape"gradients/dropout/mul_grad/Shape_1*
T0*2
_output_shapes 
:         :         
Ш
gradients/dropout/mul_grad/MulMul0gradients/MatMul_3_grad/tuple/control_dependencydropout/Floor*
T0*'
_output_shapes
:         (
╖
gradients/dropout/mul_grad/SumSumgradients/dropout/mul_grad/Mul0gradients/dropout/mul_grad/BroadcastGradientArgs*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
п
"gradients/dropout/mul_grad/ReshapeReshapegradients/dropout/mul_grad/Sum gradients/dropout/mul_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         (
Ш
 gradients/dropout/mul_grad/Mul_1Muldropout/div0gradients/MatMul_3_grad/tuple/control_dependency*
T0*'
_output_shapes
:         (
╜
 gradients/dropout/mul_grad/Sum_1Sum gradients/dropout/mul_grad/Mul_12gradients/dropout/mul_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
╡
$gradients/dropout/mul_grad/Reshape_1Reshape gradients/dropout/mul_grad/Sum_1"gradients/dropout/mul_grad/Shape_1*
T0*
Tshape0*'
_output_shapes
:         (

+gradients/dropout/mul_grad/tuple/group_depsNoOp#^gradients/dropout/mul_grad/Reshape%^gradients/dropout/mul_grad/Reshape_1
·
3gradients/dropout/mul_grad/tuple/control_dependencyIdentity"gradients/dropout/mul_grad/Reshape,^gradients/dropout/mul_grad/tuple/group_deps*
T0*'
_output_shapes
:         (*5
_class+
)'loc:@gradients/dropout/mul_grad/Reshape
А
5gradients/dropout/mul_grad/tuple/control_dependency_1Identity$gradients/dropout/mul_grad/Reshape_1,^gradients/dropout/mul_grad/tuple/group_deps*
T0*'
_output_shapes
:         (*7
_class-
+)loc:@gradients/dropout/mul_grad/Reshape_1
i
 gradients/dropout/div_grad/ShapeShape	Sigmoid_2*
T0*
out_type0*
_output_shapes
:
e
"gradients/dropout/div_grad/Shape_1Const*
valueB *
dtype0*
_output_shapes
: 
╠
0gradients/dropout/div_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/dropout/div_grad/Shape"gradients/dropout/div_grad/Shape_1*
T0*2
_output_shapes 
:         :         
Ы
"gradients/dropout/div_grad/RealDivRealDiv3gradients/dropout/mul_grad/tuple/control_dependencypkeep*
T0*'
_output_shapes
:         (
╗
gradients/dropout/div_grad/SumSum"gradients/dropout/div_grad/RealDiv0gradients/dropout/div_grad/BroadcastGradientArgs*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
п
"gradients/dropout/div_grad/ReshapeReshapegradients/dropout/div_grad/Sum gradients/dropout/div_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         (
b
gradients/dropout/div_grad/NegNeg	Sigmoid_2*
T0*'
_output_shapes
:         (
И
$gradients/dropout/div_grad/RealDiv_1RealDivgradients/dropout/div_grad/Negpkeep*
T0*'
_output_shapes
:         (
О
$gradients/dropout/div_grad/RealDiv_2RealDiv$gradients/dropout/div_grad/RealDiv_1pkeep*
T0*'
_output_shapes
:         (
▓
gradients/dropout/div_grad/mulMul3gradients/dropout/mul_grad/tuple/control_dependency$gradients/dropout/div_grad/RealDiv_2*
T0*'
_output_shapes
:         (
╗
 gradients/dropout/div_grad/Sum_1Sumgradients/dropout/div_grad/mul2gradients/dropout/div_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
д
$gradients/dropout/div_grad/Reshape_1Reshape gradients/dropout/div_grad/Sum_1"gradients/dropout/div_grad/Shape_1*
T0*
Tshape0*
_output_shapes
: 

+gradients/dropout/div_grad/tuple/group_depsNoOp#^gradients/dropout/div_grad/Reshape%^gradients/dropout/div_grad/Reshape_1
·
3gradients/dropout/div_grad/tuple/control_dependencyIdentity"gradients/dropout/div_grad/Reshape,^gradients/dropout/div_grad/tuple/group_deps*
T0*'
_output_shapes
:         (*5
_class+
)'loc:@gradients/dropout/div_grad/Reshape
я
5gradients/dropout/div_grad/tuple/control_dependency_1Identity$gradients/dropout/div_grad/Reshape_1,^gradients/dropout/div_grad/tuple/group_deps*
T0*
_output_shapes
: *7
_class-
+)loc:@gradients/dropout/div_grad/Reshape_1
е
$gradients/Sigmoid_2_grad/SigmoidGradSigmoidGrad	Sigmoid_23gradients/dropout/div_grad/tuple/control_dependency*
T0*'
_output_shapes
:         (
b
gradients/add_2_grad/ShapeShapeMatMul_2*
T0*
out_type0*
_output_shapes
:
f
gradients/add_2_grad/Shape_1Const*
valueB:(*
dtype0*
_output_shapes
:
║
*gradients/add_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_2_grad/Shapegradients/add_2_grad/Shape_1*
T0*2
_output_shapes 
:         :         
▒
gradients/add_2_grad/SumSum$gradients/Sigmoid_2_grad/SigmoidGrad*gradients/add_2_grad/BroadcastGradientArgs*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
Э
gradients/add_2_grad/ReshapeReshapegradients/add_2_grad/Sumgradients/add_2_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         (
╡
gradients/add_2_grad/Sum_1Sum$gradients/Sigmoid_2_grad/SigmoidGrad,gradients/add_2_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
Ц
gradients/add_2_grad/Reshape_1Reshapegradients/add_2_grad/Sum_1gradients/add_2_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:(
m
%gradients/add_2_grad/tuple/group_depsNoOp^gradients/add_2_grad/Reshape^gradients/add_2_grad/Reshape_1
т
-gradients/add_2_grad/tuple/control_dependencyIdentitygradients/add_2_grad/Reshape&^gradients/add_2_grad/tuple/group_deps*
T0*'
_output_shapes
:         (*/
_class%
#!loc:@gradients/add_2_grad/Reshape
█
/gradients/add_2_grad/tuple/control_dependency_1Identitygradients/add_2_grad/Reshape_1&^gradients/add_2_grad/tuple/group_deps*
T0*
_output_shapes
:(*1
_class'
%#loc:@gradients/add_2_grad/Reshape_1
└
gradients/MatMul_2_grad/MatMulMatMul-gradients/add_2_grad/tuple/control_dependencyVariable_4/read*
T0*
transpose_b(*
transpose_a( *'
_output_shapes
:         
│
 gradients/MatMul_2_grad/MatMul_1MatMul	Sigmoid_1-gradients/add_2_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes

:(
t
(gradients/MatMul_2_grad/tuple/group_depsNoOp^gradients/MatMul_2_grad/MatMul!^gradients/MatMul_2_grad/MatMul_1
ь
0gradients/MatMul_2_grad/tuple/control_dependencyIdentitygradients/MatMul_2_grad/MatMul)^gradients/MatMul_2_grad/tuple/group_deps*
T0*'
_output_shapes
:         *1
_class'
%#loc:@gradients/MatMul_2_grad/MatMul
щ
2gradients/MatMul_2_grad/tuple/control_dependency_1Identity gradients/MatMul_2_grad/MatMul_1)^gradients/MatMul_2_grad/tuple/group_deps*
T0*
_output_shapes

:(*3
_class)
'%loc:@gradients/MatMul_2_grad/MatMul_1
в
$gradients/Sigmoid_1_grad/SigmoidGradSigmoidGrad	Sigmoid_10gradients/MatMul_2_grad/tuple/control_dependency*
T0*'
_output_shapes
:         
b
gradients/add_1_grad/ShapeShapeMatMul_1*
T0*
out_type0*
_output_shapes
:
f
gradients/add_1_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
║
*gradients/add_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_1_grad/Shapegradients/add_1_grad/Shape_1*
T0*2
_output_shapes 
:         :         
▒
gradients/add_1_grad/SumSum$gradients/Sigmoid_1_grad/SigmoidGrad*gradients/add_1_grad/BroadcastGradientArgs*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
Э
gradients/add_1_grad/ReshapeReshapegradients/add_1_grad/Sumgradients/add_1_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         
╡
gradients/add_1_grad/Sum_1Sum$gradients/Sigmoid_1_grad/SigmoidGrad,gradients/add_1_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
Ц
gradients/add_1_grad/Reshape_1Reshapegradients/add_1_grad/Sum_1gradients/add_1_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
m
%gradients/add_1_grad/tuple/group_depsNoOp^gradients/add_1_grad/Reshape^gradients/add_1_grad/Reshape_1
т
-gradients/add_1_grad/tuple/control_dependencyIdentitygradients/add_1_grad/Reshape&^gradients/add_1_grad/tuple/group_deps*
T0*'
_output_shapes
:         */
_class%
#!loc:@gradients/add_1_grad/Reshape
█
/gradients/add_1_grad/tuple/control_dependency_1Identitygradients/add_1_grad/Reshape_1&^gradients/add_1_grad/tuple/group_deps*
T0*
_output_shapes
:*1
_class'
%#loc:@gradients/add_1_grad/Reshape_1
└
gradients/MatMul_1_grad/MatMulMatMul-gradients/add_1_grad/tuple/control_dependencyVariable_2/read*
T0*
transpose_b(*
transpose_a( *'
_output_shapes
:         
▒
 gradients/MatMul_1_grad/MatMul_1MatMulSigmoid-gradients/add_1_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes

:
t
(gradients/MatMul_1_grad/tuple/group_depsNoOp^gradients/MatMul_1_grad/MatMul!^gradients/MatMul_1_grad/MatMul_1
ь
0gradients/MatMul_1_grad/tuple/control_dependencyIdentitygradients/MatMul_1_grad/MatMul)^gradients/MatMul_1_grad/tuple/group_deps*
T0*'
_output_shapes
:         *1
_class'
%#loc:@gradients/MatMul_1_grad/MatMul
щ
2gradients/MatMul_1_grad/tuple/control_dependency_1Identity gradients/MatMul_1_grad/MatMul_1)^gradients/MatMul_1_grad/tuple/group_deps*
T0*
_output_shapes

:*3
_class)
'%loc:@gradients/MatMul_1_grad/MatMul_1
Ю
"gradients/Sigmoid_grad/SigmoidGradSigmoidGradSigmoid0gradients/MatMul_1_grad/tuple/control_dependency*
T0*'
_output_shapes
:         
^
gradients/add_grad/ShapeShapeMatMul*
T0*
out_type0*
_output_shapes
:
d
gradients/add_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
┤
(gradients/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_grad/Shapegradients/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
л
gradients/add_grad/SumSum"gradients/Sigmoid_grad/SigmoidGrad(gradients/add_grad/BroadcastGradientArgs*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
Ч
gradients/add_grad/ReshapeReshapegradients/add_grad/Sumgradients/add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         
п
gradients/add_grad/Sum_1Sum"gradients/Sigmoid_grad/SigmoidGrad*gradients/add_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
Р
gradients/add_grad/Reshape_1Reshapegradients/add_grad/Sum_1gradients/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
g
#gradients/add_grad/tuple/group_depsNoOp^gradients/add_grad/Reshape^gradients/add_grad/Reshape_1
┌
+gradients/add_grad/tuple/control_dependencyIdentitygradients/add_grad/Reshape$^gradients/add_grad/tuple/group_deps*
T0*'
_output_shapes
:         *-
_class#
!loc:@gradients/add_grad/Reshape
╙
-gradients/add_grad/tuple/control_dependency_1Identitygradients/add_grad/Reshape_1$^gradients/add_grad/tuple/group_deps*
T0*
_output_shapes
:*/
_class%
#!loc:@gradients/add_grad/Reshape_1
║
gradients/MatMul_grad/MatMulMatMul+gradients/add_grad/tuple/control_dependencyVariable/read*
T0*
transpose_b(*
transpose_a( *'
_output_shapes
:         %
п
gradients/MatMul_grad/MatMul_1MatMul	inputdata+gradients/add_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes

:%
n
&gradients/MatMul_grad/tuple/group_depsNoOp^gradients/MatMul_grad/MatMul^gradients/MatMul_grad/MatMul_1
ф
.gradients/MatMul_grad/tuple/control_dependencyIdentitygradients/MatMul_grad/MatMul'^gradients/MatMul_grad/tuple/group_deps*
T0*'
_output_shapes
:         %*/
_class%
#!loc:@gradients/MatMul_grad/MatMul
с
0gradients/MatMul_grad/tuple/control_dependency_1Identitygradients/MatMul_grad/MatMul_1'^gradients/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:%*1
_class'
%#loc:@gradients/MatMul_grad/MatMul_1
{
beta1_power/initial_valueConst*
valueB
 *fff?*
dtype0*
_output_shapes
: *
_class
loc:@Variable
М
beta1_power
VariableV2*
shared_name *
_class
loc:@Variable*
_output_shapes
: *
dtype0*
shape: *
	container 
л
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
T0*
_output_shapes
: *
use_locking(*
validate_shape(*
_class
loc:@Variable
g
beta1_power/readIdentitybeta1_power*
T0*
_output_shapes
: *
_class
loc:@Variable
{
beta2_power/initial_valueConst*
valueB
 *w╛?*
dtype0*
_output_shapes
: *
_class
loc:@Variable
М
beta2_power
VariableV2*
shared_name *
_class
loc:@Variable*
_output_shapes
: *
dtype0*
shape: *
	container 
л
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
T0*
_output_shapes
: *
use_locking(*
validate_shape(*
_class
loc:@Variable
g
beta2_power/readIdentitybeta2_power*
T0*
_output_shapes
: *
_class
loc:@Variable
С
Variable/Adam/Initializer/zerosConst*
valueB%*    *
dtype0*
_output_shapes

:%*
_class
loc:@Variable
Ю
Variable/Adam
VariableV2*
shared_name *
_class
loc:@Variable*
_output_shapes

:%*
dtype0*
shape
:%*
	container 
╜
Variable/Adam/AssignAssignVariable/AdamVariable/Adam/Initializer/zeros*
T0*
_output_shapes

:%*
use_locking(*
validate_shape(*
_class
loc:@Variable
s
Variable/Adam/readIdentityVariable/Adam*
T0*
_output_shapes

:%*
_class
loc:@Variable
У
!Variable/Adam_1/Initializer/zerosConst*
valueB%*    *
dtype0*
_output_shapes

:%*
_class
loc:@Variable
а
Variable/Adam_1
VariableV2*
shared_name *
_class
loc:@Variable*
_output_shapes

:%*
dtype0*
shape
:%*
	container 
├
Variable/Adam_1/AssignAssignVariable/Adam_1!Variable/Adam_1/Initializer/zeros*
T0*
_output_shapes

:%*
use_locking(*
validate_shape(*
_class
loc:@Variable
w
Variable/Adam_1/readIdentityVariable/Adam_1*
T0*
_output_shapes

:%*
_class
loc:@Variable
Н
!Variable_1/Adam/Initializer/zerosConst*
valueB*    *
dtype0*
_output_shapes
:*
_class
loc:@Variable_1
Ъ
Variable_1/Adam
VariableV2*
shared_name *
_class
loc:@Variable_1*
_output_shapes
:*
dtype0*
shape:*
	container 
┴
Variable_1/Adam/AssignAssignVariable_1/Adam!Variable_1/Adam/Initializer/zeros*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_1
u
Variable_1/Adam/readIdentityVariable_1/Adam*
T0*
_output_shapes
:*
_class
loc:@Variable_1
П
#Variable_1/Adam_1/Initializer/zerosConst*
valueB*    *
dtype0*
_output_shapes
:*
_class
loc:@Variable_1
Ь
Variable_1/Adam_1
VariableV2*
shared_name *
_class
loc:@Variable_1*
_output_shapes
:*
dtype0*
shape:*
	container 
╟
Variable_1/Adam_1/AssignAssignVariable_1/Adam_1#Variable_1/Adam_1/Initializer/zeros*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_1
y
Variable_1/Adam_1/readIdentityVariable_1/Adam_1*
T0*
_output_shapes
:*
_class
loc:@Variable_1
Х
!Variable_2/Adam/Initializer/zerosConst*
valueB*    *
dtype0*
_output_shapes

:*
_class
loc:@Variable_2
в
Variable_2/Adam
VariableV2*
shared_name *
_class
loc:@Variable_2*
_output_shapes

:*
dtype0*
shape
:*
	container 
┼
Variable_2/Adam/AssignAssignVariable_2/Adam!Variable_2/Adam/Initializer/zeros*
T0*
_output_shapes

:*
use_locking(*
validate_shape(*
_class
loc:@Variable_2
y
Variable_2/Adam/readIdentityVariable_2/Adam*
T0*
_output_shapes

:*
_class
loc:@Variable_2
Ч
#Variable_2/Adam_1/Initializer/zerosConst*
valueB*    *
dtype0*
_output_shapes

:*
_class
loc:@Variable_2
д
Variable_2/Adam_1
VariableV2*
shared_name *
_class
loc:@Variable_2*
_output_shapes

:*
dtype0*
shape
:*
	container 
╦
Variable_2/Adam_1/AssignAssignVariable_2/Adam_1#Variable_2/Adam_1/Initializer/zeros*
T0*
_output_shapes

:*
use_locking(*
validate_shape(*
_class
loc:@Variable_2
}
Variable_2/Adam_1/readIdentityVariable_2/Adam_1*
T0*
_output_shapes

:*
_class
loc:@Variable_2
Н
!Variable_3/Adam/Initializer/zerosConst*
valueB*    *
dtype0*
_output_shapes
:*
_class
loc:@Variable_3
Ъ
Variable_3/Adam
VariableV2*
shared_name *
_class
loc:@Variable_3*
_output_shapes
:*
dtype0*
shape:*
	container 
┴
Variable_3/Adam/AssignAssignVariable_3/Adam!Variable_3/Adam/Initializer/zeros*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_3
u
Variable_3/Adam/readIdentityVariable_3/Adam*
T0*
_output_shapes
:*
_class
loc:@Variable_3
П
#Variable_3/Adam_1/Initializer/zerosConst*
valueB*    *
dtype0*
_output_shapes
:*
_class
loc:@Variable_3
Ь
Variable_3/Adam_1
VariableV2*
shared_name *
_class
loc:@Variable_3*
_output_shapes
:*
dtype0*
shape:*
	container 
╟
Variable_3/Adam_1/AssignAssignVariable_3/Adam_1#Variable_3/Adam_1/Initializer/zeros*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_3
y
Variable_3/Adam_1/readIdentityVariable_3/Adam_1*
T0*
_output_shapes
:*
_class
loc:@Variable_3
б
1Variable_4/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"   (   *
dtype0*
_output_shapes
:*
_class
loc:@Variable_4
Л
'Variable_4/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: *
_class
loc:@Variable_4
▀
!Variable_4/Adam/Initializer/zerosFill1Variable_4/Adam/Initializer/zeros/shape_as_tensor'Variable_4/Adam/Initializer/zeros/Const*
T0*
_output_shapes

:(*

index_type0*
_class
loc:@Variable_4
в
Variable_4/Adam
VariableV2*
shared_name *
_class
loc:@Variable_4*
_output_shapes

:(*
dtype0*
shape
:(*
	container 
┼
Variable_4/Adam/AssignAssignVariable_4/Adam!Variable_4/Adam/Initializer/zeros*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_4
y
Variable_4/Adam/readIdentityVariable_4/Adam*
T0*
_output_shapes

:(*
_class
loc:@Variable_4
г
3Variable_4/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"   (   *
dtype0*
_output_shapes
:*
_class
loc:@Variable_4
Н
)Variable_4/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: *
_class
loc:@Variable_4
х
#Variable_4/Adam_1/Initializer/zerosFill3Variable_4/Adam_1/Initializer/zeros/shape_as_tensor)Variable_4/Adam_1/Initializer/zeros/Const*
T0*
_output_shapes

:(*

index_type0*
_class
loc:@Variable_4
д
Variable_4/Adam_1
VariableV2*
shared_name *
_class
loc:@Variable_4*
_output_shapes

:(*
dtype0*
shape
:(*
	container 
╦
Variable_4/Adam_1/AssignAssignVariable_4/Adam_1#Variable_4/Adam_1/Initializer/zeros*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_4
}
Variable_4/Adam_1/readIdentityVariable_4/Adam_1*
T0*
_output_shapes

:(*
_class
loc:@Variable_4
Н
!Variable_5/Adam/Initializer/zerosConst*
valueB(*    *
dtype0*
_output_shapes
:(*
_class
loc:@Variable_5
Ъ
Variable_5/Adam
VariableV2*
shared_name *
_class
loc:@Variable_5*
_output_shapes
:(*
dtype0*
shape:(*
	container 
┴
Variable_5/Adam/AssignAssignVariable_5/Adam!Variable_5/Adam/Initializer/zeros*
T0*
_output_shapes
:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_5
u
Variable_5/Adam/readIdentityVariable_5/Adam*
T0*
_output_shapes
:(*
_class
loc:@Variable_5
П
#Variable_5/Adam_1/Initializer/zerosConst*
valueB(*    *
dtype0*
_output_shapes
:(*
_class
loc:@Variable_5
Ь
Variable_5/Adam_1
VariableV2*
shared_name *
_class
loc:@Variable_5*
_output_shapes
:(*
dtype0*
shape:(*
	container 
╟
Variable_5/Adam_1/AssignAssignVariable_5/Adam_1#Variable_5/Adam_1/Initializer/zeros*
T0*
_output_shapes
:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_5
y
Variable_5/Adam_1/readIdentityVariable_5/Adam_1*
T0*
_output_shapes
:(*
_class
loc:@Variable_5
Х
!Variable_6/Adam/Initializer/zerosConst*
valueB(*    *
dtype0*
_output_shapes

:(*
_class
loc:@Variable_6
в
Variable_6/Adam
VariableV2*
shared_name *
_class
loc:@Variable_6*
_output_shapes

:(*
dtype0*
shape
:(*
	container 
┼
Variable_6/Adam/AssignAssignVariable_6/Adam!Variable_6/Adam/Initializer/zeros*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_6
y
Variable_6/Adam/readIdentityVariable_6/Adam*
T0*
_output_shapes

:(*
_class
loc:@Variable_6
Ч
#Variable_6/Adam_1/Initializer/zerosConst*
valueB(*    *
dtype0*
_output_shapes

:(*
_class
loc:@Variable_6
д
Variable_6/Adam_1
VariableV2*
shared_name *
_class
loc:@Variable_6*
_output_shapes

:(*
dtype0*
shape
:(*
	container 
╦
Variable_6/Adam_1/AssignAssignVariable_6/Adam_1#Variable_6/Adam_1/Initializer/zeros*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_6
}
Variable_6/Adam_1/readIdentityVariable_6/Adam_1*
T0*
_output_shapes

:(*
_class
loc:@Variable_6
Н
!Variable_7/Adam/Initializer/zerosConst*
valueB*    *
dtype0*
_output_shapes
:*
_class
loc:@Variable_7
Ъ
Variable_7/Adam
VariableV2*
shared_name *
_class
loc:@Variable_7*
_output_shapes
:*
dtype0*
shape:*
	container 
┴
Variable_7/Adam/AssignAssignVariable_7/Adam!Variable_7/Adam/Initializer/zeros*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_7
u
Variable_7/Adam/readIdentityVariable_7/Adam*
T0*
_output_shapes
:*
_class
loc:@Variable_7
П
#Variable_7/Adam_1/Initializer/zerosConst*
valueB*    *
dtype0*
_output_shapes
:*
_class
loc:@Variable_7
Ь
Variable_7/Adam_1
VariableV2*
shared_name *
_class
loc:@Variable_7*
_output_shapes
:*
dtype0*
shape:*
	container 
╟
Variable_7/Adam_1/AssignAssignVariable_7/Adam_1#Variable_7/Adam_1/Initializer/zeros*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_7
y
Variable_7/Adam_1/readIdentityVariable_7/Adam_1*
T0*
_output_shapes
:*
_class
loc:@Variable_7
W
Adam/learning_rateConst*
valueB
 *
╫г;*
dtype0*
_output_shapes
: 
O

Adam/beta1Const*
valueB
 *fff?*
dtype0*
_output_shapes
: 
O

Adam/beta2Const*
valueB
 *w╛?*
dtype0*
_output_shapes
: 
Q
Adam/epsilonConst*
valueB
 *w╠+2*
dtype0*
_output_shapes
: 
╥
Adam/update_Variable/ApplyAdam	ApplyAdamVariableVariable/AdamVariable/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon0gradients/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:%*
use_locking( *
use_nesterov( *
_class
loc:@Variable
╒
 Adam/update_Variable_1/ApplyAdam	ApplyAdam
Variable_1Variable_1/AdamVariable_1/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon-gradients/add_grad/tuple/control_dependency_1*
T0*
_output_shapes
:*
use_locking( *
use_nesterov( *
_class
loc:@Variable_1
▐
 Adam/update_Variable_2/ApplyAdam	ApplyAdam
Variable_2Variable_2/AdamVariable_2/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon2gradients/MatMul_1_grad/tuple/control_dependency_1*
T0*
_output_shapes

:*
use_locking( *
use_nesterov( *
_class
loc:@Variable_2
╫
 Adam/update_Variable_3/ApplyAdam	ApplyAdam
Variable_3Variable_3/AdamVariable_3/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/add_1_grad/tuple/control_dependency_1*
T0*
_output_shapes
:*
use_locking( *
use_nesterov( *
_class
loc:@Variable_3
▐
 Adam/update_Variable_4/ApplyAdam	ApplyAdam
Variable_4Variable_4/AdamVariable_4/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon2gradients/MatMul_2_grad/tuple/control_dependency_1*
T0*
_output_shapes

:(*
use_locking( *
use_nesterov( *
_class
loc:@Variable_4
╫
 Adam/update_Variable_5/ApplyAdam	ApplyAdam
Variable_5Variable_5/AdamVariable_5/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/add_2_grad/tuple/control_dependency_1*
T0*
_output_shapes
:(*
use_locking( *
use_nesterov( *
_class
loc:@Variable_5
▐
 Adam/update_Variable_6/ApplyAdam	ApplyAdam
Variable_6Variable_6/AdamVariable_6/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon2gradients/MatMul_3_grad/tuple/control_dependency_1*
T0*
_output_shapes

:(*
use_locking( *
use_nesterov( *
_class
loc:@Variable_6
╫
 Adam/update_Variable_7/ApplyAdam	ApplyAdam
Variable_7Variable_7/AdamVariable_7/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/add_3_grad/tuple/control_dependency_1*
T0*
_output_shapes
:*
use_locking( *
use_nesterov( *
_class
loc:@Variable_7
Б
Adam/mulMulbeta1_power/read
Adam/beta1^Adam/update_Variable/ApplyAdam!^Adam/update_Variable_1/ApplyAdam!^Adam/update_Variable_2/ApplyAdam!^Adam/update_Variable_3/ApplyAdam!^Adam/update_Variable_4/ApplyAdam!^Adam/update_Variable_5/ApplyAdam!^Adam/update_Variable_6/ApplyAdam!^Adam/update_Variable_7/ApplyAdam*
T0*
_output_shapes
: *
_class
loc:@Variable
У
Adam/AssignAssignbeta1_powerAdam/mul*
T0*
_output_shapes
: *
use_locking( *
validate_shape(*
_class
loc:@Variable
Г

Adam/mul_1Mulbeta2_power/read
Adam/beta2^Adam/update_Variable/ApplyAdam!^Adam/update_Variable_1/ApplyAdam!^Adam/update_Variable_2/ApplyAdam!^Adam/update_Variable_3/ApplyAdam!^Adam/update_Variable_4/ApplyAdam!^Adam/update_Variable_5/ApplyAdam!^Adam/update_Variable_6/ApplyAdam!^Adam/update_Variable_7/ApplyAdam*
T0*
_output_shapes
: *
_class
loc:@Variable
Ч
Adam/Assign_1Assignbeta2_power
Adam/mul_1*
T0*
_output_shapes
: *
use_locking( *
validate_shape(*
_class
loc:@Variable
└
AdamNoOp^Adam/Assign^Adam/Assign_1^Adam/update_Variable/ApplyAdam!^Adam/update_Variable_1/ApplyAdam!^Adam/update_Variable_2/ApplyAdam!^Adam/update_Variable_3/ApplyAdam!^Adam/update_Variable_4/ApplyAdam!^Adam/update_Variable_5/ApplyAdam!^Adam/update_Variable_6/ApplyAdam!^Adam/update_Variable_7/ApplyAdam
R
ArgMax/dimensionConst*
value	B :*
dtype0*
_output_shapes
: 
x
ArgMaxArgMaxSoftmaxArgMax/dimension*
output_type0	*
T0*#
_output_shapes
:         *

Tidx0
T
ArgMax_1/dimensionConst*
value	B :*
dtype0*
_output_shapes
: 
К
ArgMax_1ArgMaxnormal_fraud_featuresArgMax_1/dimension*
output_type0	*
T0*#
_output_shapes
:         *

Tidx0
N
EqualEqualArgMaxArgMax_1*
T0	*#
_output_shapes
:         
P
CastCastEqual*

DstT0*#
_output_shapes
:         *

SrcT0

Q
Const_1Const*
valueB: *
dtype0*
_output_shapes
:
Y
MeanMeanCastConst_1*
	keep_dims( *
T0*
_output_shapes
: *

Tidx0
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
Ў
save/SaveV2/tensor_namesConst*й
valueЯBЬBVariableBVariable/AdamBVariable/Adam_1B
Variable_1BVariable_1/AdamBVariable_1/Adam_1B
Variable_2BVariable_2/AdamBVariable_2/Adam_1B
Variable_3BVariable_3/AdamBVariable_3/Adam_1B
Variable_4BVariable_4/AdamBVariable_4/Adam_1B
Variable_5BVariable_5/AdamBVariable_5/Adam_1B
Variable_6BVariable_6/AdamBVariable_6/Adam_1B
Variable_7BVariable_7/AdamBVariable_7/Adam_1Bbeta1_powerBbeta2_power*
dtype0*
_output_shapes
:
Ч
save/SaveV2/shape_and_slicesConst*G
value>B<B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
Ч
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesVariableVariable/AdamVariable/Adam_1
Variable_1Variable_1/AdamVariable_1/Adam_1
Variable_2Variable_2/AdamVariable_2/Adam_1
Variable_3Variable_3/AdamVariable_3/Adam_1
Variable_4Variable_4/AdamVariable_4/Adam_1
Variable_5Variable_5/AdamVariable_5/Adam_1
Variable_6Variable_6/AdamVariable_6/Adam_1
Variable_7Variable_7/AdamVariable_7/Adam_1beta1_powerbeta2_power*(
dtypes
2
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_output_shapes
: *
_class
loc:@save/Const
∙
save/RestoreV2/tensor_namesConst*й
valueЯBЬBVariableBVariable/AdamBVariable/Adam_1B
Variable_1BVariable_1/AdamBVariable_1/Adam_1B
Variable_2BVariable_2/AdamBVariable_2/Adam_1B
Variable_3BVariable_3/AdamBVariable_3/Adam_1B
Variable_4BVariable_4/AdamBVariable_4/Adam_1B
Variable_5BVariable_5/AdamBVariable_5/Adam_1B
Variable_6BVariable_6/AdamBVariable_6/Adam_1B
Variable_7BVariable_7/AdamBVariable_7/Adam_1Bbeta1_powerBbeta2_power*
dtype0*
_output_shapes
:
Ъ
save/RestoreV2/shape_and_slicesConst*G
value>B<B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
Н
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*(
dtypes
2*|
_output_shapesj
h::::::::::::::::::::::::::
Ю
save/AssignAssignVariablesave/RestoreV2*
T0*
_output_shapes

:%*
use_locking(*
validate_shape(*
_class
loc:@Variable
з
save/Assign_1AssignVariable/Adamsave/RestoreV2:1*
T0*
_output_shapes

:%*
use_locking(*
validate_shape(*
_class
loc:@Variable
й
save/Assign_2AssignVariable/Adam_1save/RestoreV2:2*
T0*
_output_shapes

:%*
use_locking(*
validate_shape(*
_class
loc:@Variable
в
save/Assign_3Assign
Variable_1save/RestoreV2:3*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_1
з
save/Assign_4AssignVariable_1/Adamsave/RestoreV2:4*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_1
й
save/Assign_5AssignVariable_1/Adam_1save/RestoreV2:5*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_1
ж
save/Assign_6Assign
Variable_2save/RestoreV2:6*
T0*
_output_shapes

:*
use_locking(*
validate_shape(*
_class
loc:@Variable_2
л
save/Assign_7AssignVariable_2/Adamsave/RestoreV2:7*
T0*
_output_shapes

:*
use_locking(*
validate_shape(*
_class
loc:@Variable_2
н
save/Assign_8AssignVariable_2/Adam_1save/RestoreV2:8*
T0*
_output_shapes

:*
use_locking(*
validate_shape(*
_class
loc:@Variable_2
в
save/Assign_9Assign
Variable_3save/RestoreV2:9*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_3
й
save/Assign_10AssignVariable_3/Adamsave/RestoreV2:10*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_3
л
save/Assign_11AssignVariable_3/Adam_1save/RestoreV2:11*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_3
и
save/Assign_12Assign
Variable_4save/RestoreV2:12*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_4
н
save/Assign_13AssignVariable_4/Adamsave/RestoreV2:13*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_4
п
save/Assign_14AssignVariable_4/Adam_1save/RestoreV2:14*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_4
д
save/Assign_15Assign
Variable_5save/RestoreV2:15*
T0*
_output_shapes
:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_5
й
save/Assign_16AssignVariable_5/Adamsave/RestoreV2:16*
T0*
_output_shapes
:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_5
л
save/Assign_17AssignVariable_5/Adam_1save/RestoreV2:17*
T0*
_output_shapes
:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_5
и
save/Assign_18Assign
Variable_6save/RestoreV2:18*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_6
н
save/Assign_19AssignVariable_6/Adamsave/RestoreV2:19*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_6
п
save/Assign_20AssignVariable_6/Adam_1save/RestoreV2:20*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_6
д
save/Assign_21Assign
Variable_7save/RestoreV2:21*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_7
й
save/Assign_22AssignVariable_7/Adamsave/RestoreV2:22*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_7
л
save/Assign_23AssignVariable_7/Adam_1save/RestoreV2:23*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_7
Я
save/Assign_24Assignbeta1_powersave/RestoreV2:24*
T0*
_output_shapes
: *
use_locking(*
validate_shape(*
_class
loc:@Variable
Я
save/Assign_25Assignbeta2_powersave/RestoreV2:25*
T0*
_output_shapes
: *
use_locking(*
validate_shape(*
_class
loc:@Variable
╞
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_2^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_25^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9
Ё
initNoOp^Variable/Adam/Assign^Variable/Adam_1/Assign^Variable/Assign^Variable_1/Adam/Assign^Variable_1/Adam_1/Assign^Variable_1/Assign^Variable_2/Adam/Assign^Variable_2/Adam_1/Assign^Variable_2/Assign^Variable_3/Adam/Assign^Variable_3/Adam_1/Assign^Variable_3/Assign^Variable_4/Adam/Assign^Variable_4/Adam_1/Assign^Variable_4/Assign^Variable_5/Adam/Assign^Variable_5/Adam_1/Assign^Variable_5/Assign^Variable_6/Adam/Assign^Variable_6/Adam_1/Assign^Variable_6/Assign^Variable_7/Adam/Assign^Variable_7/Adam_1/Assign^Variable_7/Assign^beta1_power/Assign^beta2_power/Assign
T
ArgMax_2/dimensionConst*
value	B :*
dtype0*
_output_shapes
: 
|
ArgMax_2ArgMaxSoftmaxArgMax_2/dimension*
output_type0	*
T0*#
_output_shapes
:         *

Tidx0
T
ArgMax_3/dimensionConst*
value	B :*
dtype0*
_output_shapes
: 
|
ArgMax_3ArgMaxSoftmaxArgMax_3/dimension*
output_type0	*
T0*#
_output_shapes
:         *

Tidx0
R
save_1/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
Ж
save_1/StringJoin/inputs_1Const*<
value3B1 B+_temp_4a6948a5e1434521ba9e20b9dd96058c/part*
dtype0*
_output_shapes
: 
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
N*
	separator *
_output_shapes
: 
S
save_1/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
^
save_1/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 
Е
save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards*
_output_shapes
: 
°
save_1/SaveV2/tensor_namesConst*й
valueЯBЬBVariableBVariable/AdamBVariable/Adam_1B
Variable_1BVariable_1/AdamBVariable_1/Adam_1B
Variable_2BVariable_2/AdamBVariable_2/Adam_1B
Variable_3BVariable_3/AdamBVariable_3/Adam_1B
Variable_4BVariable_4/AdamBVariable_4/Adam_1B
Variable_5BVariable_5/AdamBVariable_5/Adam_1B
Variable_6BVariable_6/AdamBVariable_6/Adam_1B
Variable_7BVariable_7/AdamBVariable_7/Adam_1Bbeta1_powerBbeta2_power*
dtype0*
_output_shapes
:
Щ
save_1/SaveV2/shape_and_slicesConst*G
value>B<B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
й
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesVariableVariable/AdamVariable/Adam_1
Variable_1Variable_1/AdamVariable_1/Adam_1
Variable_2Variable_2/AdamVariable_2/Adam_1
Variable_3Variable_3/AdamVariable_3/Adam_1
Variable_4Variable_4/AdamVariable_4/Adam_1
Variable_5Variable_5/AdamVariable_5/Adam_1
Variable_6Variable_6/AdamVariable_6/Adam_1
Variable_7Variable_7/AdamVariable_7/Adam_1beta1_powerbeta2_power*(
dtypes
2
Щ
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2*
T0*
_output_shapes
: *)
_class
loc:@save_1/ShardedFilename
г
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency*

axis *
T0*
N*
_output_shapes
:
Г
save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const*
delete_old_dirs(
В
save_1/IdentityIdentitysave_1/Const^save_1/MergeV2Checkpoints^save_1/control_dependency*
T0*
_output_shapes
: 
√
save_1/RestoreV2/tensor_namesConst*й
valueЯBЬBVariableBVariable/AdamBVariable/Adam_1B
Variable_1BVariable_1/AdamBVariable_1/Adam_1B
Variable_2BVariable_2/AdamBVariable_2/Adam_1B
Variable_3BVariable_3/AdamBVariable_3/Adam_1B
Variable_4BVariable_4/AdamBVariable_4/Adam_1B
Variable_5BVariable_5/AdamBVariable_5/Adam_1B
Variable_6BVariable_6/AdamBVariable_6/Adam_1B
Variable_7BVariable_7/AdamBVariable_7/Adam_1Bbeta1_powerBbeta2_power*
dtype0*
_output_shapes
:
Ь
!save_1/RestoreV2/shape_and_slicesConst*G
value>B<B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
Х
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices*(
dtypes
2*|
_output_shapesj
h::::::::::::::::::::::::::
в
save_1/AssignAssignVariablesave_1/RestoreV2*
T0*
_output_shapes

:%*
use_locking(*
validate_shape(*
_class
loc:@Variable
л
save_1/Assign_1AssignVariable/Adamsave_1/RestoreV2:1*
T0*
_output_shapes

:%*
use_locking(*
validate_shape(*
_class
loc:@Variable
н
save_1/Assign_2AssignVariable/Adam_1save_1/RestoreV2:2*
T0*
_output_shapes

:%*
use_locking(*
validate_shape(*
_class
loc:@Variable
ж
save_1/Assign_3Assign
Variable_1save_1/RestoreV2:3*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_1
л
save_1/Assign_4AssignVariable_1/Adamsave_1/RestoreV2:4*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_1
н
save_1/Assign_5AssignVariable_1/Adam_1save_1/RestoreV2:5*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_1
к
save_1/Assign_6Assign
Variable_2save_1/RestoreV2:6*
T0*
_output_shapes

:*
use_locking(*
validate_shape(*
_class
loc:@Variable_2
п
save_1/Assign_7AssignVariable_2/Adamsave_1/RestoreV2:7*
T0*
_output_shapes

:*
use_locking(*
validate_shape(*
_class
loc:@Variable_2
▒
save_1/Assign_8AssignVariable_2/Adam_1save_1/RestoreV2:8*
T0*
_output_shapes

:*
use_locking(*
validate_shape(*
_class
loc:@Variable_2
ж
save_1/Assign_9Assign
Variable_3save_1/RestoreV2:9*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_3
н
save_1/Assign_10AssignVariable_3/Adamsave_1/RestoreV2:10*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_3
п
save_1/Assign_11AssignVariable_3/Adam_1save_1/RestoreV2:11*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_3
м
save_1/Assign_12Assign
Variable_4save_1/RestoreV2:12*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_4
▒
save_1/Assign_13AssignVariable_4/Adamsave_1/RestoreV2:13*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_4
│
save_1/Assign_14AssignVariable_4/Adam_1save_1/RestoreV2:14*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_4
и
save_1/Assign_15Assign
Variable_5save_1/RestoreV2:15*
T0*
_output_shapes
:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_5
н
save_1/Assign_16AssignVariable_5/Adamsave_1/RestoreV2:16*
T0*
_output_shapes
:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_5
п
save_1/Assign_17AssignVariable_5/Adam_1save_1/RestoreV2:17*
T0*
_output_shapes
:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_5
м
save_1/Assign_18Assign
Variable_6save_1/RestoreV2:18*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_6
▒
save_1/Assign_19AssignVariable_6/Adamsave_1/RestoreV2:19*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_6
│
save_1/Assign_20AssignVariable_6/Adam_1save_1/RestoreV2:20*
T0*
_output_shapes

:(*
use_locking(*
validate_shape(*
_class
loc:@Variable_6
и
save_1/Assign_21Assign
Variable_7save_1/RestoreV2:21*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_7
н
save_1/Assign_22AssignVariable_7/Adamsave_1/RestoreV2:22*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_7
п
save_1/Assign_23AssignVariable_7/Adam_1save_1/RestoreV2:23*
T0*
_output_shapes
:*
use_locking(*
validate_shape(*
_class
loc:@Variable_7
г
save_1/Assign_24Assignbeta1_powersave_1/RestoreV2:24*
T0*
_output_shapes
: *
use_locking(*
validate_shape(*
_class
loc:@Variable
г
save_1/Assign_25Assignbeta2_powersave_1/RestoreV2:25*
T0*
_output_shapes
: *
use_locking(*
validate_shape(*
_class
loc:@Variable
■
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_10^save_1/Assign_11^save_1/Assign_12^save_1/Assign_13^save_1/Assign_14^save_1/Assign_15^save_1/Assign_16^save_1/Assign_17^save_1/Assign_18^save_1/Assign_19^save_1/Assign_2^save_1/Assign_20^save_1/Assign_21^save_1/Assign_22^save_1/Assign_23^save_1/Assign_24^save_1/Assign_25^save_1/Assign_3^save_1/Assign_4^save_1/Assign_5^save_1/Assign_6^save_1/Assign_7^save_1/Assign_8^save_1/Assign_9
1
save_1/restore_allNoOp^save_1/restore_shard "B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8"┼
trainable_variablesнк
B

Variable:0Variable/AssignVariable/read:02truncated_normal:0
=
Variable_1:0Variable_1/AssignVariable_1/read:02zeros:0
J
Variable_2:0Variable_2/AssignVariable_2/read:02truncated_normal_1:0
?
Variable_3:0Variable_3/AssignVariable_3/read:02	zeros_1:0
J
Variable_4:0Variable_4/AssignVariable_4/read:02truncated_normal_2:0
?
Variable_5:0Variable_5/AssignVariable_5/read:02	zeros_2:0
J
Variable_6:0Variable_6/AssignVariable_6/read:02truncated_normal_3:0
?
Variable_7:0Variable_7/AssignVariable_7/read:02	zeros_3:0"
train_op

Adam"╖
	variablesйж
B

Variable:0Variable/AssignVariable/read:02truncated_normal:0
=
Variable_1:0Variable_1/AssignVariable_1/read:02zeros:0
J
Variable_2:0Variable_2/AssignVariable_2/read:02truncated_normal_1:0
?
Variable_3:0Variable_3/AssignVariable_3/read:02	zeros_1:0
J
Variable_4:0Variable_4/AssignVariable_4/read:02truncated_normal_2:0
?
Variable_5:0Variable_5/AssignVariable_5/read:02	zeros_2:0
J
Variable_6:0Variable_6/AssignVariable_6/read:02truncated_normal_3:0
?
Variable_7:0Variable_7/AssignVariable_7/read:02	zeros_3:0
T
beta1_power:0beta1_power/Assignbeta1_power/read:02beta1_power/initial_value:0
T
beta2_power:0beta2_power/Assignbeta2_power/read:02beta2_power/initial_value:0
`
Variable/Adam:0Variable/Adam/AssignVariable/Adam/read:02!Variable/Adam/Initializer/zeros:0
h
Variable/Adam_1:0Variable/Adam_1/AssignVariable/Adam_1/read:02#Variable/Adam_1/Initializer/zeros:0
h
Variable_1/Adam:0Variable_1/Adam/AssignVariable_1/Adam/read:02#Variable_1/Adam/Initializer/zeros:0
p
Variable_1/Adam_1:0Variable_1/Adam_1/AssignVariable_1/Adam_1/read:02%Variable_1/Adam_1/Initializer/zeros:0
h
Variable_2/Adam:0Variable_2/Adam/AssignVariable_2/Adam/read:02#Variable_2/Adam/Initializer/zeros:0
p
Variable_2/Adam_1:0Variable_2/Adam_1/AssignVariable_2/Adam_1/read:02%Variable_2/Adam_1/Initializer/zeros:0
h
Variable_3/Adam:0Variable_3/Adam/AssignVariable_3/Adam/read:02#Variable_3/Adam/Initializer/zeros:0
p
Variable_3/Adam_1:0Variable_3/Adam_1/AssignVariable_3/Adam_1/read:02%Variable_3/Adam_1/Initializer/zeros:0
h
Variable_4/Adam:0Variable_4/Adam/AssignVariable_4/Adam/read:02#Variable_4/Adam/Initializer/zeros:0
p
Variable_4/Adam_1:0Variable_4/Adam_1/AssignVariable_4/Adam_1/read:02%Variable_4/Adam_1/Initializer/zeros:0
h
Variable_5/Adam:0Variable_5/Adam/AssignVariable_5/Adam/read:02#Variable_5/Adam/Initializer/zeros:0
p
Variable_5/Adam_1:0Variable_5/Adam_1/AssignVariable_5/Adam_1/read:02%Variable_5/Adam_1/Initializer/zeros:0
h
Variable_6/Adam:0Variable_6/Adam/AssignVariable_6/Adam/read:02#Variable_6/Adam/Initializer/zeros:0
p
Variable_6/Adam_1:0Variable_6/Adam_1/AssignVariable_6/Adam_1/read:02%Variable_6/Adam_1/Initializer/zeros:0
h
Variable_7/Adam:0Variable_7/Adam/AssignVariable_7/Adam/read:02#Variable_7/Adam/Initializer/zeros:0
p
Variable_7/Adam_1:0Variable_7/Adam_1/AssignVariable_7/Adam_1/read:02%Variable_7/Adam_1/Initializer/zeros:0*║
serving_defaultж
3
a.
normal_fraud_features:0         
'
x"
inputdata:0         %*
output 
	Softmax:0         tensorflow/serving/predict