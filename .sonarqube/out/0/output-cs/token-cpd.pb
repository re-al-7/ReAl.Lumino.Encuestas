�h
VC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\AccountController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
public 

class 
AccountController "
:# $
BaseController% 3
{ 
public 
AccountController  
(  !
db_encuestasContext! 4
context5 <
)< =
:> ?
base@ D
(D E
contextE L
)L M
{ 	
} 	
[ 	
HttpGet	 
] 
[ 	
AllowAnonymous	 
] 
public 

Login "
(" #
string# )
	returnUrl* 3
=4 5
null6 :
): ;
{ 	
try 
{ 
ViewData 
[ 
$str $
]$ %
=& '
	returnUrl( 1
;1 2
return 
View 
( 
) 
; 
} 
catch   
(   
	Exception   
e   
)   
{!! 
Console"" 
."" 
	WriteLine"" !
(""! "
e""" #
)""# $
;""$ %
throw## 
;## 
}$$ 
}%% 	
['' 	
HttpPost''	 
,'' 

ActionName'' 
('' 
$str'' %
)''% &
]''& '
[(( 	
AllowAnonymous((	 
](( 
[)) 	$
ValidateAntiForgeryToken))	 !
]))! "
public** 
async** 
Task** 
<** 

>**' (
Login**) .
(**. /
SegUsuarios**/ :
user**; ?
,**? @
string**A G
strReturnUrl**H T
)**T U
{++ 	
ViewData,, 
[,, 
$str,,  
],,  !
=,," #
strReturnUrl,,$ 0
;,,0 1
if-- 
(-- 

ModelState-- 
.-- 
IsValid-- "
)--" #
{.. 
const// 
string// (
badUserNameOrPasswordMessage// 9
=//: ;
$str//< _
;//_ `
const00 
string00 
badUserCreation00 ,
=00- .
$str00/ R
;00R S
if11 
(11 
user11 
==11 
null11  
)11  !
{22 

ModelState33 
.33 

(33, -
$str33- /
,33/ 0(
badUserNameOrPasswordMessage331 M
)33M N
;33N O
return44 
View44 
(44  
)44  !
;44! "
}55 
const77 
string77 !
incompleteInformation77 2
=773 4
$str775 o
;77o p
if88 
(88 
user88 
.88 
Login88 
==88 !
$str88" $
||88% '
user88( ,
.88, -
Password88- 5
==886 8
$str889 ;
)88; <
{99 

ModelState:: 
.:: 

(::, -
$str::- /
,::/ 0!
incompleteInformation::1 F
)::F G
;::G H
return;; 
View;; 
(;;  
);;  !
;;;! "
}<< 
var>> 
obj>> 
=>> 
_context>> "
.>>" #
SegUsuarios>># .
.>>. /
SingleOrDefault>>/ >
(>>> ?
m>>? @
=>>>A C
m>>D E
.>>E F
Login>>F K
==>>L N
user>>O S
.>>S T
Login>>T Y
)>>Y Z
;>>Z [
if?? 
(?? 
obj?? 
==?? 
null?? 
)??  
{@@ 

ModelStateAA 
.AA 

(AA, -
$strAA- /
,AA/ 0(
badUserNameOrPasswordMessageAA1 M
)AAM N
;AAN O
returnBB 
ViewBB 
(BB  
)BB  !
;BB! "
}CC 
ifEE 
(EE 
!EE 

CFuncionesEE 
.EE  

GenerarMd5EE  *
(EE* +
userEE+ /
.EE/ 0
PasswordEE0 8
)EE8 9
.EE9 :
ToUpperEE: A
(EEA B
)EEB C
.EEC D
EqualsEED J
(EEJ K
objEEK N
.EEN O
PasswordEEO W
.EEW X
ToUpperEEX _
(EE_ `
)EE` a
)EEa b
)EEb c
{FF 

ModelStateGG 
.GG 

(GG, -
$strGG- /
,GG/ 0(
badUserNameOrPasswordMessageGG1 M
)GGM N
;GGN O
returnHH 
ViewHH 
(HH  
)HH  !
;HH! "
}II 
varKK 
identityKK 
=KK 
newKK "
ClaimsIdentityKK# 1
(KK1 2(
CookieAuthenticationDefaultsKK2 N
.KKN O 
AuthenticationSchemeKKO c
)KKc d
;KKd e
identityLL 
.LL 
AddClaimLL !
(LL! "
newLL" %
ClaimLL& +
(LL+ ,

ClaimTypesLL, 6
.LL6 7
NameLL7 ;
,LL; <
objLL= @
.LL@ A
LoginLLA F
)LLF G
)LLG H
;LLH I
identityMM 
.MM 
AddClaimMM !
(MM! "
newMM" %
ClaimMM& +
(MM+ ,

ClaimTypesMM, 6
.MM6 7
	GivenNameMM7 @
,MM@ A
objMMB E
.MME F
NombresMMF M
+MMN O
$strMMP S
+MMT U
objMMV Y
.MMY Z
	ApellidosMMZ c
)MMc d
)MMd e
;MMe f
varPP 
objRolPP 
=PP 
_contextPP %
.PP% &
SegUsuariosPP& 1
.QQ 
JoinQQ 
(QQ 
_contextQQ "
.QQ" #"
SegUsuariosRestriccionQQ# 9
,QQ9 :
susQQ; >
=>QQ? A
susQQB E
.QQE F
IdsusQQF K
,QQK L
surQQM P
=>QQQ S
surQQT W
.QQW X
IdsusQQX ]
,QQ] ^
(QQ_ `
susQQ` c
,QQc d
surQQe h
)QQh i
=>QQj l
newQQm p
{QQq r
susQQr u
,QQu v
surQQw z
}QQz {
)QQ{ |
.RR 
JoinRR 
(RR 
_contextRR "
.RR" #
SegRolesRR# +
,RR+ ,
sussurRR- 3
=>RR4 6
sussurRR7 =
.RR= >
surRR> A
.RRA B
IdsroRRB G
,RRG H
sroRRI L
=>RRM O
sroRRP S
.RRS T
IdsroRRT Y
,RRY Z
(RR[ \
sussurRR\ b
,RRb c
sroRRd g
)RRg h
=>RRi k
newRRl o
{RRp q
sussurRRq w
,RRw x
sroRRy |
}RR| }
)RR} ~
.SS 
WhereSS 
(SS 
tSS 
=>SS 
tSS  !
.SS! "
sussurSS" (
.SS( )
surSS) ,
.SS, -
	RolactivoSS- 6
==SS7 9
$numSS: ;
)SS; <
.TT 
WhereTT 
(TT 
tTT 
=>TT 
stringTT  &
.TT& '
EqualsTT' -
(TT- .
tTT. /
.TT/ 0
sussurTT0 6
.TT6 7
susTT7 :
.TT: ;
LoginTT; @
,TT@ A
objTTB E
.TTE F
LoginTTF K
,TTK L
StringComparisonTTM ]
.TT] ^$
CurrentCultureIgnoreCaseTT^ v
)TTv w
)TTw x
.UU 
SelectUU 
(UU 
argUU 
=>UU  "
argUU# &
)UU& '
.UU' (
SingleOrDefaultUU( 7
(UU7 8
)UU8 9
;UU9 :
ifVV 
(VV 
objRolVV 
==VV 
nullVV "
)VV" #
{WW 
identityXX 
.XX 
AddClaimXX %
(XX% &
newXX& )
ClaimXX* /
(XX/ 0

ClaimTypesXX0 :
.XX: ;
RoleXX; ?
,XX? @
stringXXA G
.XXG H
EmptyXXH M
)XXM N
)XXN O
;XXO P
identityYY 
.YY 
AddClaimYY %
(YY% &
newYY& )
ClaimYY* /
(YY/ 0

ClaimTypesYY0 :
.YY: ;
GroupSidYY; C
,YYC D
stringYYE K
.YYK L
EmptyYYL Q
)YYQ R
)YYR S
;YYS T
HttpContextZZ 
.ZZ  
SessionZZ  '
.ZZ' (
	SetStringZZ( 1
(ZZ1 2
$strZZ2 >
,ZZ> ?
stringZZ@ F
.ZZF G
EmptyZZG L
)ZZL M
;ZZM N

ModelState[[ 
.[[ 

([[, -
$str[[- /
,[[/ 0
badUserCreation[[1 @
)[[@ A
;[[A B
return\\ 
View\\ 
(\\  
)\\  !
;\\! "
}]] 
identity^^ 
.^^ 
AddClaim^^ !
(^^! "
new^^" %
Claim^^& +
(^^+ ,

ClaimTypes^^, 6
.^^6 7
Role^^7 ;
,^^; <
objRol^^= C
.^^C D
sro^^D G
.^^G H
Idsro^^H M
.^^M N
ToString^^N V
(^^V W
)^^W X
)^^X Y
)^^Y Z
;^^Z [
identity__ 
.__ 
AddClaim__ !
(__! "
new__" %
Claim__& +
(__+ ,

ClaimTypes__, 6
.__6 7
GroupSid__7 ?
,__? @
objRol__A G
.__G H
sussur__H N
.__N O
sur__O R
.__R S
Idopy__S X
.__X Y
ToString__Y a
(__a b
)__b c
)__c d
)__d e
;__e f
identity`` 
.`` 
AddClaim`` !
(``! "
new``" %
Claim``& +
(``+ ,

ClaimTypes``, 6
.``6 7

PrimarySid``7 A
,``A B
objRol``C I
.``I J
sussur``J P
.``P Q
sur``Q T
.``T U
Idcde``U Z
.``Z [
ToString``[ c
(``c d
)``d e
)``e f
)``f g
;``g h
varaa 
objAppaa 
=aa 
CMenusaa #
.aa# $
GetAplicacionesaa$ 3
(aa3 4
_contextaa4 <
,aa< =
objRolaa> D
.aaD E
sroaaE H
.aaH I
IdsroaaI N
)aaN O
.aaO P
OrderByaaP W
(aaW X
xaaX Y
=>aaZ \
xaa] ^
.aa^ _
Nombreaa_ e
)aae f
.aaf g
Firstaag l
(aal m
)aam n
;aan o
HttpContextcc 
.cc 
Sessioncc #
.cc# $
	SetStringcc$ -
(cc- .
$strcc. :
,cc: ;
objAppcc< B
==ccC E
nullccF J
?ccJ K
stringccL R
.ccR S
EmptyccS X
:ccY Z
objAppcc[ a
.cca b
Siglaccb g
)ccg h
;cch i
awaitee 
HttpContextee !
.ee! "
SignInAsyncee" -
(ee- .(
CookieAuthenticationDefaultsee. J
.eeJ K 
AuthenticationSchemeeeK _
,ee_ `
neweea d
ClaimsPrincipaleee t
(eet u
identityeeu }
)ee} ~
)ee~ 
;	ee �
ifgg 
(gg 
strReturnUrlgg  
==gg! #
nullgg$ (
)gg( )
{hh 
ifii 
(ii 
TempDataii  
[ii  !
$strii! ,
]ii, -
!=ii. 0
nullii1 5
)ii5 6
{jj 
returnkk 
Redirectkk '
(kk' (
TempDatakk( 0
[kk0 1
$strkk1 <
]kk< =
.kk= >
ToStringkk> F
(kkF G
)kkG H
)kkH I
;kkI J
}ll 
}mm 
returnoo 
RedirectToActionoo '
(oo' (
nameofoo( .
(oo. /
DashboardControlleroo/ B
.ooB C
IndexooC H
)ooH I
,ooI J
$strooK V
)ooV W
;ooW X
}pp 
returnss 
Viewss 
(ss 
)ss 
;ss 
}tt 	
[vv 	
	Authorizevv	 
]vv 
publicww 
asyncww 
Taskww 
<ww 

>ww' (
Logoutww) /
(ww/ 0
)ww0 1
{xx 	
awaityy 
HttpContextyy 
.yy 
SignOutAsyncyy *
(yy* +(
CookieAuthenticationDefaultsyy+ G
.yyG H 
AuthenticationSchemeyyH \
)yy\ ]
;yy] ^
returnzz 
RedirectToActionzz #
(zz# $
nameofzz$ *
(zz* +
Loginzz+ 0
)zz0 1
)zz1 2
;zz2 3
}{{ 	
}|| 
}}} �X
SC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\BaseController.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Controllers  +
{
public 

class 
BaseController 
:  !

Controller" ,
{ 
	protected 
readonly 
db_encuestasContext .
_context/ 7
;7 8
	protected 
IConfiguration  
_iconfiguration! 0
;0 1
	protected 
readonly 
IOptions #
<# $%
ConnectionStringsSettings$ =
>= >&
_connectionStringsSettings? Y
;Y Z
public 
BaseController 
( 
db_encuestasContext 1
context2 9
)9 :
{ 	
_context 
= 
context 
; 
} 	
public 
BaseController 
( 
db_encuestasContext 1
context2 9
,9 :
IConfiguration; I
iconfigurationJ X
)X Y
{ 	
_context 
= 
context 
; 
_iconfiguration 
= 
iconfiguration ,
;, -
} 	
public 
BaseController 
( 
db_encuestasContext 1
context2 9
,9 :
IConfiguration; I
iconfigurationJ X
,X Y
IOptionsZ b
<b c%
ConnectionStringsSettingsc |
>| }

connstring	~ �
)
� �
{   	
_context!! 
=!! 
context!! 
;!! 
_iconfiguration"" 
="" 
iconfiguration"" ,
;"", -&
_connectionStringsSettings## &
=##' (

connstring##) 3
;##3 4
}$$ 	
public&& 
override&& 
void&& 
OnActionExecuted&& -
(&&- .!
ActionExecutedContext&&. C
context&&D K
)&&K L
{'' 	
ViewBag(( 
.(( 
ListApp(( 
=(( 
GetAplicaciones(( -
(((- .
)((. /
;((/ 0
ViewBag)) 
.)) 
	ListPages)) 
=)) 
GetPages))  (
())( )
)))) *
;))* +
ViewBag** 
.** 

CurrentApp** 
=**  

(**. /
)**/ 0
;**0 1
ViewBag++ 
.++ 
Usuario++ 
=++ 
GetUserName++ )
(++) *
)++* +
;+++ ,
},, 	
public.. 
IEnumerable.. 
<.. 
CatDepartamentos.. +
>..+ ,
GetDeptoRestriccion..- @
(..@ A
)..A B
{// 	
return00 
_context00 
.00 
CatDepartamentos00 ,
.11 
Where11 
(11 
cde11 
=>11 
cde11 !
.11! "
Idcde11" '
==11( *
this11+ /
.11/ 0
GetDepartamentoId110 A
(11A B
)11B C
)11C D
.22 
ToList22 
(22 
)22 
;22 
}33 	
public55 
string55 

(55# $
)55$ %
{66 	
return77 
this77 
.77 
HttpContext77 #
.77# $
Session77$ +
.77+ ,
Keys77, 0
.770 1
Contains771 9
(779 :
$str77: F
)77F G
?77H I
this77J N
.77N O
HttpContext77O Z
.77Z [
Session77[ b
.77b c
	GetString77c l
(77l m
$str77m y
)77y z
.77z {
ToString	77{ �
(
77� �
)
77� �
:
77� �
null
77� �
;
77� �
}88 	
public:: 
string:: 
GetLogin:: 
(:: 
)::  
{;; 	
return<< 
User<< 
.<< 
Identity<<  
.<<  !
IsAuthenticated<<! 0
?<<1 2
User<<3 7
.<<7 8
Identity<<8 @
.<<@ A
Name<<A E
:<<F G
null<<H L
;<<L M
}== 	
public?? 
string?? 
GetUserName?? !
(??! "
)??" #
{@@ 	
ifAA 
(AA 
!AA 
UserAA 
.AA 
IdentityAA 
.AA 
IsAuthenticatedAA .
)AA. /
{BB 
returnCC 
nullCC 
;CC 
}DD 
varEE 
objEE 
=EE 
_contextEE 
.EE 
SegUsuariosEE *
.EE* +
SingleOrDefaultEE+ :
(EE: ;
mEE; <
=>EE= ?
mEE@ A
.EEA B
LoginEEB G
==EEH J
UserEEK O
.EEO P
IdentityEEP X
.EEX Y
GetGivenNameEEY e
(EEe f
)EEf g
)EEg h
;EEh i
ifFF 
(FF 
objFF 
==FF 
nullFF 
)FF 
{GG 
returnHH 
UserHH 
.HH 
IdentityHH $
.HH$ %
GetGivenNameHH% 1
(HH1 2
)HH2 3
.HH3 4
LengthHH4 :
>HH; <
$numHH= ?
?HH@ A
UserHHB F
.HHF G
IdentityHHG O
.HHO P
GetGivenNameHHP \
(HH\ ]
)HH] ^
.HH^ _
SplitHH_ d
(HHd e
$charHHe h
)HHh i
[HHi j
$numHHj k
]HHk l
:HHm n
UserHHo s
.HHs t
IdentityHHt |
.HH| }
GetGivenName	HH} �
(
HH� �
)
HH� �
;
HH� �
}II 
returnJJ 
(JJ 
(JJ 
objJJ 
.JJ 
NombresJJ  
+JJ! "
$strJJ# &
+JJ' (
objJJ) ,
.JJ, -
	ApellidosJJ- 6
)JJ6 7
.JJ7 8
ToStringJJ8 @
(JJ@ A
)JJA B
.JJB C
LengthJJC I
>JJJ K
$numJJL N
)JJN O
?JJP Q
objJJR U
.JJU V
NombresJJV ]
:JJ^ _
objJJ` c
.JJc d
NombresJJd k
+JJl m
$strJJn q
+JJr s
objJJt w
.JJw x
	Apellidos	JJx �
;
JJ� �
}KK 	
publicMM 
SegUsuariosMM 
GetUserMM "
(MM" #
)MM# $
{NN 	
ifOO 
(OO 
!OO 
UserOO 
.OO 
IdentityOO 
.OO 
IsAuthenticatedOO .
)OO. /
{PP 
returnQQ 
nullQQ 
;QQ 
}RR 
varSS 
objSS 
=SS 
_contextSS 
.SS 
SegUsuariosSS *
.SS* +
SingleOrDefaultSS+ :
(SS: ;
mSS; <
=>SS= ?
mSS@ A
.SSA B
LoginSSB G
.SSG H
EqualsSSH N
(SSN O
UserSSO S
.SSS T
IdentitySST \
.SS\ ]
NameSS] a
)SSa b
)SSb c
;SSc d
returnTT 
objTT 
;TT 
}VV 	
publicXX 
SegRolesXX 
GetUserRoleXX #
(XX# $
)XX$ %
{YY 	
ifZZ 
(ZZ 
!ZZ 
UserZZ 
.ZZ 
IdentityZZ 
.ZZ 
IsAuthenticatedZZ .
)ZZ. /
{[[ 
return\\ 
null\\ 
;\\ 
}]] 
var^^ 
obj^^ 
=^^ 
_context^^ 
.^^ 
SegRoles^^ '
.^^' (
SingleOrDefault^^( 7
(^^7 8
m^^8 9
=>^^: <
m^^= >
.^^> ?
Idsro^^? D
.^^D E
ToString^^E M
(^^M N
)^^N O
==^^P R
User^^S W
.^^W X
Identity^^X `
.^^` a
GetRole^^a h
(^^h i
)^^i j
)^^j k
;^^k l
return__ 
obj__ 
;__ 
}`` 	
publicbb 
intbb 

(bb  !
)bb! "
{cc 	
returndd 
(dd 
Userdd 
.dd 
Identitydd !
.dd! "
IsAuthenticateddd" 1
)dd1 2
?dd3 4
intdd5 8
.dd8 9
Parsedd9 >
(dd> ?
Userdd? C
.ddC D
IdentityddD L
.ddL M
GetGroupSidddM X
(ddX Y
)ddY Z
)ddZ [
:dd\ ]
-dd^ _
$numdd_ `
;dd` a
}ee 	
publicgg 
intgg 
GetDepartamentoIdgg $
(gg$ %
)gg% &
{hh 	
returnii 
(ii 
Userii 
.ii 
Identityii !
.ii! "
IsAuthenticatedii" 1
)ii1 2
?ii3 4
intii5 8
.ii8 9
Parseii9 >
(ii> ?
Userii? C
.iiC D
IdentityiiD L
.iiL M

(iiZ [
)ii[ \
)ii\ ]
:ii^ _
-ii` a
$numiia b
;iib c
}jj 	
	protectedll 
Listll 
<ll 
SegAplicacionesll &
>ll& '
GetAplicacionesll( 7
(ll7 8
)ll8 9
{mm 	
varnn 
objRolnn 
=nn 
GetUserRolenn $
(nn$ %
)nn% &
;nn& '
returnoo 
objRoloo 
==oo 
nulloo !
?oo" #
CMenusoo$ *
.oo* +
GetAplicacionesoo+ :
(oo: ;
_contextoo; C
,ooC D
-ooE F
$numooF G
)ooG H
:ooI J
CMenusooK Q
.ooQ R
GetAplicacionesooR a
(ooa b
_contextoob j
,ooj k
objRolool r
.oor s
Idsrooos x
)oox y
;ooy z
}pp 	
	protectedrr 
Listrr 
<rr 

SegPaginasrr !
>rr! "
GetPagesrr# +
(rr+ ,
)rr, -
{ss 	
vartt 
objRoltt 
=tt 
GetUserRolett $
(tt$ %
)tt% &
;tt& '
returnuu 
objRoluu 
==uu 
nulluu !
?uu" #
CMenusuu$ *
.uu* +
GetPagesuu+ 3
(uu3 4
thisuu4 8
.uu8 9
HttpContextuu9 D
,uuD E
_contextuuF N
,uuN O
-uuO P
$numuuP Q
)uuQ R
:uuS T
CMenusuuU [
.uu[ \
GetPagesuu\ d
(uud e
thisuue i
.uui j
HttpContextuuj u
,uuu v
_contextuuw 
,	uu �
objRol
uu� �
.
uu� �
Idsro
uu� �
)
uu� �
;
uu� �
}vv 	
}xx 
}yy �h
_C:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\CatDepartamentosController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class &
CatDepartamentosController +
:, -
BaseController. <
{ 
public &
CatDepartamentosController	 #
(# $
db_encuestasContext$ 7
context8 ?
,? @
IConfigurationA O

)] ^
:_ `
basea e
(e f
contextf m
,m n

)| }
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
return 
View 
( 
await 
_context &
.& '
CatDepartamentos' 7
.7 8
ToListAsync8 C
(C D
)D E
)E F
;F G
} 	
public 
async 
Task 
< 

>' (
Details) 0
(0 1
long1 5
?5 6
id7 9
)9 :
{ 	
if   
(   
id   
==   
null   
)   
{!! 
return"" 
NotFound"" 
(""  
)""  !
;""! "
}## 
var%% 
catDepartamentos%%  
=%%! "
await%%# (
_context%%) 1
.%%1 2
CatDepartamentos%%2 B
.&&  
SingleOrDefaultAsync&& %
(&&% &
m&&& '
=>&&( *
m&&+ ,
.&&, -
Idcde&&- 2
==&&3 5
id&&6 8
)&&8 9
;&&9 :
if'' 
('' 
catDepartamentos''  
==''! #
null''$ (
)''( )
{(( 
return)) 
NotFound)) 
())  
)))  !
;))! "
}** 
return,, 
View,, 
(,, 
catDepartamentos,, (
),,( )
;,,) *
}-- 	
public00 

Create00 #
(00# $
)00$ %
{11 	
return22 
View22 
(22 
)22 
;22 
}33 	
[88 	
HttpPost88	 
]88 
[99 	$
ValidateAntiForgeryToken99	 !
]99! "
public:: 
async:: 
Task:: 
<:: 

>::' (
Create::) /
(::/ 0
[::0 1
Bind::1 5
(::5 6
$str	::6 �
)
::� �
]
::� �
CatDepartamentos
::� �
catDepartamentos
::� �
)
::� �
{;; 	
if<< 
(<< 

ModelState<< 
.<< 
IsValid<< 
)<< 
{== 
try>> 
{?? 
catDepartamentos@@ $
.@@$ %
Usucre@@% +
=@@, -
this@@. 2
.@@2 3
GetLogin@@3 ;
(@@; <
)@@< =
;@@= >
_contextAA 
.AA
AddAA 
(AA 
catDepartamentosAA "
)AA" #
;AA# $
awaitBB 

_contextBB 
.BB 
SaveChangesAsyncBB $
(BB$ %
)BB% &
;BB& '
returnCC 
RedirectToActionCC (
(CC( )
nameofCC) /
(CC/ 0
IndexCC0 5
)CC5 6
)CC6 7
;CC7 8
}DD 
catchEE 	
(EE
 
	ExceptionEE 
expEE 
)EE 
{FF 
ifGG 
(GG 
expGG 
.GG 
InnerExceptionGG *
isGG+ -
NpgsqlExceptionGG. =
)GG= >
{HH 
ViewBagII 
.II  
ErrorDbII  '
=II( )
expII* -
.II- .
InnerExceptionII. <
.II< =
MessageII= D
;IID E
}JJ 
elseKK 
{LL 

ModelStateMM "
.MM" #

(MM0 1
$strMM1 3
,MM3 4
expMM5 8
.MM8 9
MessageMM9 @
)MM@ A
;MMA B
}NN 
returnOO 
ViewOO 
(OO  
)OO  !
;OO! "
}PP 
}QQ 
returnRR 
ViewRR 
(RR 
catDepartamentosRR (
)RR( )
;RR) *
}SS 	
publicVV 
asyncVV 
TaskVV 
<VV 

>VV' (
EditVV) -
(VV- .
longVV. 2
?VV2 3
idVV4 6
)VV6 7
{WW 	
ifXX 
(XX 
idXX 
==XX 
nullXX 
)XX 
{YY 
returnZZ 
NotFoundZZ 
(ZZ  
)ZZ  !
;ZZ! "
}[[ 
var]] 
catDepartamentos]]  
=]]! "
await]]# (
_context]]) 1
.]]1 2
CatDepartamentos]]2 B
.]]B C 
SingleOrDefaultAsync]]C W
(]]W X
m]]X Y
=>]]Z \
m]]] ^
.]]^ _
Idcde]]_ d
==]]e g
id]]h j
)]]j k
;]]k l
if^^ 
(^^ 
catDepartamentos^^  
==^^! #
null^^$ (
)^^( )
{__ 
return`` 
NotFound`` 
(``  
)``  !
;``! "
}aa 
returnbb 
Viewbb 
(bb 
catDepartamentosbb (
)bb( )
;bb) *
}cc 	
[hh 	
HttpPosthh	 
]hh 
[ii 	$
ValidateAntiForgeryTokenii	 !
]ii! "
publicjj 
asyncjj 
Taskjj 
<jj 

>jj' (
Editjj) -
(jj- .
longjj. 2
idjj3 5
,jj5 6
[jj7 8
Bindjj8 <
(jj< =
$str	jj= �
)
jj� �
]
jj� �
CatDepartamentos
jj� �
catDepartamentos
jj� �
)
jj� �
{kk 	
ifll 
(ll 
idll 
!=ll 
catDepartamentosll &
.ll& '
Idcdell' ,
)ll, -
{mm 
returnnn 
NotFoundnn 
(nn  
)nn  !
;nn! "
}oo 
ifqq 
(qq 

ModelStateqq 
.qq 
IsValidqq "
)qq" #
{rr 
tryss 
{tt 
catDepartamentosuu $
.uu$ %
Usumoduu% +
=uu, -
thisuu. 2
.uu2 3
GetLoginuu3 ;
(uu; <
)uu< =
;uu= >
catDepartamentosvv $
.vv$ %
Apitransaccionvv% 3
=vv4 5
$strvv6 A
;vvA B
_contextww 
.ww 
Updateww #
(ww# $
catDepartamentosww$ 4
)ww4 5
;ww5 6
awaitxx 
_contextxx "
.xx" #
SaveChangesAsyncxx# 3
(xx3 4
)xx4 5
;xx5 6
}yy 
catchzz 
(zz (
DbUpdateConcurrencyExceptionzz 3
)zz3 4
{{{ 
if|| 
(|| 
!|| "
CatDepartamentosExists|| /
(||/ 0
catDepartamentos||0 @
.||@ A
Idcde||A F
)||F G
)||G H
{}} 
return~~ 
NotFound~~ '
(~~' (
)~~( )
;~~) *
} 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
return
�� 
View
�� 
(
��  
catDepartamentos
��  0
)
��0 1
;
��1 2
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
return
�� 
View
�� 
(
�� 
catDepartamentos
�� (
)
��( )
;
��) *
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
catDepartamentos
��  
=
��! "
await
��# (
_context
��) 1
.
��1 2
CatDepartamentos
��2 B
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idcde
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
catDepartamentos
��  
==
��! #
null
��$ (
)
��( )
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
catDepartamentos
�� (
)
��( )
;
��) *
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 
catDepartamentos
�� 
=
�� 
await
��  
_context
��! )
.
��) *
CatDepartamentos
��* :
.
��: ;"
SingleOrDefaultAsync
��; O
(
��O P
m
��P Q
=>
��R T
m
��U V
.
��V W
Idcde
��W \
==
��] _
id
��` b
)
��b c
;
��c d
_context
�� 
.
�� 
CatDepartamentos
��
.
�� 
Remove
�� $
(
��$ %
catDepartamentos
��% 5
)
��5 6
;
��6 7
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
�� $
CatDepartamentosExists
�� +
(
��+ ,
long
��, 0
id
��1 3
)
��3 4
{
�� 	
return
�� 
_context
�� 
.
�� 
CatDepartamentos
�� ,
.
��, -
Any
��- 0
(
��0 1
e
��1 2
=>
��3 5
e
��6 7
.
��7 8
Idcde
��8 =
==
��> @
id
��A C
)
��C D
;
��D E
}
�� 	
}
�� 
}�� �g
YC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\CatNivelesController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class  
CatNivelesController %
:& '
BaseController( 6
{ 
public  
CatNivelesController	 
( 
db_encuestasContext 1
context2 9
,9 :
IConfiguration; I

)W X
:Y Z
base[ _
(_ `
context` g
,g h

)v w
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
return 
View 
( 
await 
_context &
.& '

CatNiveles' 1
.1 2
ToListAsync2 =
(= >
)> ?
)? @
;@ A
} 	
public 
async 
Task 
< 

>' (
Details) 0
(0 1
long1 5
?5 6
id7 9
)9 :
{ 	
if   
(   
id   
==   
null   
)   
{!! 
return"" 
NotFound"" 
(""  
)""  !
;""! "
}## 
var%% 

catNiveles%% 
=%% 
await%% "
_context%%# +
.%%+ ,

CatNiveles%%, 6
.&&  
SingleOrDefaultAsync&& %
(&&% &
m&&& '
=>&&( *
m&&+ ,
.&&, -
Idcnv&&- 2
==&&3 5
id&&6 8
)&&8 9
;&&9 :
if'' 
('' 

catNiveles'' 
=='' 
null'' "
)''" #
{(( 
return)) 
NotFound)) 
())  
)))  !
;))! "
}** 
return,, 
View,, 
(,, 

catNiveles,, "
),," #
;,,# $
}-- 	
public00 

Create00 #
(00# $
)00$ %
{11 	
return22 
View22 
(22 
)22 
;22 
}33 	
[88 	
HttpPost88	 
]88 
[99 	$
ValidateAntiForgeryToken99	 !
]99! "
public:: 
async:: 
Task:: 
<:: 

>::' (
Create::) /
(::/ 0
[::0 1
Bind::1 5
(::5 6
$str	::6 �
)
::� �
]
::� �

CatNiveles
::� �

catNiveles
::� �
)
::� �
{;; 	
if<< 
(<< 

ModelState<< 
.<< 
IsValid<< 
)<< 
{== 
try>> 
{?? 

catNiveles@@ 
.@@ 
Usucre@@ %
=@@& '
this@@( ,
.@@, -
GetLogin@@- 5
(@@5 6
)@@6 7
;@@7 8
_contextAA 
.AA
AddAA 
(AA 

catNivelesAA 
)AA 
;AA 
awaitBB 

_contextBB 
.BB 
SaveChangesAsyncBB $
(BB$ %
)BB% &
;BB& '
returnCC 
RedirectToActionCC (
(CC( )
nameofCC) /
(CC/ 0
IndexCC0 5
)CC5 6
)CC6 7
;CC7 8
}DD 
catchEE 	
(EE
 
	ExceptionEE 
expEE 
)EE 
{FF 
ifGG 
(GG 
expGG 
.GG 
InnerExceptionGG *
isGG+ -
NpgsqlExceptionGG. =
)GG= >
{HH 
ViewBagII 
.II  
ErrorDbII  '
=II( )
expII* -
.II- .
InnerExceptionII. <
.II< =
MessageII= D
;IID E
}JJ 
elseKK 
{LL 

ModelStateMM "
.MM" #

(MM0 1
$strMM1 3
,MM3 4
expMM5 8
.MM8 9
MessageMM9 @
)MM@ A
;MMA B
}NN 
returnPP 
ViewPP 
(PP  
)PP  !
;PP! "
}QQ 
}RR 
returnSS 
ViewSS 
(SS 

catNivelesSS "
)SS" #
;SS# $
}TT 	
publicWW 
asyncWW 
TaskWW 
<WW 

>WW' (
EditWW) -
(WW- .
longWW. 2
?WW2 3
idWW4 6
)WW6 7
{XX 	
ifYY 
(YY 
idYY 
==YY 
nullYY 
)YY 
{ZZ 
return[[ 
NotFound[[ 
([[  
)[[  !
;[[! "
}\\ 
var^^ 

catNiveles^^ 
=^^ 
await^^ "
_context^^# +
.^^+ ,

CatNiveles^^, 6
.^^6 7 
SingleOrDefaultAsync^^7 K
(^^K L
m^^L M
=>^^N P
m^^Q R
.^^R S
Idcnv^^S X
==^^Y [
id^^\ ^
)^^^ _
;^^_ `
if__ 
(__ 

catNiveles__ 
==__ 
null__ "
)__" #
{`` 
returnaa 
NotFoundaa 
(aa  
)aa  !
;aa! "
}bb 
returncc 
Viewcc 
(cc 

catNivelescc "
)cc" #
;cc# $
}dd 	
[ii 	
HttpPostii	 
]ii 
[jj 	$
ValidateAntiForgeryTokenjj	 !
]jj! "
publickk 
asynckk 
Taskkk 
<kk 

>kk' (
Editkk) -
(kk- .
longkk. 2
idkk3 5
,kk5 6
[kk7 8
Bindkk8 <
(kk< =
$str	kk= �
)
kk� �
]
kk� �

CatNiveles
kk� �

catNiveles
kk� �
)
kk� �
{ll 	
ifmm 
(mm 
idmm 
!=mm 

catNivelesmm  
.mm  !
Idcnvmm! &
)mm& '
{nn 
returnoo 
NotFoundoo 
(oo  
)oo  !
;oo! "
}pp 
ifrr 
(rr 

ModelStaterr 
.rr 
IsValidrr "
)rr" #
{ss 
trytt 
{uu 

catNivelesvv 
.vv 
Usumodvv %
=vv& '
thisvv( ,
.vv, -
GetLoginvv- 5
(vv5 6
)vv6 7
;vv7 8

catNivelesww 
.ww 
Apitransaccionww -
=ww. /
$strww0 ;
;ww; <
_contextxx 
.xx 
Updatexx #
(xx# $

catNivelesxx$ .
)xx. /
;xx/ 0
awaityy 
_contextyy "
.yy" #
SaveChangesAsyncyy# 3
(yy3 4
)yy4 5
;yy5 6
}zz 
catch{{ 
({{ (
DbUpdateConcurrencyException{{ 3
){{3 4
{|| 
if}} 
(}} 
!}} 
CatNivelesExists}} )
(}}) *

catNiveles}}* 4
.}}4 5
Idcnv}}5 :
)}}: ;
)}}; <
{~~ 
return 
NotFound '
(' (
)( )
;) *
}
�� 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
return
�� 
View
�� 
(
��  

catNiveles
��  *
)
��* +
;
��+ ,
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
return
�� 
View
�� 
(
�� 

catNiveles
�� "
)
��" #
;
��# $
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 

catNiveles
�� 
=
�� 
await
�� "
_context
��# +
.
��+ ,

CatNiveles
��, 6
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idcnv
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 

catNiveles
�� 
==
�� 
null
�� "
)
��" #
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 

catNiveles
�� "
)
��" #
;
��# $
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 

catNiveles
�� 
=
�� 
await
�� 
_context
�� #
.
��# $

CatNiveles
��$ .
.
��. /"
SingleOrDefaultAsync
��/ C
(
��C D
m
��D E
=>
��F H
m
��I J
.
��J K
Idcnv
��K P
==
��Q S
id
��T V
)
��V W
;
��W X
_context
�� 
.
�� 

CatNiveles
��
.
�� 
Remove
�� 
(
�� 

catNiveles
�� )
)
��) *
;
��* +
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
�� 
CatNivelesExists
�� %
(
��% &
long
��& *
id
��+ -
)
��- .
{
�� 	
return
�� 
_context
�� 
.
�� 

CatNiveles
�� &
.
��& '
Any
��' *
(
��* +
e
��+ ,
=>
��- /
e
��0 1
.
��1 2
Idcnv
��2 7
==
��8 :
id
��; =
)
��= >
;
��> ?
}
�� 	
}
�� 
}�� �h
_C:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\CatTiposPreguntaController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class &
CatTiposPreguntaController +
:, -
BaseController. <
{ 
public &
CatTiposPreguntaController	 #
(# $
db_encuestasContext$ 7
context8 ?
,? @
IConfigurationA O

)] ^
:_ `
basea e
(e f
contextf m
,m n

)| }
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
return 
View 
( 
await 
_context &
.& '
CatTiposPregunta' 7
.7 8
ToListAsync8 C
(C D
)D E
)E F
;F G
} 	
public 
async 
Task 
< 

>' (
Details) 0
(0 1
long1 5
?5 6
id7 9
)9 :
{ 	
if   
(   
id   
==   
null   
)   
{!! 
return"" 
NotFound"" 
(""  
)""  !
;""! "
}## 
var%% 
catTiposPregunta%%  
=%%! "
await%%# (
_context%%) 1
.%%1 2
CatTiposPregunta%%2 B
.&&  
SingleOrDefaultAsync&& %
(&&% &
m&&& '
=>&&( *
m&&+ ,
.&&, -
Idctp&&- 2
==&&3 5
id&&6 8
)&&8 9
;&&9 :
if'' 
('' 
catTiposPregunta''  
==''! #
null''$ (
)''( )
{(( 
return)) 
NotFound)) 
())  
)))  !
;))! "
}** 
return,, 
View,, 
(,, 
catTiposPregunta,, (
),,( )
;,,) *
}-- 	
public00 

Create00 #
(00# $
)00$ %
{11 	
return22 
View22 
(22 
)22 
;22 
}33 	
[88 	
HttpPost88	 
]88 
[99 	$
ValidateAntiForgeryToken99	 !
]99! "
public:: 
async:: 
Task:: 
<:: 

>::' (
Create::) /
(::/ 0
[::0 1
Bind::1 5
(::5 6
$str	::6 �
)
::� �
]
::� �
CatTiposPregunta
::� �
catTiposPregunta
::� �
)
::� �
{;; 	
if<< 
(<< 

ModelState<< 
.<< 
IsValid<< 
)<< 
{== 
try>> 
{?? 
catTiposPregunta@@ $
.@@$ %
Usucre@@% +
=@@, -
this@@. 2
.@@2 3
GetLogin@@3 ;
(@@; <
)@@< =
;@@= >
_contextAA 
.AA
AddAA 
(AA 
catTiposPreguntaAA "
)AA" #
;AA# $
awaitBB 

_contextBB 
.BB 
SaveChangesAsyncBB $
(BB$ %
)BB% &
;BB& '
returnCC 
RedirectToActionCC (
(CC( )
nameofCC) /
(CC/ 0
IndexCC0 5
)CC5 6
)CC6 7
;CC7 8
}DD 
catchEE 	
(EE
 
	ExceptionEE 
expEE 
)EE 
{FF 
ifGG 
(GG 
expGG 
.GG 
InnerExceptionGG *
isGG+ -
NpgsqlExceptionGG. =
)GG= >
{HH 
ViewBagII 
.II  
ErrorDbII  '
=II( )
expII* -
.II- .
InnerExceptionII. <
.II< =
MessageII= D
;IID E
}JJ 
elseKK 
{LL 

ModelStateMM "
.MM" #

(MM0 1
$strMM1 3
,MM3 4
expMM5 8
.MM8 9
MessageMM9 @
)MM@ A
;MMA B
}NN 
returnOO 
ViewOO 
(OO  
)OO  !
;OO! "
}PP 
}QQ 
returnRR 
ViewRR 
(RR 
catTiposPreguntaRR (
)RR( )
;RR) *
}SS 	
publicVV 
asyncVV 
TaskVV 
<VV 

>VV' (
EditVV) -
(VV- .
longVV. 2
?VV2 3
idVV4 6
)VV6 7
{WW 	
ifXX 
(XX 
idXX 
==XX 
nullXX 
)XX 
{YY 
returnZZ 
NotFoundZZ 
(ZZ  
)ZZ  !
;ZZ! "
}[[ 
var]] 
catTiposPregunta]]  
=]]! "
await]]# (
_context]]) 1
.]]1 2
CatTiposPregunta]]2 B
.]]B C 
SingleOrDefaultAsync]]C W
(]]W X
m]]X Y
=>]]Z \
m]]] ^
.]]^ _
Idctp]]_ d
==]]e g
id]]h j
)]]j k
;]]k l
if^^ 
(^^ 
catTiposPregunta^^  
==^^! #
null^^$ (
)^^( )
{__ 
return`` 
NotFound`` 
(``  
)``  !
;``! "
}aa 
returnbb 
Viewbb 
(bb 
catTiposPreguntabb (
)bb( )
;bb) *
}cc 	
[hh 	
HttpPosthh	 
]hh 
[ii 	$
ValidateAntiForgeryTokenii	 !
]ii! "
publicjj 
asyncjj 
Taskjj 
<jj 

>jj' (
Editjj) -
(jj- .
longjj. 2
idjj3 5
,jj5 6
[jj7 8
Bindjj8 <
(jj< =
$str	jj= �
)
jj� �
]
jj� �
CatTiposPregunta
jj� �
catTiposPregunta
jj� �
)
jj� �
{kk 	
ifll 
(ll 
idll 
!=ll 
catTiposPreguntall &
.ll& '
Idctpll' ,
)ll, -
{mm 
returnnn 
NotFoundnn 
(nn  
)nn  !
;nn! "
}oo 
ifqq 
(qq 

ModelStateqq 
.qq 
IsValidqq "
)qq" #
{rr 
tryss 
{tt 
catTiposPreguntauu $
.uu$ %
Usumoduu% +
=uu, -
thisuu. 2
.uu2 3
GetLoginuu3 ;
(uu; <
)uu< =
;uu= >
catTiposPreguntavv $
.vv$ %
Apitransaccionvv% 3
=vv4 5
$strvv6 A
;vvA B
_contextww 
.ww 
Updateww #
(ww# $
catTiposPreguntaww$ 4
)ww4 5
;ww5 6
awaitxx 
_contextxx "
.xx" #
SaveChangesAsyncxx# 3
(xx3 4
)xx4 5
;xx5 6
}yy 
catchzz 
(zz (
DbUpdateConcurrencyExceptionzz 3
)zz3 4
{{{ 
if|| 
(|| 
!|| "
CatTiposPreguntaExists|| /
(||/ 0
catTiposPregunta||0 @
.||@ A
Idctp||A F
)||F G
)||G H
{}} 
return~~ 
NotFound~~ '
(~~' (
)~~( )
;~~) *
} 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
return
�� 
View
�� 
(
��  
catTiposPregunta
��  0
)
��0 1
;
��1 2
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
return
�� 
View
�� 
(
�� 
catTiposPregunta
�� (
)
��( )
;
��) *
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
catTiposPregunta
��  
=
��! "
await
��# (
_context
��) 1
.
��1 2
CatTiposPregunta
��2 B
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idctp
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
catTiposPregunta
��  
==
��! #
null
��$ (
)
��( )
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
catTiposPregunta
�� (
)
��( )
;
��) *
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 
catTiposPregunta
�� 
=
�� 
await
��  
_context
��! )
.
��) *
CatTiposPregunta
��* :
.
��: ;"
SingleOrDefaultAsync
��; O
(
��O P
m
��P Q
=>
��R T
m
��U V
.
��V W
Idctp
��W \
==
��] _
id
��` b
)
��b c
;
��c d
_context
�� 
.
�� 
CatTiposPregunta
��
.
�� 
Remove
�� $
(
��$ %
catTiposPregunta
��% 5
)
��5 6
;
��6 7
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
�� $
CatTiposPreguntaExists
�� +
(
��+ ,
long
��, 0
id
��1 3
)
��3 4
{
�� 	
return
�� 
_context
�� 
.
�� 
CatTiposPregunta
�� ,
.
��, -
Any
��- 0
(
��0 1
e
��1 2
=>
��3 5
e
��6 7
.
��7 8
Idctp
��8 =
==
��> @
id
��A C
)
��C D
;
��D E
}
�� 	
}
�� 
}�� �

XC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\DashboardController.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Controllers  +
{ 
[ 
	Authorize 
] 
public		 

class		 
DashboardController		 $
:		% &
BaseController		' 5
{

 
public 
DashboardController "
(" #
db_encuestasContext# 6
context7 >
)> ?
:@ A
baseB F
(F G
contextG N
)N O
{ 	
}
public 

Index "
(" #
string# )
app* -
=. /
$str0 2
)2 3
{ 	
if 
( 
app 
!= 
$str 
) 
{ 
HttpContext 
. 
Session #
.# $
	SetString$ -
(- .
$str. :
,: ;
app< ?
)? @
;@ A
} 
return 
View 
( 
) 
; 
} 	
} 
} ��
[C:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\EncSeccionesController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class "
EncSeccionesController '
:( )
BaseController* 8
{ 
public "
EncSeccionesController	 
(  
db_encuestasContext  3
context4 ;
,; <
IConfiguration= K

)Y Z
:[ \
base] a
(a b
contextb i
,i j

)x y
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
var 
db_encuestasContext #
=$ %
_context& .
.. /
EncSecciones/ ;
. 
Where 
( 
sec 
=> 
sec !
.! "
Idopy" '
==( *
this+ /
./ 0

(= >
)> ?
)? @
. 
Include 
( 
e 
=> 
e 
.  
IdcnvNavigation  /
)/ 0
. 
Include 
( 
e 
=> 
e 
.  
IdopyNavigation  /
)/ 0
;0 1
return 
View 
( 
await 
db_encuestasContext 1
.1 2
ToListAsync2 =
(= >
)> ?
)? @
;@ A
} 	
public!! 
async!! 
Task!! 
<!! 

>!!' (
Details!!) 0
(!!0 1
long!!1 5
?!!5 6
id!!7 9
)!!9 :
{"" 	
if$$ 
($$ 
id$$ 
==$$ 
null$$ 
)$$ 
{%% 
return&& 
NotFound&& 
(&&  
)&&  !
;&&! "
}'' 
var)) 
encSecciones)) 
=)) 
await)) $
_context))% -
.))- .
EncSecciones)). :
.** 
Include** 
(** 
e** 
=>** 
e** 
.**  
IdcnvNavigation**  /
)**/ 0
.++ 
Include++ 
(++ 
e++ 
=>++ 
e++ 
.++  
IdopyNavigation++  /
)++/ 0
.,,  
SingleOrDefaultAsync,, %
(,,% &
m,,& '
=>,,( *
m,,+ ,
.,,, -
Idese,,- 2
==,,3 5
id,,6 8
),,8 9
;,,9 :
if-- 
(-- 
encSecciones-- 
==-- 
null--  $
)--$ %
{.. 
return// 
NotFound// 
(//  
)//  !
;//! "
}00 
return22 
View22 
(22 
encSecciones22 $
)22$ %
;22% &
}33 	
public66 

Create66 #
(66# $
)66$ %
{77 	
ViewData88 
[88 
$str88 
]88 
=88 
new88  #

SelectList88$ .
(88. /
_context88/ 7
.887 8

CatNiveles888 B
,88B C

CatNiveles99 
.99 
Fields99 !
.99! "
Idcnv99" '
.99' (
ToString99( 0
(990 1
)991 2
,992 3

CatNiveles:: 
.:: 
Fields:: !
.::! "
Descripcion::" -
.::- .
ToString::. 6
(::6 7
)::7 8
)::8 9
;::9 :
ViewData;; 
[;; 
$str;; 
];; 
=;; 
new;;  #

SelectList;;$ .
(;;. /
_context;;/ 7
.;;7 8
OpeProyectos;;8 D
.;;D E
Where;;E J
(;;J K
proy;;K O
=>;;P R
proy;;S W
.;;W X
Idopy;;X ]
==;;^ `

(;;n o
);;o p
);;p q
,;;q r
OpeProyectos<< 
.<< 
Fields<< #
.<<# $
Idopy<<$ )
.<<) *
ToString<<* 2
(<<2 3
)<<3 4
,<<4 5
OpeProyectos== 
.== 
Fields== #
.==# $
Nombre==$ *
.==* +
ToString==+ 3
(==3 4
)==4 5
)==5 6
;==6 7
return>> 
View>> 
(>> 
)>> 
;>> 
}?? 	
[DD 	
HttpPostDD	 
]DD 
[EE 	$
ValidateAntiForgeryTokenEE	 !
]EE! "
publicFF 
asyncFF 
TaskFF 
<FF 

>FF' (
CreateFF) /
(FF/ 0
[FF0 1
BindFF1 5
(FF5 6
$str	FF6 �
)
FF� �
]
FF� �
EncSecciones
FF� �
encSecciones
FF� �
)
FF� �
{GG 	
ifHH 
(HH 

ModelStateHH 
.HH 
IsValidHH 
)HH 
{II 
tryJJ 
{KK 
encSeccionesLL  
.LL  !
UsucreLL! '
=LL( )
thisLL* .
.LL. /
GetLoginLL/ 7
(LL7 8
)LL8 9
;LL9 :
_contextMM 
.MM
AddMM 
(MM 
encSeccionesMM 
)MM 
;MM  
awaitNN 

_contextNN 
.NN 
SaveChangesAsyncNN $
(NN$ %
)NN% &
;NN& '
returnOO 
RedirectToActionOO (
(OO( )
nameofOO) /
(OO/ 0
IndexOO0 5
)OO5 6
)OO6 7
;OO7 8
}PP 
catchQQ 	
(QQ
 
	ExceptionQQ 
expQQ 
)QQ 
{RR 
ifSS 
(SS 
expSS 
.SS 
InnerExceptionSS *
isSS+ -
NpgsqlExceptionSS. =
)SS= >
{TT 
ViewBagUU 
.UU  
ErrorDbUU  '
=UU( )
expUU* -
.UU- .
InnerExceptionUU. <
.UU< =
MessageUU= D
;UUD E
}VV 
elseWW 
{XX 

ModelStateYY "
.YY" #

(YY0 1
$strYY1 3
,YY3 4
expYY5 8
.YY8 9
MessageYY9 @
)YY@ A
;YYA B
}ZZ 
ViewData[[ 
[[[ 
$str[[ $
][[$ %
=[[& '
new\\ 

SelectList\\ &
(\\& '
_context\\' /
.\\/ 0

CatNiveles\\0 :
,\\: ;

CatNiveles]] "
.]]" #
Fields]]# )
.]]) *
Idcnv]]* /
.]]/ 0
ToString]]0 8
(]]8 9
)]]9 :
,]]: ;

CatNiveles^^ "
.^^" #
Fields^^# )
.^^) *
Descripcion^^* 5
.^^5 6
ToString^^6 >
(^^> ?
)^^? @
)^^@ A
;^^A B
ViewData__ 
[__ 
$str__ $
]__$ %
=__& '
new`` 

SelectList`` &
(``& '
_context``' /
.``/ 0
OpeProyectos``0 <
.``< =
Where``= B
(``B C
proy``C G
=>``H J
proy``K O
.``O P
Idopy``P U
==``V X

(``f g
)``g h
)``h i
,``i j
OpeProyectosaa $
.aa$ %
Fieldsaa% +
.aa+ ,
Idopyaa, 1
.aa1 2
ToStringaa2 :
(aa: ;
)aa; <
,aa< =
OpeProyectosbb $
.bb$ %
Fieldsbb% +
.bb+ ,
Nombrebb, 2
.bb2 3
ToStringbb3 ;
(bb; <
)bb< =
)bb= >
;bb> ?
returncc 
Viewcc 
(cc  
)cc  !
;cc! "
}dd 
}ee 
ViewDataff 
[ff 
$strff 
]ff 
=ff 
newff  #

SelectListff$ .
(ff. /
_contextff/ 7
.ff7 8

CatNivelesff8 B
,ffB C

CatNivelesgg 
.gg 
Fieldsgg !
.gg! "
Idcnvgg" '
.gg' (
ToStringgg( 0
(gg0 1
)gg1 2
,gg2 3

CatNiveleshh 
.hh 
Fieldshh !
.hh! "
Descripcionhh" -
.hh- .
ToStringhh. 6
(hh6 7
)hh7 8
,hh8 9
encSeccionesii 
.ii 
Idcnvii "
)ii" #
;ii# $
ViewDatajj 
[jj 
$strjj 
]jj 
=jj 
newjj  #

SelectListjj$ .
(jj. /
_contextjj/ 7
.jj7 8
OpeProyectosjj8 D
,jjD E
OpeProyectoskk 
.kk 
Fieldskk #
.kk# $
Idopykk$ )
.kk) *
ToStringkk* 2
(kk2 3
)kk3 4
,kk4 5
OpeProyectosll 
.ll 
Fieldsll #
.ll# $
Nombrell$ *
.ll* +
ToStringll+ 3
(ll3 4
)ll4 5
,ll5 6
encSeccionesmm 
.mm 
Idopymm "
)mm" #
;mm# $
returnnn 
Viewnn 
(nn 
encSeccionesnn $
)nn$ %
;nn% &
}oo 	
publicrr 
asyncrr 
Taskrr 
<rr 

>rr' (
Editrr) -
(rr- .
longrr. 2
?rr2 3
idrr4 6
)rr6 7
{ss 	
iftt 
(tt 
idtt 
==tt 
nulltt 
)tt 
{uu 
returnvv 
NotFoundvv 
(vv  
)vv  !
;vv! "
}ww 
varyy 
encSeccionesyy 
=yy 
awaityy $
_contextyy% -
.yy- .
EncSeccionesyy. :
.yy: ; 
SingleOrDefaultAsyncyy; O
(yyO P
myyP Q
=>yyR T
myyU V
.yyV W
IdeseyyW \
==yy] _
idyy` b
)yyb c
;yyc d
ifzz 
(zz 
encSeccioneszz 
==zz 
nullzz  $
)zz$ %
{{{ 
return|| 
NotFound|| 
(||  
)||  !
;||! "
}}} 
ViewData~~ 
[~~ 
$str~~ 
]~~ 
=~~ 
new~~  #

SelectList~~$ .
(~~. /
_context~~/ 7
.~~7 8

CatNiveles~~8 B
,~~B C

CatNiveles 
. 
Fields !
.! "
Idcnv" '
.' (
ToString( 0
(0 1
)1 2
,2 3

CatNiveles
�� 
.
�� 
Fields
�� !
.
��! "
Descripcion
��" -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
encSecciones
�� 
.
�� 
Idcnv
�� "
)
��" #
;
��# $
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
OpeProyectos
��8 D
.
��D E
Where
��E J
(
��J K
proy
��K O
=>
��P R
proy
��S W
.
��W X
Idopy
��X ]
==
��^ `

��a n
(
��n o
)
��o p
)
��p q
,
��q r
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
Idopy
��$ )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
Nombre
��$ *
.
��* +
ToString
��+ 3
(
��3 4
)
��4 5
,
��5 6
encSecciones
�� 
.
�� 
Idopy
�� "
)
��" #
;
��# $
return
�� 
View
�� 
(
�� 
encSecciones
�� $
)
��$ %
;
��% &
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Edit
��) -
(
��- .
long
��. 2
id
��3 5
,
��5 6
[
��7 8
Bind
��8 <
(
��< =
$str��= �
)��� �
]��� �
EncSecciones��� �
encSecciones��� �
)��� �
{
�� 	
if
�� 
(
�� 
id
�� 
!=
�� 
encSecciones
�� "
.
��" #
Idese
��# (
)
��( )
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
try
�� 
{
�� 
encSecciones
��  
.
��  !
Usumod
��! '
=
��( )
this
��* .
.
��. /
GetLogin
��/ 7
(
��7 8
)
��8 9
;
��9 :
encSecciones
��  
.
��  !
Apitransaccion
��! /
=
��0 1
$str
��2 =
;
��= >
_context
�� 
.
�� 
Update
�� #
(
��# $
encSecciones
��$ 0
)
��0 1
;
��1 2
await
�� 
_context
�� "
.
��" #
SaveChangesAsync
��# 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
catch
�� 
(
�� *
DbUpdateConcurrencyException
�� 3
)
��3 4
{
�� 
if
�� 
(
�� 
!
��  
EncSeccionesExists
�� +
(
��+ ,
encSecciones
��, 8
.
��8 9
Idese
��9 >
)
��> ?
)
��? @
{
�� 
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
}
�� 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0

CatNiveles
��0 :
,
��: ;

CatNiveles
�� "
.
��" #
Fields
��# )
.
��) *
Idcnv
��* /
.
��/ 0
ToString
��0 8
(
��8 9
)
��9 :
,
��: ;

CatNiveles
�� "
.
��" #
Fields
��# )
.
��) *
Descripcion
��* 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
)
��@ A
;
��A B
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
OpeProyectos
��0 <
.
��< =
Where
��= B
(
��B C
proy
��C G
=>
��H J
proy
��K O
.
��O P
Idopy
��P U
==
��V X

��Y f
(
��f g
)
��g h
)
��h i
,
��i j
OpeProyectos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Idopy
��, 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =
OpeProyectos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Nombre
��, 2
.
��2 3
ToString
��3 ;
(
��; <
)
��< =
)
��= >
;
��> ?
return
�� 
View
�� 
(
��  
encSecciones
��  ,
)
��, -
;
��- .
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8

CatNiveles
��8 B
,
��B C

CatNiveles
�� 
.
�� 
Fields
�� !
.
��! "
Idcnv
��" '
.
��' (
ToString
��( 0
(
��0 1
)
��1 2
,
��2 3

CatNiveles
�� 
.
�� 
Fields
�� !
.
��! "
Descripcion
��" -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
encSecciones
�� 
.
�� 
Idcnv
�� "
)
��" #
;
��# $
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
OpeProyectos
��8 D
.
��D E
Where
��E J
(
��J K
proy
��K O
=>
��P R
proy
��S W
.
��W X
Idopy
��X ]
==
��^ `

��a n
(
��n o
)
��o p
)
��p q
,
��q r
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
Idopy
��$ )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
Nombre
��$ *
.
��* +
ToString
��+ 3
(
��3 4
)
��4 5
,
��5 6
encSecciones
�� 
.
�� 
Idopy
�� "
)
��" #
;
��# $
return
�� 
View
�� 
(
�� 
encSecciones
�� $
)
��$ %
;
��% &
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
encSecciones
�� 
=
�� 
await
�� $
_context
��% -
.
��- .
EncSecciones
��. :
.
�� 
Include
�� 
(
�� 
e
�� 
=>
�� 
e
�� 
.
��  
IdcnvNavigation
��  /
)
��/ 0
.
�� 
Include
�� 
(
�� 
e
�� 
=>
�� 
e
�� 
.
��  
IdopyNavigation
��  /
)
��/ 0
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idese
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
encSecciones
�� 
==
�� 
null
��  $
)
��$ %
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
encSecciones
�� $
)
��$ %
;
��% &
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 
encSecciones
�� 
=
�� 
await
�� 
_context
�� %
.
��% &
EncSecciones
��& 2
.
��2 3"
SingleOrDefaultAsync
��3 G
(
��G H
m
��H I
=>
��J L
m
��M N
.
��N O
Idese
��O T
==
��U W
id
��X Z
)
��Z [
;
��[ \
_context
�� 
.
�� 
EncSecciones
��
.
�� 
Remove
��  
(
��  !
encSecciones
��! -
)
��- .
;
��. /
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <

CatNiveles
��< F
,
��F G

CatNiveles
�� 
.
�� 
Fields
�� %
.
��% &
Idcnv
��& +
.
��+ ,
ToString
��, 4
(
��4 5
)
��5 6
,
��6 7

CatNiveles
�� 
.
�� 
Fields
�� %
.
��% &
Descripcion
��& 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
)
��< =
;
��= >
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
OpeProyectos
��< H
.
��H I
Where
��I N
(
��N O
proy
��O S
=>
��T V
proy
��W [
.
��[ \
Idopy
��\ a
==
��b d

��e r
(
��r s
)
��s t
)
��t u
,
��u v
OpeProyectos
��  
.
��  !
Fields
��! '
.
��' (
Idopy
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
OpeProyectos
��  
.
��  !
Fields
��! '
.
��' (
Nombre
��( .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
)
��9 :
;
��: ;
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
��  
EncSeccionesExists
�� '
(
��' (
long
��( ,
id
��- /
)
��/ 0
{
�� 	
return
�� 
_context
�� 
.
�� 
EncSecciones
�� (
.
��( )
Any
��) ,
(
��, -
e
��- .
=>
��/ 1
e
��2 3
.
��3 4
Idese
��4 9
==
��: <
id
��= ?
)
��? @
;
��@ A
}
�� 	
}
�� 
}�� ��
ZC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\OpeBrigadasController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class !
OpeBrigadasController &
:' (
BaseController) 7
{ 
public !
OpeBrigadasController	 
( 
db_encuestasContext 2
context3 :
,: ;
IConfiguration< J

)X Y
:Z [
base\ `
(` a
contexta h
,h i

)w x
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
var 
lstDepto 
= 
this 
.  
GetDeptoRestriccion  3
(3 4
)4 5
;5 6
ViewData 
[ 
$str 
] 
= 
lstDepto  (
;( )
var 
db_encuestasContext #
=$ %
_context& .
.. /
OpeBrigadas/ :
. 
Where 
( 
bri 
=> 
bri !
.! "
Idopy" '
==( *

(8 9
)9 :
&&; =
bri> A
.A B
IdcdeB G
==H J
lstDeptoK S
.S T
FirstT Y
(Y Z
)Z [
.[ \
Idcde\ a
)a b
. 
Include 
( 
o 
=> 
o 
.  
IdcdeNavigation  /
)/ 0
.0 1
Include1 8
(8 9
o9 :
=>; =
o> ?
.? @
IdopyNavigation@ O
)O P
;P Q
return 
View 
( 
await 
db_encuestasContext 1
.1 2
ToListAsync2 =
(= >
)> ?
)? @
;@ A
} 	
public!! 
PartialViewResult!!  
GetBrigadas!!! ,
(!!, -
long!!- 1
?!!1 2
idcde!!3 8
)!!8 9
{"" 	
var## 
db_encuestasContext## #
=##$ %
_context##& .
.##. /
OpeBrigadas##/ :
.$$ 
Where$$ 
($$ 
bri$$ 
=>$$ 
bri$$ !
.$$! "
Idopy$$" '
==$$( *

($$8 9
)$$9 :
&&$$; =
bri$$> A
.$$A B
Idcde$$B G
==$$H J
idcde$$K P
)$$P Q
.%% 
Include%% 
(%% 
o%% 
=>%% 
o%% 
.%%  
IdcdeNavigation%%  /
)%%/ 0
.%%0 1
Include%%1 8
(%%8 9
o%%9 :
=>%%; =
o%%> ?
.%%? @
IdopyNavigation%%@ O
)%%O P
;%%P Q
return&& 
PartialView&& 
(&& 
$str&& .
,&&. /
db_encuestasContext&&/ B
.&&B C
ToList&&C I
(&&I J
)&&J K
)&&K L
;&&L M
}'' 	
public** 
async** 
Task** 
<** 

>**' (
Details**) 0
(**0 1
long**1 5
?**5 6
id**7 9
)**9 :
{++ 	
if-- 
(-- 
id-- 
==-- 
null-- 
)-- 
{.. 
return// 
NotFound// 
(//  
)//  !
;//! "
}00 
var22 
opeBrigadas22 
=22 
await22 #
_context22$ ,
.22, -
OpeBrigadas22- 8
.33 
Include33 
(33 
o33 
=>33 
o33 
.33  
IdcdeNavigation33  /
)33/ 0
.44 
Include44 
(44 
o44 
=>44 
o44 
.44  
IdopyNavigation44  /
)44/ 0
.55  
SingleOrDefaultAsync55 %
(55% &
m55& '
=>55( *
m55+ ,
.55, -
Idobr55- 2
==553 5
id556 8
)558 9
;559 :
if66 
(66 
opeBrigadas66 
==66 
null66 #
)66# $
{77 
return88 
NotFound88 
(88  
)88  !
;88! "
}99 
return;; 
View;; 
(;; 
opeBrigadas;; #
);;# $
;;;$ %
}<< 	
public?? 

Create?? #
(??# $
)??$ %
{@@ 	
ViewDataAA 
[AA 
$strAA 
]AA 
=AA 
newAA  #

SelectListAA$ .
(AA. /
_contextAA/ 7
.AA7 8
CatDepartamentosAA8 H
,AAH I
CatDepartamentosBB  
.BB  !
FieldsBB! '
.BB' (
IdcdeBB( -
.BB- .
ToStringBB. 6
(BB6 7
)BB7 8
,BB8 9
CatDepartamentosCC  
.CC  !
FieldsCC! '
.CC' (
NombreCC( .
.CC. /
ToStringCC/ 7
(CC7 8
)CC8 9
)CC9 :
;CC: ;
ViewDataDD 
[DD 
$strDD 
]DD 
=DD 
newDD  #

SelectListDD$ .
(DD. /
_contextDD/ 7
.DD7 8
OpeProyectosDD8 D
.DDD E
WhereDDE J
(DDJ K
proyDDK O
=>DDP R
proyDDS W
.DDW X
IdopyDDX ]
==DD^ `
thisDDa e
.DDe f

(DDs t
)DDt u
)DDu v
,DDv w
OpeProyectosEE 
.EE 
FieldsEE #
.EE# $
IdopyEE$ )
.EE) *
ToStringEE* 2
(EE2 3
)EE3 4
,EE4 5
OpeProyectosFF 
.FF 
FieldsFF #
.FF# $
NombreFF$ *
.FF* +
ToStringFF+ 3
(FF3 4
)FF4 5
)FF5 6
;FF6 7
returnGG 
ViewGG 
(GG 
)GG 
;GG 
}HH 	
[MM 	
HttpPostMM	 
]MM 
[NN 	$
ValidateAntiForgeryTokenNN	 !
]NN! "
publicOO 
asyncOO 
TaskOO 
<OO 

>OO' (
CreateOO) /
(OO/ 0
[OO0 1
BindOO1 5
(OO5 6
$str	OO6 �
)
OO� �
]
OO� �
OpeBrigadas
OO� �
opeBrigadas
OO� �
)
OO� �
{PP 	
ifQQ 
(QQ 

ModelStateQQ 
.QQ 
IsValidQQ 
)QQ 
{RR 
trySS 
{TT 
opeBrigadasUU 
.UU  
UsucreUU  &
=UU' (
thisUU) -
.UU- .
GetLoginUU. 6
(UU6 7
)UU7 8
;UU8 9
_contextVV 
.VV
AddVV 
(VV 
opeBrigadasVV 
)VV 
;VV 
awaitWW 

_contextWW 
.WW 
SaveChangesAsyncWW $
(WW$ %
)WW% &
;WW& '
returnXX 
RedirectToActionXX (
(XX( )
nameofXX) /
(XX/ 0
IndexXX0 5
)XX5 6
)XX6 7
;XX7 8
}YY 
catchZZ 	
(ZZ
 
	ExceptionZZ 
expZZ 
)ZZ 
{[[ 
if\\ 
(\\ 
exp\\ 
.\\ 
InnerException\\ *
is\\+ -
NpgsqlException\\. =
)\\= >
{]] 
ViewBag^^ 
.^^  
ErrorDb^^  '
=^^( )
exp^^* -
.^^- .
InnerException^^. <
.^^< =
Message^^= D
;^^D E
}__ 
else`` 
{aa 

ModelStatebb "
.bb" #

(bb0 1
$strbb1 3
,bb3 4
expbb5 8
.bb8 9
Messagebb9 @
)bb@ A
;bbA B
}cc 
ViewDatadd 
[dd 
$strdd $
]dd$ %
=dd& '
newdd( +

SelectListdd, 6
(dd6 7
_contextdd7 ?
.dd? @
CatDepartamentosdd@ P
,ddP Q
CatDepartamentosee (
.ee( )
Fieldsee) /
.ee/ 0
Idcdeee0 5
.ee5 6
ToStringee6 >
(ee> ?
)ee? @
,ee@ A
CatDepartamentosff (
.ff( )
Fieldsff) /
.ff/ 0
Nombreff0 6
.ff6 7
ToStringff7 ?
(ff? @
)ff@ A
)ffA B
;ffB C
ViewDatagg 
[gg 
$strgg $
]gg$ %
=gg& '
newhh 

SelectListhh &
(hh& '
_contexthh' /
.hh/ 0
OpeProyectoshh0 <
.hh< =
Wherehh= B
(hhB C
proyhhC G
=>hhH J
proyhhK O
.hhO P
IdopyhhP U
==hhV X
thishhY ]
.hh] ^

(hhk l
)hhl m
)hhm n
,hhn o
OpeProyectosii (
.ii( )
Fieldsii) /
.ii/ 0
Idopyii0 5
.ii5 6
ToStringii6 >
(ii> ?
)ii? @
,ii@ A
OpeProyectosjj (
.jj( )
Fieldsjj) /
.jj/ 0
Nombrejj0 6
.jj6 7
ToStringjj7 ?
(jj? @
)jj@ A
)jjA B
;jjB C
returnkk 
Viewkk 
(kk  
)kk  !
;kk! "
}ll 
}mm 
ViewDatann 
[nn 
$strnn 
]nn 
=nn 
newnn  #

SelectListnn$ .
(nn. /
_contextnn/ 7
.nn7 8
CatDepartamentosnn8 H
,nnH I
CatDepartamentosoo  
.oo  !
Fieldsoo! '
.oo' (
Idcdeoo( -
.oo- .
ToStringoo. 6
(oo6 7
)oo7 8
,oo8 9
CatDepartamentospp  
.pp  !
Fieldspp! '
.pp' (
Nombrepp( .
.pp. /
ToStringpp/ 7
(pp7 8
)pp8 9
,pp9 :
opeBrigadaspp; F
.ppF G
IdcdeppG L
)ppL M
;ppM N
ViewDataqq 
[qq 
$strqq 
]qq 
=qq 
newqq  #

SelectListqq$ .
(qq. /
_contextqq/ 7
.qq7 8
OpeProyectosqq8 D
.qqD E
WhereqqE J
(qqJ K
proyqqK O
=>qqP R
proyqqS W
.qqW X
IdopyqqX ]
==qq^ `
thisqqa e
.qqe f

(qqs t
)qqt u
)qqu v
,qqv w
OpeProyectosrr 
.rr 
Fieldsrr #
.rr# $
Idopyrr$ )
.rr) *
ToStringrr* 2
(rr2 3
)rr3 4
,rr4 5
OpeProyectosss 
.ss 
Fieldsss #
.ss# $
Nombress$ *
.ss* +
ToStringss+ 3
(ss3 4
)ss4 5
,ss5 6
opeBrigadasss7 B
.ssB C
IdopyssC H
)ssH I
;ssI J
returntt 
Viewtt 
(tt 
opeBrigadastt #
)tt# $
;tt$ %
}uu 	
publicxx 
asyncxx 
Taskxx 
<xx 

>xx' (
Editxx) -
(xx- .
longxx. 2
?xx2 3
idxx4 6
)xx6 7
{yy 	
ifzz 
(zz 
idzz 
==zz 
nullzz 
)zz 
{{{ 
return|| 
NotFound|| 
(||  
)||  !
;||! "
}}} 
var 
opeBrigadas 
= 
await #
_context$ ,
., -
OpeBrigadas- 8
.8 9 
SingleOrDefaultAsync9 M
(M N
mN O
=>P R
mS T
.T U
IdobrU Z
==[ ]
id^ `
)` a
;a b
if
�� 
(
�� 
opeBrigadas
�� 
==
�� 
null
�� #
)
��# $
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
CatDepartamentos
��8 H
,
��H I
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
Idcde
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
Nombre
��( .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
,
��9 :
opeBrigadas
��; F
.
��F G
Idcde
��G L
)
��L M
;
��M N
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
OpeProyectos
��8 D
.
��D E
Where
��E J
(
��J K
proy
��K O
=>
��P R
proy
��S W
.
��W X
Idopy
��X ]
==
��^ `
this
��a e
.
��e f

��f s
(
��s t
)
��t u
)
��u v
,
��v w
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
Idopy
��$ )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
	Apiestado
��$ -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
opeBrigadas
��: E
.
��E F
Idopy
��F K
)
��K L
;
��L M
return
�� 
View
�� 
(
�� 
opeBrigadas
�� #
)
��# $
;
��$ %
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Edit
��) -
(
��- .
long
��. 2
id
��3 5
,
��5 6
[
��7 8
Bind
��8 <
(
��< =
$str��= �
)��� �
]��� �
OpeBrigadas��� �
opeBrigadas��� �
)��� �
{
�� 	
if
�� 
(
�� 
id
�� 
!=
�� 
opeBrigadas
�� !
.
��! "
Idobr
��" '
)
��' (
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
try
�� 
{
�� 
opeBrigadas
�� 
.
��  
Usumod
��  &
=
��' (
this
��) -
.
��- .
GetLogin
��. 6
(
��6 7
)
��7 8
;
��8 9
opeBrigadas
�� 
.
��  
Apitransaccion
��  .
=
��/ 0
$str
��1 <
;
��< =
_context
�� 
.
�� 
Update
�� #
(
��# $
opeBrigadas
��$ /
)
��/ 0
;
��0 1
await
�� 
_context
�� "
.
��" #
SaveChangesAsync
��# 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
catch
�� 
(
�� *
DbUpdateConcurrencyException
�� 3
)
��3 4
{
�� 
if
�� 
(
�� 
!
�� 
OpeBrigadasExists
�� *
(
��* +
opeBrigadas
��+ 6
.
��6 7
Idobr
��7 <
)
��< =
)
��= >
{
�� 
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
}
�� 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
��( +

SelectList
��, 6
(
��6 7
_context
��7 ?
.
��? @
CatDepartamentos
��@ P
,
��P Q
CatDepartamentos
�� (
.
��( )
Fields
��) /
.
��/ 0
Idcde
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A
CatDepartamentos
�� (
.
��( )
Fields
��) /
.
��/ 0
Nombre
��0 6
.
��6 7
ToString
��7 ?
(
��? @
)
��@ A
)
��A B
;
��B C
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
��( +

SelectList
��, 6
(
��6 7
_context
��7 ?
.
��? @
OpeProyectos
��@ L
.
��L M
Where
��M R
(
��R S
proy
��S W
=>
��X Z
proy
��[ _
.
��_ `
Idopy
��` e
==
��f h
this
��i m
.
��m n

��n {
(
��{ |
)
��| }
)
��} ~
,
��~ 
OpeProyectos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Idopy
��, 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =
OpeProyectos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Nombre
��, 2
.
��2 3
ToString
��3 ;
(
��; <
)
��< =
)
��= >
;
��> ?
return
�� 
View
�� 
(
��  
opeBrigadas
��  +
)
��+ ,
;
��, -
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
CatDepartamentos
��8 H
,
��H I
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
Idcde
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
Nombre
��( .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
,
��9 :
opeBrigadas
��; F
.
��F G
Idcde
��G L
)
��L M
;
��M N
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
OpeProyectos
��8 D
.
��D E
Where
��E J
(
��J K
proy
��K O
=>
��P R
proy
��S W
.
��W X
Idopy
��X ]
==
��^ `
this
��a e
.
��e f

��f s
(
��s t
)
��t u
)
��u v
,
��v w
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
Idopy
��$ )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
Nombre
��$ *
.
��* +
ToString
��+ 3
(
��3 4
)
��4 5
,
��5 6
opeBrigadas
��7 B
.
��B C
Idopy
��C H
)
��H I
;
��I J
return
�� 
View
�� 
(
�� 
opeBrigadas
�� #
)
��# $
;
��$ %
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
opeBrigadas
�� 
=
�� 
await
�� #
_context
��$ ,
.
��, -
OpeBrigadas
��- 8
.
�� 
Include
�� 
(
�� 
o
�� 
=>
�� 
o
�� 
.
��  
IdcdeNavigation
��  /
)
��/ 0
.
�� 
Include
�� 
(
�� 
o
�� 
=>
�� 
o
�� 
.
��  
IdopyNavigation
��  /
)
��/ 0
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idobr
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
opeBrigadas
�� 
==
�� 
null
�� #
)
��# $
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
opeBrigadas
�� #
)
��# $
;
��$ %
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 
opeBrigadas
�� 
=
�� 
await
�� 
_context
�� $
.
��$ %
OpeBrigadas
��% 0
.
��0 1"
SingleOrDefaultAsync
��1 E
(
��E F
m
��F G
=>
��H J
m
��K L
.
��L M
Idobr
��M R
==
��S U
id
��V X
)
��X Y
;
��Y Z
_context
�� 
.
�� 
OpeBrigadas
��
.
�� 
Remove
�� 
(
��  
opeBrigadas
��  +
)
��+ ,
;
��, -
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
CatDepartamentos
��< L
,
��L M
CatDepartamentos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Idcde
��, 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =
CatDepartamentos
�� $
.
��$ %
Fields
��% +
.
��+ ,
	Apiestado
��, 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
)
��@ A
;
��A B
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
OpeProyectos
��< H
.
��H I
Where
��I N
(
��N O
proy
��O S
=>
��T V
proy
��W [
.
��[ \
Idopy
��\ a
==
��b d
this
��e i
.
��i j

��j w
(
��w x
)
��x y
)
��y z
,
��z {
OpeProyectos
��  
.
��  !
Fields
��! '
.
��' (
Idopy
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
OpeProyectos
��  
.
��  !
Fields
��! '
.
��' (
Nombre
��( .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
)
��9 :
;
��: ;
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
�� 
OpeBrigadasExists
�� &
(
��& '
long
��' +
id
��, .
)
��. /
{
�� 	
return
�� 
_context
�� 
.
�� 
OpeBrigadas
�� '
.
��' (
Any
��( +
(
��+ ,
e
��, -
=>
��. 0
e
��1 2
.
��2 3
Idobr
��3 8
==
��9 ;
id
��< >
)
��> ?
;
��? @
}
�� 	
}
�� 
}�� ��
]C:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\OpeMovimientosController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class $
OpeMovimientosController )
:* +
BaseController, :
{ 
public $
OpeMovimientosController	 !
(! "
db_encuestasContext" 5
context6 =
,= >
IConfiguration? M

)[ \
:] ^
base_ c
(c d
contextd k
,k l

)z {
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
var 
lstDepto 
= 
this 
.  
GetDeptoRestriccion  3
(3 4
)4 5
;5 6
ViewData 
[ 
$str 
] 
= 
lstDepto  (
;( )
var 
db_encuestasContext #
=$ %
_context& .
.. /
OpeMovimientos/ =
. 
Where 
( 
aux 
=> 
aux !
.! "
IdoupNavigation" 1
.1 2
Idopy2 7
==8 :

(H I
)I J
&&K M
aux !
.! "
IdoupNavigation" 1
.1 2
Idcde2 7
==8 :
lstDepto; C
.C D
FirstD I
(I J
)J K
.K L
IdcdeL Q
&&R T
aux !
.! "
	Apiestado" +
.+ ,
Equals, 2
(2 3
$str3 >
)> ?
)? @
. 
Include 
( 
o 
=> 
o 
.  
IdsusNavigation  /
)/ 0
.   
Include   
(   
o   
=>   
o   
.    
IdoupNavigation    /
)  / 0
.!! 
Include!! 
(!! 
o!! 
=>!! 
o!! 
.!!  
IdsusNavigation!!  /
.!!/ 0
IdobrNavigation!!0 ?
)!!? @
;!!@ A
return"" 
View"" 
("" 
await"" 
db_encuestasContext"" 1
.""1 2
ToListAsync""2 =
(""= >
)""> ?
)""? @
;""@ A
}## 	
public%% 
PartialViewResult%%  
GetMovimientos%%! /
(%%/ 0
long%%0 4
?%%4 5
idcde%%6 ;
)%%; <
{&& 	
var'' 
db_encuestasContext'' #
=''$ %
_context''& .
.''. /
OpeMovimientos''/ =
.(( 
Where(( 
((( 
aux(( 
=>(( 
aux(( !
.((! "
IdoupNavigation((" 1
.((1 2
Idopy((2 7
==((8 :

(((H I
)((I J
&&((K M
aux)) !
.))! "
IdoupNavigation))" 1
.))1 2
Idcde))2 7
==))8 :
idcde)); @
&&))A C
aux** !
.**! "
	Apiestado**" +
.**+ ,
Equals**, 2
(**2 3
$str**3 >
)**> ?
)**? @
.++ 
Include++ 
(++ 
o++ 
=>++ 
o++ 
.++  
IdsusNavigation++  /
)++/ 0
.++0 1
Include++1 8
(++8 9
o++9 :
=>++; =
o++> ?
.++? @
IdoupNavigation++@ O
)++O P
.,, 
Include,, 
(,, 
o,, 
=>,, 
o,, 
.,,  
IdsusNavigation,,  /
.,,/ 0
IdobrNavigation,,0 ?
),,? @
;,,@ A
return-- 
PartialView-- 
(-- 
$str-- .
,--. /
db_encuestasContext--/ B
.--B C
ToList--C I
(--I J
)--J K
)--K L
;--L M
}.. 	
public11 
async11 
Task11 
<11 

>11' (
Details11) 0
(110 1
long111 5
?115 6
id117 9
)119 :
{22 	
if44 
(44 
id44 
==44 
null44 
)44 
{55 
return66 
NotFound66 
(66  
)66  !
;66! "
}77 
var99 
opeMovimientos99 
=99  
await99! &
_context99' /
.99/ 0
OpeMovimientos990 >
.:: 
Include:: 
(:: 
o:: 
=>:: 
o:: 
.::  
IdoupNavigation::  /
)::/ 0
.;; 
Include;; 
(;; 
o;; 
=>;; 
o;; 
.;;  
IdsusNavigation;;  /
);;/ 0
.<<  
SingleOrDefaultAsync<< %
(<<% &
m<<& '
=><<( *
m<<+ ,
.<<, -
Idomv<<- 2
==<<3 5
id<<6 8
)<<8 9
;<<9 :
if== 
(== 
opeMovimientos== 
==== !
null==" &
)==& '
{>> 
return?? 
NotFound?? 
(??  
)??  !
;??! "
}@@ 
returnBB 
ViewBB 
(BB 
opeMovimientosBB &
)BB& '
;BB' (
}CC 	
publicFF 

CreateFF #
(FF# $
)FF$ %
{GG 	
varHH 
UpmsHH 
=HH 
_contextII 
.II 
OpeUpmsII  
.JJ 
WhereJJ 
(JJ 
oupJJ 
=>JJ !
oupJJ" %
.JJ% &
IdcdeJJ& +
==JJ, .
GetDepartamentoIdJJ/ @
(JJ@ A
)JJA B
&&JJC E
oupJJF I
.JJI J
IdopyJJJ O
==JJP R

(JJ` a
)JJa b
)JJb c
.KK 
SelectKK 
(KK 
sKK 
=>KK  
newKK! $
{LL 
IdUpmMM 
=MM 
sMM  !
.MM! "
IdoupMM" '
,MM' (
	NombreUpmNN !
=NN" #
$"NN$ &
{NN& '
sNN' (
.NN( )
CodigoNN) /
}NN/ 0
 - NN0 3
{NN3 4
sNN4 5
.NN5 6
NombreNN6 <
}NN< =
"NN= >
}OO 
)OO 
.PP 
ToListPP 
(PP 
)PP 
;PP 
ViewDataQQ 
[QQ 
$strQQ 
]QQ 
=QQ 
newQQ  #

SelectListQQ$ .
(QQ. /
UpmsQQ/ 3
,QQ3 4
$strQQ4 ;
,QQ; <
$strQQ< G
)QQG H
;QQH I
ViewDataSS 
[SS 
$strSS 
]SS 
=SS 
newSS  #

SelectListSS$ .
(SS. /
_contextSS/ 7
.SS7 8
SegUsuariosSS8 C
,SSC D
SegUsuariosTT 
.TT 
FieldsTT "
.TT" #
IdsusTT# (
.TT( )
ToStringTT) 1
(TT1 2
)TT2 3
,TT3 4
SegUsuariosUU 
.UU 
FieldsUU "
.UU" #
LoginUU# (
.UU( )
ToStringUU) 1
(UU1 2
)UU2 3
)UU3 4
;UU4 5
returnVV 
ViewVV 
(VV 
)VV 
;VV 
}WW 	
[\\ 	
HttpPost\\	 
]\\ 
[]] 	$
ValidateAntiForgeryToken]]	 !
]]]! "
public^^ 
async^^ 
Task^^ 
<^^ 

>^^' (
Create^^) /
(^^/ 0
[^^0 1
Bind^^1 5
(^^5 6
$str^^6 ~
)^^~ 
]	^^ �
OpeMovimientos
^^� �
opeMovimientos
^^� �
)
^^� �
{__ 	
if`` 
(`` 

ModelState`` 
.`` 
IsValid`` 
)`` 
{aa 
trybb 
{cc 
varee 
opeMovExistenteee 
=ee 
awaitee #
_contextee$ ,
.ee, -
OpeMovimientosee- ;
.ff 
SingleOrDefaultAsyncff
(ff! "
mff" #
=>ff$ &
mff' (
.ff( )
Idsusff) .
==ff/ 1
opeMovimientosff2 @
.ff@ A
IdsusffA F
&&ffG I
mgg' (
.gg( )
Idoupgg) .
==gg/ 1
opeMovimientosgg2 @
.gg@ A
IdoupggA F
)ggF G
;ggG H
ifii 

(ii 
opeMovExistenteii 
==ii 
nullii #
)ii# $
{jj 	
opeMovimientoskk 
.kk 
Usucrekk !
=kk" #
thiskk$ (
.kk( )
GetLoginkk) 1
(kk1 2
)kk2 3
;kk3 4
_contextll 
.ll 
Addll 
(ll 
opeMovimientosll '
)ll' (
;ll( )
}mm 	
elsenn 
{oo 	
opeMovExistentepp 
.pp 
Usumodpp "
=pp# $
thispp% )
.pp) *
GetLoginpp* 2
(pp2 3
)pp3 4
;pp4 5
opeMovExistenteqq 
.qq 
Apitransaccionqq *
=qq+ ,
$strqq- 8
;qq8 9
_contextrr 
.rr 
Updaterr 
(rr 
opeMovExistenterr +
)rr+ ,
;rr, -
}ss 	
awaittt 

_contexttt 
.tt 
SaveChangesAsynctt $
(tt$ %
)tt% &
;tt& '
returnuu 
RedirectToActionuu (
(uu( )
nameofuu) /
(uu/ 0
Indexuu0 5
)uu5 6
)uu6 7
;uu7 8
}vv 
catchww 	
(ww
 
	Exceptionww 
expww 
)ww 
{xx 
ifyy 
(yy 
expyy 
.yy 
InnerExceptionyy *
isyy+ -
NpgsqlExceptionyy. =
)yy= >
{zz 
ViewBag{{ 
.{{  
ErrorDb{{  '
={{( )
exp{{* -
.{{- .
InnerException{{. <
.{{< =
Message{{= D
;{{D E
}|| 
else}} 
{~~ 

ModelState "
." #

(0 1
$str1 3
,3 4
exp5 8
.8 9
Message9 @
)@ A
;A B
}
�� 
var
�� 
Upms1
�� 
=
�� 
_context
��  
.
��  !
OpeUpms
��! (
.
�� 
Where
�� "
(
��" #
oup
��# &
=>
��' )
oup
��* -
.
��- .
Idcde
��. 3
==
��4 6
GetDepartamentoId
��7 H
(
��H I
)
��I J
&&
��K M
oup
��N Q
.
��Q R
Idopy
��R W
==
��X Z

��[ h
(
��h i
)
��i j
)
��j k
.
�� 
Select
�� #
(
��# $
s
��$ %
=>
��& (
new
��) ,
{
�� 
IdUpm
��  %
=
��& '
s
��( )
.
��) *
Idoup
��* /
,
��/ 0
	NombreUpm
��  )
=
��* +
$"
��, .
{
��. /
s
��/ 0
.
��0 1
Codigo
��1 7
}
��7 8
 - 
��8 ;
{
��; <
s
��< =
.
��= >
Nombre
��> D
}
��D E
"
��E F
}
�� 
)
�� 
.
�� 
ToList
�� #
(
��# $
)
��$ %
;
��% &
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
��( +

SelectList
��, 6
(
��6 7
Upms1
��7 <
,
��< =
$str
��= D
,
��D E
$str
��E P
)
��P Q
;
��Q R
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
SegUsuarios
��0 ;
,
��; <
SegUsuarios
�� #
.
��# $
Fields
��$ *
.
��* +
Idsus
��+ 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
,
��; <
SegUsuarios
�� #
.
��# $
Fields
��$ *
.
��* +
Login
��+ 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
)
��; <
;
��< =
return
�� 
View
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 
var
�� 
Upms2
�� 
=
�� 
_context
�� 
.
�� 
OpeUpms
��  
.
�� 
Where
�� 
(
�� 
oup
�� 
=>
�� !
oup
��" %
.
��% &
Idcde
��& +
==
��, .
GetDepartamentoId
��/ @
(
��@ A
)
��A B
&&
��C E
oup
��F I
.
��I J
Idopy
��J O
==
��P R

��S `
(
��` a
)
��a b
)
��b c
.
�� 
Select
�� 
(
�� 
s
�� 
=>
��  
new
��! $
{
�� 
IdUpm
�� 
=
�� 
s
��  !
.
��! "
Idoup
��" '
,
��' (
	NombreUpm
�� !
=
��" #
$"
��$ &
{
��& '
s
��' (
.
��( )
Codigo
��) /
}
��/ 0
 - 
��0 3
{
��3 4
s
��4 5
.
��5 6
Nombre
��6 <
}
��< =
"
��= >
}
�� 
)
�� 
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
Upms2
��/ 4
,
��4 5
$str
��5 <
,
��< =
$str
��= H
)
��H I
;
��I J
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
SegUsuarios
��8 C
,
��C D
SegUsuarios
�� 
.
�� 
Fields
�� "
.
��" #
Idsus
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4
SegUsuarios
�� 
.
�� 
Fields
�� "
.
��" #
Login
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4
opeMovimientos
�� 
.
�� 
Idsus
�� $
)
��$ %
;
��% &
return
�� 
View
�� 
(
�� 
opeMovimientos
�� &
)
��& '
;
��' (
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Edit
��) -
(
��- .
long
��. 2
?
��2 3
id
��4 6
)
��6 7
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
opeMovimientos
�� 
=
��  
await
��! &
_context
��' /
.
��/ 0
OpeMovimientos
��0 >
.
��> ?"
SingleOrDefaultAsync
��? S
(
��S T
m
��T U
=>
��V X
m
��Y Z
.
��Z [
Idomv
��[ `
==
��a c
id
��d f
)
��f g
;
��g h
if
�� 
(
�� 
opeMovimientos
�� 
==
�� !
null
��" &
)
��& '
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
Upms
�� 
=
�� 
_context
�� 
.
�� 
OpeUpms
��  
.
�� 
Where
�� 
(
�� 
oup
�� 
=>
�� !
oup
��" %
.
��% &
Idcde
��& +
==
��, .
GetDepartamentoId
��/ @
(
��@ A
)
��A B
&&
��C E
oup
��F I
.
��I J
Idopy
��J O
==
��P R

��S `
(
��` a
)
��a b
)
��b c
.
�� 
Select
�� 
(
�� 
s
�� 
=>
��  
new
��! $
{
�� 
IdUpm
�� 
=
�� 
s
��  !
.
��! "
Idoup
��" '
,
��' (
	NombreUpm
�� !
=
��" #
$"
��$ &
{
��& '
s
��' (
.
��( )
Codigo
��) /
}
��/ 0
 - 
��0 3
{
��3 4
s
��4 5
.
��5 6
Nombre
��6 <
}
��< =
"
��= >
}
�� 
)
�� 
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
Upms
��/ 3
,
��3 4
$str
��4 ;
,
��; <
$str
��< G
)
��G H
;
��H I
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
SegUsuarios
��8 C
,
��C D
SegUsuarios
�� 
.
�� 
Fields
�� "
.
��" #
Idsus
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4
SegUsuarios
�� 
.
�� 
Fields
�� "
.
��" #
Login
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4
opeMovimientos
�� 
.
�� 
Idsus
�� $
)
��$ %
;
��% &
return
�� 
View
�� 
(
�� 
opeMovimientos
�� &
)
��& '
;
��' (
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Edit
��) -
(
��- .
long
��. 2
id
��3 5
,
��5 6
[
��7 8
Bind
��8 <
(
��< =
$str��= �
)��� �
]��� �
OpeMovimientos��� �
opeMovimientos��� �
)��� �
{
�� 	
if
�� 
(
�� 
id
�� 
!=
�� 
opeMovimientos
�� $
.
��$ %
Idomv
��% *
)
��* +
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
try
�� 
{
�� 
opeMovimientos
�� "
.
��" #
Usumod
��# )
=
��* +
this
��, 0
.
��0 1
GetLogin
��1 9
(
��9 :
)
��: ;
;
��; <
opeMovimientos
�� "
.
��" #
Apitransaccion
��# 1
=
��2 3
$str
��4 ?
;
��? @
_context
�� 
.
�� 
Update
�� #
(
��# $
opeMovimientos
��$ 2
)
��2 3
;
��3 4
await
�� 
_context
�� "
.
��" #
SaveChangesAsync
��# 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
catch
�� 
(
�� *
DbUpdateConcurrencyException
�� 3
)
��3 4
{
�� 
if
�� 
(
�� 
!
�� "
OpeMovimientosExists
�� -
(
��- .
opeMovimientos
��. <
.
��< =
Idomv
��= B
)
��B C
)
��C D
{
�� 
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
}
�� 
throw
�� 
;
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
var
�� 
Upms1
�� 
=
�� 
_context
��  
.
��  !
OpeUpms
��! (
.
�� 
Where
�� "
(
��" #
oup
��# &
=>
��' )
oup
��* -
.
��- .
Idcde
��. 3
==
��4 6
GetDepartamentoId
��7 H
(
��H I
)
��I J
&&
��K M
oup
��N Q
.
��Q R
Idopy
��R W
==
��X Z

��[ h
(
��h i
)
��i j
)
��j k
.
�� 
Select
�� #
(
��# $
s
��$ %
=>
��& (
new
��) ,
{
�� 
IdUpm
��  %
=
��& '
s
��( )
.
��) *
Idoup
��* /
,
��/ 0
	NombreUpm
��  )
=
��* +
$"
��, .
{
��. /
s
��/ 0
.
��0 1
Codigo
��1 7
}
��7 8
 - 
��8 ;
{
��; <
s
��< =
.
��= >
Nombre
��> D
}
��D E
"
��E F
}
�� 
)
�� 
.
�� 
ToList
�� #
(
��# $
)
��$ %
;
��% &
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
��( +

SelectList
��, 6
(
��6 7
Upms1
��7 <
,
��< =
$str
��= D
,
��D E
$str
��E P
)
��P Q
;
��Q R
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
SegUsuarios
��0 ;
,
��; <
SegUsuarios
�� #
.
��# $
Fields
��$ *
.
��* +
Idsus
��+ 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
,
��; <
SegUsuarios
�� #
.
��# $
Fields
��$ *
.
��* +
Login
��+ 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
)
��; <
;
��< =
return
�� 
View
�� 
(
��  
opeMovimientos
��  .
)
��. /
;
��/ 0
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
var
�� 
Upms2
�� 
=
�� 
_context
�� 
.
�� 
OpeUpms
��  
.
�� 
Where
�� 
(
�� 
oup
�� 
=>
�� !
oup
��" %
.
��% &
Idcde
��& +
==
��, .
GetDepartamentoId
��/ @
(
��@ A
)
��A B
&&
��C E
oup
��F I
.
��I J
Idopy
��J O
==
��P R

��S `
(
��` a
)
��a b
)
��b c
.
�� 
Select
�� 
(
�� 
s
�� 
=>
��  
new
��! $
{
�� 
IdUpm
�� 
=
�� 
s
��  !
.
��! "
Idoup
��" '
,
��' (
	NombreUpm
�� !
=
��" #
$"
��$ &
{
��& '
s
��' (
.
��( )
Codigo
��) /
}
��/ 0
 - 
��0 3
{
��3 4
s
��4 5
.
��5 6
Nombre
��6 <
}
��< =
"
��= >
}
�� 
)
�� 
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
Upms2
��/ 4
,
��4 5
$str
��5 <
,
��< =
$str
��= H
)
��H I
;
��I J
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
SegUsuarios
��8 C
,
��C D
SegUsuarios
�� 
.
�� 
Fields
�� "
.
��" #
Idsus
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4
SegUsuarios
�� 
.
�� 
Fields
�� "
.
��" #
Login
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4
opeMovimientos
�� 
.
�� 
Idsus
�� $
)
��$ %
;
��% &
return
�� 
View
�� 
(
�� 
opeMovimientos
�� &
)
��& '
;
��' (
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
opeMovimientos
�� 
=
��  
await
��! &
_context
��' /
.
��/ 0
OpeMovimientos
��0 >
.
�� 
Include
�� 
(
�� 
o
�� 
=>
�� 
o
�� 
.
��  
IdoupNavigation
��  /
)
��/ 0
.
�� 
Include
�� 
(
�� 
o
�� 
=>
�� 
o
�� 
.
��  
IdsusNavigation
��  /
)
��/ 0
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idomv
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
opeMovimientos
�� 
==
�� !
null
��" &
)
��& '
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
opeMovimientos
�� &
)
��& '
;
��' (
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 
opeMovimientos
�� 
=
�� 
await
�� 
_context
�� '
.
��' (
OpeMovimientos
��( 6
.
��6 7"
SingleOrDefaultAsync
��7 K
(
��K L
m
��L M
=>
��N P
m
��Q R
.
��R S
Idomv
��S X
==
��Y [
id
��\ ^
)
��^ _
;
��_ `
opeMovimientos
�� 
.
�� 
Usumod
�� 
=
�� 
GetLogin
�� '
(
��' (
)
��( )
;
��) *
opeMovimientos
�� 
.
�� 
Apitransaccion
�� $
=
��% &
$str
��' 1
;
��1 2
_context
�� 
.
�� 
OpeMovimientos
��
.
�� 
Update
�� "
(
��" #
opeMovimientos
��# 1
)
��1 2
;
��2 3
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
var
�� 
Upms
�� 
=
�� 
_context
�� 
.
�� 
OpeUpms
�� $
.
�� 
Where
�� 
(
�� 
oup
�� "
=>
��# %
oup
��& )
.
��) *
Idcde
��* /
==
��0 2
GetDepartamentoId
��3 D
(
��D E
)
��E F
&&
��G I
oup
��J M
.
��M N
Idopy
��N S
==
��T V

��W d
(
��d e
)
��e f
)
��f g
.
�� 
Select
�� 
(
��  
s
��  !
=>
��" $
new
��% (
{
�� 
IdUpm
�� !
=
��" #
s
��$ %
.
��% &
Idoup
��& +
,
��+ ,
	NombreUpm
�� %
=
��& '
$"
��( *
{
��* +
s
��+ ,
.
��, -
Codigo
��- 3
}
��3 4
 - 
��4 7
{
��7 8
s
��8 9
.
��9 :
Nombre
��: @
}
��@ A
"
��A B
}
�� 
)
�� 
.
�� 
ToList
�� 
(
��  
)
��  !
;
��! "
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
Upms
��3 7
,
��7 8
$str
��8 ?
,
��? @
$str
��@ K
)
��K L
;
��L M
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
SegUsuarios
��< G
,
��G H
SegUsuarios
�� 
.
��  
Fields
��  &
.
��& '
Idsus
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
,
��7 8
SegUsuarios
�� 
.
��  
Fields
��  &
.
��& '
Login
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
)
��7 8
;
��8 9
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
�� "
OpeMovimientosExists
�� )
(
��) *
long
��* .
id
��/ 1
)
��1 2
{
�� 	
return
�� 
_context
�� 
.
�� 
OpeMovimientos
�� *
.
��* +
Any
��+ .
(
��. /
e
��/ 0
=>
��1 3
e
��4 5
.
��5 6
Idomv
��6 ;
==
��< >
id
��? A
)
��A B
;
��B C
}
�� 	
}
�� 
}�� �g
[C:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\OpeProyectosController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class "
OpeProyectosController '
:( )
BaseController* 8
{ 
public "
OpeProyectosController	 
(  
db_encuestasContext  3
context4 ;
,; <
IConfiguration= K

)Y Z
:[ \
base] a
(a b
contextb i
,i j

)x y
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
return 
View 
( 
await 
_context &
.& '
OpeProyectos' 3
.3 4
ToListAsync4 ?
(? @
)@ A
)A B
;B C
} 	
public 
async 
Task 
< 

>' (
Details) 0
(0 1
long1 5
?5 6
id7 9
)9 :
{ 	
if   
(   
id   
==   
null   
)   
{!! 
return"" 
NotFound"" 
(""  
)""  !
;""! "
}## 
var%% 
opeProyectos%% 
=%% 
await%% $
_context%%% -
.%%- .
OpeProyectos%%. :
.&&  
SingleOrDefaultAsync&& %
(&&% &
m&&& '
=>&&( *
m&&+ ,
.&&, -
Idopy&&- 2
==&&3 5
id&&6 8
)&&8 9
;&&9 :
if'' 
('' 
opeProyectos'' 
=='' 
null''  $
)''$ %
{(( 
return)) 
NotFound)) 
())  
)))  !
;))! "
}** 
return,, 
View,, 
(,, 
opeProyectos,, $
),,$ %
;,,% &
}-- 	
public00 

Create00 #
(00# $
)00$ %
{11 	
return22 
View22 
(22 
)22 
;22 
}33 	
[88 	
HttpPost88	 
]88 
[99 	$
ValidateAntiForgeryToken99	 !
]99! "
public:: 
async:: 
Task:: 
<:: 

>::' (
Create::) /
(::/ 0
[::0 1
Bind::1 5
(::5 6
$str	::6 �
)
::� �
]
::� �
OpeProyectos
::� �
opeProyectos
::� �
)
::� �
{;; 	
if<< 
(<< 

ModelState<< 
.<< 
IsValid<< 
)<< 
{== 
try>> 
{?? 
opeProyectos@@  
.@@  !
Usucre@@! '
=@@( )
this@@* .
.@@. /
GetLogin@@/ 7
(@@7 8
)@@8 9
;@@9 :
_contextAA 
.AA
AddAA 
(AA 
opeProyectosAA 
)AA 
;AA  
awaitBB 

_contextBB 
.BB 
SaveChangesAsyncBB $
(BB$ %
)BB% &
;BB& '
returnCC 
RedirectToActionCC (
(CC( )
nameofCC) /
(CC/ 0
IndexCC0 5
)CC5 6
)CC6 7
;CC7 8
}DD 
catchEE 	
(EE
 
	ExceptionEE 
expEE 
)EE 
{FF 
ifGG 
(GG 
expGG 
.GG 
InnerExceptionGG *
isGG+ -
NpgsqlExceptionGG. =
)GG= >
{HH 
ViewBagII 
.II  
ErrorDbII  '
=II( )
expII* -
.II- .
InnerExceptionII. <
.II< =
MessageII= D
;IID E
}JJ 
elseKK 
{LL 

ModelStateMM "
.MM" #

(MM0 1
$strMM1 3
,MM3 4
expMM5 8
.MM8 9
MessageMM9 @
)MM@ A
;MMA B
}NN 
returnOO 
ViewOO 
(OO  
)OO  !
;OO! "
}PP 
}QQ 
returnRR 
ViewRR 
(RR 
opeProyectosRR $
)RR$ %
;RR% &
}SS 	
publicVV 
asyncVV 
TaskVV 
<VV 

>VV' (
EditVV) -
(VV- .
longVV. 2
?VV2 3
idVV4 6
)VV6 7
{WW 	
ifXX 
(XX 
idXX 
==XX 
nullXX 
)XX 
{YY 
returnZZ 
NotFoundZZ 
(ZZ  
)ZZ  !
;ZZ! "
}[[ 
var]] 
opeProyectos]] 
=]] 
await]] $
_context]]% -
.]]- .
OpeProyectos]]. :
.]]: ; 
SingleOrDefaultAsync]]; O
(]]O P
m]]P Q
=>]]R T
m]]U V
.]]V W
Idopy]]W \
==]]] _
id]]` b
)]]b c
;]]c d
if^^ 
(^^ 
opeProyectos^^ 
==^^ 
null^^  $
)^^$ %
{__ 
return`` 
NotFound`` 
(``  
)``  !
;``! "
}aa 
returnbb 
Viewbb 
(bb 
opeProyectosbb $
)bb$ %
;bb% &
}cc 	
[hh 	
HttpPosthh	 
]hh 
[ii 	$
ValidateAntiForgeryTokenii	 !
]ii! "
publicjj 
asyncjj 
Taskjj 
<jj 

>jj' (
Editjj) -
(jj- .
longjj. 2
idjj3 5
,jj5 6
[jj7 8
Bindjj8 <
(jj< =
$str	jj= �
)
jj� �
]
jj� �
OpeProyectos
jj� �
opeProyectos
jj� �
)
jj� �
{kk 	
ifll 
(ll 
idll 
!=ll 
opeProyectosll "
.ll" #
Idopyll# (
)ll( )
{mm 
returnnn 
NotFoundnn 
(nn  
)nn  !
;nn! "
}oo 
ifqq 
(qq 

ModelStateqq 
.qq 
IsValidqq "
)qq" #
{rr 
tryss 
{tt 
opeProyectosuu  
.uu  !
Usumoduu! '
=uu( )
thisuu* .
.uu. /
GetLoginuu/ 7
(uu7 8
)uu8 9
;uu9 :
opeProyectosvv  
.vv  !
Apitransaccionvv! /
=vv0 1
$strvv2 =
;vv= >
_contextww 
.ww 
Updateww #
(ww# $
opeProyectosww$ 0
)ww0 1
;ww1 2
awaitxx 
_contextxx "
.xx" #
SaveChangesAsyncxx# 3
(xx3 4
)xx4 5
;xx5 6
}yy 
catchzz 
(zz (
DbUpdateConcurrencyExceptionzz 3
)zz3 4
{{{ 
if|| 
(|| 
!|| 
OpeProyectosExists|| +
(||+ ,
opeProyectos||, 8
.||8 9
Idopy||9 >
)||> ?
)||? @
{}} 
return~~ 
NotFound~~ '
(~~' (
)~~( )
;~~) *
} 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
return
�� 
View
�� 
(
��  
opeProyectos
��  ,
)
��, -
;
��- .
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
return
�� 
View
�� 
(
�� 
opeProyectos
�� $
)
��$ %
;
��% &
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
opeProyectos
�� 
=
�� 
await
�� $
_context
��% -
.
��- .
OpeProyectos
��. :
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idopy
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
opeProyectos
�� 
==
�� 
null
��  $
)
��$ %
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
opeProyectos
�� $
)
��$ %
;
��% &
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 
opeProyectos
�� 
=
�� 
await
�� 
_context
�� %
.
��% &
OpeProyectos
��& 2
.
��2 3"
SingleOrDefaultAsync
��3 G
(
��G H
m
��H I
=>
��J L
m
��M N
.
��N O
Idopy
��O T
==
��U W
id
��X Z
)
��Z [
;
��[ \
_context
�� 
.
�� 
OpeProyectos
��
.
�� 
Remove
��  
(
��  !
opeProyectos
��! -
)
��- .
;
��. /
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
��  
OpeProyectosExists
�� '
(
��' (
long
��( ,
id
��- /
)
��/ 0
{
�� 	
return
�� 
_context
�� 
.
�� 
OpeProyectos
�� (
.
��( )
Any
��) ,
(
��, -
e
��- .
=>
��/ 1
e
��2 3
.
��3 4
Idopy
��4 9
==
��: <
id
��= ?
)
��? @
;
��@ A
}
�� 	
}
�� 
}�� ��
VC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\OpeUpmsController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class 
OpeUpmsController "
:# $
BaseController% 3
{ 
public 
OpeUpmsController	 
( 
db_encuestasContext .
context/ 6
,6 7
IConfiguration8 F

)T U
:V W
baseX \
(\ ]
context] d
,d e

)s t
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
var 
lstDepto 
= 
this 
.  
GetDeptoRestriccion  3
(3 4
)4 5
;5 6
ViewData 
[ 
$str 
] 
= 
lstDepto  (
;( )
var 
db_encuestasContext #
=$ %
_context& .
.. /
OpeUpms/ 6
. 
Where 
( 
upms 
=> 
upms #
.# $
Idopy$ )
==* ,

(: ;
); <
&&= ?
upms@ D
.D E
IdcdeE J
==K M
lstDeptoN V
.V W
FirstW \
(\ ]
)] ^
.^ _
Idcde_ d
)d e
. 
Include 
( 
o 
=> 
o 
.  
IdcdeNavigation  /
)/ 0
.0 1
Include1 8
(8 9
o9 :
=>; =
o> ?
.? @
IdopyNavigation@ O
)O P
;P Q
return 
View 
( 
await 
db_encuestasContext 1
.1 2
ToListAsync2 =
(= >
)> ?
)? @
;@ A
} 	
public"" 
PartialViewResult""  
GetUpms""! (
(""( )
long"") -
?""- .
idcde""/ 4
)""4 5
{## 	
var$$ 
db_encuestasContext$$ #
=$$$ %
_context$$& .
.$$. /
OpeUpms$$/ 6
.%% 
Where%% 
(%% 
upms%% 
=>%% 
upms%% #
.%%# $
Idopy%%$ )
==%%* ,

(%%: ;
)%%; <
&&%%= ?
upms%%@ D
.%%D E
Idcde%%E J
==%%K M
idcde%%N S
)%%S T
.&& 
Include&& 
(&& 
o&& 
=>&& 
o&& 
.&&  
IdcdeNavigation&&  /
)&&/ 0
.&&0 1
Include&&1 8
(&&8 9
o&&9 :
=>&&; =
o&&> ?
.&&? @
IdopyNavigation&&@ O
)&&O P
;&&P Q
return'' 
PartialView'' 
('' 
$str'' .
,''. /
db_encuestasContext''/ B
.''B C
ToList''C I
(''I J
)''J K
)''K L
;''L M
}(( 	
public++ 
async++ 
Task++ 
<++ 

>++' (
Details++) 0
(++0 1
long++1 5
?++5 6
id++7 9
)++9 :
{,, 	
if.. 
(.. 
id.. 
==.. 
null.. 
).. 
{// 
return00 
NotFound00 
(00  
)00  !
;00! "
}11 
var33 
opeUpms33 
=33 
await33 
_context33  (
.33( )
OpeUpms33) 0
.44 
Include44 
(44 
o44 
=>44 
o44 
.44  
IdcdeNavigation44  /
)44/ 0
.55 
Include55 
(55 
o55 
=>55 
o55 
.55  
IdopyNavigation55  /
)55/ 0
.66  
SingleOrDefaultAsync66 %
(66% &
m66& '
=>66( *
m66+ ,
.66, -
Idoup66- 2
==663 5
id666 8
)668 9
;669 :
if77 
(77 
opeUpms77 
==77 
null77 
)77  
{88 
return99 
NotFound99 
(99  
)99  !
;99! "
}:: 
return<< 
View<< 
(<< 
opeUpms<< 
)<<  
;<<  !
}== 	
public@@ 

Create@@ #
(@@# $
)@@$ %
{AA 	
ViewDataBB 
[BB 
$strBB 
]BB 
=BB 
newBB  #

SelectListBB$ .
(BB. /
_contextBB/ 7
.BB7 8
CatDepartamentosBB8 H
,BBH I
CatDepartamentosCC  
.CC  !
FieldsCC! '
.CC' (
IdcdeCC( -
.CC- .
ToStringCC. 6
(CC6 7
)CC7 8
,CC8 9
CatDepartamentosDD  
.DD  !
FieldsDD! '
.DD' (
NombreDD( .
.DD. /
ToStringDD/ 7
(DD7 8
)DD8 9
)DD9 :
;DD: ;
ViewDataEE 
[EE 
$strEE 
]EE 
=EE 
newEE  #

SelectListEE$ .
(EE. /
_contextEE/ 7
.EE7 8
OpeProyectosEE8 D
.EED E
WhereEEE J
(EEJ K
proyEEK O
=>EEP R
proyEES W
.EEW X
IdopyEEX ]
==EE^ `
thisEEa e
.EEe f

(EEs t
)EEt u
)EEu v
,EEv w
OpeProyectosFF 
.FF 
FieldsFF #
.FF# $
IdopyFF$ )
.FF) *
ToStringFF* 2
(FF2 3
)FF3 4
,FF4 5
OpeProyectosGG 
.GG 
FieldsGG #
.GG# $
NombreGG$ *
.GG* +
ToStringGG+ 3
(GG3 4
)GG4 5
)GG5 6
;GG6 7
returnHH 
ViewHH 
(HH 
)HH 
;HH 
}II 	
[NN 	
HttpPostNN	 
]NN 
[OO 	$
ValidateAntiForgeryTokenOO	 !
]OO! "
publicPP 
asyncPP 
TaskPP 
<PP 

>PP' (
CreatePP) /
(PP/ 0
[PP0 1
BindPP1 5
(PP5 6
$str	PP6 �
)
PP� �
]
PP� �
OpeUpms
PP� �
opeUpms
PP� �
)
PP� �
{QQ 	
ifRR 
(RR 

ModelStateRR 
.RR 
IsValidRR 
)RR 
{SS 
tryTT 
{UU 
_contextVV 
.VV
AddVV 
(VV 
opeUpmsVV 
)VV 
;VV 
awaitWW 

_contextWW 
.WW 
SaveChangesAsyncWW $
(WW$ %
)WW% &
;WW& '
returnXX 
RedirectToActionXX (
(XX( )
nameofXX) /
(XX/ 0
IndexXX0 5
)XX5 6
)XX6 7
;XX7 8
}YY 
catchZZ 	
(ZZ
 
	ExceptionZZ 
expZZ 
)ZZ 
{[[ 
if\\ 
(\\ 
exp\\ 
.\\ 
InnerException\\ *
is\\+ -
NpgsqlException\\. =
)\\= >
{]] 
ViewBag^^ 
.^^  
ErrorDb^^  '
=^^( )
exp^^* -
.^^- .
InnerException^^. <
.^^< =
Message^^= D
;^^D E
}__ 
else`` 
{aa 

ModelStatebb "
.bb" #

(bb0 1
$strbb1 3
,bb3 4
expbb5 8
.bb8 9
Messagebb9 @
)bb@ A
;bbA B
}cc 
ViewDatadd 
[dd 
$strdd $
]dd$ %
=dd& '
newdd( +

SelectListdd, 6
(dd6 7
_contextdd7 ?
.dd? @
CatDepartamentosdd@ P
,ddP Q
CatDepartamentosee (
.ee( )
Fieldsee) /
.ee/ 0
Idcdeee0 5
.ee5 6
ToStringee6 >
(ee> ?
)ee? @
,ee@ A
CatDepartamentosff (
.ff( )
Fieldsff) /
.ff/ 0
Nombreff0 6
.ff6 7
ToStringff7 ?
(ff? @
)ff@ A
)ffA B
;ffB C
ViewDatagg 
[gg 
$strgg $
]gg$ %
=gg& '
newhh 

SelectListhh &
(hh& '
_contexthh' /
.hh/ 0
OpeProyectoshh0 <
.hh< =
Wherehh= B
(hhB C
proyhhC G
=>hhH J
proyhhK O
.hhO P
IdopyhhP U
==hhV X
thishhY ]
.hh] ^

(hhk l
)hhl m
)hhm n
,hhn o
OpeProyectosii (
.ii( )
Fieldsii) /
.ii/ 0
Idopyii0 5
.ii5 6
ToStringii6 >
(ii> ?
)ii? @
,ii@ A
OpeProyectosjj (
.jj( )
Fieldsjj) /
.jj/ 0
Nombrejj0 6
.jj6 7
ToStringjj7 ?
(jj? @
)jj@ A
)jjA B
;jjB C
returnkk 
Viewkk 
(kk  
)kk  !
;kk! "
}ll 
}mm 
ViewDatann 
[nn 
$strnn 
]nn 
=nn 
newnn  #

SelectListnn$ .
(nn. /
_contextnn/ 7
.nn7 8
CatDepartamentosnn8 H
,nnH I
CatDepartamentosoo  
.oo  !
Fieldsoo! '
.oo' (
Idcdeoo( -
.oo- .
ToStringoo. 6
(oo6 7
)oo7 8
,oo8 9
CatDepartamentospp  
.pp  !
Fieldspp! '
.pp' (
Nombrepp( .
.pp. /
ToStringpp/ 7
(pp7 8
)pp8 9
,pp9 :
opeUpmspp; B
.ppB C
IdcdeppC H
)ppH I
;ppI J
ViewDataqq 
[qq 
$strqq 
]qq 
=qq 
newqq  #

SelectListqq$ .
(qq. /
_contextqq/ 7
.qq7 8
OpeProyectosqq8 D
.qqD E
WhereqqE J
(qqJ K
proyqqK O
=>qqP R
proyqqS W
.qqW X
IdopyqqX ]
==qq^ `
thisqqa e
.qqe f

(qqs t
)qqt u
)qqu v
,qqv w
OpeProyectosrr 
.rr 
Fieldsrr #
.rr# $
Idopyrr$ )
.rr) *
ToStringrr* 2
(rr2 3
)rr3 4
,rr4 5
OpeProyectosss 
.ss 
Fieldsss #
.ss# $
Nombress$ *
.ss* +
ToStringss+ 3
(ss3 4
)ss4 5
,ss5 6
opeUpmsss7 >
.ss> ?
Idopyss? D
)ssD E
;ssE F
returntt 
Viewtt 
(tt 
opeUpmstt 
)tt  
;tt  !
}uu 	
publicxx 
asyncxx 
Taskxx 
<xx 

>xx' (
Editxx) -
(xx- .
longxx. 2
?xx2 3
idxx4 6
)xx6 7
{yy 	
ifzz 
(zz 
idzz 
==zz 
nullzz 
)zz 
{{{ 
return|| 
NotFound|| 
(||  
)||  !
;||! "
}}} 
var 
opeUpms 
= 
await 
_context  (
.( )
OpeUpms) 0
.0 1 
SingleOrDefaultAsync1 E
(E F
mF G
=>H J
mK L
.L M
IdoupM R
==S U
idV X
)X Y
;Y Z
if
�� 
(
�� 
opeUpms
�� 
==
�� 
null
�� 
)
��  
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
CatDepartamentos
��8 H
,
��H I
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
Idcde
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
Nombre
��( .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
,
��9 :
opeUpms
��; B
.
��B C
Idcde
��C H
)
��H I
;
��I J
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
OpeProyectos
��8 D
.
��D E
Where
��E J
(
��J K
proy
��K O
=>
��P R
proy
��S W
.
��W X
Idopy
��X ]
==
��^ `
this
��a e
.
��e f

��f s
(
��s t
)
��t u
)
��u v
,
��v w
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
Idopy
��$ )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
	Apiestado
��$ -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
opeUpms
��: A
.
��A B
Idopy
��B G
)
��G H
;
��H I
return
�� 
View
�� 
(
�� 
opeUpms
�� 
)
��  
;
��  !
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Edit
��) -
(
��- .
long
��. 2
id
��3 5
,
��5 6
[
��7 8
Bind
��8 <
(
��< =
$str��= �
)��� �
]��� �
OpeUpms��� �
opeUpms��� �
)��� �
{
�� 	
if
�� 
(
�� 
id
�� 
!=
�� 
opeUpms
�� 
.
�� 
Idoup
�� #
)
��# $
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
try
�� 
{
�� 
(
�� 
opeUpms
�� 
)
�� 
.
�� 
Usumod
�� $
=
��% &
this
��' +
.
��+ ,
GetLogin
��, 4
(
��4 5
)
��5 6
;
��6 7
(
�� 
opeUpms
�� 
)
�� 
.
�� 
Apitransaccion
�� ,
=
��- .
$str
��/ :
;
��: ;
_context
�� 
.
�� 
Update
�� #
(
��# $
opeUpms
��$ +
)
��+ ,
;
��, -
await
�� 
_context
�� "
.
��" #
SaveChangesAsync
��# 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
catch
�� 
(
�� *
DbUpdateConcurrencyException
�� 3
)
��3 4
{
�� 
if
�� 
(
�� 
!
�� 

�� &
(
��& '
opeUpms
��' .
.
��. /
Idoup
��/ 4
)
��4 5
)
��5 6
{
�� 
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
}
�� 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
��( +

SelectList
��, 6
(
��6 7
_context
��7 ?
.
��? @
CatDepartamentos
��@ P
,
��P Q
CatDepartamentos
�� (
.
��( )
Fields
��) /
.
��/ 0
Idcde
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A
CatDepartamentos
�� (
.
��( )
Fields
��) /
.
��/ 0
Nombre
��0 6
.
��6 7
ToString
��7 ?
(
��? @
)
��@ A
)
��A B
;
��B C
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
��( +

SelectList
��, 6
(
��6 7
_context
��7 ?
.
��? @
OpeProyectos
��@ L
.
��L M
Where
��M R
(
��R S
proy
��S W
=>
��X Z
proy
��[ _
.
��_ `
Idopy
��` e
==
��f h
this
��i m
.
��m n

��n {
(
��{ |
)
��| }
)
��} ~
,
��~ 
OpeProyectos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Idopy
��, 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =
OpeProyectos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Nombre
��, 2
.
��2 3
ToString
��3 ;
(
��; <
)
��< =
)
��= >
;
��> ?
return
�� 
View
�� 
(
��  
opeUpms
��  '
)
��' (
;
��( )
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
CatDepartamentos
��8 H
,
��H I
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
Idcde
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
Nombre
��( .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
,
��9 :
opeUpms
��; B
.
��B C
Idcde
��C H
)
��H I
;
��I J
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
OpeProyectos
��8 D
.
��D E
Where
��E J
(
��J K
proy
��K O
=>
��P R
proy
��S W
.
��W X
Idopy
��X ]
==
��^ `
this
��a e
.
��e f

��f s
(
��s t
)
��t u
)
��u v
,
��v w
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
Idopy
��$ )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
Nombre
��$ *
.
��* +
ToString
��+ 3
(
��3 4
)
��4 5
,
��5 6
opeUpms
��7 >
.
��> ?
Idopy
��? D
)
��D E
;
��E F
return
�� 
View
�� 
(
�� 
opeUpms
�� 
)
��  
;
��  !
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
opeUpms
�� 
=
�� 
await
�� 
_context
��  (
.
��( )
OpeUpms
��) 0
.
�� 
Include
�� 
(
�� 
o
�� 
=>
�� 
o
�� 
.
��  
IdcdeNavigation
��  /
)
��/ 0
.
�� 
Include
�� 
(
�� 
o
�� 
=>
�� 
o
�� 
.
��  
IdopyNavigation
��  /
)
��/ 0
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idoup
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
opeUpms
�� 
==
�� 
null
�� 
)
��  
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
opeUpms
�� 
)
��  
;
��  !
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 
opeUpms
�� 
=
�� 
await
�� 
_context
��  
.
��  !
OpeUpms
��! (
.
��( )"
SingleOrDefaultAsync
��) =
(
��= >
m
��> ?
=>
��@ B
m
��C D
.
��D E
Idoup
��E J
==
��K M
id
��N P
)
��P Q
;
��Q R
_context
�� 
.
�� 
OpeUpms
��
.
�� 
Remove
�� 
(
�� 
opeUpms
�� #
)
��# $
;
��$ %
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
CatDepartamentos
��< L
,
��L M
CatDepartamentos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Idcde
��, 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =
CatDepartamentos
�� $
.
��$ %
Fields
��% +
.
��+ ,
	Apiestado
��, 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
)
��@ A
;
��A B
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
OpeProyectos
��< H
.
��H I
Where
��I N
(
��N O
proy
��O S
=>
��T V
proy
��W [
.
��[ \
Idopy
��\ a
==
��b d
this
��e i
.
��i j

��j w
(
��w x
)
��x y
)
��y z
,
��z {
OpeProyectos
��  
.
��  !
Fields
��! '
.
��' (
Idopy
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
OpeProyectos
��  
.
��  !
Fields
��! '
.
��' (
Nombre
��( .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
)
��9 :
;
��: ;
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
�� 

�� "
(
��" #
long
��# '
id
��( *
)
��* +
{
�� 	
return
�� 
_context
�� 
.
�� 
OpeUpms
�� #
.
��# $
Any
��$ '
(
��' (
e
��( )
=>
��* ,
e
��- .
.
��. /
Idoup
��/ 4
==
��5 7
id
��8 :
)
��: ;
;
��; <
}
�� 	
}
�� 
}�� �:
WC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\ReportesController.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Controllers  +
{ 
public 

class 
ReportesController #
:$ %
BaseController& 4
{ 
public 
ReportesController !
(! "
db_encuestasContext" 5
context6 =
,= >
IConfiguration? M

,[ \
IOptions] e
<e f%
ConnectionStringsSettingsf 
>	 �

connstring
� �
)
� �
:
� �
base
� �
(
� �
context
� �
,
� �

� �
,
� �

connstring
� �
)
� �
{ 	
}   	
public## 

Index## "
(##" #
)### $
{$$ 	
var%% 
rn%% 
=%% 
new%% 
RnVista%%  
(%%  !&
_connectionStringsSettings%%! ;
.%%; <
Value%%< A
)%%A B
;%%B C
var&& 
arrColWhere&& 
=&& 
new&& !
	ArrayList&&" +
{&&, -
OpeProyectos&&- 9
.&&9 :
Fields&&: @
.&&@ A
Idopy&&A F
.&&F G
ToString&&G O
(&&O P
)&&P Q
}&&Q R
;&&R S
var'' 
arrValWhere'' 
='' 
new'' !
	ArrayList''" +
{'', -
this''- 1
.''1 2

(''? @
)''@ A
}''A B
;''B C
var(( 
	dtReporte(( 
=(( 
rn(( 
.(( 
ObtenerDatos(( +
(((+ ,
$str((, :
,((: ;
arrColWhere((< G
,((G H
arrValWhere((I T
)((T U
;((U V
ViewData)) 
[)) 
$str)) 
])) 
=)) 
	dtReporte))  )
;))) *
return** 
View** 
(** 
)** 
;** 
}++ 	
public00 

Download00 %
(00% &
)00& '
{11 	
byte22 
[22 
]22 
reportBytes22 
;22 
var33 
rn33 
=33 
new33 
RnVista33  
(33  !&
_connectionStringsSettings33! ;
.33; <
Value33< A
)33A B
;33B C
var44 
arrColWhere44 
=44 
new44 !
	ArrayList44" +
{44, -
OpeProyectos44- 9
.449 :
Fields44: @
.44@ A
Idopy44A F
.44F G
ToString44G O
(44O P
)44P Q
}44Q R
;44R S
var55 
arrValWhere55 
=55 
new55 !
	ArrayList55" +
{55, -
this55- 1
.551 2

(55? @
)55@ A
}55A B
;55B C
var66 
	dtReporte66 
=66 
rn66 
.66 
ObtenerDatos66 +
(66+ ,
$str66, :
,66: ;
arrColWhere66< G
,66G H
arrValWhere66I T
)66T U
;66U V
foreach88 
(88 

DataColumn88 
column88  &
in88' )
	dtReporte88* 3
.883 4
Columns884 ;
)88; <
{99 
column:: 
.:: 

ColumnName:: !
=::" #
column::$ *
.::* +

ColumnName::+ 5
.::5 6
ToPascalCase::6 B
(::B C
)::C D
;::D E
};; 
using>> 
(>> 
var>> 
package>> 
=>>  
new>>! $
ExcelPackage>>% 1
(>>1 2
)>>2 3
)>>3 4
{?? 
ExcelWorksheet@@ 
ws@@ !
=@@" #
package@@$ +
.@@+ ,
Workbook@@, 4
.@@4 5

Worksheets@@5 ?
.@@? @
Add@@@ C
(@@C D
$str@@D M
)@@M N
;@@N O
wsBB 
.BB 
CellsBB 
[BB 
$strBB 
]BB 
.BB 
ValueBB $
=BB% &
$strBB' 0
;BB0 1
wsCC 
.CC 
CellsCC 
[CC 
$strCC 
]CC 
.CC 
ValueCC $
=CC% &
$strCC' 0
+CC1 2
DateTimeCC3 ;
.CC; <
NowCC< ?
;CC? @
wsDD 
.DD 
CellsDD 
[DD 
$strDD 
]DD 
.DD 
ValueDD $
=DD% &
$strDD' 7
+DD8 9
thisDD: >
.DD> ?
GetUserDD? F
(DDF G
)DDG H
.DDH I
NombresDDI P
+DDQ R
$strDDS V
+DDW X
thisDDY ]
.DD] ^
GetUserDD^ e
(DDe f
)DDf g
.DDg h
	ApellidosDDh q
;DDq r
wsEE 
.EE 
CellsEE 
[EE 
$numEE 
,EE 
$numEE 
,EE 
$numEE  
,EE  !
$numEE" #
]EE# $
.EE$ %
StyleEE% *
.EE* +
FontEE+ /
.EE/ 0
BoldEE0 4
=EE5 6
trueEE7 ;
;EE; <
wsHH 
.HH 
CellsHH 
[HH 
$strHH 
]HH 
.HH 
LoadFromDataTableHH 0
(HH0 1
	dtReporteHH1 :
,HH: ;
trueHH< @
)HH@ A
;HHA B
wsII 
.II 
CellsII 
[II 
$numII 
,II 
$numII 
,II 
	dtReporteII (
.II( )
RowsII) -
.II- .
CountII. 3
,II3 4
	dtReporteII5 >
.II> ?
ColumnsII? F
.IIF G
CountIIG L
]IIL M
.IIM N
AutoFitColumnsIIN \
(II\ ]
)II] ^
;II^ _
varKK 
tblKK 
=KK 
wsKK 
.KK 
TablesKK #
.KK# $
AddKK$ '
(KK' (
newKK( +
ExcelAddressBaseKK, <
(KK< =
fromRowKK= D
:KKD E
$numKKF G
,KKG H
fromColKKI P
:KKP Q
$numKKR S
,KKS T
toRowKKU Z
:KKZ [
	dtReporteKK\ e
.KKe f
RowsKKf j
.KKj k
CountKKk p
,KKp q
toColumnKKr z
:KKz {
	dtReporte	KK| �
.
KK� �
Columns
KK� �
.
KK� �
Count
KK� �
)
KK� �
,
KK� �
$str
KK� �
)
KK� �
;
KK� �
tblLL 
.LL 

ShowHeaderLL 
=LL  
trueLL! %
;LL% &
reportBytesNN 
=NN 
packageNN %
.NN% &
GetAsByteArrayNN& 4
(NN4 5
)NN5 6
;NN6 7
}OO 
returnQQ 
FileQQ 
(QQ 
reportBytesQQ #
,QQ# $
$strQQ% h
,QQh i
$strQQj w
)QQw x
;QQx y
}RR 	
}SS 
}TT �h
^C:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\SegAplicacionesController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class %
SegAplicacionesController *
:+ ,
BaseController- ;
{ 
public %
SegAplicacionesController	 "
(" #
db_encuestasContext# 6
context7 >
,> ?
IConfiguration@ N

)\ ]
:^ _
base` d
(d e
contexte l
,l m

){ |
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
return 
View 
( 
await 
_context &
.& '
SegAplicaciones' 6
.6 7
ToListAsync7 B
(B C
)C D
)D E
;E F
} 	
public 
async 
Task 
< 

>' (
Details) 0
(0 1
long1 5
?5 6
id7 9
)9 :
{ 	
if   
(   
id   
==   
null   
)   
{!! 
return"" 
NotFound"" 
(""  
)""  !
;""! "
}## 
var%% 
segAplicaciones%% 
=%%  !
await%%" '
_context%%( 0
.%%0 1
SegAplicaciones%%1 @
.&&  
SingleOrDefaultAsync&& %
(&&% &
m&&& '
=>&&( *
m&&+ ,
.&&, -
Idsap&&- 2
==&&3 5
id&&6 8
)&&8 9
;&&9 :
if'' 
('' 
segAplicaciones'' 
==''  "
null''# '
)''' (
{(( 
return)) 
NotFound)) 
())  
)))  !
;))! "
}** 
return,, 
View,, 
(,, 
segAplicaciones,, '
),,' (
;,,( )
}-- 	
public00 

Create00 #
(00# $
)00$ %
{11 	
return22 
View22 
(22 
)22 
;22 
}33 	
[88 	
HttpPost88	 
]88 
[99 	$
ValidateAntiForgeryToken99	 !
]99! "
public:: 
async:: 
Task:: 
<:: 

>::' (
Create::) /
(::/ 0
[::0 1
Bind::1 5
(::5 6
$str	::6 �
)
::� �
]
::� �
SegAplicaciones
::� �
segAplicaciones
::� �
)
::� �
{;; 	
if<< 
(<< 

ModelState<< 
.<< 
IsValid<< 
)<< 
{== 
try>> 
{?? 
segAplicaciones@@ #
.@@# $
Usucre@@$ *
=@@+ ,
this@@- 1
.@@1 2
GetLogin@@2 :
(@@: ;
)@@; <
;@@< =
_contextAA 
.AA
AddAA 
(AA 
segAplicacionesAA !
)AA! "
;AA" #
awaitBB 

_contextBB 
.BB 
SaveChangesAsyncBB $
(BB$ %
)BB% &
;BB& '
returnCC 
RedirectToActionCC (
(CC( )
nameofCC) /
(CC/ 0
IndexCC0 5
)CC5 6
)CC6 7
;CC7 8
}DD 
catchEE 	
(EE
 
	ExceptionEE 
expEE 
)EE 
{FF 
ifGG 
(GG 
expGG 
.GG 
InnerExceptionGG *
isGG+ -
NpgsqlExceptionGG. =
)GG= >
{HH 
ViewBagII 
.II  
ErrorDbII  '
=II( )
expII* -
.II- .
InnerExceptionII. <
.II< =
MessageII= D
;IID E
}JJ 
elseKK 
{LL 

ModelStateMM "
.MM" #

(MM0 1
$strMM1 3
,MM3 4
expMM5 8
.MM8 9
MessageMM9 @
)MM@ A
;MMA B
}NN 
returnOO 
ViewOO 
(OO  
)OO  !
;OO! "
}PP 
}QQ 
returnRR 
ViewRR 
(RR 
segAplicacionesRR '
)RR' (
;RR( )
}SS 	
publicVV 
asyncVV 
TaskVV 
<VV 

>VV' (
EditVV) -
(VV- .
longVV. 2
?VV2 3
idVV4 6
)VV6 7
{WW 	
ifXX 
(XX 
idXX 
==XX 
nullXX 
)XX 
{YY 
returnZZ 
NotFoundZZ 
(ZZ  
)ZZ  !
;ZZ! "
}[[ 
var]] 
segAplicaciones]] 
=]]  !
await]]" '
_context]]( 0
.]]0 1
SegAplicaciones]]1 @
.]]@ A 
SingleOrDefaultAsync]]A U
(]]U V
m]]V W
=>]]X Z
m]][ \
.]]\ ]
Idsap]]] b
==]]c e
id]]f h
)]]h i
;]]i j
if^^ 
(^^ 
segAplicaciones^^ 
==^^  "
null^^# '
)^^' (
{__ 
return`` 
NotFound`` 
(``  
)``  !
;``! "
}aa 
returnbb 
Viewbb 
(bb 
segAplicacionesbb '
)bb' (
;bb( )
}cc 	
[hh 	
HttpPosthh	 
]hh 
[ii 	$
ValidateAntiForgeryTokenii	 !
]ii! "
publicjj 
asyncjj 
Taskjj 
<jj 

>jj' (
Editjj) -
(jj- .
longjj. 2
idjj3 5
,jj5 6
[jj7 8
Bindjj8 <
(jj< =
$str	jj= �
)
jj� �
]
jj� �
SegAplicaciones
jj� �
segAplicaciones
jj� �
)
jj� �
{kk 	
ifll 
(ll 
idll 
!=ll 
segAplicacionesll %
.ll% &
Idsapll& +
)ll+ ,
{mm 
returnnn 
NotFoundnn 
(nn  
)nn  !
;nn! "
}oo 
ifqq 
(qq 

ModelStateqq 
.qq 
IsValidqq "
)qq" #
{rr 
tryss 
{tt 
segAplicacionesuu #
.uu# $
Usumoduu$ *
=uu+ ,
thisuu- 1
.uu1 2
GetLoginuu2 :
(uu: ;
)uu; <
;uu< =
segAplicacionesvv #
.vv# $
Apitransaccionvv$ 2
=vv3 4
$strvv5 @
;vv@ A
_contextww 
.ww 
Updateww #
(ww# $
segAplicacionesww$ 3
)ww3 4
;ww4 5
awaitxx 
_contextxx "
.xx" #
SaveChangesAsyncxx# 3
(xx3 4
)xx4 5
;xx5 6
}yy 
catchzz 
(zz (
DbUpdateConcurrencyExceptionzz 3
)zz3 4
{{{ 
if|| 
(|| 
!|| !
SegAplicacionesExists|| .
(||. /
segAplicaciones||/ >
.||> ?
Idsap||? D
)||D E
)||E F
{}} 
return~~ 
NotFound~~ '
(~~' (
)~~( )
;~~) *
} 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
return
�� 
View
�� 
(
��  
segAplicaciones
��  /
)
��/ 0
;
��0 1
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
return
�� 
View
�� 
(
�� 
segAplicaciones
�� '
)
��' (
;
��( )
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
segAplicaciones
�� 
=
��  !
await
��" '
_context
��( 0
.
��0 1
SegAplicaciones
��1 @
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idsap
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
segAplicaciones
�� 
==
��  "
null
��# '
)
��' (
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
segAplicaciones
�� '
)
��' (
;
��( )
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 
segAplicaciones
�� 
=
�� 
await
�� 
_context
��  (
.
��( )
SegAplicaciones
��) 8
.
��8 9"
SingleOrDefaultAsync
��9 M
(
��M N
m
��N O
=>
��P R
m
��S T
.
��T U
Idsap
��U Z
==
��[ ]
id
��^ `
)
��` a
;
��a b
_context
�� 
.
�� 
SegAplicaciones
��
.
�� 
Remove
�� #
(
��# $
segAplicaciones
��$ 3
)
��3 4
;
��4 5
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
�� #
SegAplicacionesExists
�� *
(
��* +
long
��+ /
id
��0 2
)
��2 3
{
�� 	
return
�� 
_context
�� 
.
�� 
SegAplicaciones
�� +
.
��+ ,
Any
��, /
(
��/ 0
e
��0 1
=>
��2 4
e
��5 6
.
��6 7
Idsap
��7 <
==
��= ?
id
��@ B
)
��B C
;
��C D
}
�� 	
}
�� 
}�� ��
YC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\SegPaginasController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class  
SegPaginasController %
:& '
BaseController( 6
{ 
public  
SegPaginasController	 
( 
db_encuestasContext 1
context2 9
,9 :
IConfiguration; I

)W X
:Y Z
base[ _
(_ `
context` g
,g h

)v w
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
var 
db_encuestasContext #
=$ %
_context& .
.. /

SegPaginas/ 9
.9 :
Include: A
(A B
sB C
=>D F
sG H
.H I
IdsapNavigationI X
)X Y
;Y Z
return 
View 
( 
await 
db_encuestasContext 1
.1 2
ToListAsync2 =
(= >
)> ?
)? @
;@ A
} 	
public 
async 
Task 
< 

>' (
Details) 0
(0 1
long1 5
?5 6
id7 9
)9 :
{ 	
if!! 
(!! 
id!! 
==!! 
null!! 
)!! 
{"" 
return## 
NotFound## 
(##  
)##  !
;##! "
}$$ 
var&& 

segPaginas&& 
=&& 
await&& "
_context&&# +
.&&+ ,

SegPaginas&&, 6
.'' 
Include'' 
('' 
s'' 
=>'' 
s'' 
.''  
IdsapNavigation''  /
)''/ 0
.((  
SingleOrDefaultAsync(( %
(((% &
m((& '
=>((( *
m((+ ,
.((, -
Idspg((- 2
==((3 5
id((6 8
)((8 9
;((9 :
if)) 
()) 

segPaginas)) 
==)) 
null)) "
)))" #
{** 
return++ 
NotFound++ 
(++  
)++  !
;++! "
},, 
return.. 
View.. 
(.. 

segPaginas.. "
).." #
;..# $
}// 	
public22 

Create22 #
(22# $
)22$ %
{33 	
ViewData44 
[44 
$str44 
]44 
=44 
new44 

SelectList44  *
(44* +
_context44+ 3
.443 4
SegAplicaciones444 C
,44C D
SegAplicaciones55 
.55 
Fields55 "
.55" #
Idsap55# (
.55( )
ToString55) 1
(551 2
)552 3
,553 4
SegAplicaciones66 
.66 
Fields66 "
.66" #
	Apiestado66# ,
.66, -
ToString66- 5
(665 6
)666 7
)667 8
;668 9
return77 
View77 
(77 
)77 
;77 
}88 	
[== 	
HttpPost==	 
]== 
[>> 	$
ValidateAntiForgeryToken>>	 !
]>>! "
public?? 
async?? 
Task?? 
<?? 

>??' (
Create??) /
(??/ 0
[??0 1
Bind??1 5
(??5 6
$str	??6 �
)
??� �
]
??� �

SegPaginas
??� �

segPaginas
??� �
)
??� �
{@@ 	
ifAA 
(AA 

ModelStateAA 
.AA 
IsValidAA 
)AA 
{BB 
tryCC 
{DD 

segPaginasEE 
.EE 
UsucreEE %
=EE& '
thisEE( ,
.EE, -
GetLoginEE- 5
(EE5 6
)EE6 7
;EE7 8
_contextFF 
.FF
AddFF 
(FF 

segPaginasFF 
)FF 
;FF 
awaitGG 

_contextGG 
.GG 
SaveChangesAsyncGG $
(GG$ %
)GG% &
;GG& '
returnHH 
RedirectToActionHH (
(HH( )
nameofHH) /
(HH/ 0
IndexHH0 5
)HH5 6
)HH6 7
;HH7 8
}II 
catchJJ 	
(JJ
 
	ExceptionJJ 
expJJ 
)JJ 
{KK 
ifLL 
(LL 
expLL 
.LL 
InnerExceptionLL *
isLL+ -
NpgsqlExceptionLL. =
)LL= >
{MM 
ViewBagNN 
.NN  
ErrorDbNN  '
=NN( )
expNN* -
.NN- .
InnerExceptionNN. <
.NN< =
MessageNN= D
;NND E
}OO 
elsePP 
{QQ 

ModelStateRR "
.RR" #

(RR0 1
$strRR1 3
,RR3 4
expRR5 8
.RR8 9
MessageRR9 @
)RR@ A
;RRA B
}SS 
ViewDataTT 
[TT 
$strTT $
]TT$ %
=TT& '
newUU 

SelectListUU &
(UU& '
_contextUU' /
.UU/ 0
SegAplicacionesUU0 ?
,UU? @
SegAplicacionesVV '
.VV' (
FieldsVV( .
.VV. /
IdsapVV/ 4
.VV4 5
ToStringVV5 =
(VV= >
)VV> ?
,VV? @
SegAplicacionesWW '
.WW' (
FieldsWW( .
.WW. /
	ApiestadoWW/ 8
.WW8 9
ToStringWW9 A
(WWA B
)WWB C
)WWC D
;WWD E
returnXX 
ViewXX 
(XX  
)XX  !
;XX! "
}YY 
}ZZ 
ViewData[[ 
[[[ 
$str[[ 
][[ 
=[[ 
new[[  #

SelectList[[$ .
([[. /
_context[[/ 7
.[[7 8
SegAplicaciones[[8 G
,[[G H
SegAplicaciones\\ 
.\\  
Fields\\  &
.\\& '
Idsap\\' ,
.\\, -
ToString\\- 5
(\\5 6
)\\6 7
,\\7 8
SegAplicaciones]] 
.]]  
Fields]]  &
.]]& '
	Apiestado]]' 0
.]]0 1
ToString]]1 9
(]]9 :
)]]: ;
,]]; <

segPaginas^^ 
.^^ 
Idsap^^  
)^^  !
;^^! "
return__ 
View__ 
(__ 

segPaginas__ "
)__" #
;__# $
}`` 	
publiccc 
asynccc 
Taskcc 
<cc 

>cc' (
Editcc) -
(cc- .
longcc. 2
?cc2 3
idcc4 6
)cc6 7
{dd 	
ifee 
(ee 
idee 
==ee 
nullee 
)ee 
{ff 
returngg 
NotFoundgg 
(gg  
)gg  !
;gg! "
}hh 
varjj 

segPaginasjj 
=jj 
awaitjj "
_contextjj# +
.jj+ ,

SegPaginasjj, 6
.jj6 7 
SingleOrDefaultAsyncjj7 K
(jjK L
mjjL M
=>jjN P
mjjQ R
.jjR S
IdspgjjS X
==jjY [
idjj\ ^
)jj^ _
;jj_ `
ifkk 
(kk 

segPaginaskk 
==kk 
nullkk "
)kk" #
{ll 
returnmm 
NotFoundmm 
(mm  
)mm  !
;mm! "
}nn 
ViewDataoo 
[oo 
$stroo 
]oo 
=oo 
newoo  #

SelectListoo$ .
(oo. /
_contextoo/ 7
.oo7 8
SegAplicacionesoo8 G
,ooG H
SegAplicacionespp 
.pp  
Fieldspp  &
.pp& '
Idsappp' ,
.pp, -
ToStringpp- 5
(pp5 6
)pp6 7
,pp7 8
SegAplicacionesqq 
.qq  
Fieldsqq  &
.qq& '
	Apiestadoqq' 0
.qq0 1
ToStringqq1 9
(qq9 :
)qq: ;
,qq; <

segPaginasrr 
.rr 
Idsaprr  
)rr  !
;rr! "
returnss 
Viewss 
(ss 

segPaginasss "
)ss" #
;ss# $
}tt 	
[yy 	
HttpPostyy	 
]yy 
[zz 	$
ValidateAntiForgeryTokenzz	 !
]zz! "
public{{ 
async{{ 
Task{{ 
<{{ 

>{{' (
Edit{{) -
({{- .
long{{. 2
id{{3 5
,{{5 6
[{{7 8
Bind{{8 <
({{< =
$str	{{= �
)
{{� �
]
{{� �

SegPaginas
{{� �

segPaginas
{{� �
)
{{� �
{|| 	
if}} 
(}} 
id}} 
!=}} 

segPaginas}}  
.}}  !
Idspg}}! &
)}}& '
{~~ 
return 
NotFound 
(  
)  !
;! "
}
�� 
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
try
�� 
{
�� 

segPaginas
�� 
.
�� 
Usumod
�� %
=
��& '
this
��( ,
.
��, -
GetLogin
��- 5
(
��5 6
)
��6 7
;
��7 8

segPaginas
�� 
.
�� 
Apitransaccion
�� -
=
��. /
$str
��0 ;
;
��; <
_context
�� 
.
�� 
Update
�� #
(
��# $

segPaginas
��$ .
)
��. /
;
��/ 0
await
�� 
_context
�� "
.
��" #
SaveChangesAsync
��# 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
catch
�� 
(
�� *
DbUpdateConcurrencyException
�� 3
)
��3 4
{
�� 
if
�� 
(
�� 
!
�� 
SegPaginasExists
�� )
(
��) *

segPaginas
��* 4
.
��4 5
Idspg
��5 :
)
��: ;
)
��; <
{
�� 
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
}
�� 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
SegAplicaciones
��0 ?
,
��? @
SegAplicaciones
�� '
.
��' (
Fields
��( .
.
��. /
Idsap
��/ 4
.
��4 5
ToString
��5 =
(
��= >
)
��> ?
,
��? @
SegAplicaciones
�� '
.
��' (
Fields
��( .
.
��. /
	Apiestado
��/ 8
.
��8 9
ToString
��9 A
(
��A B
)
��B C
)
��C D
;
��D E
return
�� 
View
�� 
(
��  

segPaginas
��  *
)
��* +
;
��+ ,
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
SegAplicaciones
��8 G
,
��G H
SegAplicaciones
�� 
.
��  
Fields
��  &
.
��& '
Idsap
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
,
��7 8
SegAplicaciones
�� 
.
��  
Fields
��  &
.
��& '
	Apiestado
��' 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
,
��; <

segPaginas
�� 
.
�� 
Idsap
��  
)
��  !
;
��! "
return
�� 
View
�� 
(
�� 

segPaginas
�� "
)
��" #
;
��# $
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 

segPaginas
�� 
=
�� 
await
�� "
_context
��# +
.
��+ ,

SegPaginas
��, 6
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdsapNavigation
��  /
)
��/ 0
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idspg
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 

segPaginas
�� 
==
�� 
null
�� "
)
��" #
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 

segPaginas
�� "
)
��" #
;
��# $
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 

segPaginas
�� 
=
�� 
await
�� 
_context
�� #
.
��# $

SegPaginas
��$ .
.
��. /"
SingleOrDefaultAsync
��/ C
(
��C D
m
��D E
=>
��F H
m
��I J
.
��J K
Idspg
��K P
==
��Q S
id
��T V
)
��V W
;
��W X
_context
�� 
.
�� 

SegPaginas
��
.
�� 
Remove
�� 
(
�� 

segPaginas
�� )
)
��) *
;
��* +
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
SegAplicaciones
��< K
,
��K L
SegAplicaciones
�� #
.
��# $
Fields
��$ *
.
��* +
Idsap
��+ 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
,
��; <
SegAplicaciones
�� #
.
��# $
Fields
��$ *
.
��* +
	Apiestado
��+ 4
.
��4 5
ToString
��5 =
(
��= >
)
��> ?
)
��? @
;
��@ A
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
�� 
SegPaginasExists
�� %
(
��% &
long
��& *
id
��+ -
)
��- .
{
�� 	
return
�� 
_context
�� 
.
�� 

SegPaginas
�� &
.
��& '
Any
��' *
(
��* +
e
��+ ,
=>
��- /
e
��0 1
.
��1 2
Idspg
��2 7
==
��8 :
id
��; =
)
��= >
;
��> ?
}
�� 	
}
�� 
}�� �f
WC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\SegRolesController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class 
SegRolesController #
:$ %
BaseController& 4
{ 
public 
SegRolesController	 
( 
db_encuestasContext /
context0 7
,7 8
IConfiguration9 G

)U V
:W X
baseY ]
(] ^
context^ e
,e f

)t u
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
return 
View 
( 
await 
_context &
.& '
SegRoles' /
./ 0
ToListAsync0 ;
(; <
)< =
)= >
;> ?
} 	
public 
async 
Task 
< 

>' (
Details) 0
(0 1
long1 5
?5 6
id7 9
)9 :
{ 	
if   
(   
id   
==   
null   
)   
{!! 
return"" 
NotFound"" 
(""  
)""  !
;""! "
}## 
var%% 
segRoles%% 
=%% 
await%%  
_context%%! )
.%%) *
SegRoles%%* 2
.&&  
SingleOrDefaultAsync&& %
(&&% &
m&&& '
=>&&( *
m&&+ ,
.&&, -
Idsro&&- 2
==&&3 5
id&&6 8
)&&8 9
;&&9 :
if'' 
('' 
segRoles'' 
=='' 
null''  
)''  !
{(( 
return)) 
NotFound)) 
())  
)))  !
;))! "
}** 
return,, 
View,, 
(,, 
segRoles,,  
),,  !
;,,! "
}-- 	
public00 

Create00 #
(00# $
)00$ %
{11 	
return22 
View22 
(22 
)22 
;22 
}33 	
[88 	
HttpPost88	 
]88 
[99 	$
ValidateAntiForgeryToken99	 !
]99! "
public:: 
async:: 
Task:: 
<:: 

>::' (
Create::) /
(::/ 0
[::0 1
Bind::1 5
(::5 6
$str	::6 �
)
::� �
]
::� �
SegRoles
::� �
segRoles
::� �
)
::� �
{;; 	
if<< 
(<< 

ModelState<< 
.<< 
IsValid<< 
)<< 
{== 
try>> 
{?? 
segRoles@@ 
.@@ 
Usucre@@ #
=@@$ %
this@@& *
.@@* +
GetLogin@@+ 3
(@@3 4
)@@4 5
;@@5 6
_contextAA 
.AA
AddAA 
(AA 
segRolesAA 
)AA 
;AA 
awaitBB 

_contextBB 
.BB 
SaveChangesAsyncBB $
(BB$ %
)BB% &
;BB& '
returnCC 
RedirectToActionCC (
(CC( )
nameofCC) /
(CC/ 0
IndexCC0 5
)CC5 6
)CC6 7
;CC7 8
}DD 
catchEE 	
(EE
 
	ExceptionEE 
expEE 
)EE 
{FF 
ifGG 
(GG 
expGG 
.GG 
InnerExceptionGG *
isGG+ -
NpgsqlExceptionGG. =
)GG= >
{HH 
ViewBagII 
.II  
ErrorDbII  '
=II( )
expII* -
.II- .
InnerExceptionII. <
.II< =
MessageII= D
;IID E
}JJ 
elseKK 
{LL 

ModelStateMM "
.MM" #

(MM0 1
$strMM1 3
,MM3 4
expMM5 8
.MM8 9
MessageMM9 @
)MM@ A
;MMA B
}NN 
returnOO 
ViewOO 
(OO  
)OO  !
;OO! "
}PP 
}QQ 
returnRR 
ViewRR 
(RR 
segRolesRR  
)RR  !
;RR! "
}SS 	
publicVV 
asyncVV 
TaskVV 
<VV 

>VV' (
EditVV) -
(VV- .
longVV. 2
?VV2 3
idVV4 6
)VV6 7
{WW 	
ifXX 
(XX 
idXX 
==XX 
nullXX 
)XX 
{YY 
returnZZ 
NotFoundZZ 
(ZZ  
)ZZ  !
;ZZ! "
}[[ 
var]] 
segRoles]] 
=]] 
await]]  
_context]]! )
.]]) *
SegRoles]]* 2
.]]2 3 
SingleOrDefaultAsync]]3 G
(]]G H
m]]H I
=>]]J L
m]]M N
.]]N O
Idsro]]O T
==]]U W
id]]X Z
)]]Z [
;]][ \
if^^ 
(^^ 
segRoles^^ 
==^^ 
null^^  
)^^  !
{__ 
return`` 
NotFound`` 
(``  
)``  !
;``! "
}aa 
returnbb 
Viewbb 
(bb 
segRolesbb  
)bb  !
;bb! "
}cc 	
[hh 	
HttpPosthh	 
]hh 
[ii 	$
ValidateAntiForgeryTokenii	 !
]ii! "
publicjj 
asyncjj 
Taskjj 
<jj 

>jj' (
Editjj) -
(jj- .
longjj. 2
idjj3 5
,jj5 6
[jj7 8
Bindjj8 <
(jj< =
$str	jj= �
)
jj� �
]
jj� �
SegRoles
jj� �
segRoles
jj� �
)
jj� �
{kk 	
ifll 
(ll 
idll 
!=ll 
segRolesll 
.ll 
Idsroll $
)ll$ %
{mm 
returnnn 
NotFoundnn 
(nn  
)nn  !
;nn! "
}oo 
ifqq 
(qq 

ModelStateqq 
.qq 
IsValidqq "
)qq" #
{rr 
tryss 
{tt 
segRolesuu 
.uu 
Usumoduu #
=uu$ %
thisuu& *
.uu* +
GetLoginuu+ 3
(uu3 4
)uu4 5
;uu5 6
segRolesvv 
.vv 
Apitransaccionvv +
=vv, -
$strvv. 9
;vv9 :
_contextww 
.ww 
Updateww #
(ww# $
segRolesww$ ,
)ww, -
;ww- .
awaitxx 
_contextxx "
.xx" #
SaveChangesAsyncxx# 3
(xx3 4
)xx4 5
;xx5 6
}yy 
catchzz 
(zz (
DbUpdateConcurrencyExceptionzz 3
)zz3 4
{{{ 
if|| 
(|| 
!|| 
SegRolesExists|| '
(||' (
segRoles||( 0
.||0 1
Idsro||1 6
)||6 7
)||7 8
{}} 
return~~ 
NotFound~~ '
(~~' (
)~~( )
;~~) *
} 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
return
�� 
View
�� 
(
��  
segRoles
��  (
)
��( )
;
��) *
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
return
�� 
View
�� 
(
�� 
segRoles
��  
)
��  !
;
��! "
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
segRoles
�� 
=
�� 
await
��  
_context
��! )
.
��) *
SegRoles
��* 2
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idsro
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
segRoles
�� 
==
�� 
null
��  
)
��  !
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
segRoles
��  
)
��  !
;
��! "
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 
segRoles
�� 
=
�� 
await
�� 
_context
�� !
.
��! "
SegRoles
��" *
.
��* +"
SingleOrDefaultAsync
��+ ?
(
��? @
m
��@ A
=>
��B D
m
��E F
.
��F G
Idsro
��G L
==
��M O
id
��P R
)
��R S
;
��S T
_context
�� 
.
�� 
SegRoles
��
.
�� 
Remove
�� 
(
�� 
segRoles
�� %
)
��% &
;
��& '
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
�� 
SegRolesExists
�� #
(
��# $
long
��$ (
id
��) +
)
��+ ,
{
�� 	
return
�� 
_context
�� 
.
�� 
SegRoles
�� $
.
��$ %
Any
��% (
(
��( )
e
��) *
=>
��+ -
e
��. /
.
��/ 0
Idsro
��0 5
==
��6 8
id
��9 ;
)
��; <
;
��< =
}
�� 	
}
�� 
}�� ��
]C:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\SegRolesPaginaController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class $
SegRolesPaginaController )
:* +
BaseController, :
{ 
public $
SegRolesPaginaController	 !
(! "
db_encuestasContext" 5
context6 =
,= >
IConfiguration? M

)[ \
:] ^
base_ c
(c d
contextd k
,k l

)z {
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
var 
lstRoles 
= 
_context #
.# $
SegRoles$ ,
;, -
ViewData 
[ 
$str 
] 
= 
lstRoles  (
;( )
var 
db_encuestasContext #
=$ %
_context& .
.. /
SegRolesPagina/ =
. 
Where 
( 
srp 
=> 
srp !
.! "
Idsro" '
==( *
lstRoles+ 3
.3 4
First4 9
(9 :
): ;
.; <
Idsro< A
)A B
. 
Include 
( 
s 
=> 
s 
.  
IdspgNavigation  /
)/ 0
. 
Include 
( 
s 
=> 
s 
.  
IdsroNavigation  /
)/ 0
;0 1
return 
View 
( 
await 
db_encuestasContext 1
.1 2
ToListAsync2 =
(= >
)> ?
)? @
;@ A
}   	
public## 
PartialViewResult##  

GetPaginas##! +
(##+ ,
long##, 0
?##0 1
idsro##2 7
)##7 8
{$$ 	
var%% 
db_encuestasContext%% #
=%%$ %
_context%%& .
.%%. /
SegRolesPagina%%/ =
.&& 
Where&& 
(&& 
srp&& 
=>&& 
srp&& !
.&&! "
Idsro&&" '
==&&( *
idsro&&+ 0
)&&0 1
.'' 
Include'' 
('' 
s'' 
=>'' 
s'' 
.''  
IdspgNavigation''  /
)''/ 0
.(( 
Include(( 
((( 
s(( 
=>(( 
s(( 
.((  
IdsroNavigation((  /
)((/ 0
;((0 1
return)) 
PartialView)) 
()) 
$str)) .
,)). /
db_encuestasContext))/ B
.))B C
ToList))C I
())I J
)))J K
)))K L
;))L M
}** 	
public-- 
async-- 
Task-- 
<-- 

>--' (
Details--) 0
(--0 1
long--1 5
?--5 6
id--7 9
)--9 :
{.. 	
if00 
(00 
id00 
==00 
null00 
)00 
{11 
return22 
NotFound22 
(22  
)22  !
;22! "
}33 
var55 
segRolesPagina55 
=55  
await55! &
_context55' /
.55/ 0
SegRolesPagina550 >
.66 
Include66 
(66 
s66 
=>66 
s66 
.66  
IdspgNavigation66  /
)66/ 0
.77 
Include77 
(77 
s77 
=>77 
s77 
.77  
IdsroNavigation77  /
)77/ 0
.88  
SingleOrDefaultAsync88 %
(88% &
m88& '
=>88( *
m88+ ,
.88, -
Idsrp88- 2
==883 5
id886 8
)888 9
;889 :
if99 
(99 
segRolesPagina99 
==99 !
null99" &
)99& '
{:: 
return;; 
NotFound;; 
(;;  
);;  !
;;;! "
}<< 
return>> 
View>> 
(>> 
segRolesPagina>> &
)>>& '
;>>' (
}?? 	
publicBB 

CreateBB #
(BB# $
)BB$ %
{CC 	
ViewDataDD 
[DD 
$strDD 
]DD 
=DD 
newDD 

SelectListDD  *
(DD* +
_contextDD+ 3
.DD3 4

SegPaginasDD4 >
,DD> ?

SegPaginasEE 
.EE 
FieldsEE 
.EE 
IdspgEE #
.EE# $
ToStringEE$ ,
(EE, -
)EE- .
,EE. /

SegPaginasFF 
.FF 
FieldsFF 
.FF 
	ApiestadoFF '
.FF' (
ToStringFF( 0
(FF0 1
)FF1 2
)FF2 3
;FF3 4
ViewDataGG 
[GG 
$strGG 
]GG 
=GG 
newGG 

SelectListGG  *
(GG* +
_contextGG+ 3
.GG3 4
SegRolesGG4 <
,GG< =
SegRolesHH 
.HH 
FieldsHH 
.HH 
IdsroHH !
.HH! "
ToStringHH" *
(HH* +
)HH+ ,
,HH, -
SegRolesII 
.II 
FieldsII 
.II 
	ApiestadoII %
.II% &
ToStringII& .
(II. /
)II/ 0
)II0 1
;II1 2
returnJJ 
ViewJJ 
(JJ 
)JJ 
;JJ 
}KK 	
[PP 	
HttpPostPP	 
]PP 
[QQ 	$
ValidateAntiForgeryTokenQQ	 !
]QQ! "
publicRR 
asyncRR 
TaskRR 
<RR 

>RR' (
CreateRR) /
(RR/ 0
[RR0 1
BindRR1 5
(RR5 6
$strRR6 ~
)RR~ 
]	RR �
SegRolesPagina
RR� �
segRolesPagina
RR� �
)
RR� �
{SS 	
ifTT 
(TT 

ModelStateTT 
.TT 
IsValidTT 
)TT 
{UU 
tryVV 
{WW 
segRolesPaginaXX "
.XX" #
UsucreXX# )
=XX* +
thisXX, 0
.XX0 1
GetLoginXX1 9
(XX9 :
)XX: ;
;XX; <
_contextYY 
.YY
AddYY 
(YY 
segRolesPaginaYY  
)YY  !
;YY! "
awaitZZ 

_contextZZ 
.ZZ 
SaveChangesAsyncZZ $
(ZZ$ %
)ZZ% &
;ZZ& '
return[[ 
RedirectToAction[[ (
([[( )
nameof[[) /
([[/ 0
Index[[0 5
)[[5 6
)[[6 7
;[[7 8
}\\ 
catch]] 	
(]]
 
	Exception]] 
exp]] 
)]] 
{^^ 
if__ 
(__ 
exp__ 
.__ 
InnerException__ *
is__+ -
NpgsqlException__. =
)__= >
{`` 
ViewBagaa 
.aa  
ErrorDbaa  '
=aa( )
expaa* -
.aa- .
InnerExceptionaa. <
.aa< =
Messageaa= D
;aaD E
}bb 
elsecc 
{dd 

ModelStateee "
.ee" #

(ee0 1
$stree1 3
,ee3 4
expee5 8
.ee8 9
Messageee9 @
)ee@ A
;eeA B
}ff 
ViewDatagg 
[gg 
$strgg $
]gg$ %
=gg& '
newhh 

SelectListhh &
(hh& '
_contexthh' /
.hh/ 0

SegPaginashh0 :
,hh: ;

SegPaginasii "
.ii" #
Fieldsii# )
.ii) *
Idspgii* /
.ii/ 0
ToStringii0 8
(ii8 9
)ii9 :
,ii: ;

SegPaginasjj "
.jj" #
Fieldsjj# )
.jj) *
	Apiestadojj* 3
.jj3 4
ToStringjj4 <
(jj< =
)jj= >
)jj> ?
;jj? @
ViewDatakk 
[kk 
$strkk $
]kk$ %
=kk& '
newll 

SelectListll &
(ll& '
_contextll' /
.ll/ 0
SegRolesll0 8
,ll8 9
SegRolesmm  
.mm  !
Fieldsmm! '
.mm' (
Idsromm( -
.mm- .
ToStringmm. 6
(mm6 7
)mm7 8
,mm8 9
SegRolesnn  
.nn  !
Fieldsnn! '
.nn' (
	Apiestadonn( 1
.nn1 2
ToStringnn2 :
(nn: ;
)nn; <
)nn< =
;nn= >
returnoo 
Viewoo 
(oo  
)oo  !
;oo! "
}pp 
}qq 
ViewDatarr 
[rr 
$strrr 
]rr 
=rr 
newrr  #

SelectListrr$ .
(rr. /
_contextrr/ 7
.rr7 8

SegPaginasrr8 B
,rrB C

SegPaginasss 
.ss 
Fieldsss !
.ss! "
Idspgss" '
.ss' (
ToStringss( 0
(ss0 1
)ss1 2
,ss2 3

SegPaginastt 
.tt 
Fieldstt !
.tt! "
	Apiestadott" +
.tt+ ,
ToStringtt, 4
(tt4 5
)tt5 6
,tt6 7
segRolesPaginauu 
.uu 
Idspguu $
)uu$ %
;uu% &
ViewDatavv 
[vv 
$strvv 
]vv 
=vv 
newvv  #

SelectListvv$ .
(vv. /
_contextvv/ 7
.vv7 8
SegRolesvv8 @
,vv@ A
SegRolesww 
.ww 
Fieldsww 
.ww  
Idsroww  %
.ww% &
ToStringww& .
(ww. /
)ww/ 0
,ww0 1
SegRolesxx 
.xx 
Fieldsxx 
.xx  
	Apiestadoxx  )
.xx) *
ToStringxx* 2
(xx2 3
)xx3 4
,xx4 5
segRolesPaginayy 
.yy 
Idsroyy $
)yy$ %
;yy% &
returnzz 
Viewzz 
(zz 
segRolesPaginazz &
)zz& '
;zz' (
}{{ 	
public~~ 
async~~ 
Task~~ 
<~~ 

>~~' (
Edit~~) -
(~~- .
long~~. 2
?~~2 3
id~~4 6
)~~6 7
{ 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
segRolesPagina
�� 
=
��  
await
��! &
_context
��' /
.
��/ 0
SegRolesPagina
��0 >
.
��> ?"
SingleOrDefaultAsync
��? S
(
��S T
m
��T U
=>
��V X
m
��Y Z
.
��Z [
Idsrp
��[ `
==
��a c
id
��d f
)
��f g
;
��g h
if
�� 
(
�� 
segRolesPagina
�� 
==
�� !
null
��" &
)
��& '
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8

SegPaginas
��8 B
,
��B C

SegPaginas
�� 
.
�� 
Fields
�� !
.
��! "
Idspg
��" '
.
��' (
ToString
��( 0
(
��0 1
)
��1 2
,
��2 3

SegPaginas
�� 
.
�� 
Fields
�� !
.
��! "
	Apiestado
��" +
.
��+ ,
ToString
��, 4
(
��4 5
)
��5 6
,
��6 7
segRolesPagina
�� 
.
�� 
Idspg
�� $
)
��$ %
;
��% &
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
SegRoles
��8 @
,
��@ A
SegRoles
�� 
.
�� 
Fields
�� 
.
��  
Idsro
��  %
.
��% &
ToString
��& .
(
��. /
)
��/ 0
,
��0 1
SegRoles
�� 
.
�� 
Fields
�� 
.
��  
	Apiestado
��  )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
segRolesPagina
�� 
.
�� 
Idsro
�� $
)
��$ %
;
��% &
return
�� 
View
�� 
(
�� 
segRolesPagina
�� &
)
��& '
;
��' (
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Edit
��) -
(
��- .
long
��. 2
id
��3 5
,
��5 6
[
��7 8
Bind
��8 <
(
��< =
$str��= �
)��� �
]��� �
SegRolesPagina��� �
segRolesPagina��� �
)��� �
{
�� 	
if
�� 
(
�� 
id
�� 
!=
�� 
segRolesPagina
�� $
.
��$ %
Idsrp
��% *
)
��* +
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
try
�� 
{
�� 
segRolesPagina
�� "
.
��" #
Usumod
��# )
=
��* +
this
��, 0
.
��0 1
GetLogin
��1 9
(
��9 :
)
��: ;
;
��; <
segRolesPagina
�� "
.
��" #
Apitransaccion
��# 1
=
��2 3
$str
��4 ?
;
��? @
_context
�� 
.
�� 
Update
�� #
(
��# $
segRolesPagina
��$ 2
)
��2 3
;
��3 4
await
�� 
_context
�� "
.
��" #
SaveChangesAsync
��# 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
catch
�� 
(
�� *
DbUpdateConcurrencyException
�� 3
)
��3 4
{
�� 
if
�� 
(
�� 
!
�� "
SegRolesPaginaExists
�� -
(
��- .
segRolesPagina
��. <
.
��< =
Idsrp
��= B
)
��B C
)
��C D
{
�� 
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
}
�� 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0

SegPaginas
��0 :
,
��: ;

SegPaginas
�� "
.
��" #
Fields
��# )
.
��) *
Idspg
��* /
.
��/ 0
ToString
��0 8
(
��8 9
)
��9 :
,
��: ;

SegPaginas
�� "
.
��" #
Fields
��# )
.
��) *
	Apiestado
��* 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
)
��> ?
;
��? @
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
SegRoles
��0 8
,
��8 9
SegRoles
��  
.
��  !
Fields
��! '
.
��' (
Idsro
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
SegRoles
��  
.
��  !
Fields
��! '
.
��' (
	Apiestado
��( 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
)
��< =
;
��= >
return
�� 
View
�� 
(
��  
segRolesPagina
��  .
)
��. /
;
��/ 0
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8

SegPaginas
��8 B
,
��B C

SegPaginas
�� 
.
�� 
Fields
�� !
.
��! "
Idspg
��" '
.
��' (
ToString
��( 0
(
��0 1
)
��1 2
,
��2 3

SegPaginas
�� 
.
�� 
Fields
�� !
.
��! "
	Apiestado
��" +
.
��+ ,
ToString
��, 4
(
��4 5
)
��5 6
,
��6 7
segRolesPagina
�� 
.
�� 
Idspg
�� $
)
��$ %
;
��% &
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
SegRoles
��8 @
,
��@ A
SegRoles
�� 
.
�� 
Fields
�� 
.
��  
Idsro
��  %
.
��% &
ToString
��& .
(
��. /
)
��/ 0
,
��0 1
SegRoles
�� 
.
�� 
Fields
�� 
.
��  
	Apiestado
��  )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
segRolesPagina
�� 
.
�� 
Idsro
�� $
)
��$ %
;
��% &
return
�� 
View
�� 
(
�� 
segRolesPagina
�� &
)
��& '
;
��' (
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
segRolesPagina
�� 
=
��  
await
��! &
_context
��' /
.
��/ 0
SegRolesPagina
��0 >
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdspgNavigation
��  /
)
��/ 0
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdsroNavigation
��  /
)
��/ 0
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idsrp
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
segRolesPagina
�� 
==
�� !
null
��" &
)
��& '
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
segRolesPagina
�� &
)
��& '
;
��' (
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 
segRolesPagina
�� 
=
�� 
await
�� 
_context
�� '
.
��' (
SegRolesPagina
��( 6
.
��6 7"
SingleOrDefaultAsync
��7 K
(
��K L
m
��L M
=>
��N P
m
��Q R
.
��R S
Idsrp
��S X
==
��Y [
id
��\ ^
)
��^ _
;
��_ `
_context
�� 
.
�� 
SegRolesPagina
��
.
�� 
Remove
�� "
(
��" #
segRolesPagina
��# 1
)
��1 2
;
��2 3
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <

SegPaginas
��< F
,
��F G

SegPaginas
�� 
.
�� 
Fields
�� %
.
��% &
Idspg
��& +
.
��+ ,
ToString
��, 4
(
��4 5
)
��5 6
,
��6 7

SegPaginas
�� 
.
�� 
Fields
�� %
.
��% &
	Apiestado
��& /
.
��/ 0
ToString
��0 8
(
��8 9
)
��9 :
)
��: ;
;
��; <
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
SegRoles
��< D
,
��D E
SegRoles
�� 
.
�� 
Fields
�� #
.
��# $
Idsro
��$ )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
SegRoles
�� 
.
�� 
Fields
�� #
.
��# $
	Apiestado
��$ -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
)
��8 9
;
��9 :
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
�� "
SegRolesPaginaExists
�� )
(
��) *
long
��* .
id
��/ 1
)
��1 2
{
�� 	
return
�� 
_context
�� 
.
�� 
SegRolesPagina
�� *
.
��* +
Any
��+ .
(
��. /
e
��/ 0
=>
��1 3
e
��4 5
.
��5 6
Idsrp
��6 ;
==
��< >
id
��? A
)
��A B
;
��B C
}
�� 	
}
�� 
}�� ڐ
XC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\SegTablasController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class 
SegTablasController $
:% &
BaseController' 5
{ 
public 
SegTablasController	 
( 
db_encuestasContext 0
context1 8
,8 9
IConfiguration: H

)V W
:X Y
baseZ ^
(^ _
context_ f
,f g

)u v
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
var 
db_encuestasContext #
=$ %
_context& .
.. /
	SegTablas/ 8
.8 9
Include9 @
(@ A
sA B
=>C E
sF G
.G H
IdsapNavigationH W
)W X
;X Y
return 
View 
( 
await 
db_encuestasContext 1
.1 2
ToListAsync2 =
(= >
)> ?
)? @
;@ A
} 	
public 
async 
Task 
< 

>' (
Details) 0
(0 1
long1 5
?5 6
id7 9
)9 :
{ 	
if!! 
(!! 
id!! 
==!! 
null!! 
)!! 
{"" 
return## 
NotFound## 
(##  
)##  !
;##! "
}$$ 
var&& 
	segTablas&& 
=&& 
await&& !
_context&&" *
.&&* +
	SegTablas&&+ 4
.'' 
Include'' 
('' 
s'' 
=>'' 
s'' 
.''  
IdsapNavigation''  /
)''/ 0
.((  
SingleOrDefaultAsync(( %
(((% &
m((& '
=>((( *
m((+ ,
.((, -
Idsta((- 2
==((3 5
id((6 8
)((8 9
;((9 :
if)) 
()) 
	segTablas)) 
==)) 
null)) !
)))! "
{** 
return++ 
NotFound++ 
(++  
)++  !
;++! "
},, 
return.. 
View.. 
(.. 
	segTablas.. !
)..! "
;.." #
}// 	
public22 

Create22 #
(22# $
)22$ %
{33 	
ViewData44 
[44 
$str44 
]44 
=44 
new44 

SelectList44  *
(44* +
_context44+ 3
.443 4
SegAplicaciones444 C
,44C D
SegAplicaciones55 
.55 
Fields55 "
.55" #
Idsap55# (
.55( )
ToString55) 1
(551 2
)552 3
,553 4
SegAplicaciones66 
.66 
Fields66 "
.66" #
	Apiestado66# ,
.66, -
ToString66- 5
(665 6
)666 7
)667 8
;668 9
return77 
View77 
(77 
)77 
;77 
}88 	
[== 	
HttpPost==	 
]== 
[>> 	$
ValidateAntiForgeryToken>>	 !
]>>! "
public?? 
async?? 
Task?? 
<?? 

>??' (
Create??) /
(??/ 0
[??0 1
Bind??1 5
(??5 6
$str	??6 �
)
??� �
]
??� �
	SegTablas
??� �
	segTablas
??� �
)
??� �
{@@ 	
ifAA 
(AA 

ModelStateAA 
.AA 
IsValidAA 
)AA 
{BB 
tryCC 
{DD 
	segTablasEE 
.EE 
UsucreEE $
=EE% &
thisEE' +
.EE+ ,
GetLoginEE, 4
(EE4 5
)EE5 6
;EE6 7
_contextFF 
.FF
AddFF 
(FF 
	segTablasFF 
)FF 
;FF 
awaitGG 

_contextGG 
.GG 
SaveChangesAsyncGG $
(GG$ %
)GG% &
;GG& '
returnHH 
RedirectToActionHH (
(HH( )
nameofHH) /
(HH/ 0
IndexHH0 5
)HH5 6
)HH6 7
;HH7 8
}II 
catchJJ 	
(JJ
 
	ExceptionJJ 
expJJ 
)JJ 
{KK 
ifLL 
(LL 
expLL 
.LL 
InnerExceptionLL *
isLL+ -
NpgsqlExceptionLL. =
)LL= >
{MM 
ViewBagNN 
.NN  
ErrorDbNN  '
=NN( )
expNN* -
.NN- .
InnerExceptionNN. <
.NN< =
MessageNN= D
;NND E
}OO 
elsePP 
{QQ 

ModelStateRR "
.RR" #

(RR0 1
$strRR1 3
,RR3 4
expRR5 8
.RR8 9
MessageRR9 @
)RR@ A
;RRA B
}SS 
ViewDataTT 
[TT 
$strTT $
]TT$ %
=TT& '
newUU 

SelectListUU &
(UU& '
_contextUU' /
.UU/ 0
SegAplicacionesUU0 ?
,UU? @
SegAplicacionesVV '
.VV' (
FieldsVV( .
.VV. /
IdsapVV/ 4
.VV4 5
ToStringVV5 =
(VV= >
)VV> ?
,VV? @
SegAplicacionesWW '
.WW' (
FieldsWW( .
.WW. /
	ApiestadoWW/ 8
.WW8 9
ToStringWW9 A
(WWA B
)WWB C
)WWC D
;WWD E
returnXX 
ViewXX 
(XX  
)XX  !
;XX! "
}YY 
}ZZ 
ViewData[[ 
[[[ 
$str[[ 
][[ 
=[[ 
new[[  #

SelectList[[$ .
([[. /
_context[[/ 7
.[[7 8
SegAplicaciones[[8 G
,[[G H
SegAplicaciones\\ 
.\\  
Fields\\  &
.\\& '
Idsap\\' ,
.\\, -
ToString\\- 5
(\\5 6
)\\6 7
,\\7 8
SegAplicaciones]] 
.]]  
Fields]]  &
.]]& '
	Apiestado]]' 0
.]]0 1
ToString]]1 9
(]]9 :
)]]: ;
,]]; <
	segTablas^^ 
.^^ 
Idsap^^ 
)^^  
;^^  !
return__ 
View__ 
(__ 
	segTablas__ !
)__! "
;__" #
}`` 	
publiccc 
asynccc 
Taskcc 
<cc 

>cc' (
Editcc) -
(cc- .
longcc. 2
?cc2 3
idcc4 6
)cc6 7
{dd 	
ifee 
(ee 
idee 
==ee 
nullee 
)ee 
{ff 
returngg 
NotFoundgg 
(gg  
)gg  !
;gg! "
}hh 
varjj 
	segTablasjj 
=jj 
awaitjj !
_contextjj" *
.jj* +
	SegTablasjj+ 4
.jj4 5 
SingleOrDefaultAsyncjj5 I
(jjI J
mjjJ K
=>jjL N
mjjO P
.jjP Q
IdstajjQ V
==jjW Y
idjjZ \
)jj\ ]
;jj] ^
ifkk 
(kk 
	segTablaskk 
==kk 
nullkk !
)kk! "
{ll 
returnmm 
NotFoundmm 
(mm  
)mm  !
;mm! "
}nn 
ViewDataoo 
[oo 
$stroo 
]oo 
=oo 
newoo  #

SelectListoo$ .
(oo. /
_contextoo/ 7
.oo7 8
SegAplicacionesoo8 G
,ooG H
SegAplicacionespp 
.pp  
Fieldspp  &
.pp& '
Idsappp' ,
.pp, -
ToStringpp- 5
(pp5 6
)pp6 7
,pp7 8
SegAplicacionesqq 
.qq  
Fieldsqq  &
.qq& '
	Apiestadoqq' 0
.qq0 1
ToStringqq1 9
(qq9 :
)qq: ;
,qq; <
	segTablasrr 
.rr 
Idsaprr 
)rr  
;rr  !
returnss 
Viewss 
(ss 
	segTablasss !
)ss! "
;ss" #
}tt 	
[yy 	
HttpPostyy	 
]yy 
[zz 	$
ValidateAntiForgeryTokenzz	 !
]zz! "
public{{ 
async{{ 
Task{{ 
<{{ 

>{{' (
Edit{{) -
({{- .
long{{. 2
id{{3 5
,{{5 6
[{{7 8
Bind{{8 <
({{< =
$str	{{= �
)
{{� �
]
{{� �
	SegTablas
{{� �
	segTablas
{{� �
)
{{� �
{|| 	
if}} 
(}} 
id}} 
!=}} 
	segTablas}} 
.}}  
Idsta}}  %
)}}% &
{~~ 
return 
NotFound 
(  
)  !
;! "
}
�� 
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
try
�� 
{
�� 
	segTablas
�� 
.
�� 
Usumod
�� $
=
��% &
this
��' +
.
��+ ,
GetLogin
��, 4
(
��4 5
)
��5 6
;
��6 7
	segTablas
�� 
.
�� 
Apitransaccion
�� ,
=
��- .
$str
��/ :
;
��: ;
_context
�� 
.
�� 
Update
�� #
(
��# $
	segTablas
��$ -
)
��- .
;
��. /
await
�� 
_context
�� "
.
��" #
SaveChangesAsync
��# 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
catch
�� 
(
�� *
DbUpdateConcurrencyException
�� 3
)
��3 4
{
�� 
if
�� 
(
�� 
!
�� 
SegTablasExists
�� (
(
��( )
	segTablas
��) 2
.
��2 3
Idsta
��3 8
)
��8 9
)
��9 :
{
�� 
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
}
�� 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
SegAplicaciones
��0 ?
,
��? @
SegAplicaciones
�� '
.
��' (
Fields
��( .
.
��. /
Idsap
��/ 4
.
��4 5
ToString
��5 =
(
��= >
)
��> ?
,
��? @
SegAplicaciones
�� '
.
��' (
Fields
��( .
.
��. /
	Apiestado
��/ 8
.
��8 9
ToString
��9 A
(
��A B
)
��B C
)
��C D
;
��D E
return
�� 
View
�� 
(
��  
	segTablas
��  )
)
��) *
;
��* +
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
SegAplicaciones
��8 G
,
��G H
SegAplicaciones
�� 
.
��  
Fields
��  &
.
��& '
Idsap
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
,
��7 8
SegAplicaciones
�� 
.
��  
Fields
��  &
.
��& '
	Apiestado
��' 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
,
��; <
	segTablas
�� 
.
�� 
Idsap
�� 
)
��  
;
��  !
return
�� 
View
�� 
(
�� 
	segTablas
�� !
)
��! "
;
��" #
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
	segTablas
�� 
=
�� 
await
�� !
_context
��" *
.
��* +
	SegTablas
��+ 4
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdsapNavigation
��  /
)
��/ 0
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idsta
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
	segTablas
�� 
==
�� 
null
�� !
)
��! "
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
	segTablas
�� !
)
��! "
;
��" #
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 
	segTablas
�� 
=
�� 
await
�� 
_context
�� "
.
��" #
	SegTablas
��# ,
.
��, -"
SingleOrDefaultAsync
��- A
(
��A B
m
��B C
=>
��D F
m
��G H
.
��H I
Idsta
��I N
==
��O Q
id
��R T
)
��T U
;
��U V
_context
�� 
.
�� 
	SegTablas
��
.
�� 
Remove
�� 
(
�� 
	segTablas
�� '
)
��' (
;
��( )
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
SegAplicaciones
��< K
,
��K L
SegAplicaciones
�� #
.
��# $
Fields
��$ *
.
��* +
Idsap
��+ 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
,
��; <
SegAplicaciones
�� #
.
��# $
Fields
��$ *
.
��* +
	Apiestado
��+ 4
.
��4 5
ToString
��5 =
(
��= >
)
��> ?
)
��? @
;
��@ A
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
�� 
SegTablasExists
�� $
(
��$ %
long
��% )
id
��* ,
)
��, -
{
�� 	
return
�� 
_context
�� 
.
�� 
	SegTablas
�� %
.
��% &
Any
��& )
(
��) *
e
��* +
=>
��, .
e
��/ 0
.
��0 1
Idsta
��1 6
==
��7 9
id
��: <
)
��< =
;
��= >
}
�� 	
}
�� 
}�� ��
ZC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\SegUsuariosController.cs
	namespace
ReAl
 
.
Lumino
.
	Encuestas
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class !
SegUsuariosController &
:' (
BaseController) 7
{ 
public !
SegUsuariosController	 
( 
db_encuestasContext 2
context3 :
,: ;
IConfiguration< J

)X Y
:Z [
base\ `
(` a
contexta h
,h i

)w x
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
var 
db_encuestasContext #
=$ %
_context& .
.. /
SegUsuarios/ :
.: ;
Include; B
(B C
sC D
=>E G
sH I
.I J
IdcdeNavigationJ Y
)Y Z
.Z [
Include[ b
(b c
sc d
=>e g
sh i
.i j
IdobrNavigationj y
)y z
;z {
return 
View 
( 
await 
db_encuestasContext 1
.1 2
ToListAsync2 =
(= >
)> ?
)? @
;@ A
} 	
public 
async 
Task 
< 

>' (
Details) 0
(0 1
long1 5
?5 6
id7 9
)9 :
{ 	
if!! 
(!! 
id!! 
==!! 
null!! 
)!! 
{"" 
return## 
NotFound## 
(##  
)##  !
;##! "
}$$ 
var&& 
segUsuarios&& 
=&& 
await&& #
_context&&$ ,
.&&, -
SegUsuarios&&- 8
.'' 
Include'' 
('' 
s'' 
=>'' 
s'' 
.''  
IdcdeNavigation''  /
)''/ 0
.(( 
Include(( 
((( 
s(( 
=>(( 
s(( 
.((  
IdobrNavigation((  /
)((/ 0
.))  
SingleOrDefaultAsync)) %
())% &
m))& '
=>))( *
m))+ ,
.)), -
Idsus))- 2
==))3 5
id))6 8
)))8 9
;))9 :
if** 
(** 
segUsuarios** 
==** 
null** #
)**# $
{++ 
return,, 
NotFound,, 
(,,  
),,  !
;,,! "
}-- 
return// 
View// 
(// 
segUsuarios// #
)//# $
;//$ %
}00 	
public33 

Create33 #
(33# $
)33$ %
{44 	
ViewData55 
[55 
$str55 
]55 
=55 
new55 

SelectList55  *
(55* +
_context55+ 3
.553 4
CatDepartamentos554 D
,55D E
CatDepartamentos66 
.66 
Fields66 #
.66# $
Idcde66$ )
.66) *
ToString66* 2
(662 3
)663 4
,664 5
CatDepartamentos77 
.77 
Fields77 #
.77# $
Idcde77$ )
.77) *
ToString77* 2
(772 3
)773 4
)774 5
;775 6
ViewData88 
[88 
$str88 
]88 
=88 
new88 

SelectList88  *
(88* +
_context88+ 3
.883 4
OpeBrigadas884 ?
,88? @
OpeBrigadas99 
.99 
Fields99 
.99 
Idobr99 $
.99$ %
ToString99% -
(99- .
)99. /
,99/ 0
OpeBrigadas:: 
.:: 
Fields:: 
.:: 
Codigo:: %
.::% &
ToString::& .
(::. /
)::/ 0
)::0 1
;::1 2
return;; 
View;; 
(;; 
);; 
;;; 
}<< 	
[AA 	
HttpPostAA	 
]AA 
[BB 	$
ValidateAntiForgeryTokenBB	 !
]BB! "
publicCC 
asyncCC 
TaskCC 
<CC 

>CC' (
CreateCC) /
(CC/ 0
[CC0 1
BindCC1 5
(CC5 6
$str	CC6 �
)
CC� �
]
CC� �
SegUsuarios
CC� �
segUsuarios
CC� �
)
CC� �
{DD 	
ifEE 
(EE 

ModelStateEE 
.EE 
IsValidEE 
)EE 
{FF 
tryGG 
{HH 
segUsuariosII 
.II  
UsucreII  &
=II' (
thisII) -
.II- .
GetLoginII. 6
(II6 7
)II7 8
;II8 9
_contextJJ 
.JJ
AddJJ 
(JJ 
segUsuariosJJ 
)JJ 
;JJ 
awaitKK 

_contextKK 
.KK 
SaveChangesAsyncKK $
(KK$ %
)KK% &
;KK& '
returnLL 
RedirectToActionLL (
(LL( )
nameofLL) /
(LL/ 0
IndexLL0 5
)LL5 6
)LL6 7
;LL7 8
}MM 
catchNN 	
(NN
 
	ExceptionNN 
expNN 
)NN 
{OO 
ifPP 
(PP 
expPP 
.PP 
InnerExceptionPP *
isPP+ -
NpgsqlExceptionPP. =
)PP= >
{QQ 
ViewBagRR 
.RR  
ErrorDbRR  '
=RR( )
expRR* -
.RR- .
InnerExceptionRR. <
.RR< =
MessageRR= D
;RRD E
}SS 
elseTT 
{UU 

ModelStateVV "
.VV" #

(VV0 1
$strVV1 3
,VV3 4
expVV5 8
.VV8 9
MessageVV9 @
)VV@ A
;VVA B
}WW 
ViewDataYY 
[YY 
$strYY $
]YY$ %
=YY& '
newZZ 

SelectListZZ &
(ZZ& '
_contextZZ' /
.ZZ/ 0
CatDepartamentosZZ0 @
,ZZ@ A
CatDepartamentos[[ (
.[[( )
Fields[[) /
.[[/ 0
Idcde[[0 5
.[[5 6
ToString[[6 >
([[> ?
)[[? @
,[[@ A
CatDepartamentos\\ (
.\\( )
Fields\\) /
.\\/ 0
Idcde\\0 5
.\\5 6
ToString\\6 >
(\\> ?
)\\? @
)\\@ A
;\\A B
ViewData]] 
[]] 
$str]] $
]]]$ %
=]]& '
new^^ 

SelectList^^ &
(^^& '
_context^^' /
.^^/ 0
OpeBrigadas^^0 ;
,^^; <
OpeBrigadas__ #
.__# $
Fields__$ *
.__* +
Idobr__+ 0
.__0 1
ToString__1 9
(__9 :
)__: ;
,__; <
OpeBrigadas`` #
.``# $
Fields``$ *
.``* +
Codigo``+ 1
.``1 2
ToString``2 :
(``: ;
)``; <
)``< =
;``= >
returnaa 
Viewaa 
(aa  
)aa  !
;aa! "
}bb 
}cc 
ViewDatadd 
[dd 
$strdd 
]dd 
=dd 
newdd  #

SelectListdd$ .
(dd. /
_contextdd/ 7
.dd7 8
CatDepartamentosdd8 H
,ddH I
CatDepartamentosee  
.ee  !
Fieldsee! '
.ee' (
Idcdeee( -
.ee- .
ToStringee. 6
(ee6 7
)ee7 8
,ee8 9
CatDepartamentosff  
.ff  !
Fieldsff! '
.ff' (
Idcdeff( -
.ff- .
ToStringff. 6
(ff6 7
)ff7 8
,ff8 9
segUsuariosgg 
.gg 
Idcdegg !
)gg! "
;gg" #
ViewDatahh 
[hh 
$strhh 
]hh 
=hh 
newhh  #

SelectListhh$ .
(hh. /
_contexthh/ 7
.hh7 8
OpeBrigadashh8 C
,hhC D
OpeBrigadasii 
.ii 
Fieldsii "
.ii" #
Idobrii# (
.ii( )
ToStringii) 1
(ii1 2
)ii2 3
,ii3 4
OpeBrigadasjj 
.jj 
Fieldsjj "
.jj" #
Codigojj# )
.jj) *
ToStringjj* 2
(jj2 3
)jj3 4
,jj4 5
segUsuarioskk 
.kk 
Idobrkk !
)kk! "
;kk" #
returnll 
Viewll 
(ll 
segUsuariosll #
)ll# $
;ll$ %
}mm 	
publicpp 
asyncpp 
Taskpp 
<pp 

>pp' (
Editpp) -
(pp- .
longpp. 2
?pp2 3
idpp4 6
)pp6 7
{qq 	
ifrr 
(rr 
idrr 
==rr 
nullrr 
)rr 
{ss 
returntt 
NotFoundtt 
(tt  
)tt  !
;tt! "
}uu 
varww 
segUsuariosww 
=ww 
awaitww #
_contextww$ ,
.ww, -
SegUsuariosww- 8
.ww8 9 
SingleOrDefaultAsyncww9 M
(wwM N
mwwN O
=>wwP R
mwwS T
.wwT U
IdsuswwU Z
==ww[ ]
idww^ `
)ww` a
;wwa b
ifxx 
(xx 
segUsuariosxx 
==xx 
nullxx #
)xx# $
{yy 
returnzz 
NotFoundzz 
(zz  
)zz  !
;zz! "
}{{ 
ViewData|| 
[|| 
$str|| 
]|| 
=|| 
new||  #

SelectList||$ .
(||. /
_context||/ 7
.||7 8
CatDepartamentos||8 H
,||H I
CatDepartamentos}}  
.}}  !
Fields}}! '
.}}' (
Idcde}}( -
.}}- .
ToString}}. 6
(}}6 7
)}}7 8
,}}8 9
CatDepartamentos~~  
.~~  !
Fields~~! '
.~~' (
Idcde~~( -
.~~- .
ToString~~. 6
(~~6 7
)~~7 8
,~~8 9
segUsuarios 
. 
Idcde !
)! "
;" #
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
OpeBrigadas
��8 C
,
��C D
OpeBrigadas
�� 
.
�� 
Fields
�� "
.
��" #
Idobr
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4
OpeBrigadas
�� 
.
�� 
Fields
�� "
.
��" #
Codigo
��# )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
segUsuarios
�� 
.
�� 
Idobr
�� !
)
��! "
;
��" #
return
�� 
View
�� 
(
�� 
segUsuarios
�� #
)
��# $
;
��$ %
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Edit
��) -
(
��- .
long
��. 2
id
��3 5
,
��5 6
[
��7 8
Bind
��8 <
(
��< =
$str��= �
)��� �
]��� �
SegUsuarios��� �
segUsuarios��� �
)��� �
{
�� 	
if
�� 
(
�� 
id
�� 
!=
�� 
segUsuarios
�� !
.
��! "
Idsus
��" '
)
��' (
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
try
�� 
{
�� 
segUsuarios
�� 
.
��  
Usumod
��  &
=
��' (
this
��) -
.
��- .
GetLogin
��. 6
(
��6 7
)
��7 8
;
��8 9
segUsuarios
�� 
.
��  
Apitransaccion
��  .
=
��/ 0
$str
��1 <
;
��< =
_context
�� 
.
�� 
Update
�� #
(
��# $
segUsuarios
��$ /
)
��/ 0
;
��0 1
await
�� 
_context
�� "
.
��" #
SaveChangesAsync
��# 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
catch
�� 
(
�� *
DbUpdateConcurrencyException
�� 3
)
��3 4
{
�� 
if
�� 
(
�� 
!
�� 
SegUsuariosExists
�� *
(
��* +
segUsuarios
��+ 6
.
��6 7
Idsus
��7 <
)
��< =
)
��= >
{
�� 
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
}
�� 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
CatDepartamentos
��0 @
,
��@ A
CatDepartamentos
�� (
.
��( )
Fields
��) /
.
��/ 0
Idcde
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A
CatDepartamentos
�� (
.
��( )
Fields
��) /
.
��/ 0
Idcde
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
)
��@ A
;
��A B
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
OpeBrigadas
��0 ;
,
��; <
OpeBrigadas
�� #
.
��# $
Fields
��$ *
.
��* +
Idobr
��+ 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
,
��; <
OpeBrigadas
�� #
.
��# $
Fields
��$ *
.
��* +
Codigo
��+ 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
)
��< =
;
��= >
return
�� 
View
�� 
(
��  
segUsuarios
��  +
)
��+ ,
;
��, -
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
CatDepartamentos
��8 H
,
��H I
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
Idcde
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
Idcde
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
segUsuarios
�� 
.
�� 
Idcde
�� !
)
��! "
;
��" #
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
OpeBrigadas
��8 C
,
��C D
OpeBrigadas
�� 
.
�� 
Fields
�� "
.
��" #
Idobr
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4
OpeBrigadas
�� 
.
�� 
Fields
�� "
.
��" #
Codigo
��# )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
segUsuarios
�� 
.
�� 
Idobr
�� !
)
��! "
;
��" #
return
�� 
View
�� 
(
�� 
segUsuarios
�� #
)
��# $
;
��$ %
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
segUsuarios
�� 
=
�� 
await
�� #
_context
��$ ,
.
��, -
SegUsuarios
��- 8
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdcdeNavigation
��  /
)
��/ 0
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdobrNavigation
��  /
)
��/ 0
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idsus
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
segUsuarios
�� 
==
�� 
null
�� #
)
��# $
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
segUsuarios
�� #
)
��# $
;
��$ %
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Profile
��) 0
(
��0 1
)
��1 2
{
�� 	
var
�� 
segUsuarios
�� 
=
�� 
await
�� #
_context
��$ ,
.
��, -
SegUsuarios
��- 8
.
��8 9"
SingleOrDefaultAsync
��9 M
(
��M N
m
��N O
=>
��P R
m
��S T
.
��T U
Idsus
��U Z
==
��[ ]
this
��^ b
.
��b c
GetUser
��c j
(
��j k
)
��k l
.
��l m
Idsus
��m r
)
��r s
;
��s t
if
�� 
(
�� 
segUsuarios
�� 
==
�� 
null
�� #
)
��# $
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
segUsuarios
�� #
)
��# $
;
��$ %
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Profile
��) 0
(
��0 1
long
��1 5
id
��6 8
,
��8 9
[
��: ;
Bind
��; ?
(
��? @
$str��@ �
)��� �
]��� �
SegUsuarios��� �
segUsuarios��� �
)��� �
{
�� 	
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
try
�� 
{
�� 
(
�� 
segUsuarios
��  
)
��  !
.
��! "
Usumod
��" (
=
��) *
GetLogin
��+ 3
(
��3 4
)
��4 5
;
��5 6
(
�� 
segUsuarios
�� 
)
�� 
.
�� 
Apitransaccion
�� !
=
��" #
$str
��$ /
;
��/ 0
_context
�� 
.
�� 
Update
�� #
(
��# $
segUsuarios
��$ /
)
��/ 0
;
��0 1
await
�� 
_context
�� "
.
��" #
SaveChangesAsync
��# 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
catch
�� 
(
�� *
DbUpdateConcurrencyException
�� 3
)
��3 4
{
�� 
if
�� 
(
�� 
!
�� 
SegUsuariosExists
�� *
(
��* +
segUsuarios
��+ 6
.
��6 7
Idsus
��7 <
)
��< =
)
��= >
{
�� 
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
}
�� 
throw
�� 
;
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
��( +

SelectList
��, 6
(
��6 7
_context
��7 ?
.
��? @
CatDepartamentos
��@ P
,
��P Q
CatDepartamentos
�� (
.
��( )
Fields
��) /
.
��/ 0
Idcde
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A
CatDepartamentos
�� (
.
��( )
Fields
��) /
.
��/ 0
Idcde
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
)
��@ A
;
��A B
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
��( +

SelectList
��, 6
(
��6 7
_context
��7 ?
.
��? @
OpeBrigadas
��@ K
,
��K L
OpeBrigadas
�� #
.
��# $
Fields
��$ *
.
��* +
Idobr
��+ 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
,
��; <
OpeBrigadas
�� #
.
��# $
Fields
��$ *
.
��* +
Codigo
��+ 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
)
��< =
;
��= >
return
�� 
View
�� 
(
��  
segUsuarios
��  +
)
��+ ,
;
��, -
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /!
DashboardController
��/ B
.
��B C
Index
��C H
)
��H I
,
��I J
$str
��K V
)
��V W
;
��W X
}
�� 
return
�� 
View
�� 
(
�� 
segUsuarios
�� #
)
��# $
;
��$ %
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� 
segUsuarios
�� 
=
�� 
await
�� 
_context
�� $
.
��$ %
SegUsuarios
��% 0
.
��0 1"
SingleOrDefaultAsync
��1 E
(
��E F
m
��F G
=>
��H J
m
��K L
.
��L M
Idsus
��M R
==
��S U
id
��V X
)
��X Y
;
��Y Z
_context
�� 
.
�� 
SegUsuarios
��
.
�� 
Remove
�� 
(
��  
segUsuarios
��  +
)
��+ ,
;
��, -
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
CatDepartamentos
��< L
,
��L M
CatDepartamentos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Idcde
��, 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =
CatDepartamentos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Idcde
��, 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
)
��< =
;
��= >
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
OpeBrigadas
��< G
,
��G H
OpeBrigadas
�� 
.
��  
Fields
��  &
.
��& '
Idobr
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
,
��7 8
OpeBrigadas
�� 
.
��  
Fields
��  &
.
��& '
Codigo
��' -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
)
��8 9
;
��9 :
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
�� 
SegUsuariosExists
�� &
(
��& '
long
��' +
id
��, .
)
��. /
{
�� 	
return
�� 
_context
�� 
.
�� 
SegUsuarios
�� '
.
��' (
Any
��( +
(
��+ ,
e
��, -
=>
��. 0
e
��1 2
.
��2 3
Idsus
��3 8
==
��9 ;
id
��< >
)
��> ?
;
��? @
}
�� 	
}
�� 
}�� ��
eC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Controllers\SegUsuariosRestriccionController.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Controllers  +
{ 
[ 
	Authorize 
] 
public 

class ,
 SegUsuariosRestriccionController 1
:2 3
BaseController4 B
{ 
public ,
 SegUsuariosRestriccionController	 )
() *
db_encuestasContext* =
context> E
,E F
IConfigurationG U

)c d
:e f
baseg k
(k l
contextl s
,s t

)
� �
{ 	
} 	
public 
async 
Task 
< 

>' (
Index) .
(. /
)/ 0
{ 	
var 
db_encuestasContext #
=$ %
_context& .
.. /"
SegUsuariosRestriccion/ E
. 
Include 
( 
s 
=> 
s 
.  
IdcdeNavigation  /
)/ 0
.0 1
Include1 8
(8 9
s9 :
=>; =
s> ?
.? @
IdopyNavigation@ O
)O P
.   
Include   
(   
s   
=>   
s   
.    
IdsroNavigation    /
)  / 0
.  0 1
Include  1 8
(  8 9
s  9 :
=>  ; =
s  > ?
.  ? @
IdsusNavigation  @ O
)  O P
;  P Q
return!! 
View!! 
(!! 
await!! 
db_encuestasContext!! 1
.!!1 2
ToListAsync!!2 =
(!!= >
)!!> ?
)!!? @
;!!@ A
}"" 	
public%% 
async%% 
Task%% 
<%% 

>%%' (
CambiarRolActual%%) 9
(%%9 :
)%%: ;
{&& 	
var'' 
db_encuestasContext'' #
=''$ %
_context''& .
.''. /"
SegUsuariosRestriccion''/ E
.(( 
Where(( 
((( 
sur(( 
=>(( 
sur(( !
.((! "
Idsus((" '
==((( *
this((+ /
.((/ 0
GetUser((0 7
(((7 8
)((8 9
.((9 :
Idsus((: ?
)((? @
.)) 
Where)) 
()) 
sur)) 
=>)) 
sur)) !
.))! "
Vigente))" )
==))* ,
$num))- .
))). /
.** 
Include** 
(** 
s** 
=>** 
s** 
.**  
IdcdeNavigation**  /
)**/ 0
.**0 1
Include**1 8
(**8 9
s**9 :
=>**; =
s**> ?
.**? @
IdopyNavigation**@ O
)**O P
.++ 
Include++ 
(++ 
s++ 
=>++ 
s++ 
.++  
IdsroNavigation++  /
)++/ 0
.++0 1
Include++1 8
(++8 9
s++9 :
=>++; =
s++> ?
.++? @
IdsusNavigation++@ O
)++O P
;++P Q
return,, 
View,, 
(,, 
await,, 
db_encuestasContext,, 1
.,,1 2
ToListAsync,,2 =
(,,= >
),,> ?
),,? @
;,,@ A
}-- 	
[00 	
HttpPost00	 
]00 
[11 	$
ValidateAntiForgeryToken11	 !
]11! "
public22 
async22 
Task22 
<22 

>22' (
CambiarRolActual22) 9
(229 :
long22: >
?22> ?
id22@ B
)22B C
{33 	
try44 
{55 
var66 
list66 
=66 
await66  
_context66! )
.66) *"
SegUsuariosRestriccion66* @
.77 
Where77 
(77 
sur77 
=>77 !
sur77" %
.77% &
Idsur77& +
!=77, .
id77/ 1
)771 2
.88 
Where88 
(88 
sur88 
=>88 !
sur88" %
.88% &
Idsus88& +
==88, .
this88/ 3
.883 4
GetUser884 ;
(88; <
)88< =
.88= >
Idsus88> C
)88C D
.99 
ToListAsync99  
(99  !
)99! "
;99" #
foreach:: 
(:: "
SegUsuariosRestriccion:: /
sur::0 3
in::4 6
list::7 ;
)::; <
{;; 
sur<< 
.<< 
Apitransaccion<< &
=<<' (
$str<<) 4
;<<4 5
sur== 
.== 
Usumod== 
===  
this==! %
.==% &
GetLogin==& .
(==. /
)==/ 0
;==0 1
sur>> 
.>> 
	Rolactivo>> !
=>>" #
$num>>$ %
;>>% &
_context?? 
.?? "
SegUsuariosRestriccion?? 3
.??3 4
Update??4 :
(??: ;
sur??; >
)??> ?
;??? @
}@@ 
varBB "
segUsuariosRestriccionBB *
=BB+ ,
awaitBB- 2
_contextBB3 ;
.BB; <"
SegUsuariosRestriccionBB< R
.BBR S 
SingleOrDefaultAsyncBBS g
(BBg h
mBBh i
=>BBj l
mBBm n
.BBn o
IdsurBBo t
==BBu w
idBBx z
)BBz {
;BB{ |"
segUsuariosRestriccionCC &
.CC& '
ApitransaccionCC' 5
=CC6 7
$strCC8 C
;CCC D"
segUsuariosRestriccionDD &
.DD& '
UsumodDD' -
=DD. /
thisDD0 4
.DD4 5
GetLoginDD5 =
(DD= >
)DD> ?
;DD? @"
segUsuariosRestriccionEE &
.EE& '
	RolactivoEE' 0
=EE1 2
$numEE3 4
;EE4 5
_contextFF 
.FF "
SegUsuariosRestriccionFF /
.FF/ 0
UpdateFF0 6
(FF6 7"
segUsuariosRestriccionFF7 M
)FFM N
;FFN O
awaitGG 
_contextGG 
.GG 
SaveChangesAsyncGG /
(GG/ 0
)GG0 1
;GG1 2
varII 
userII 
=II 
UserII 
asII  "
ClaimsPrincipalII# 2
;II2 3
varJJ 
identityJJ 
=JJ 
userJJ #
.JJ# $
IdentityJJ$ ,
asJJ- /
ClaimsIdentityJJ0 >
;JJ> ?
ifLL 
(LL 
identityLL 
==LL 
nullLL  $
)LL$ %
{MM 
returnNN 
RedirectToActionNN +
(NN+ ,
nameofNN, 2
(NN2 3
CambiarRolActualNN3 C
)NNC D
)NND E
;NNE F
}OO 
varQQ 
claimQQ 
=QQ 
(QQ 
fromQQ !
cQQ" #
inQQ$ &
userQQ' +
.QQ+ ,
ClaimsQQ, 2
whereRR 
cRR 
.RR 
TypeRR  
==RR! #

ClaimTypesRR$ .
.RR. /
RoleRR/ 3
selectSS 
cSS 
)SS 
.SS 
SingleSS $
(SS$ %
)SS% &
;SS& '
identityTT 
.TT 
RemoveClaimTT $
(TT$ %
claimTT% *
)TT* +
;TT+ ,
varVV 
claim2VV 
=VV 
(VV 
fromVV "
cVV# $
inVV% '
userVV( ,
.VV, -
ClaimsVV- 3
whereWW 
cWW 
.WW 
TypeWW  
==WW! #

ClaimTypesWW$ .
.WW. /
GroupSidWW/ 7
selectXX 
cXX 
)XX 
.XX 
SingleXX $
(XX$ %
)XX% &
;XX& '
identityYY 
.YY 
RemoveClaimYY $
(YY$ %
claim2YY% +
)YY+ ,
;YY, -
var\\ 
objRol\\ 
=\\ 
_context\\ %
.\\% &
SegUsuarios\\& 1
.]] 
Join]] 
(]] 
_context]] "
.]]" #"
SegUsuariosRestriccion]]# 9
,]]9 :
sus]]; >
=>]]? A
sus]]B E
.]]E F
Idsus]]F K
,]]K L
sur]]M P
=>]]Q S
sur]]T W
.]]W X
Idsus]]X ]
,]]] ^
(^^ 
sus^^ 
,^^ 
sur^^ !
)^^! "
=>^^# %
new^^& )
{^^* +
sus^^+ .
,^^. /
sur^^0 3
}^^3 4
)^^4 5
.__ 
Join__ 
(__ 
_context__ "
.__" #
SegRoles__# +
,__+ ,
sussur__- 3
=>__4 6
sussur__7 =
.__= >
sur__> A
.__A B
Idsro__B G
,__G H
sro__I L
=>__M O
sro__P S
.__S T
Idsro__T Y
,__Y Z
(`` 
sussur`` 
,``  
sro``! $
)``$ %
=>``& (
new``) ,
{``- .
sussur``. 4
,``4 5
sro``6 9
}``9 :
)``: ;
.aa 
Whereaa 
(aa 
@taa 
=>aa  
@taa! #
.aa# $
sussuraa$ *
.aa* +
suraa+ .
.aa. /
	Rolactivoaa/ 8
==aa9 ;
$numaa< =
)aa= >
.bb 
Wherebb 
(bb 
@tbb 
=>bb  
stringbb! '
.bb' (
Equalsbb( .
(bb. /
@tbb/ 1
.bb1 2
sussurbb2 8
.bb8 9
susbb9 <
.bb< =
Loginbb= B
,bbB C
thisbbD H
.bbH I
GetLoginbbI Q
(bbQ R
)bbR S
,bbS T
StringComparisoncc (
.cc( )$
CurrentCultureIgnoreCasecc) A
)ccA B
)ccB C
.dd 
Selectdd 
(dd 
argdd 
=>dd  "
argdd# &
)dd& '
.dd' (
SingleOrDefaultdd( 7
(dd7 8
)dd8 9
;dd9 :
ifee 
(ee 
objRolee 
==ee 
nullee "
)ee" #
{ff 
identitygg 
.gg 
AddClaimgg %
(gg% &
newgg& )
Claimgg* /
(gg/ 0

ClaimTypesgg0 :
.gg: ;
Rolegg; ?
,gg? @
stringggA G
.ggG H
EmptyggH M
)ggM N
)ggN O
;ggO P
identityhh 
.hh 
AddClaimhh %
(hh% &
newhh& )
Claimhh* /
(hh/ 0

ClaimTypeshh0 :
.hh: ;
GroupSidhh; C
,hhC D
stringhhE K
.hhK L
EmptyhhL Q
)hhQ R
)hhR S
;hhS T
identityii 
.ii 
AddClaimii %
(ii% &
newii& )
Claimii* /
(ii/ 0

ClaimTypesii0 :
.ii: ;

PrimarySidii; E
,iiE F
stringiiG M
.iiM N
EmptyiiN S
)iiS T
)iiT U
;iiU V
}jj 
elsekk 
{ll 
identitymm 
.mm 
AddClaimmm %
(mm% &
newmm& )
Claimmm* /
(mm/ 0

ClaimTypesmm0 :
.mm: ;
Rolemm; ?
,mm? @
objRolmmA G
.mmG H
srommH K
.mmK L
IdsrommL Q
.mmQ R
ToStringmmR Z
(mmZ [
)mm[ \
)mm\ ]
)mm] ^
;mm^ _
identitynn 
.nn 
AddClaimnn %
(nn% &
newnn& )
Claimnn* /
(nn/ 0

ClaimTypesnn0 :
.nn: ;
GroupSidnn; C
,nnC D
objRolnnE K
.nnK L
sussurnnL R
.nnR S
surnnS V
.nnV W
IdopynnW \
.nn\ ]
ToStringnn] e
(nne f
)nnf g
)nng h
)nnh i
;nni j
identityoo 
.oo 
AddClaimoo %
(oo% &
newoo& )
Claimoo* /
(oo/ 0

ClaimTypesoo0 :
.oo: ;

PrimarySidoo; E
,ooE F
objRolooG M
.ooM N
sussurooN T
.ooT U
surooU X
.ooX Y
IdcdeooY ^
.oo^ _
ToStringoo_ g
(oog h
)ooh i
)ooi j
)ooj k
;ook l
}pp 
awaitrr 
HttpContextrr !
.rr! "
SignInAsyncrr" -
(rr- .(
CookieAuthenticationDefaultsrr. J
.rrJ K 
AuthenticationSchemerrK _
,rr_ `
newss 
ClaimsPrincipalss '
(ss' (
identityss( 0
)ss0 1
)ss1 2
;ss2 3
returnuu 
RedirectToActionuu '
(uu' (
nameofuu( .
(uu. /
CambiarRolActualuu/ ?
)uu? @
)uu@ A
;uuA B
}vv 
catchww 
(ww 
	Exceptionww 
expww  
)ww  !
{xx 
ifyy 
(yy 
expyy 
.yy 
InnerExceptionyy &
isyy' )
NpgsqlExceptionyy* 9
)yy9 :
{zz 
ViewBag{{ 
.{{ 
ErrorDb{{ #
={{$ %
exp{{& )
.{{) *
InnerException{{* 8
.{{8 9
Message{{9 @
;{{@ A
}|| 
else}} 
{~~ 

ModelState 
. 

(, -
$str- /
,/ 0
exp1 4
.4 5
Message5 <
)< =
;= >
}
�� 
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
CatDepartamentos
��< L
,
��L M
CatDepartamentos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Idcde
��, 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =
CatDepartamentos
�� $
.
��$ %
Fields
��% +
.
��+ ,
	Apiestado
��, 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
)
��@ A
;
��A B
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
OpeProyectos
��< H
,
��H I
OpeProyectos
��  
.
��  !
Fields
��! '
.
��' (
Idopy
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
OpeProyectos
��  
.
��  !
Fields
��! '
.
��' (
	Apiestado
��( 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
)
��< =
;
��= >
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
SegRoles
��< D
,
��D E
SegRoles
�� 
.
�� 
Fields
�� #
.
��# $
Idsro
��$ )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
SegRoles
�� 
.
�� 
Fields
�� #
.
��# $
	Apiestado
��$ -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
)
��8 9
;
��9 :
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
SegUsuarios
��< G
,
��G H
SegUsuarios
�� 
.
��  
Fields
��  &
.
��& '
Idsus
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
,
��7 8
SegUsuarios
�� 
.
��  
Fields
��  &
.
��& '
Login
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
)
��7 8
;
��8 9
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Details
��) 0
(
��0 1
long
��1 5
?
��5 6
id
��7 9
)
��9 :
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� $
segUsuariosRestriccion
�� &
=
��' (
await
��) .
_context
��/ 7
.
��7 8$
SegUsuariosRestriccion
��8 N
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdcdeNavigation
��  /
)
��/ 0
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdopyNavigation
��  /
)
��/ 0
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdsroNavigation
��  /
)
��/ 0
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdsusNavigation
��  /
)
��/ 0
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idsur
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� $
segUsuariosRestriccion
�� &
==
��' )
null
��* .
)
��. /
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� $
segUsuariosRestriccion
�� .
)
��. /
;
��/ 0
}
�� 	
public
�� 

�� 
Create
�� #
(
��# $
)
��$ %
{
�� 	
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
�� 

SelectList
��  *
(
��* +
_context
��+ 3
.
��3 4
CatDepartamentos
��4 D
,
��D E
CatDepartamentos
�� 
.
�� 
Fields
�� #
.
��# $
Idcde
��$ )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
CatDepartamentos
�� 
.
�� 
Fields
�� #
.
��# $
	Apiestado
��$ -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
)
��8 9
;
��9 :
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
�� 

SelectList
��  *
(
��* +
_context
��+ 3
.
��3 4
OpeProyectos
��4 @
,
��@ A
OpeProyectos
�� 
.
�� 
Fields
�� 
.
��  
Idopy
��  %
.
��% &
ToString
��& .
(
��. /
)
��/ 0
,
��0 1
OpeProyectos
�� 
.
�� 
Fields
�� 
.
��  
	Apiestado
��  )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
)
��4 5
;
��5 6
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
�� 

SelectList
��  *
(
��* +
_context
��+ 3
.
��3 4
SegRoles
��4 <
,
��< =
SegRoles
�� 
.
�� 
Fields
�� 
.
�� 
Idsro
�� !
.
��! "
ToString
��" *
(
��* +
)
��+ ,
,
��, -
SegRoles
�� 
.
�� 
Fields
�� 
.
�� 
	Apiestado
�� %
.
��% &
ToString
��& .
(
��. /
)
��/ 0
)
��0 1
;
��1 2
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
�� 

SelectList
��  *
(
��* +
_context
��+ 3
.
��3 4
SegUsuarios
��4 ?
,
��? @
SegUsuarios
�� 
.
�� 
Fields
�� 
.
�� 
Idsus
�� $
.
��$ %
ToString
��% -
(
��- .
)
��. /
,
��/ 0
SegUsuarios
�� 
.
�� 
Fields
�� 
.
�� 
Login
�� $
.
��$ %
ToString
��% -
(
��- .
)
��. /
)
��/ 0
;
��0 1
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Create
��) /
(
��/ 0
[
��0 1
Bind
��1 5
(
��5 6
$str��6 �
)��� �
]��� �&
SegUsuariosRestriccion��� �&
segUsuariosRestriccion��� �
)��� �
{
�� 	
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� 
)
�� 
{
�� 
try
�� 
{
�� $
segUsuariosRestriccion
�� *
.
��* +
Usucre
��+ 1
=
��2 3
this
��4 8
.
��8 9
GetLogin
��9 A
(
��A B
)
��B C
;
��C D
_context
�� 
.
��
Add
�� 
(
�� $
segUsuariosRestriccion
�� (
)
��( )
;
��) *
await
�� 

_context
�� 
.
�� 
SaveChangesAsync
�� $
(
��$ %
)
��% &
;
��& '
return
�� 
RedirectToAction
�� (
(
��( )
nameof
��) /
(
��/ 0
Index
��0 5
)
��5 6
)
��6 7
;
��7 8
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
CatDepartamentos
��0 @
,
��@ A
CatDepartamentos
�� (
.
��( )
Fields
��) /
.
��/ 0
Idcde
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A
CatDepartamentos
�� (
.
��( )
Fields
��) /
.
��/ 0
	Apiestado
��0 9
.
��9 :
ToString
��: B
(
��B C
)
��C D
)
��D E
;
��E F
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
OpeProyectos
��0 <
,
��< =
OpeProyectos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Idopy
��, 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =
OpeProyectos
�� $
.
��$ %
Fields
��% +
.
��+ ,
	Apiestado
��, 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
)
��@ A
;
��A B
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
SegRoles
��0 8
,
��8 9
SegRoles
��  
.
��  !
Fields
��! '
.
��' (
Idsro
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
SegRoles
��  
.
��  !
Fields
��! '
.
��' (
	Apiestado
��( 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
)
��< =
;
��= >
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
SegUsuarios
��0 ;
,
��; <
SegUsuarios
�� #
.
��# $
Fields
��$ *
.
��* +
Idsus
��+ 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
,
��; <
SegUsuarios
�� #
.
��# $
Fields
��$ *
.
��* +
Login
��+ 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
)
��; <
;
��< =
return
�� 
View
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
CatDepartamentos
��8 H
,
��H I
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
Idcde
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
	Apiestado
��( 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =$
segUsuariosRestriccion
�� &
.
��& '
Idcde
��' ,
)
��, -
;
��- .
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
OpeProyectos
��8 D
,
��D E
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
Idopy
��$ )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
	Apiestado
��$ -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9$
segUsuariosRestriccion
�� &
.
��& '
Idopy
��' ,
)
��, -
;
��- .
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
SegRoles
��8 @
,
��@ A
SegRoles
�� 
.
�� 
Fields
�� 
.
��  
Idsro
��  %
.
��% &
ToString
��& .
(
��. /
)
��/ 0
,
��0 1
SegRoles
�� 
.
�� 
Fields
�� 
.
��  
	Apiestado
��  )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5$
segUsuariosRestriccion
�� &
.
��& '
Idsro
��' ,
)
��, -
;
��- .
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
SegUsuarios
��8 C
,
��C D
SegUsuarios
�� 
.
�� 
Fields
�� "
.
��" #
Idsus
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4
SegUsuarios
�� 
.
�� 
Fields
�� "
.
��" #
Login
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4$
segUsuariosRestriccion
�� &
.
��& '
Idsus
��' ,
)
��, -
;
��- .
return
�� 
View
�� 
(
�� $
segUsuariosRestriccion
�� .
)
��. /
;
��/ 0
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Edit
��) -
(
��- .
long
��. 2
?
��2 3
id
��4 6
)
��6 7
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� $
segUsuariosRestriccion
�� &
=
��' (
await
��) .
_context
��/ 7
.
��7 8$
SegUsuariosRestriccion
��8 N
.
��N O"
SingleOrDefaultAsync
��O c
(
��c d
m
��d e
=>
��f h
m
��i j
.
��j k
Idsur
��k p
==
��q s
id
��t v
)
��v w
;
��w x
if
�� 
(
�� $
segUsuariosRestriccion
�� &
==
��' )
null
��* .
)
��. /
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
CatDepartamentos
��8 H
,
��H I
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
Idcde
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
	Apiestado
��( 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =$
segUsuariosRestriccion
�� &
.
��& '
Idcde
��' ,
)
��, -
;
��- .
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
OpeProyectos
��8 D
,
��D E
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
Idopy
��$ )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
	Apiestado
��$ -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9$
segUsuariosRestriccion
�� &
.
��& '
Idopy
��' ,
)
��, -
;
��- .
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
SegRoles
��8 @
,
��@ A
SegRoles
�� 
.
�� 
Fields
�� 
.
��  
Idsro
��  %
.
��% &
ToString
��& .
(
��. /
)
��/ 0
,
��0 1
SegRoles
�� 
.
�� 
Fields
�� 
.
��  
	Apiestado
��  )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5$
segUsuariosRestriccion
�� &
.
��& '
Idsro
��' ,
)
��, -
;
��- .
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
SegUsuarios
��8 C
,
��C D
SegUsuarios
�� 
.
�� 
Fields
�� "
.
��" #
Idsus
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4
SegUsuarios
�� 
.
�� 
Fields
�� "
.
��" #
Login
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4$
segUsuariosRestriccion
�� &
.
��& '
Idsus
��' ,
)
��, -
;
��- .
return
�� 
View
�� 
(
�� $
segUsuariosRestriccion
�� .
)
��. /
;
��/ 0
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Edit
��) -
(
��- .
long
��. 2
id
��3 5
,
��5 6
[
��7 8
Bind
��8 <
(
��< =
$str��= �
)��� �
]��� �&
SegUsuariosRestriccion��� �&
segUsuariosRestriccion��� �
)��� �
{
�� 	
if
�� 
(
�� 
id
�� 
!=
�� $
segUsuariosRestriccion
�� ,
.
��, -
Idsur
��- 2
)
��2 3
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
try
�� 
{
�� $
segUsuariosRestriccion
�� *
.
��* +
Usumod
��+ 1
=
��2 3
this
��4 8
.
��8 9
GetLogin
��9 A
(
��A B
)
��B C
;
��C D$
segUsuariosRestriccion
�� *
.
��* +
Apitransaccion
��+ 9
=
��: ;
$str
��< G
;
��G H
_context
�� 
.
�� 
Update
�� #
(
��# $$
segUsuariosRestriccion
��$ :
)
��: ;
;
��; <
await
�� 
_context
�� "
.
��" #
SaveChangesAsync
��# 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
catch
�� 
(
�� *
DbUpdateConcurrencyException
�� 3
)
��3 4
{
�� 
if
�� 
(
�� 
!
�� *
SegUsuariosRestriccionExists
�� 5
(
��5 6$
segUsuariosRestriccion
��6 L
.
��L M
Idsur
��M R
)
��R S
)
��S T
{
�� 
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
}
�� 
else
�� 
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� *
is
��+ -
NpgsqlException
��. =
)
��= >
{
�� 
ViewBag
�� 
.
��  
ErrorDb
��  '
=
��( )
exp
��* -
.
��- .
InnerException
��. <
.
��< =
Message
��= D
;
��D E
}
�� 
else
�� 
{
�� 

ModelState
�� "
.
��" #

��# 0
(
��0 1
$str
��1 3
,
��3 4
exp
��5 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
CatDepartamentos
��0 @
,
��@ A
CatDepartamentos
�� (
.
��( )
Fields
��) /
.
��/ 0
Idcde
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A
CatDepartamentos
�� (
.
��( )
Fields
��) /
.
��/ 0
	Apiestado
��0 9
.
��9 :
ToString
��: B
(
��B C
)
��C D
)
��D E
;
��E F
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
OpeProyectos
��0 <
,
��< =
OpeProyectos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Idopy
��, 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =
OpeProyectos
�� $
.
��$ %
Fields
��% +
.
��+ ,
	Apiestado
��, 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
)
��@ A
;
��A B
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
SegRoles
��0 8
,
��8 9
SegRoles
��  
.
��  !
Fields
��! '
.
��' (
Idsro
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
SegRoles
��  
.
��  !
Fields
��! '
.
��' (
	Apiestado
��( 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
)
��< =
;
��= >
ViewData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
new
�� 

SelectList
�� &
(
��& '
_context
��' /
.
��/ 0
SegUsuarios
��0 ;
,
��; <
SegUsuarios
�� #
.
��# $
Fields
��$ *
.
��* +
Idsus
��+ 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
,
��; <
SegUsuarios
�� #
.
��# $
Fields
��$ *
.
��* +
Login
��+ 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
)
��; <
;
��< =
return
�� 
View
�� 
(
��  $
segUsuariosRestriccion
��  6
)
��6 7
;
��7 8
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
nameof
��( .
(
��. /
Index
��/ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
CatDepartamentos
��8 H
,
��H I
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
Idcde
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
CatDepartamentos
��  
.
��  !
Fields
��! '
.
��' (
	Apiestado
��( 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =$
segUsuariosRestriccion
�� &
.
��& '
Idcde
��' ,
)
��, -
;
��- .
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
OpeProyectos
��8 D
,
��D E
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
Idopy
��$ )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
OpeProyectos
�� 
.
�� 
Fields
�� #
.
��# $
	Apiestado
��$ -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9$
segUsuariosRestriccion
�� &
.
��& '
Idopy
��' ,
)
��, -
;
��- .
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
SegRoles
��8 @
,
��@ A
SegRoles
�� 
.
�� 
Fields
�� 
.
��  
Idsro
��  %
.
��% &
ToString
��& .
(
��. /
)
��/ 0
,
��0 1
SegRoles
�� 
.
�� 
Fields
�� 
.
��  
	Apiestado
��  )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5$
segUsuariosRestriccion
�� &
.
��& '
Idsro
��' ,
)
��, -
;
��- .
ViewData
�� 
[
�� 
$str
�� 
]
�� 
=
�� 
new
��  #

SelectList
��$ .
(
��. /
_context
��/ 7
.
��7 8
SegUsuarios
��8 C
,
��C D
SegUsuarios
�� 
.
�� 
Fields
�� "
.
��" #
Idsus
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4
SegUsuarios
�� 
.
�� 
Fields
�� "
.
��" #
Login
��# (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
,
��3 4$
segUsuariosRestriccion
�� &
.
��& '
Idsus
��' ,
)
��, -
;
��- .
return
�� 
View
�� 
(
�� $
segUsuariosRestriccion
�� .
)
��. /
;
��/ 0
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
Delete
��) /
(
��/ 0
long
��0 4
?
��4 5
id
��6 8
)
��8 9
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� $
segUsuariosRestriccion
�� &
=
��' (
await
��) .
_context
��/ 7
.
��7 8$
SegUsuariosRestriccion
��8 N
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdcdeNavigation
��  /
)
��/ 0
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdopyNavigation
��  /
)
��/ 0
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdsroNavigation
��  /
)
��/ 0
.
�� 
Include
�� 
(
�� 
s
�� 
=>
�� 
s
�� 
.
��  
IdsusNavigation
��  /
)
��/ 0
.
�� "
SingleOrDefaultAsync
�� %
(
��% &
m
��& '
=>
��( *
m
��+ ,
.
��, -
Idsur
��- 2
==
��3 5
id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� $
segUsuariosRestriccion
�� &
==
��' )
null
��* .
)
��. /
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� $
segUsuariosRestriccion
�� .
)
��. /
;
��/ 0
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 

�� '
>
��' (
DeleteConfirmed
��) 8
(
��8 9
long
��9 =
id
��> @
)
��@ A
{
�� 	
try
�� 
{
�� 
var
�� $
segUsuariosRestriccion
�� 
=
��  
await
��! &
_context
��' /
.
��/ 0$
SegUsuariosRestriccion
��0 F
.
��F G"
SingleOrDefaultAsync
��G [
(
��[ \
m
��\ ]
=>
��^ `
m
��a b
.
��b c
Idsur
��c h
==
��i k
id
��l n
)
��n o
;
��o p
_context
�� 
.
�� 
SegUsuariosRestriccion
��
.
��# $
Remove
��$ *
(
��* +$
segUsuariosRestriccion
��+ A
)
��A B
;
��B C
await
�� 	
_context
��
 
.
�� 
SaveChangesAsync
�� #
(
��# $
)
��$ %
;
��% &
return
�� 

RedirectToAction
�� 
(
�� 
nameof
�� "
(
��" #
Index
��# (
)
��( )
)
��) *
;
��* +
}
�� 
catch
�� 
(
��	 

	Exception
��
 
exp
�� 
)
�� 
{
�� 
if
�� 
(
�� 
exp
�� 
.
�� 
InnerException
�� &
is
��' )
NpgsqlException
��* 9
)
��9 :
{
�� 
ViewBag
�� 
.
�� 
ErrorDb
�� #
=
��$ %
exp
��& )
.
��) *
InnerException
��* 8
.
��8 9
Message
��9 @
;
��@ A
}
�� 
else
�� 
{
�� 

ModelState
�� 
.
�� 

�� ,
(
��, -
$str
��- /
,
��/ 0
exp
��1 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
CatDepartamentos
��< L
,
��L M
CatDepartamentos
�� $
.
��$ %
Fields
��% +
.
��+ ,
Idcde
��, 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =
CatDepartamentos
�� $
.
��$ %
Fields
��% +
.
��+ ,
	Apiestado
��, 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
)
��@ A
;
��A B
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
OpeProyectos
��< H
,
��H I
OpeProyectos
��  
.
��  !
Fields
��! '
.
��' (
Idopy
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
OpeProyectos
��  
.
��  !
Fields
��! '
.
��' (
	Apiestado
��( 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
)
��< =
;
��= >
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
SegRoles
��< D
,
��D E
SegRoles
�� 
.
�� 
Fields
�� #
.
��# $
Idsro
��$ )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
SegRoles
�� 
.
�� 
Fields
�� #
.
��# $
	Apiestado
��$ -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
)
��8 9
;
��9 :
ViewData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
new
��$ '

SelectList
��( 2
(
��2 3
_context
��3 ;
.
��; <
SegUsuarios
��< G
,
��G H
SegUsuarios
�� 
.
��  
Fields
��  &
.
��& '
Idsus
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
,
��7 8
SegUsuarios
�� 
.
��  
Fields
��  &
.
��& '
Login
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
)
��7 8
;
��8 9
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
bool
�� *
SegUsuariosRestriccionExists
�� 1
(
��1 2
long
��2 6
id
��7 9
)
��9 :
{
�� 	
return
�� 
_context
�� 
.
�� $
SegUsuariosRestriccion
�� 2
.
��2 3
Any
��3 6
(
��6 7
e
��7 8
=>
��9 ;
e
��< =
.
��= >
Idsur
��> C
==
��D F
id
��G I
)
��I J
;
��J K
}
�� 	
}
�� 
}�� ̽
BC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Dal\CConn.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Dal  #
{ 
public 

class 
CConn 
{ 
internal 
NpgsqlConnection !

ConexionBd" ,
=- .
new/ 2
NpgsqlConnection3 C
(C D
)D E
;E F
private 
static 
readonly 
EnumTipoConexion  0
TipoConexion1 =
=> ?
EnumTipoConexion@ P
.P Q

;^ _
private 
enum 
EnumTipoConexion %
{ 	
UseDataAdapter 
, 

} 	
public 
CConn 
( 
string 
strConn #
)# $
{   	

ConexionBd!! 
.!! 
ConnectionString!! '
=!!( )
strConn!!* 1
;!!1 2
}"" 	
private// 
	DataTable// 
CargarDataTable// )
(//) *
string//* 0
query//1 6
)//6 7
{00 	
var11 
dt11 
=11 
new11 
	DataTable11 "
(11" #
)11# $
;11$ %
dt33 
.33 
Clear33 
(33 
)33 
;33 
try44 
{55 
var66 
command66 
=66 
new66 !

(66/ 0
query660 5
,665 6

ConexionBd667 A
)66A B
;66B C
if88 
(88 
TipoConexion88  
==88! #
EnumTipoConexion88$ 4
.884 5

)88B C
{99 
if:: 
(:: 
command:: 
.::  

Connection::  *
.::* +
State::+ 0
==::1 3
ConnectionState::4 C
.::C D
Closed::D J
)::J K
{;; 
command<< 
.<<  

Connection<<  *
.<<* +
Open<<+ /
(<</ 0
)<<0 1
;<<1 2
}== 
DbDataReader>>  
dr>>! #
=>>$ %
command>>& -
.>>- .

(>>; <
CommandBehavior>>< K
.>>K L
CloseConnection>>L [
)>>[ \
;>>\ ]
dt?? 
.?? 
Load?? 
(?? 
dr?? 
)?? 
;??  
dr@@ 
.@@ 
Close@@ 
(@@ 
)@@ 
;@@ 
ifAA 
(AA 
commandAA 
.AA  

ConnectionAA  *
.AA* +
StateAA+ 0
!=AA1 3
ConnectionStateAA4 C
.AAC D
ClosedAAD J
)AAJ K
{BB 
commandCC 
.CC  

ConnectionCC  *
.CC* +
CloseCC+ 0
(CC0 1
)CC1 2
;CC2 3
}DD 
}EE 
elseFF 
{GG 
varHH 
daHH 
=HH 
newHH  
NpgsqlDataAdapterHH! 2
(HH2 3
)HH3 4
;HH4 5
daII 
=II 
newII 
NpgsqlDataAdapterII .
(II. /
commandII/ 6
)II6 7
;II7 8
daJJ 
.JJ 
FillJJ 
(JJ 
dtJJ 
)JJ 
;JJ  
}KK 
commandLL 
.LL 
DisposeLL 
(LL  
)LL  !
;LL! "
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN 
)NN  
{OO 
exPP 
.PP 
DataPP 
.PP 
AddPP 
(PP 
$strPP %
,PP% &
queryPP' ,
)PP, -
;PP- .
throwQQ 
;QQ 
}RR 
returnSS 
dtSS 
;SS 
}TT 	
privateff 
	DataTableff 
CargarDataTableff )
(ff) *
stringff* 0
queryff1 6
,ff6 7
refff8 ;
CTransff< B
transffC H
)ffH I
{gg 	
varhh 
dthh 
=hh 
newhh 
	DataTablehh "
(hh" #
)hh# $
;hh$ %
dtii 
.ii 
Clearii 
(ii 
)ii 
;ii 
tryjj 
{kk 
varll 
commandll 
=ll 
newll !

(ll/ 0
queryll0 5
,ll5 6
transll7 <
.ll< =
MyConnll= C
)llC D
;llD E
commandmm 
.mm 
Transactionmm #
=mm$ %
transmm& +
.mm+ ,
MyTransmm, 3
;mm3 4
ifoo 
(oo 
TipoConexionoo  
==oo! #
EnumTipoConexionoo$ 4
.oo4 5

)ooB C
{pp 
ifqq 
(qq 
commandqq 
.qq  

Connectionqq  *
.qq* +
Stateqq+ 0
==qq1 3
ConnectionStateqq4 C
.qqC D
ClosedqqD J
)qqJ K
{rr 
commandss 
.ss  

Connectionss  *
.ss* +
Openss+ /
(ss/ 0
)ss0 1
;ss1 2
}tt 
varuu 
druu 
=uu 
(uu 
NpgsqlDataReaderuu .
)uu. /
commanduu/ 6
.uu6 7

(uuD E
CommandBehavioruuE T
.uuT U
DefaultuuU \
)uu\ ]
;uu] ^
dtvv 
.vv 
Loadvv 
(vv 
drvv 
)vv 
;vv  
drww 
.ww 
Closeww 
(ww 
)ww 
;ww 
}xx 
elseyy 
{zz 
var{{ 
da{{ 
={{ 
new{{  
NpgsqlDataAdapter{{! 2
({{2 3
){{3 4
;{{4 5
da|| 
=|| 
new|| 
NpgsqlDataAdapter|| .
(||. /
command||/ 6
)||6 7
;||7 8
da}} 
.}} 
Fill}} 
(}} 
dt}} 
)}} 
;}}  
}~~ 
command 
. 
Dispose 
(  
)  !
;! "
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 6
,
��6 7
query
��8 =
)
��= >
;
��> ?
throw
�� 
;
�� 
}
�� 
return
�� 
dt
�� 
;
�� 
}
�� 	
private
�� 
DbDataReader
�� 
CargarDataReader
�� -
(
��- .
string
��. 4
query
��5 :
)
��: ;
{
�� 	
DbDataReader
�� 
dr
�� 
=
�� 
null
�� "
;
��" #
try
�� 
{
�� 
var
�� 
command
�� 
=
�� 
new
�� !

��" /
(
��/ 0
query
��0 5
,
��5 6

ConexionBd
��7 A
)
��A B
;
��B C
command
�� 
.
�� 

Connection
�� "
.
��" #
Open
��# '
(
��' (
)
��( )
;
��) *
dr
�� 
=
�� 
(
�� 
DbDataReader
�� "
)
��" #
command
��# *
.
��* +

��+ 8
(
��8 9
CommandBehavior
��9 H
.
��H I
CloseConnection
��I X
)
��X Y
;
��Y Z
dr
�� 
.
�� 
Close
�� 
(
�� 
)
�� 
;
�� 
if
�� 
(
�� 
command
�� 
.
�� 

Connection
�� &
.
��& '
State
��' ,
!=
��- /
ConnectionState
��0 ?
.
��? @
Closed
��@ F
)
��F G
{
�� 
command
�� 
.
�� 

Connection
�� &
.
��& '
Close
��' ,
(
��, -
)
��- .
;
��. /
}
�� 
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 0
,
��0 1
query
��2 7
)
��7 8
;
��8 9
throw
�� 
;
�� 
}
�� 
return
�� 
dr
�� 
;
�� 
}
�� 	
private
�� 
DbDataReader
�� 
CargarDataReader
�� -
(
��- .
string
��. 4
query
��5 :
,
��: ;
ref
��< ?
CTrans
��@ F
trans
��G L
)
��L M
{
�� 	
DbDataReader
�� 
dr
�� 
=
�� 
null
�� "
;
��" #
try
�� 
{
�� 
var
�� 
command
�� 
=
�� 
new
�� !

��" /
(
��/ 0
query
��0 5
,
��5 6
trans
��7 <
.
��< =
MyConn
��= C
)
��C D
;
��D E
command
�� 
.
�� 
Transaction
�� #
=
��$ %
trans
��& +
.
��+ ,
MyTrans
��, 3
;
��3 4
if
�� 
(
�� 
command
�� 
.
�� 

Connection
�� &
.
��& '
State
��' ,
==
��- /
ConnectionState
��0 ?
.
��? @
Closed
��@ F
)
��F G
{
�� 
command
�� 
.
�� 

Connection
�� &
.
��& '
Open
��' +
(
��+ ,
)
��, -
;
��- .
}
�� 
dr
�� 
=
�� 
(
�� 
NpgsqlDataReader
�� &
)
��& '
command
��' .
.
��. /

��/ <
(
��< =
CommandBehavior
��= L
.
��L M
Default
��M T
)
��T U
;
��U V
dr
�� 
.
�� 
Close
�� 
(
�� 
)
�� 
;
�� 
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 7
,
��7 8
query
��9 >
)
��> ?
;
��? @
throw
�� 
;
�� 
}
�� 
return
�� 
dr
�� 
;
�� 
}
�� 	
private
�� 
int
�� 
Ejecutar
�� 
(
�� 
string
�� #
query
��$ )
)
��) *
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 

ConexionBd
�� 
.
�� 
State
�� $
==
��% '
ConnectionState
��( 7
.
��7 8
Closed
��8 >
)
��> ?
{
�� 

ConexionBd
�� 
.
�� 
Open
�� #
(
��# $
)
��$ %
;
��% &
}
�� 
var
�� 
command
�� 
=
�� 
new
�� !

��" /
(
��/ 0
query
��0 5
,
��5 6

ConexionBd
��7 A
)
��A B
;
��B C
var
�� 
numReg
�� 
=
�� 
command
�� $
.
��$ %
ExecuteNonQuery
��% 4
(
��4 5
)
��5 6
;
��6 7

ConexionBd
�� 
.
�� 
Close
��  
(
��  !
)
��! "
;
��" #
command
�� 
.
�� 

Connection
�� "
.
��" #
Close
��# (
(
��( )
)
��) *
;
��* +
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "
return
�� 
numReg
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� /
,
��/ 0
query
��1 6
)
��6 7
;
��7 8
throw
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
int
�� 
Ejecutar
�� 
(
�� 
string
�� #
query
��$ )
,
��) *
ref
��+ .
CTrans
��/ 5
trans
��6 ;
)
��; <
{
�� 	
try
�� 
{
�� 
var
�� 
command
�� 
=
�� 
new
�� !

��" /
(
��/ 0
query
��0 5
,
��5 6
trans
��7 <
.
��< =
MyConn
��= C
)
��C D
;
��D E
command
�� 
.
�� 
Transaction
�� #
=
��$ %
trans
��& +
.
��+ ,
MyTrans
��, 3
;
��3 4
var
�� 
numReg
�� 
=
�� 
command
�� $
.
��$ %
ExecuteNonQuery
��% 4
(
��4 5
)
��5 6
;
��6 7
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "

ConexionBd
�� 
.
�� 
Close
��  
(
��  !
)
��! "
;
��" #
return
�� 
numReg
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� /
,
��/ 0
query
��1 6
)
��6 7
;
��7 8
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
bool
��  
ExecStoreProcedure
�� &
(
��& '
string
��' -
nombreSp
��. 6
)
��6 7
{
�� 	
var
�� 
command
�� 
=
�� 
new
�� 

�� +
(
��+ ,
)
��, -
;
��- .
command
�� 
.
�� 
CommandText
�� 
=
��  !
nombreSp
��" *
;
��* +
command
�� 
.
�� 
CommandType
�� 
=
��  !
CommandType
��" -
.
��- .
StoredProcedure
��. =
;
��= >
try
�� 
{
�� 
command
�� 
.
�� 

Connection
�� "
=
��# $

ConexionBd
��% /
;
��/ 0
command
�� 
.
�� 
ExecuteNonQuery
�� '
(
��' (
)
��( )
;
��) *
command
�� 
.
�� 

Connection
�� "
.
��" #
Close
��# (
(
��( )
)
��) *
;
��* +
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "
return
�� 
true
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� -
,
��- .
nombreSp
��/ 7
)
��7 8
;
��8 9
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
bool
��  
ExecStoreProcedure
�� &
(
��& '
string
��' -
nombreSp
��. 6
,
��6 7
ref
��8 ;
CTrans
��< B
myTrans
��C J
)
��J K
{
�� 	
var
�� 
command
�� 
=
�� 
new
�� 

�� +
(
��+ ,
)
��, -
;
��- .
command
�� 
.
�� 
CommandText
�� 
=
��  !
nombreSp
��" *
;
��* +
command
�� 
.
�� 
CommandType
�� 
=
��  !
CommandType
��" -
.
��- .
StoredProcedure
��. =
;
��= >
try
�� 
{
�� 
command
�� 
.
�� 

Connection
�� "
=
��# $
myTrans
��% ,
.
��, -
MyConn
��- 3
;
��3 4
command
�� 
.
�� 
ExecuteNonQuery
�� '
(
��' (
)
��( )
;
��) *
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "
return
�� 
true
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� -
,
��- .
nombreSp
��/ 7
)
��7 8
;
��8 9
throw
�� 
;
�� 
}
�� 
}
�� 	
internal
�� 
	DataTable
�� 
CargarDataTable
�� *
(
��* +
string
��+ 1
tabla
��2 7
,
��7 8
	ArrayList
��9 B
arrColumnas
��C N
)
��N O
{
�� 	
var
�� 
arrColWhere
�� 
=
�� 
new
�� !
	ArrayList
��" +
(
��+ ,
)
��, -
;
��- .
arrColWhere
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 
)
��  
;
��  !
return
��  
CargarDataTableAnd
�� %
(
��% &
tabla
��& +
,
��+ ,
arrColumnas
��- 8
,
��8 9
arrColWhere
��: E
,
��E F
arrColWhere
��G R
,
��R S
$str
��T V
)
��V W
;
��W X
}
�� 	
internal
�� 
	DataTable
�� 
CargarDataTable
�� *
(
��* +
string
��+ 1
tabla
��2 7
,
��7 8
	ArrayList
��9 B
arrColumnas
��C N
,
��N O
ref
��P S
CTrans
��T Z
trans
��[ `
)
��` a
{
�� 	
var
�� 
arrColWhere
�� 
=
�� 
new
�� !
	ArrayList
��" +
{
��, -
$str
��- 0
}
��0 1
;
��1 2
return
��  
CargarDataTableAnd
�� %
(
��% &
tabla
��& +
,
��+ ,
arrColumnas
��- 8
,
��8 9
arrColWhere
��: E
,
��E F
arrColWhere
��G R
,
��R S
$str
��T V
,
��V W
ref
��X [
trans
��\ a
)
��a b
;
��b c
}
�� 	
internal
�� 
	DataTable
��  
CargarDataTableAnd
�� -
(
��- .
string
��. 4
tabla
��5 :
,
��: ;
	ArrayList
��< E
arrColumnas
��F Q
,
��Q R
	ArrayList
��S \
arrColumnasWhere
��] m
,
��m n
	ArrayList
��, 5
arrValoresWhere
��6 E
)
��E F
{
�� 	
return
��  
CargarDataTableAnd
�� %
(
��% &
tabla
��& +
,
��+ ,
arrColumnas
��- 8
,
��8 9
arrColumnasWhere
��: J
,
��J K
arrValoresWhere
��L [
,
��[ \
$str
��] _
)
��_ `
;
��` a
}
�� 	
internal
�� 
	DataTable
��  
CargarDataTableAnd
�� -
(
��- .
string
��. 4
tabla
��5 :
,
��: ;
	ArrayList
��< E
arrColumnas
��F Q
)
��Q R
{
�� 	
var
�� 
arrColWhere
�� 
=
�� 
new
�� !
	ArrayList
��" +
{
��, -
$str
��- 0
}
��0 1
;
��1 2
return
��  
CargarDataTableAnd
�� %
(
��% &
tabla
��& +
,
��+ ,
arrColumnas
��- 8
,
��8 9
arrColWhere
��: E
,
��E F
arrColWhere
��G R
,
��R S
$str
��T V
)
��V W
;
��W X
}
�� 	
internal
�� 
	DataTable
��  
CargarDataTableAnd
�� -
(
��- .
string
��. 4
tabla
��5 :
,
��: ;
	ArrayList
��< E
arrColumnas
��F Q
,
��Q R
	ArrayList
��S \
arrColumnasWhere
��] m
,
��m n
	ArrayList
��, 5
arrValoresWhere
��6 E
,
��E F
ref
��G J
CTrans
��K Q
trans
��R W
)
��W X
{
�� 	
return
��  
CargarDataTableAnd
�� %
(
��% &
tabla
��& +
,
��+ ,
arrColumnas
��- 8
,
��8 9
arrColumnasWhere
��: J
,
��J K
arrValoresWhere
��L [
,
��[ \
$str
��] _
,
��_ `
ref
��a d
trans
��e j
)
��j k
;
��k l
}
�� 	
internal
�� 
	DataTable
��  
CargarDataTableAnd
�� -
(
��- .
string
��. 4
tabla
��5 :
,
��: ;
	ArrayList
��< E
arrColumnas
��F Q
,
��Q R
	ArrayList
��S \
arrColumnasWhere
��] m
,
��m n
	ArrayList
��, 5
arrValoresWhere
��6 E
,
��E F
string
��G M$
sParametrosAdicionales
��N d
)
��d e
{
�� 	
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� &
)
��& '
;
��' (
var
�� 
	primerReg
�� 
=
�� 
true
��  
;
��  !
foreach
�� 
(
�� 
string
�� 
columna
�� #
in
��$ &
arrColumnas
��' 2
)
��2 3
{
�� 
if
�� 
(
�� 
	primerReg
�� 
)
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
columna
��% ,
)
��, -
;
��- .
	primerReg
�� 
=
�� 
false
��  %
;
��% &
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% )
+
��* +
columna
��, 3
)
��3 4
;
��4 5
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� %
+
��& '
tabla
��( -
+
��. /
$str
��0 9
)
��9 :
;
��: ;
var
�� 
boolBandera
�� 
=
�� 
false
�� #
;
��# $
for
�� 
(
�� 
var
�� 
intContador
��  
=
��! "
$num
��# $
;
��$ %
intContador
��& 1
<
��2 3
arrValoresWhere
��4 C
.
��C D
Count
��D I
;
��I J
intContador
��K V
++
��V X
)
��X Y
{
�� 
if
�� 
(
�� 
boolBandera
�� 
)
��  
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% ,
+
��- .
arrColumnasWhere
��/ ?
[
��? @
intContador
��@ K
]
��K L
+
��M N
$str
��O T
+
��U V
arrValoresWhere
��W f
[
��f g
intContador
��g r
]
��r s
)
��s t
;
��t u
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
arrColumnasWhere
��% 5
[
��5 6
intContador
��6 A
]
��A B
+
��C D
$str
��E J
+
��K L
arrValoresWhere
��M \
[
��\ ]
intContador
��] h
]
��h i
)
��i j
;
��j k
boolBandera
�� 
=
��  !
true
��" &
;
��& '
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� $
sParametrosAdicionales
�� 3
)
��3 4
;
��4 5
try
�� 
{
�� 
return
�� 
CargarDataTable
�� &
(
��& '
query
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
)
��7 8
;
��8 9
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 9
,
��9 :
query
��; @
)
��@ A
;
��A B
throw
�� 
;
�� 
}
�� 
}
�� 	
internal
�� 
	DataTable
��  
CargarDataTableAnd
�� -
(
��- .
string
��. 4
tabla
��5 :
,
��: ;
	ArrayList
��< E
arrColumnas
��F Q
,
��Q R
	ArrayList
��S \
arrColumnasWhere
��] m
,
��m n
	ArrayList
��, 5
arrValoresWhere
��6 E
,
��E F
string
��G M$
sParametrosAdicionales
��N d
,
��d e
ref
��f i
CTrans
��j p
trans
��q v
)
��v w
{
�� 	
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� &
)
��& '
;
��' (
var
�� 
	primerReg
�� 
=
�� 
true
��  
;
��  !
foreach
�� 
(
�� 
string
�� 
columna
�� #
in
��$ &
arrColumnas
��' 2
)
��2 3
{
�� 
if
�� 
(
�� 
	primerReg
�� 
)
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
columna
��% ,
)
��, -
;
��- .
	primerReg
�� 
=
�� 
false
��  %
;
��% &
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% )
+
��* +
columna
��, 3
)
��3 4
;
��4 5
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� %
+
��& '
tabla
��( -
+
��. /
$str
��0 9
)
��9 :
;
��: ;
var
�� 
boolBandera
�� 
=
�� 
false
�� #
;
��# $
for
�� 
(
�� 
var
�� 
intContador
��  
=
��! "
$num
��# $
;
��$ %
intContador
��& 1
<
��2 3
arrValoresWhere
��4 C
.
��C D
Count
��D I
;
��I J
intContador
��K V
++
��V X
)
��X Y
{
�� 
if
�� 
(
�� 
boolBandera
�� 
)
��  
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% ,
+
��- .
arrColumnasWhere
��/ ?
[
��? @
intContador
��@ K
]
��K L
+
��M N
$str
��O T
+
��U V
arrValoresWhere
��W f
[
��f g
intContador
��g r
]
��r s
)
��s t
;
��t u
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
arrColumnasWhere
��% 5
[
��5 6
intContador
��6 A
]
��A B
+
��C D
$str
��E J
+
��K L
arrValoresWhere
��M \
[
��\ ]
intContador
��] h
]
��h i
)
��i j
;
��j k
boolBandera
�� 
=
��  !
true
��" &
;
��& '
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� $
sParametrosAdicionales
�� 3
)
��3 4
;
��4 5
try
�� 
{
�� 
return
�� 
CargarDataTable
�� &
(
��& '
query
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
,
��7 8
ref
��9 <
trans
��= B
)
��B C
;
��C D
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 9
,
��9 :
query
��; @
)
��@ A
;
��A B
throw
�� 
;
�� 
}
�� 
}
�� 	
internal
�� 
	DataTable
�� !
CargarDataTableLike
�� .
(
��. /
string
��/ 5
tabla
��6 ;
,
��; <
	ArrayList
��= F
arrColumnas
��G R
,
��R S
	ArrayList
��T ]
arrColumnasWhere
��^ n
,
��n o
	ArrayList
��- 6
arrValoresWhere
��7 F
,
��F G
string
��H N!
strParamAdicionales
��O b
)
��b c
{
�� 
var
�� 	
query
��
 
=
�� 
new
�� 

�� #
(
��# $
)
��$ %
;
��% &
query
�� 
.
�� 
Append
�� 
(
�� 
$str
�� "
)
��" #
;
��# $
var
�� 
	primerReg
�� 
=
�� 
true
��  
;
��  !
foreach
�� 
(
�� 
string
�� 
columna
�� #
in
��$ &
arrColumnas
��' 2
)
��2 3
{
�� 
if
�� 
(
�� 
	primerReg
�� 
)
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
columna
��% ,
)
��, -
;
��- .
	primerReg
�� 
=
�� 
false
��  %
;
��% &
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% )
+
��* +
columna
��, 3
)
��3 4
;
��4 5
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� %
+
��& '
tabla
��( -
+
��. /
$str
��0 9
)
��9 :
;
��: ;
var
�� 
boolBandera
�� 
=
�� 
false
�� #
;
��# $
for
�� 
(
�� 
var
�� 
intContador
��  
=
��! "
$num
��# $
;
��$ %
intContador
��& 1
<
��2 3
arrValoresWhere
��4 C
.
��C D
Count
��D I
;
��I J
intContador
��K V
++
��V X
)
��X Y
{
�� 
if
�� 
(
�� 
boolBandera
�� 
)
��  
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% ,
+
��- .
arrColumnasWhere
��/ ?
[
��? @
intContador
��@ K
]
��K L
+
��M N
$str
��O W
+
��X Y
arrValoresWhere
��Z i
[
��i j
intContador
��j u
]
��u v
)
��v w
;
��w x
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
arrColumnasWhere
��% 5
[
��5 6
intContador
��6 A
]
��A B
+
��C D
$str
��E J
+
��K L
arrValoresWhere
��M \
[
��\ ]
intContador
��] h
]
��h i
)
��i j
;
��j k
boolBandera
�� 
=
��  !
true
��" &
;
��& '
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� !
strParamAdicionales
�� 0
)
��0 1
;
��1 2
try
�� 
{
�� 
return
�� 
CargarDataTable
�� &
(
��& '
query
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
)
��7 8
;
��8 9
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 9
,
��9 :
query
��; @
)
��@ A
;
��A B
throw
�� 
;
�� 
}
�� 
}
�� 	
internal
�� 
	DataTable
�� 
CargarDataTableOr
�� ,
(
��, -
string
��- 3
tabla
��4 9
,
��9 :
	ArrayList
��; D
arrColumnas
��E P
,
��P Q
	ArrayList
��R [
arrColumnasWhere
��\ l
,
��l m
	ArrayList
��+ 4
arrValoresWhere
��5 D
)
��D E
{
�� 	
return
�� 
CargarDataTableOr
�� $
(
��$ %
tabla
��% *
,
��* +
arrColumnas
��, 7
,
��7 8
arrColumnasWhere
��9 I
,
��I J
arrValoresWhere
��K Z
,
��Z [
$str
��\ ^
)
��^ _
;
��_ `
}
�� 	
internal
�� 
	DataTable
�� 
CargarDataTableOr
�� ,
(
��, -
string
��- 3
tabla
��4 9
,
��9 :
	ArrayList
��; D
arrColumnas
��E P
,
��P Q
	ArrayList
��R [
arrColumnasWhere
��\ l
,
��l m
	ArrayList
��+ 4
arrValoresWhere
��5 D
,
��D E
ref
��F I
CTrans
��J P
trans
��Q V
)
��V W
{
�� 	
return
�� 
CargarDataTableOr
�� $
(
��$ %
tabla
��% *
,
��* +
arrColumnas
��, 7
,
��7 8
arrColumnasWhere
��9 I
,
��I J
arrValoresWhere
��K Z
,
��Z [
$str
��\ ^
,
��^ _
ref
��` c
trans
��d i
)
��i j
;
��j k
}
�� 	
internal
�� 
	DataTable
�� 
CargarDataTableOr
�� ,
(
��, -
string
��- 3
tabla
��4 9
,
��9 :
	ArrayList
��; D
arrColumnas
��E P
,
��P Q
	ArrayList
��R [
arrColumnasWhere
��\ l
,
��l m
	ArrayList
��+ 4
arrValoresWhere
��5 D
,
��D E
string
��F L$
sParametrosAdicionales
��M c
)
��c d
{
�� 	
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� &
)
��& '
;
��' (
var
�� 
	primerReg
�� 
=
�� 
true
��  
;
��  !
foreach
�� 
(
�� 
string
�� 
columna
�� #
in
��$ &
arrColumnas
��' 2
)
��2 3
{
�� 
if
�� 
(
�� 
	primerReg
�� 
)
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
columna
��% ,
)
��, -
;
��- .
	primerReg
�� 
=
�� 
false
��  %
;
��% &
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% )
+
��* +
columna
��, 3
)
��3 4
;
��4 5
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� %
+
��& '
tabla
��( -
+
��. /
$str
��0 9
)
��9 :
;
��: ;
var
�� 
boolBandera
�� 
=
�� 
false
�� #
;
��# $
for
�� 
(
�� 
var
�� 
intContador
��  
=
��! "
$num
��# $
;
��$ %
intContador
��& 1
<
��2 3
arrValoresWhere
��4 C
.
��C D
Count
��D I
;
��I J
intContador
��K V
++
��V X
)
��X Y
{
�� 
if
�� 
(
�� 
boolBandera
�� 
)
��  
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% +
+
��, -
arrColumnasWhere
��. >
[
��> ?
intContador
��? J
]
��J K
+
��L M
$str
��N S
+
��T U
arrValoresWhere
��V e
[
��e f
intContador
��f q
]
��q r
)
��r s
;
��s t
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
arrColumnasWhere
��% 5
[
��5 6
intContador
��6 A
]
��A B
+
��C D
$str
��E J
+
��K L
arrValoresWhere
��M \
[
��\ ]
intContador
��] h
]
��h i
)
��i j
;
��j k
boolBandera
�� 
=
��  !
true
��" &
;
��& '
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� $
sParametrosAdicionales
�� 3
)
��3 4
;
��4 5
try
�� 
{
�� 
return
�� 
CargarDataTable
�� &
(
��& '
query
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
)
��7 8
;
��8 9
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 8
,
��8 9
query
��: ?
)
��? @
;
��@ A
throw
�� 
;
�� 
}
�� 
}
�� 	
internal
�� 
	DataTable
�� 
CargarDataTableOr
�� ,
(
��, -
string
��- 3
tabla
��4 9
,
��9 :
	ArrayList
��; D
arrColumnas
��E P
,
��P Q
	ArrayList
��R [
arrColumnasWhere
��\ l
,
��l m
	ArrayList
��+ 4
arrValoresWhere
��5 D
,
��D E
string
��F L$
sParametrosAdicionales
��M c
,
��c d
ref
��e h
CTrans
��i o
trans
��p u
)
��u v
{
�� 	
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� &
)
��& '
;
��' (
var
�� 
	primerReg
�� 
=
�� 
true
��  
;
��  !
foreach
�� 
(
�� 
string
�� 
columna
�� #
in
��$ &
arrColumnas
��' 2
)
��2 3
{
�� 
if
�� 
(
�� 
	primerReg
�� 
)
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
columna
��% ,
)
��, -
;
��- .
	primerReg
�� 
=
�� 
false
��  %
;
��% &
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% )
+
��* +
columna
��, 3
)
��3 4
;
��4 5
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� %
+
��& '
tabla
��( -
+
��. /
$str
��0 9
)
��9 :
;
��: ;
var
�� 
boolBandera
�� 
=
�� 
false
�� #
;
��# $
for
�� 
(
�� 
var
�� 
intContador
��  
=
��! "
$num
��# $
;
��$ %
intContador
��& 1
<
��2 3
arrValoresWhere
��4 C
.
��C D
Count
��D I
;
��I J
intContador
��K V
++
��V X
)
��X Y
{
�� 
if
�� 
(
�� 
boolBandera
�� 
)
��  
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% +
+
��, -
arrColumnasWhere
��. >
[
��> ?
intContador
��? J
]
��J K
+
��L M
$str
��N S
+
��T U
arrValoresWhere
��V e
[
��e f
intContador
��f q
]
��q r
)
��r s
;
��s t
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
arrColumnasWhere
��% 5
[
��5 6
intContador
��6 A
]
��A B
+
��C D
$str
��E J
+
��K L
arrValoresWhere
��M \
[
��\ ]
intContador
��] h
]
��h i
)
��i j
;
��j k
boolBandera
�� 
=
��  !
true
��" &
;
��& '
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� $
sParametrosAdicionales
�� 3
)
��3 4
;
��4 5
try
�� 
{
�� 
return
�� 
CargarDataTable
�� &
(
��& '
query
��' ,
.
��, -
ToString
��- 5
(
��5 6
)
��6 7
,
��7 8
ref
��9 <
trans
��= B
)
��B C
;
��C D
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 8
,
��8 9
query
��: ?
)
��? @
;
��@ A
throw
�� 
;
�� 
}
�� 
}
�� 	
internal
�� 
DbDataReader
�� 
CargarDataReader
�� .
(
��. /
string
��/ 5
tabla
��6 ;
,
��; <
	ArrayList
��= F
arrColumnas
��G R
)
��R S
{
�� 	
var
�� 
arrColWhere
�� 
=
�� 
new
�� !
	ArrayList
��" +
(
��+ ,
)
��, -
;
��- .
arrColWhere
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 
)
��  
;
��  !
return
�� !
CargarDataReaderAnd
�� &
(
��& '
tabla
��' ,
,
��, -
arrColumnas
��. 9
,
��9 :
arrColWhere
��; F
,
��F G
arrColWhere
��H S
,
��S T
$str
��U W
)
��W X
;
��X Y
}
�� 	
internal
�� 
DbDataReader
�� 
CargarDataReader
�� .
(
��. /
string
��/ 5
tabla
��6 ;
,
��; <
	ArrayList
��= F
arrColumnas
��G R
,
��R S
ref
��T W
CTrans
��X ^
trans
��_ d
)
��d e
{
�� 	
var
�� 
arrColWhere
�� 
=
�� 
new
�� !
	ArrayList
��" +
{
��, -
$str
��- 0
}
��0 1
;
��1 2
return
�� !
CargarDataReaderAnd
�� &
(
��& '
tabla
��' ,
,
��, -
arrColumnas
��. 9
,
��9 :
arrColWhere
��; F
,
��F G
arrColWhere
��H S
,
��S T
$str
��U W
,
��W X
ref
��Y \
trans
��] b
)
��b c
;
��c d
}
�� 	
internal
�� 
DbDataReader
�� !
CargarDataReaderAnd
�� 1
(
��1 2
string
��2 8
tabla
��9 >
,
��> ?
	ArrayList
��@ I
arrColumnas
��J U
,
��U V
	ArrayList
��W `
arrColumnasWhere
��a q
,
��q r
	ArrayList
��, 5
arrValoresWhere
��6 E
)
��E F
{
�� 	
return
�� !
CargarDataReaderAnd
�� &
(
��& '
tabla
��' ,
,
��, -
arrColumnas
��. 9
,
��9 :
arrColumnasWhere
��; K
,
��K L
arrValoresWhere
��M \
,
��\ ]
$str
��^ `
)
��` a
;
��a b
}
�� 	
internal
�� 
DbDataReader
�� !
CargarDataReaderAnd
�� 1
(
��1 2
string
��2 8
tabla
��9 >
,
��> ?
	ArrayList
��@ I
arrColumnas
��J U
)
��U V
{
�� 	
var
�� 
arrColWhere
�� 
=
�� 
new
�� !
	ArrayList
��" +
{
��, -
$str
��- 0
}
��0 1
;
��1 2
return
�� !
CargarDataReaderAnd
�� &
(
��& '
tabla
��' ,
,
��, -
arrColumnas
��. 9
,
��9 :
arrColWhere
��; F
,
��F G
arrColWhere
��H S
,
��S T
$str
��U W
)
��W X
;
��X Y
}
�� 	
internal
�� 
DbDataReader
�� !
CargarDataReaderAnd
�� 1
(
��1 2
string
��2 8
tabla
��9 >
,
��> ?
	ArrayList
��@ I
arrColumnas
��J U
,
��U V
	ArrayList
��W `
arrColumnasWhere
��a q
,
��q r
	ArrayList
��, 5
arrValoresWhere
��6 E
,
��E F
ref
��G J
CTrans
��K Q
trans
��R W
)
��W X
{
�� 	
return
�� !
CargarDataReaderAnd
�� &
(
��& '
tabla
��' ,
,
��, -
arrColumnas
��. 9
,
��9 :
arrColumnasWhere
��; K
,
��K L
arrValoresWhere
��M \
,
��\ ]
$str
��^ `
,
��` a
ref
��b e
trans
��f k
)
��k l
;
��l m
}
�� 	
internal
�� 
DbDataReader
�� !
CargarDataReaderAnd
�� 1
(
��1 2
string
��2 8
tabla
��9 >
,
��> ?
	ArrayList
��@ I
arrColumnas
��J U
,
��U V
	ArrayList
��W `
arrColumnasWhere
��a q
,
��q r
	ArrayList
��, 5
arrValoresWhere
��6 E
,
��E F
string
��G M$
sParametrosAdicionales
��N d
)
��d e
{
�� 	
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� &
)
��& '
;
��' (
var
�� 
	primerReg
�� 
=
�� 
true
��  
;
��  !
foreach
�� 
(
�� 
string
�� 
columna
�� #
in
��$ &
arrColumnas
��' 2
)
��2 3
{
�� 
if
�� 
(
�� 
	primerReg
�� 
)
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
columna
��% ,
)
��, -
;
��- .
	primerReg
�� 
=
�� 
false
��  %
;
��% &
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% )
+
��* +
columna
��, 3
)
��3 4
;
��4 5
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� %
+
��& '
tabla
��( -
+
��. /
$str
��0 9
)
��9 :
;
��: ;
var
�� 
boolBandera
�� 
=
�� 
false
�� #
;
��# $
for
�� 
(
�� 
var
�� 
intContador
��  
=
��! "
$num
��# $
;
��$ %
intContador
��& 1
<
��2 3
arrValoresWhere
��4 C
.
��C D
Count
��D I
;
��I J
intContador
��K V
++
��V X
)
��X Y
{
�� 
if
�� 
(
�� 
boolBandera
�� 
)
��  
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% ,
+
��- .
arrColumnasWhere
��/ ?
[
��? @
intContador
��@ K
]
��K L
+
��M N
$str
��O T
+
��U V
arrValoresWhere
��W f
[
��f g
intContador
��g r
]
��r s
)
��s t
;
��t u
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
arrColumnasWhere
��% 5
[
��5 6
intContador
��6 A
]
��A B
+
��C D
$str
��E J
+
��K L
arrValoresWhere
��M \
[
��\ ]
intContador
��] h
]
��h i
)
��i j
;
��j k
boolBandera
�� 
=
��  !
true
��" &
;
��& '
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� $
sParametrosAdicionales
�� 3
)
��3 4
;
��4 5
try
�� 
{
�� 
return
�	�	 
CargarDataReader
�	�	 '
(
�	�	' (
query
�	�	( -
.
�	�	- .
ToString
�	�	. 6
(
�	�	6 7
)
�	�	7 8
)
�	�	8 9
;
�	�	9 :
}
�	�	 
catch
�	�	 
(
�	�	 
	Exception
�	�	 
ex
�	�	 
)
�	�	  
{
�	�	 
ex
�	�	 
.
�	�	 
Data
�	�	 
.
�	�	 
Add
�	�	 
(
�	�	 
$str
�	�	 9
,
�	�	9 :
query
�	�	; @
)
�	�	@ A
;
�	�	A B
throw
�	�	 
;
�	�	 
}
�	�	 
}
�	�	 	
internal
�	�	 
DbDataReader
�	�	 !
CargarDataReaderAnd
�	�	 1
(
�	�	1 2
string
�	�	2 8
tabla
�	�	9 >
,
�	�	> ?
	ArrayList
�	�	@ I
arrColumnas
�	�	J U
,
�	�	U V
	ArrayList
�	�	W `
arrColumnasWhere
�	�	a q
,
�	�	q r
	ArrayList
�	�	, 5
arrValoresWhere
�	�	6 E
,
�	�	E F
string
�	�	G M$
sParametrosAdicionales
�	�	N d
,
�	�	d e
ref
�	�	f i
CTrans
�	�	j p
trans
�	�	q v
)
�	�	v w
{
�	�	 	
var
�	�	 
query
�	�	 
=
�	�	 
new
�	�	 

�	�	 )
(
�	�	) *
)
�	�	* +
;
�	�	+ ,
query
�	�	 
.
�	�	 

AppendLine
�	�	 
(
�	�	 
$str
�	�	 &
)
�	�	& '
;
�	�	' (
var
�	�	 
	primerReg
�	�	 
=
�	�	 
true
�	�	  
;
�	�	  !
foreach
�	�	 
(
�	�	 
string
�	�	 
columna
�	�	 #
in
�	�	$ &
arrColumnas
�	�	' 2
)
�	�	2 3
{
�	�	 
if
�	�	 
(
�	�	 
	primerReg
�	�	 
)
�	�	 
{
�	�	 
query
�	�	 
.
�	�	 

AppendLine
�	�	 $
(
�	�	$ %
columna
�	�	% ,
)
�	�	, -
;
�	�	- .
	primerReg
�	�	 
=
�	�	 
false
�	�	  %
;
�	�	% &
}
�	�	 
else
�	�	 
{
�	�	 
query
�	�	 
.
�	�	 

AppendLine
�	�	 $
(
�	�	$ %
$str
�	�	% )
+
�	�	* +
columna
�	�	, 3
)
�	�	3 4
;
�	�	4 5
}
�	�	 
}
�	�	 
query
�	�	 
.
�	�	 

AppendLine
�	�	 
(
�	�	 
$str
�	�	 %
+
�	�	& '
tabla
�	�	( -
+
�	�	. /
$str
�	�	0 9
)
�	�	9 :
;
�	�	: ;
var
�	�	 
boolBandera
�	�	 
=
�	�	 
false
�	�	 #
;
�	�	# $
for
�	�	 
(
�	�	 
var
�	�	 
intContador
�	�	  
=
�	�	! "
$num
�	�	# $
;
�	�	$ %
intContador
�	�	& 1
<
�	�	2 3
arrValoresWhere
�	�	4 C
.
�	�	C D
Count
�	�	D I
;
�	�	I J
intContador
�	�	K V
++
�	�	V X
)
�	�	X Y
{
�	�	 
if
�	�	 
(
�	�	 
boolBandera
�	�	 
)
�	�	  
{
�	�	 
query
�	�	 
.
�	�	 

AppendLine
�	�	 $
(
�	�	$ %
$str
�	�	% ,
+
�	�	- .
arrColumnasWhere
�	�	/ ?
[
�	�	? @
intContador
�	�	@ K
]
�	�	K L
+
�	�	M N
$str
�	�	O T
+
�	�	U V
arrValoresWhere
�	�	W f
[
�	�	f g
intContador
�	�	g r
]
�	�	r s
)
�	�	s t
;
�	�	t u
}
�	�	 
else
�	�	 
{
�	�	 
query
�	�	 
.
�	�	 

AppendLine
�	�	 $
(
�	�	$ %
arrColumnasWhere
�	�	% 5
[
�	�	5 6
intContador
�	�	6 A
]
�	�	A B
+
�	�	C D
$str
�	�	E J
+
�	�	K L
arrValoresWhere
�	�	M \
[
�	�	\ ]
intContador
�	�	] h
]
�	�	h i
)
�	�	i j
;
�	�	j k
boolBandera
�	�	 
=
�	�	  !
true
�	�	" &
;
�	�	& '
}
�	�	 
}
�	�	 
query
�	�	 
.
�	�	 

AppendLine
�	�	 
(
�	�	 $
sParametrosAdicionales
�	�	 3
)
�	�	3 4
;
�	�	4 5
try
�	�	 
{
�	�	 
return
�	�	 
CargarDataReader
�	�	 '
(
�	�	' (
query
�	�	( -
.
�	�	- .
ToString
�	�	. 6
(
�	�	6 7
)
�	�	7 8
,
�	�	8 9
ref
�	�	: =
trans
�	�	> C
)
�	�	C D
;
�	�	D E
}
�	�	 
catch
�	�	 
(
�	�	 
	Exception
�	�	 
ex
�	�	 
)
�	�	  
{
�	�	 
ex
�	�	 
.
�	�	 
Data
�	�	 
.
�	�	 
Add
�	�	 
(
�	�	 
$str
�	�	 9
,
�	�	9 :
query
�	�	; @
)
�	�	@ A
;
�	�	A B
throw
�	�	 
;
�	�	 
}
�	�	 
}
�	�	 	
internal
�	�	 
DbDataReader
�	�	 "
CargarDataReaderLike
�	�	 2
(
�	�	2 3
string
�	�	3 9
tabla
�	�	: ?
,
�	�	? @
	ArrayList
�	�	A J
arrColumnas
�	�	K V
,
�	�	V W
	ArrayList
�	�	X a
arrColumnasWhere
�	�	b r
,
�	�	r s
	ArrayList
�	�	- 6
arrValoresWhere
�	�	7 F
,
�	�	F G
string
�	�	H N!
strParamAdicionales
�	�	O b
)
�	�	b c
{
�	�	 
var
�	�	 	
query
�	�	
 
=
�	�	 
new
�	�	 

�	�	 #
(
�	�	# $
)
�	�	$ %
;
�	�	% &
query
�	�	 
.
�	�	 
Append
�	�	 
(
�	�	 
$str
�	�	 "
)
�	�	" #
;
�	�	# $
var
�	�	 
	primerReg
�	�	 
=
�	�	 
true
�	�	  
;
�	�	  !
foreach
�
�
 
(
�
�
 
string
�
�
 
columna
�
�
 #
in
�
�
$ &
arrColumnas
�
�
' 2
)
�
�
2 3
{
�
�
 
if
�
�
 
(
�
�
 
	primerReg
�
�
 
)
�
�
 
{
�
�
 
query
�
�
 
.
�
�
 

AppendLine
�
�
 $
(
�
�
$ %
columna
�
�
% ,
)
�
�
, -
;
�
�
- .
	primerReg
�
�
 
=
�
�
 
false
�
�
  %
;
�
�
% &
}
�
�
 
else
�
�
 
{
�
�
 
query
�
�
 
.
�
�
 

AppendLine
�
�
 $
(
�
�
$ %
$str
�
�
% )
+
�
�
* +
columna
�
�
, 3
)
�
�
3 4
;
�
�
4 5
}
�
�
 
}
�
�
 
query
�
�
 
.
�
�
 

AppendLine
�
�
 
(
�
�
 
$str
�
�
 %
+
�
�
& '
tabla
�
�
( -
+
�
�
. /
$str
�
�
0 9
)
�
�
9 :
;
�
�
: ;
var
�
�
 
boolBandera
�
�
 
=
�
�
 
false
�
�
 #
;
�
�
# $
for
�
�
 
(
�
�
 
var
�
�
 
intContador
�
�
  
=
�
�
! "
$num
�
�
# $
;
�
�
$ %
intContador
�
�
& 1
<
�
�
2 3
arrValoresWhere
�
�
4 C
.
�
�
C D
Count
�
�
D I
;
�
�
I J
intContador
�
�
K V
++
�
�
V X
)
�
�
X Y
{
�
�
 
if
�
�
 
(
�
�
 
boolBandera
�
�
 
)
�
�
  
{
�
�
 
query
�
�
 
.
�
�
 

AppendLine
�
�
 $
(
�
�
$ %
$str
�
�
% ,
+
�
�
- .
arrColumnasWhere
�
�
/ ?
[
�
�
? @
intContador
�
�
@ K
]
�
�
K L
+
�
�
M N
$str
�
�
O W
+
�
�
X Y
arrValoresWhere
�
�
Z i
[
�
�
i j
intContador
�
�
j u
]
�
�
u v
)
�
�
v w
;
�
�
w x
}
�
�
 
else
�
�
 
{
�
�
 
query
�
�
 
.
�
�
 

AppendLine
�
�
 $
(
�
�
$ %
arrColumnasWhere
�
�
% 5
[
�
�
5 6
intContador
�
�
6 A
]
�
�
A B
+
�
�
C D
$str
�
�
E J
+
�
�
K L
arrValoresWhere
�
�
M \
[
�
�
\ ]
intContador
�
�
] h
]
�
�
h i
)
�
�
i j
;
�
�
j k
boolBandera
�
�
 
=
�
�
  !
true
�
�
" &
;
�
�
& '
}
�
�
 
}
�
�
 
query
�
�
 
.
�
�
 

AppendLine
�
�
 
(
�
�
 !
strParamAdicionales
�
�
 0
)
�
�
0 1
;
�
�
1 2
try
�
�
 
{
�
�
 
return
�
�
 
CargarDataReader
�
�
 '
(
�
�
' (
query
�
�
( -
.
�
�
- .
ToString
�
�
. 6
(
�
�
6 7
)
�
�
7 8
)
�
�
8 9
;
�
�
9 :
}
�
�
 
catch
�
�
 
(
�
�
 
	Exception
�
�
 
ex
�
�
 
)
�
�
  
{
�
�
 
ex
�
�
 
.
�
�
 
Data
�
�
 
.
�
�
 
Add
�
�
 
(
�
�
 
$str
�
�
 9
,
�
�
9 :
query
�
�
; @
)
�
�
@ A
;
�
�
A B
throw
�
�
 
;
�
�
 
}
�
�
 
}
�
�
 	
internal
�
�
 
DbDataReader
�
�
  
CargarDataReaderOr
�
�
 0
(
�
�
0 1
string
�
�
1 7
tabla
�
�
8 =
,
�
�
= >
	ArrayList
�
�
? H
arrColumnas
�
�
I T
,
�
�
T U
	ArrayList
�
�
V _
arrColumnasWhere
�
�
` p
,
�
�
p q
	ArrayList
�
�
+ 4
arrValoresWhere
�
�
5 D
)
�
�
D E
{
�
�
 	
return
�
�
  
CargarDataReaderOr
�
�
 %
(
�
�
% &
tabla
�
�
& +
,
�
�
+ ,
arrColumnas
�
�
- 8
,
�
�
8 9
arrColumnasWhere
�
�
: J
,
�
�
J K
arrValoresWhere
�
�
L [
,
�
�
[ \
$str
�
�
] _
)
�
�
_ `
;
�
�
` a
}
�
�
 	
internal
�
�
 
DbDataReader
�
�
  
CargarDataReaderOr
�
�
 0
(
�
�
0 1
string
�
�
1 7
tabla
�
�
8 =
,
�
�
= >
	ArrayList
�
�
? H
arrColumnas
�
�
I T
,
�
�
T U
	ArrayList
�
�
V _
arrColumnasWhere
�
�
` p
,
�
�
p q
	ArrayList
�
�
+ 4
arrValoresWhere
�
�
5 D
,
�
�
D E
ref
�
�
F I
CTrans
�
�
J P
trans
�
�
Q V
)
�
�
V W
{
�
�
 	
return
�
�
  
CargarDataReaderOr
�
�
 %
(
�
�
% &
tabla
�
�
& +
,
�
�
+ ,
arrColumnas
�
�
- 8
,
�
�
8 9
arrColumnasWhere
�
�
: J
,
�
�
J K
arrValoresWhere
�
�
L [
,
�
�
[ \
$str
�
�
] _
,
�
�
_ `
ref
�
�
a d
trans
�
�
e j
)
�
�
j k
;
�
�
k l
}
�
�
 	
internal
�� 
DbDataReader
��  
CargarDataReaderOr
�� 0
(
��0 1
string
��1 7
tabla
��8 =
,
��= >
	ArrayList
��? H
arrColumnas
��I T
,
��T U
	ArrayList
��V _
arrColumnasWhere
��` p
,
��p q
	ArrayList
��+ 4
arrValoresWhere
��5 D
,
��D E
string
��F L$
sParametrosAdicionales
��M c
)
��c d
{
�� 	
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� &
)
��& '
;
��' (
var
�� 
	primerReg
�� 
=
�� 
true
��  
;
��  !
foreach
�� 
(
�� 
string
�� 
columna
�� #
in
��$ &
arrColumnas
��' 2
)
��2 3
{
�� 
if
�� 
(
�� 
	primerReg
�� 
)
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
columna
��% ,
)
��, -
;
��- .
	primerReg
�� 
=
�� 
false
��  %
;
��% &
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% )
+
��* +
columna
��, 3
)
��3 4
;
��4 5
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� %
+
��& '
tabla
��( -
+
��. /
$str
��0 9
)
��9 :
;
��: ;
var
�� 
boolBandera
�� 
=
�� 
false
�� #
;
��# $
for
�� 
(
�� 
var
�� 
intContador
��  
=
��! "
$num
��# $
;
��$ %
intContador
��& 1
<
��2 3
arrValoresWhere
��4 C
.
��C D
Count
��D I
;
��I J
intContador
��K V
++
��V X
)
��X Y
{
�� 
if
�� 
(
�� 
boolBandera
�� 
)
��  
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% +
+
��, -
arrColumnasWhere
��. >
[
��> ?
intContador
��? J
]
��J K
+
��L M
$str
��N S
+
��T U
arrValoresWhere
��V e
[
��e f
intContador
��f q
]
��q r
)
��r s
;
��s t
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
arrColumnasWhere
��% 5
[
��5 6
intContador
��6 A
]
��A B
+
��C D
$str
��E J
+
��K L
arrValoresWhere
��M \
[
��\ ]
intContador
��] h
]
��h i
)
��i j
;
��j k
boolBandera
�� 
=
��  !
true
��" &
;
��& '
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� $
sParametrosAdicionales
�� 3
)
��3 4
;
��4 5
try
�� 
{
�� 
return
�� 
CargarDataReader
�� '
(
��' (
query
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
)
��8 9
;
��9 :
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 8
,
��8 9
query
��: ?
)
��? @
;
��@ A
throw
�� 
;
�� 
}
�� 
}
�� 	
internal
�� 
DbDataReader
��  
CargarDataReaderOr
�� 0
(
��0 1
string
��1 7
tabla
��8 =
,
��= >
	ArrayList
��? H
arrColumnas
��I T
,
��T U
	ArrayList
��V _
arrColumnasWhere
��` p
,
��p q
	ArrayList
��+ 4
arrValoresWhere
��5 D
,
��D E
string
��F L$
sParametrosAdicionales
��M c
,
��c d
ref
��e h
CTrans
��i o
trans
��p u
)
��u v
{
�� 	
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� &
)
��& '
;
��' (
var
�� 
	primerReg
�� 
=
�� 
true
��  
;
��  !
foreach
�� 
(
�� 
string
�� 
columna
�� #
in
��$ &
arrColumnas
��' 2
)
��2 3
{
�� 
if
�� 
(
�� 
	primerReg
�� 
)
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
columna
��% ,
)
��, -
;
��- .
	primerReg
�� 
=
�� 
false
��  %
;
��% &
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% )
+
��* +
columna
��, 3
)
��3 4
;
��4 5
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� %
+
��& '
tabla
��( -
+
��. /
$str
��0 9
)
��9 :
;
��: ;
var
�� 
boolBandera
�� 
=
�� 
false
�� #
;
��# $
for
�� 
(
�� 
var
�� 
intContador
��  
=
��! "
$num
��# $
;
��$ %
intContador
��& 1
<
��2 3
arrValoresWhere
��4 C
.
��C D
Count
��D I
;
��I J
intContador
��K V
++
��V X
)
��X Y
{
�� 
if
�� 
(
�� 
boolBandera
�� 
)
��  
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
$str
��% +
+
��, -
arrColumnasWhere
��. >
[
��> ?
intContador
��? J
]
��J K
+
��L M
$str
��N S
+
��T U
arrValoresWhere
��V e
[
��e f
intContador
��f q
]
��q r
)
��r s
;
��s t
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� $
(
��$ %
arrColumnasWhere
��% 5
[
��5 6
intContador
��6 A
]
��A B
+
��C D
$str
��E J
+
��K L
arrValoresWhere
��M \
[
��\ ]
intContador
��] h
]
��h i
)
��i j
;
��j k
boolBandera
�� 
=
��  !
true
��" &
;
��& '
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
�� 
(
�� $
sParametrosAdicionales
�� 3
)
��3 4
;
��4 5
try
�� 
{
�� 
return
�� 
CargarDataReader
�� '
(
��' (
query
��( -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
,
��8 9
ref
��: =
trans
��> C
)
��C D
;
��D E
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 8
,
��8 9
query
��: ?
)
��? @
;
��@ A
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
int
�� 
DeleteBd
�� 
(
�� 
string
�� "
nomTabla
��# +
,
��+ ,
	ArrayList
��- 6
arrColumnasWhere
��7 G
,
��G H
	ArrayList
��I R
arrValoresWhere
��S b
)
��b c
{
�� 	
return
�� 
DeleteBd
�� 
(
�� 
nomTabla
�� $
,
��$ %
arrColumnasWhere
��& 6
,
��6 7
arrValoresWhere
��8 G
,
��G H
$str
��I K
)
��K L
;
��L M
}
�� 	
public
�� 
int
�� 
DeleteBd
�� 
(
�� 
string
�� "
nomTabla
��# +
,
��+ ,
	ArrayList
��- 6
arrColumnasWhere
��7 G
,
��G H
	ArrayList
��I R
arrValoresWhere
��S b
,
��b c
ref
��d g
CTrans
��h n
trans
��o t
)
��t u
{
�� 	
return
�� 
DeleteBd
�� 
(
�� 
nomTabla
�� $
,
��$ %
arrColumnasWhere
��& 6
,
��6 7
arrValoresWhere
��8 G
,
��G H
$str
��I K
,
��K L
ref
��M P
trans
��Q V
)
��V W
;
��W X
}
�� 	
public
�� 
int
�� 
DeleteBd
�� 
(
�� 
string
�� "
nomTabla
��# +
,
��+ ,
	ArrayList
��- 6
arrColumnasWhere
��7 G
,
��G H
	ArrayList
��I R
arrValoresWhere
��S b
,
��b c
string
�� "&
strParametrosAdicionales
��# ;
)
��; <
{
�� 	
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
try
�� 
{
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! /
+
��0 1
nomTabla
��2 :
+
��; <
$str
��= F
)
��F G
;
��G H
var
�� 
boolBandera
�� 
=
��  !
false
��" '
;
��' (
for
�� 
(
�� 
var
�� 
intContador
�� $
=
��% &
$num
��' (
;
��( )
intContador
��* 5
<
��6 7
arrValoresWhere
��8 G
.
��G H
Count
��H M
;
��M N
intContador
��O Z
++
��Z \
)
��\ ]
{
�� 
if
�� 
(
�� 
boolBandera
�� #
)
��# $
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
$str
��) 0
+
��1 2
arrColumnasWhere
��3 C
[
��C D
intContador
��D O
]
��O P
+
��Q R
$str
��S X
+
��Y Z
arrValoresWhere
��[ j
[
��j k
intContador
��k v
]
��v w
)
��w x
;
��x y
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
arrColumnasWhere
��) 9
[
��9 :
intContador
��: E
]
��E F
+
��G H
$str
��I N
+
��O P
arrValoresWhere
��Q `
[
��` a
intContador
��a l
]
��l m
)
��m n
;
��n o
boolBandera
�� #
=
��$ %
true
��& *
;
��* +
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !&
strParametrosAdicionales
��! 9
)
��9 :
;
��: ;
return
�� 
Ejecutar
�� 
(
��  
query
��  %
.
��% &
ToString
��& .
(
��. /
)
��/ 0
)
��0 1
;
��1 2
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� /
,
��/ 0
query
��1 6
)
��6 7
;
��7 8
throw
�
;
�
}
�
}
�
public
�
int
�
DeleteBd
�
(
�
string
�
nomTabla
�
,
�
	ArrayList
�
arrColumnasWhere
�
,
�
	ArrayList
�
arrValoresWhere
�
,
�
string
�
strParametrosAdicionales
�
,
�
ref
�
CTrans
�
trans
�
)
�
{
�
var
�
query
�
=
�
new
�

�
(
�
)
�
;
�
try
�
{
�
query
�
.
�

AppendLine
�
(
�
$str
�
+
�
nomTabla
�
+
�
$str
�
)
�
;
�
var
�
boolBandera
�
=
�
false
�
;
�
for
�
(
�
var
�
intContador
�
=
�
$num
�
;
�
intContador
�
<
�
arrValoresWhere
�
.
�
Count
�
;
�
intContador
�
++
�
)
�
{
�
if
�
(
�
boolBandera
�
)
�
{
�
query
�
.
�

AppendLine
�
(
�
$str
�
+
�
arrColumnasWhere
�
[
�
intContador
�
]
�
+
�
$str
�
+
�
arrValoresWhere
�
[
�
intContador
�
]
�
)
�
;
�
}
�
else
�
{
�
query
�
.
�

AppendLine
�
(
�
arrColumnasWhere
�
[
�
intContador
�
]
�
+
�
$str
�
+
�
arrValoresWhere
�
[
�
intContador
�
]
�
)
�
;
�
boolBandera
�
=
�
true
�
;
�
}
�
}
�
query
�
.
�

AppendLine
�
(
�
strParametrosAdicionales
�
)
�
;
�
return
�
Ejecutar
�
(
�
query
�
.
�
ToString
�
(
�
)
�
,
�
ref
�
trans
�
)
�
;
�
}
�
catch
�
(
�
	Exception
�
ex
�
)
�
{
�
ex
�
.
�
Data
�
.
�
Add
�
(
�
$str
�
,
�
query
�
)
�
;
�
throw
�
;
�
}
�
}
�
public
�
bool
�
InsertBd
�
(
�
string
�
tabla
�
,
�
	ArrayList
�
arrColumnas
�
,
�
	ArrayList
�

arrValores
�
)
�
{
�
var
�
encoding
�
=
�
new
�

�
(
�
)
�
;
�
var
�
arrParam
�
=
�
encoding
�
.
�
GetBytes
�
(
�
$str
�
)
�
;
�
var
�
arrPosicionByte
�
=
�
new
�
	ArrayList
�
(
�
)
�
;
�
var
�
query
�
=
�
new
�

�
(
�
)
�
;
�
try
�
{
�
query
�
.
�

AppendLine
�
(
�
$str
�
+
�
tabla
�
+
�
$str
�
)
�
;
�
var
�
	primerReg
�
=
�
true
�
;
�
query
�
.
�

AppendLine
�
(
�
string
�
.
�
Join
�
(
�
$str
�
,
�
arrColumnas
�
.
�
OfType
�
<
�
string
�
>
�
(
�
)
�
)
�
)
�
;
�
query
�
.
�

AppendLine
�
(
�
$str
�
)
�
;
�
for
�
(
�
var
�
intContador
�
=
�
$num
�
;
�
intContador
�
<
�

arrValores
�
.
�
Count
�
;
�
intContador
�
++
�
)
�
{
�
if
�
(
�

arrValores
�
[
�
intContador
�
]
�
==
�
null
�
)
�
{
�
throw
�
new
�
ArgumentException
�
(
�
$str
�
+
�
intContador
�
+
�
$str
�
)
�
;
�
}
�
string
�
strValorSet
�
;
�
if
�
(
�

arrValores
�
[
�
intContador
�
]
�
.
�
GetType
�
(
�
)
�
==
�
arrParam
�
.
�
GetType
�
(
�
)
�
)
�
{
�
strValorSet
�
=
�
$str
�
;
�
arrPosicionByte
�
.
�
Add
�
(
�
intContador
�
)
�
;
�
}
�
else
�
{
�
strValorSet
�
=
�

arrValores
�
[
�
intContador
�
]
�
.
�
ToString
�
(
�
)
�
;
�
}
�
if
�
(
�
	primerReg
�
)
�
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
strValorSet
��) 4
)
��4 5
;
��5 6
	primerReg
�� !
=
��" #
false
��$ )
;
��) *
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
$str
��) .
+
��/ 0
strValorSet
��1 <
)
��< =
;
��= >
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! $
)
��$ %
;
��% &
if
�� 
(
�� 

ConexionBd
�� 
.
�� 
State
�� $
==
��% '
ConnectionState
��( 7
.
��7 8
Closed
��8 >
)
��> ?
{
�� 

ConexionBd
�� 
.
�� 
Open
�� #
(
��# $
)
��$ %
;
��% &
}
�� 
var
�� 
command
�� 
=
�� 
new
�� !

��" /
(
��/ 0
query
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A

ConexionBd
��B L
)
��L M
;
��M N
foreach
�� 
(
�� 
int
�� 
posicion
�� %
in
��& (
arrPosicionByte
��) 8
)
��8 9
{
�� 
command
�� 
.
�� 

Parameters
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
NpgsqlParameter
��/ >
(
��> ?
$str
��? K
+
��L M
posicion
��N V
,
��V W
NpgsqlDbType
��X d
.
��d e
Bytea
��e j
)
��j k
)
��k l
;
��l m
command
�� 
.
�� 

Parameters
�� &
[
��& '
$str
��' 3
+
��4 5
posicion
��6 >
]
��> ?
.
��? @
Value
��@ E
=
��F G
(
��H I
byte
��I M
[
��M N
]
��N O
)
��O P

arrValores
��P Z
[
��Z [
posicion
��[ c
]
��c d
;
��d e
}
�� 
var
�� 
numReg
�� 
=
�� 
command
�� $
.
��$ %
ExecuteNonQuery
��% 4
(
��4 5
)
��5 6
;
��6 7
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "

ConexionBd
�� 
.
�� 
Close
��  
(
��  !
)
��! "
;
��" #
return
�� 
(
�� 
numReg
�� 
>
��  
$num
��! "
)
��" #
;
��# $
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� /
,
��/ 0
query
��1 6
)
��6 7
;
��7 8
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
bool
�� 
InsertBd
�� 
(
�� 
string
�� #
tabla
��$ )
,
��) *
	ArrayList
��+ 4
arrColumnas
��5 @
,
��@ A
	ArrayList
��B K

arrValores
��L V
,
��V W
ref
��X [
int
��\ _
intIdentity
��` k
)
��k l
{
�� 	
var
�� 
encoding
�� 
=
�� 
new
�� 

�� ,
(
��, -
)
��- .
;
��. /
var
�� 
arrParam
�� 
=
�� 
encoding
�� #
.
��# $
GetBytes
��$ ,
(
��, -
$str
��- 5
)
��5 6
;
��6 7
var
�� 
arrPosicionByte
�� 
=
��  !
new
��" %
	ArrayList
��& /
(
��/ 0
)
��0 1
;
��1 2
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
try
�� 
{
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! /
+
��0 1
tabla
��2 7
+
��8 9
$str
��: =
)
��= >
;
��> ?
query
�� 
.
�� 

AppendLine
��  
(
��  !
string
��! '
.
��' (
Join
��( ,
(
��, -
$str
��- 0
,
��0 1
arrColumnas
��2 =
.
��= >
OfType
��> D
<
��D E
string
��E K
>
��K L
(
��L M
)
��M N
)
��N O
)
��O P
;
��P Q
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! -
)
��- .
;
��. /
var
�� 
	primerReg
�� 
=
�� 
true
��  $
;
��$ %
for
�� 
(
�� 
var
�� 
intContador
�� $
=
��% &
$num
��' (
;
��( )
intContador
��* 5
<
��6 7

arrValores
��8 B
.
��B C
Count
��C H
;
��H I
intContador
��J U
++
��U W
)
��W X
{
�� 
if
�� 
(
�� 

arrValores
�� "
[
��" #
intContador
��# .
]
��. /
==
��0 2
null
��3 7
)
��7 8
{
�� 
throw
�� 
new
�� !
ArgumentException
��" 3
(
��3 4
$str
��4 B
+
��C D
intContador
��E P
+
��Q R
$str
��S k
)
��k l
;
��l m
}
�� 
string
�� 
strValorSet
�� &
;
��& '
if
�� 
(
�� 

arrValores
�� "
[
��" #
intContador
��# .
]
��. /
.
��/ 0
GetType
��0 7
(
��7 8
)
��8 9
==
��: <
arrParam
��= E
.
��E F
GetType
��F M
(
��M N
)
��N O
)
��O P
{
�� 
strValorSet
�� #
=
��$ %
$str
��& )
;
��) *
arrPosicionByte
�� '
.
��' (
Add
��( +
(
��+ ,
intContador
��, 7
)
��7 8
;
��8 9
}
�� 
else
�� 
{
�� 
strValorSet
�� #
=
��$ %

arrValores
��& 0
[
��0 1
intContador
��1 <
]
��< =
.
��= >
ToString
��> F
(
��F G
)
��G H
;
��H I
}
�� 
if
�� 
(
�� 
	primerReg
�� !
)
��! "
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
strValorSet
��) 4
)
��4 5
;
��5 6
	primerReg
�� !
=
��" #
false
��$ )
;
��) *
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
$str
��) .
+
��/ 0
strValorSet
��1 <
)
��< =
;
��= >
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! ;
)
��; <
;
��< =
var
�� 
command
�� 
=
�� 
new
�� !

��" /
(
��/ 0
query
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A

ConexionBd
��B L
)
��L M
;
��M N
foreach
�� 
(
�� 
int
�� 
posicion
�� %
in
��& (
arrPosicionByte
��) 8
)
��8 9
{
�� 
command
�� 
.
�� 

Parameters
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
NpgsqlParameter
��/ >
(
��> ?
$str
��? K
+
��L M
posicion
��N V
,
��V W
NpgsqlDbType
��X d
.
��d e
Bytea
��e j
)
��j k
)
��k l
;
��l m
command
�� 
.
�� 

Parameters
�� &
[
��& '
$str
��' 3
+
��4 5
posicion
��6 >
]
��> ?
.
��? @
Value
��@ E
=
��F G

arrValores
��H R
[
��R S
posicion
��S [
]
��[ \
;
��\ ]
}
�� 
var
�� 
parIdentity
�� 
=
��  !
command
��" )
.
��) *

Parameters
��* 4
.
��4 5
Add
��5 8
(
��8 9
$str
��9 C
,
��C D
NpgsqlDbType
��E Q
.
��Q R
Integer
��R Y
,
��Y Z
$num
��[ \
,
��\ ]
$str
��^ c
)
��c d
;
��d e
parIdentity
�� 
.
�� 
	Direction
�� %
=
��& ' 
ParameterDirection
��( :
.
��: ;
Output
��; A
;
��A B
var
�� 
numReg
�� 
=
�� 
command
�� $
.
��$ %
ExecuteNonQuery
��% 4
(
��4 5
)
��5 6
;
��6 7
intIdentity
�� 
=
�� 
int
�� !
.
��! "
Parse
��" '
(
��' (
command
��( /
.
��/ 0

Parameters
��0 :
[
��: ;
command
��; B
.
��B C

Parameters
��C M
.
��M N
Count
��N S
-
��T U
$num
��V W
]
��W X
.
��X Y
Value
��Y ^
.
��^ _
ToString
��_ g
(
��g h
)
��h i
)
��i j
;
��j k
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "

ConexionBd
�� 
.
�� 
Close
��  
(
��  !
)
��! "
;
��" #
return
�� 
(
�� 
numReg
�� 
>
��  
$num
��! "
)
��" #
;
��# $
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� /
,
��/ 0
query
��1 6
)
��6 7
;
��7 8
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
bool
�� 
InsertBd
�� 
(
�� 
string
�� #
tabla
��$ )
,
��) *
	ArrayList
��+ 4
arrColumnas
��5 @
,
��@ A
	ArrayList
��B K

arrValores
��L V
,
��V W
ref
��X [
CTrans
��\ b
trans
��c h
)
��h i
{
�� 	
var
�� 
encoding
�� 
=
�� 
new
�� 

�� ,
(
��, -
)
��- .
;
��. /
var
�� 
arrParam
�� 
=
�� 
encoding
�� #
.
��# $
GetBytes
��$ ,
(
��, -
$str
��- 5
)
��5 6
;
��6 7
var
�� 
arrPosicionByte
�� 
=
��  !
new
��" %
	ArrayList
��& /
(
��/ 0
)
��0 1
;
��1 2
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
try
�� 
{
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! /
+
��0 1
tabla
��2 7
+
��8 9
$str
��: =
)
��= >
;
��> ?
query
�� 
.
�� 

AppendLine
��  
(
��  !
string
��! '
.
��' (
Join
��( ,
(
��, -
$str
��- 0
,
��0 1
arrColumnas
��2 =
.
��= >
OfType
��> D
<
��D E
string
��E K
>
��K L
(
��L M
)
��M N
)
��N O
)
��O P
;
��P Q
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! -
)
��- .
;
��. /
var
�� 
	primerReg
�� 
=
�� 
true
��  $
;
��$ %
for
�� 
(
�� 
var
�� 
intContador
�� $
=
��% &
$num
��' (
;
��( )
intContador
��* 5
<
��6 7

arrValores
��8 B
.
��B C
Count
��C H
;
��H I
intContador
��J U
++
��U W
)
��W X
{
�� 
if
�� 
(
�� 

arrValores
�� "
[
��" #
intContador
��# .
]
��. /
==
��0 2
null
��3 7
)
��7 8
{
�� 
throw
�� 
new
�� !
ArgumentException
��" 3
(
��3 4
$str
��4 B
+
��C D
intContador
��E P
+
��Q R
$str
��S k
)
��k l
;
��l m
}
�� 
string
�� 
strValorSet
�� &
;
��& '
if
�� 
(
�� 

arrValores
�� "
[
��" #
intContador
��# .
]
��. /
.
��/ 0
GetType
��0 7
(
��7 8
)
��8 9
==
��: <
arrParam
��= E
.
��E F
GetType
��F M
(
��M N
)
��N O
)
��O P
{
�� 
strValorSet
�� #
=
��$ %
$str
��& )
;
��) *
arrPosicionByte
�� '
.
��' (
Add
��( +
(
��+ ,
intContador
��, 7
)
��7 8
;
��8 9
}
�� 
else
�� 
{
�� 
strValorSet
�� #
=
��$ %

arrValores
��& 0
[
��0 1
intContador
��1 <
]
��< =
.
��= >
ToString
��> F
(
��F G
)
��G H
;
��H I
}
�� 
if
�� 
(
�� 
	primerReg
�� !
)
��! "
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
strValorSet
��) 4
)
��4 5
;
��5 6
	primerReg
�� !
=
��" #
false
��$ )
;
��) *
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
$str
��) .
+
��/ 0
strValorSet
��1 <
)
��< =
;
��= >
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��" %
)
��% &
;
��& '
var
�� 
command
�� 
=
�� 
new
�� !

��" /
(
��/ 0
query
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A
trans
��B G
.
��G H
MyConn
��H N
)
��N O
;
��O P
foreach
�� 
(
�� 
int
�� 
posicion
�� %
in
��& (
arrPosicionByte
��) 8
)
��8 9
{
�� 
command
�� 
.
�� 

Parameters
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
NpgsqlParameter
��/ >
(
��> ?
$str
��? K
+
��L M
posicion
��N V
,
��V W
NpgsqlDbType
��X d
.
��d e
Bytea
��e j
)
��j k
)
��k l
;
��l m
command
�� 
.
�� 

Parameters
�� &
[
��& '
$str
��' 3
+
��4 5
posicion
��6 >
]
��> ?
.
��? @
Value
��@ E
=
��F G
(
��H I
byte
��I M
[
��M N
]
��N O
)
��O P

arrValores
��P Z
[
��Z [
posicion
��[ c
]
��c d
;
��d e
}
�� 
command
�� 
.
�� 
Transaction
�� #
=
��$ %
trans
��& +
.
��+ ,
MyTrans
��, 3
;
��3 4
var
�� 
numReg
�� 
=
�� 
command
�� $
.
��$ %
ExecuteNonQuery
��% 4
(
��4 5
)
��5 6
;
��6 7
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "

ConexionBd
�� 
.
�� 
Close
��  
(
��  !
)
��! "
;
��" #
return
�� 
(
�� 
numReg
�� 
>
��  
$num
��! "
)
��" #
;
��# $
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� /
,
��/ 0
query
��1 6
)
��6 7
;
��7 8
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
bool
�� 
InsertBd
�� 
(
�� 
string
�� #
tabla
��$ )
,
��) *
	ArrayList
��+ 4
arrColumnas
��5 @
,
��@ A
	ArrayList
��B K

arrValores
��L V
,
��V W
ref
��X [
int
��\ _
intIdentity
��` k
,
��k l
ref
��  
CTrans
��! '
trans
��( -
)
��- .
{
�� 	
var
�� 
encoding
�� 
=
�� 
new
�� 

�� ,
(
��, -
)
��- .
;
��. /
var
�� 
arrParam
�� 
=
�� 
encoding
�� #
.
��# $
GetBytes
��$ ,
(
��, -
$str
��- 5
)
��5 6
;
��6 7
var
�� 
arrPosicionByte
�� 
=
��  !
new
��" %
	ArrayList
��& /
(
��/ 0
)
��0 1
;
��1 2
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
try
�� 
{
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! /
+
��0 1
tabla
��2 7
+
��8 9
$str
��: =
)
��= >
;
��> ?
query
�� 
.
�� 

AppendLine
��  
(
��  !
string
��! '
.
��' (
Join
��( ,
(
��, -
$str
��- 0
,
��0 1
arrColumnas
��2 =
.
��= >
OfType
��> D
<
��D E
string
��E K
>
��K L
(
��L M
)
��M N
)
��N O
)
��O P
;
��P Q
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! -
)
��- .
;
��. /
var
�� 
	primerReg
�� 
=
�� 
true
��  $
;
��$ %
for
�� 
(
�� 
var
�� 
intContador
�� $
=
��% &
$num
��' (
;
��( )
intContador
��* 5
<
��6 7

arrValores
��8 B
.
��B C
Count
��C H
;
��H I
intContador
��J U
++
��U W
)
��W X
{
�� 
if
�� 
(
�� 

arrValores
�� "
[
��" #
intContador
��# .
]
��. /
==
��0 2
null
��3 7
)
��7 8
{
�� 
throw
�� 
new
�� !
ArgumentException
��" 3
(
��3 4
$str
��4 B
+
��C D
intContador
��E P
+
��Q R
$str
��S k
)
��k l
;
��l m
}
�� 
string
�� 
strValorSet
�� &
;
��& '
if
�� 
(
�� 

arrValores
�� "
[
��" #
intContador
��# .
]
��. /
.
��/ 0
GetType
��0 7
(
��7 8
)
��8 9
==
��: <
arrParam
��= E
.
��E F
GetType
��F M
(
��M N
)
��N O
)
��O P
{
�� 
strValorSet
�� #
=
��$ %
$str
��& )
;
��) *
arrPosicionByte
�� '
.
��' (
Add
��( +
(
��+ ,
intContador
��, 7
)
��7 8
;
��8 9
}
�� 
else
�� 
{
�� 
strValorSet
�� #
=
��$ %

arrValores
��& 0
[
��0 1
intContador
��1 <
]
��< =
.
��= >
ToString
��> F
(
��F G
)
��G H
;
��H I
}
�� 
if
�� 
(
�� 
	primerReg
�� !
)
��! "
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
strValorSet
��) 4
)
��4 5
;
��5 6
	primerReg
�� !
=
��" #
false
��$ )
;
��) *
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
$str
��) .
+
��/ 0
strValorSet
��1 <
)
��< =
;
��= >
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! ;
)
��; <
;
��< =
var
�� 
command
�� 
=
�� 
new
�� !

��" /
(
��/ 0
query
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A
trans
��B G
.
��G H
MyConn
��H N
)
��N O
;
��O P
foreach
�� 
(
�� 
int
�� 
posicion
�� %
in
��& (
arrPosicionByte
��) 8
)
��8 9
{
�� 
command
�� 
.
�� 

Parameters
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
NpgsqlParameter
��/ >
(
��> ?
$str
��? K
+
��L M
posicion
��N V
,
��V W
NpgsqlDbType
��X d
.
��d e
Bytea
��e j
)
��j k
)
��k l
;
��l m
command
�� 
.
�� 

Parameters
�� &
[
��& '
$str
��' 3
+
��4 5
posicion
��6 >
]
��> ?
.
��? @
Value
��@ E
=
��F G

arrValores
��H R
[
��R S
posicion
��S [
]
��[ \
;
��\ ]
}
�� 
var
�� 
parIdentity
�� 
=
��  !
command
��" )
.
��) *

Parameters
��* 4
.
��4 5
Add
��5 8
(
��8 9
$str
��9 C
,
��C D
NpgsqlDbType
��E Q
.
��Q R
Integer
��R Y
,
��Y Z
$num
��[ \
,
��\ ]
$str
��^ c
)
��c d
;
��d e
parIdentity
�� 
.
�� 
	Direction
�� %
=
��& ' 
ParameterDirection
��( :
.
��: ;
Output
��; A
;
��A B
command
�� 
.
�� 
Transaction
�� #
=
��$ %
trans
��& +
.
��+ ,
MyTrans
��, 3
;
��3 4
var
�� 
numReg
�� 
=
�� 
command
�� $
.
��$ %
ExecuteNonQuery
��% 4
(
��4 5
)
��5 6
;
��6 7
intIdentity
�� 
=
�� 
int
�� !
.
��! "
Parse
��" '
(
��' (
command
��( /
.
��/ 0

Parameters
��0 :
[
��: ;
command
��; B
.
��B C

Parameters
��C M
.
��M N
Count
��N S
-
��T U
$num
��V W
]
��W X
.
��X Y
Value
��Y ^
.
��^ _
ToString
��_ g
(
��g h
)
��h i
)
��i j
;
��j k
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "

ConexionBd
�� 
.
�� 
Close
��  
(
��  !
)
��! "
;
��" #
return
�� 
(
�� 
numReg
�� 
>
��  
$num
��! "
)
��" #
;
��# $
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� /
,
��/ 0
query
��1 6
)
��6 7
;
��7 8
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
int
�� 
UpdateBd
�� 
(
�� 
string
�� "
nomTabla
��# +
,
��+ ,
	ArrayList
��- 6
arrColumnasSet
��7 E
,
��E F
	ArrayList
��G P

��Q ^
,
��^ _
	ArrayList
�� %
arrColumnasWhere
��& 6
,
��6 7
	ArrayList
��8 A
arrValoresWhere
��B Q
)
��Q R
{
�� 	
var
�� 
encoding
�� 
=
�� 
new
�� 

�� ,
(
��, -
)
��- .
;
��. /
var
�� 
arrParam
�� 
=
�� 
encoding
�� #
.
��# $
GetBytes
��$ ,
(
��, -
$str
��- 5
)
��5 6
;
��6 7
var
�� 
arrPosicionByte
�� 
=
��  !
new
��" %
	ArrayList
��& /
(
��/ 0
)
��0 1
;
��1 2
var
�� 
query
�� 
=
�� 
new
�� 

�� (
(
��( )
)
��) *
;
��* +
query
�� 
.
�� 

AppendLine
�� 
(
�� 
$str
�� &
+
��' (
nomTabla
��) 1
+
��2 3
$str
��4 ;
)
��; <
;
��< =
try
�� 
{
�� 
var
�� 
boolBandera
�� 
=
��  !
false
��" '
;
��' (
for
�� 
(
�� 
var
�� 
intContador
�� $
=
��% &
$num
��' (
;
��( )
intContador
��* 5
<
��6 7

��8 E
.
��E F
Count
��F K
;
��K L
intContador
��M X
++
��X Z
)
��Z [
{
�� 
if
�� 
(
�� 

�� %
[
��% &
intContador
��& 1
]
��1 2
==
��3 5
null
��6 :
)
��: ;
{
�� 
if
�� 
(
�� 
boolBandera
�� '
)
��' (
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
$str
��- 2
+
��3 4
arrColumnasSet
��5 C
[
��C D
intContador
��D O
]
��O P
+
��Q R
$str
��S ]
)
��] ^
;
��^ _
}
�� 
else
�� 
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
arrColumnasSet
��- ;
[
��; <
intContador
��< G
]
��G H
+
��I J
$str
��K U
)
��U V
;
��V W
boolBandera
�� '
=
��( )
true
��* .
;
��. /
}
�� 
}
�� 
else
�� 
{
�� 
string
�� 
strValorSet
�� *
;
��* +
if
�� 
(
�� 

�� )
[
��) *
intContador
��* 5
]
��5 6
.
��6 7
GetType
��7 >
(
��> ?
)
��? @
==
��A C
arrParam
��D L
.
��L M
GetType
��M T
(
��T U
)
��U V
)
��V W
{
�� 
strValorSet
�� '
=
��( )
$str
��* -
;
��- .
arrPosicionByte
�� +
.
��+ ,
Add
��, /
(
��/ 0
intContador
��0 ;
)
��; <
;
��< =
}
�� 
else
�� 
{
�� 
strValorSet
�� '
=
��( )

��* 7
[
��7 8
intContador
��8 C
]
��C D
.
��D E
ToString
��E M
(
��M N
)
��N O
;
��O P
}
�� 
if
�� 
(
�� 
boolBandera
�� '
)
��' (
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
$str
��- 2
+
��3 4
arrColumnasSet
��5 C
[
��C D
intContador
��D O
]
��O P
+
��Q R
$str
��S X
+
��Y Z
strValorSet
��$ /
)
��/ 0
;
��0 1
}
�� 
else
�� 
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
arrColumnasSet
��- ;
[
��; <
intContador
��< G
]
��G H
+
��I J
$str
��K P
+
��Q R
strValorSet
��S ^
)
��^ _
;
��_ `
boolBandera
�� '
=
��( )
true
��* .
;
��. /
}
�� 
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! *
)
��* +
;
��+ ,
boolBandera
�� 
=
�� 
false
�� #
;
��# $
for
�� 
(
�� 
var
�� 
intContador
�� $
=
��% &
$num
��' (
;
��( )
intContador
��* 5
<
��6 7
arrValoresWhere
��8 G
.
��G H
Count
��H M
;
��M N
intContador
��O Z
++
��Z \
)
��\ ]
{
�� 
if
�� 
(
�� 
boolBandera
�� #
)
��# $
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
$str
��) 0
+
��1 2
arrColumnasWhere
��3 C
[
��C D
intContador
��D O
]
��O P
+
��Q R
$str
��S X
+
��Y Z
arrValoresWhere
��  /
[
��/ 0
intContador
��0 ;
]
��; <
)
��< =
;
��= >
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
arrColumnasWhere
��) 9
[
��9 :
intContador
��: E
]
��E F
+
��G H
$str
��I N
+
��O P
arrValoresWhere
��  /
[
��/ 0
intContador
��0 ;
]
��; <
)
��< =
;
��= >
boolBandera
�� #
=
��$ %
true
��& *
;
��* +
}
�� 
}
�� 
if
�� 
(
�� 

ConexionBd
�� 
.
�� 
State
�� $
==
��% '
ConnectionState
��( 7
.
��7 8
Closed
��8 >
)
��> ?
{
�� 

ConexionBd
�� 
.
�� 
Open
�� #
(
��# $
)
��$ %
;
��% &
}
�� 
var
�� 
command
�� 
=
�� 
new
�� !

��" /
(
��/ 0
query
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A

ConexionBd
��B L
)
��L M
;
��M N
foreach
�� 
(
�� 
int
�� 
posicion
�� %
in
��& (
arrPosicionByte
��) 8
)
��8 9
{
�� 
command
�� 
.
�� 

Parameters
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
NpgsqlParameter
��/ >
(
��> ?
$str
��? K
+
��L M
posicion
��N V
,
��V W
NpgsqlDbType
��X d
.
��d e
Bytea
��e j
)
��j k
)
��k l
;
��l m
command
�� 
.
�� 

Parameters
�� &
[
��& '
$str
��' 3
+
��4 5
posicion
��6 >
]
��> ?
.
��? @
Value
��@ E
=
��F G
(
��H I
byte
��I M
[
��M N
]
��N O
)
��O P

��P ]
[
��] ^
posicion
��^ f
]
��f g
;
��g h
}
�� 
var
�� 
numReg
�� 
=
�� 
command
�� $
.
��$ %
ExecuteNonQuery
��% 4
(
��4 5
)
��5 6
;
��6 7
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "

ConexionBd
�� 
.
�� 
Close
��  
(
��  !
)
��! "
;
��" #
return
�� 
numReg
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� /
,
��/ 0
query
��1 6
)
��6 7
;
��7 8
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
int
�� 
UpdateBd
�� 
(
�� 
string
�� "
nomTabla
��# +
,
��+ ,
	ArrayList
��- 6
arrColumnasSet
��7 E
,
��E F
	ArrayList
��G P

��Q ^
,
��^ _
	ArrayList
�� %
arrColumnasWhere
��& 6
,
��6 7
	ArrayList
��8 A
arrValoresWhere
��B Q
,
��Q R
ref
��S V
CTrans
��W ]
trans
��^ c
)
��c d
{
�� 	
var
�� 
encoding
�� 
=
�� 
new
�� 

�� ,
(
��, -
)
��- .
;
��. /
var
�� 
arrParam
�� 
=
�� 
encoding
�� #
.
��# $
GetBytes
��$ ,
(
��, -
$str
��- 5
)
��5 6
;
��6 7
var
�� 
arrPosicionByte
�� 
=
��  !
new
��" %
	ArrayList
��& /
(
��/ 0
)
��0 1
;
��1 2
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
try
�� 
{
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! *
+
��+ ,
nomTabla
��- 5
+
��6 7
$str
��8 ?
)
��? @
;
��@ A
var
�� 
boolBandera
�� 
=
��  !
false
��" '
;
��' (
for
�� 
(
�� 
var
�� 
intContador
�� $
=
��% &
$num
��' (
;
��( )
intContador
��* 5
<
��6 7

��8 E
.
��E F
Count
��F K
;
��K L
intContador
��M X
++
��X Z
)
��Z [
{
�� 
if
�� 
(
�� 

�� %
[
��% &
intContador
��& 1
]
��1 2
==
��3 5
null
��6 :
)
��: ;
{
�� 
if
�� 
(
�� 
boolBandera
�� '
)
��' (
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
$str
��- 2
+
��3 4
arrColumnasSet
��5 C
[
��C D
intContador
��D O
]
��O P
+
��Q R
$str
��S ]
)
��] ^
;
��^ _
}
�� 
else
�� 
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
arrColumnasSet
��- ;
[
��; <
intContador
��< G
]
��G H
+
��I J
$str
��K U
)
��U V
;
��V W
boolBandera
�� '
=
��( )
true
��* .
;
��. /
}
�� 
}
�� 
else
�� 
{
�� 
string
�� 
strValorSet
�� *
;
��* +
if
�� 
(
�� 

�� )
[
��) *
intContador
��* 5
]
��5 6
.
��6 7
GetType
��7 >
(
��> ?
)
��? @
==
��A C
arrParam
��D L
.
��L M
GetType
��M T
(
��T U
)
��U V
)
��V W
{
�� 
strValorSet
�� '
=
��( )
$str
��* -
;
��- .
arrPosicionByte
�� +
.
��+ ,
Add
��, /
(
��/ 0
intContador
��0 ;
)
��; <
;
��< =
}
�� 
else
�� 
{
�� 
strValorSet
�� '
=
��( )

��* 7
[
��7 8
intContador
��8 C
]
��C D
.
��D E
ToString
��E M
(
��M N
)
��N O
;
��O P
}
�� 
if
�� 
(
�� 
boolBandera
�� '
)
��' (
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
$str
��- 2
+
��3 4
arrColumnasSet
��5 C
[
��C D
intContador
��D O
]
��O P
+
��Q R
$str
��S X
+
��Y Z
strValorSet
��[ f
)
��f g
;
��g h
}
�� 
else
�� 
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
arrColumnasSet
��- ;
[
��; <
intContador
��< G
]
��G H
+
��I J
$str
��K P
+
��Q R
strValorSet
��S ^
)
��^ _
;
��_ `
boolBandera
�� '
=
��( )
true
��* .
;
��. /
}
�� 
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! *
)
��* +
;
��+ ,
boolBandera
�� 
=
�� 
false
�� #
;
��# $
for
�� 
(
�� 
var
�� 
intContador
�� $
=
��% &
$num
��' (
;
��( )
intContador
��* 5
<
��6 7
arrValoresWhere
��8 G
.
��G H
Count
��H M
;
��M N
intContador
��O Z
++
��Z \
)
��\ ]
{
�� 
if
�� 
(
�� 
boolBandera
�� #
)
��# $
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
$str
��) 0
+
��1 2
arrColumnasWhere
��3 C
[
��C D
intContador
��D O
]
��O P
+
��Q R
$str
��S X
+
��Y Z
arrValoresWhere
��[ j
[
��j k
intContador
��k v
]
��v w
)
��w x
;
��x y
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
arrColumnasWhere
��) 9
[
��9 :
intContador
��: E
]
��E F
+
��G H
$str
��I N
+
��O P
arrValoresWhere
��Q `
[
��` a
intContador
��a l
]
��l m
+
��n o
$str
��p r
)
��r s
;
��s t
boolBandera
�� #
=
��$ %
true
��& *
;
��* +
}
�� 
}
�� 
var
�� 
command
�� 
=
�� 
new
�� !

��" /
(
��/ 0
query
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A
trans
��B G
.
��G H
MyConn
��H N
)
��N O
;
��O P
foreach
�� 
(
�� 
int
�� 
posicion
�� %
in
��& (
arrPosicionByte
��) 8
)
��8 9
{
�� 
command
�� 
.
�� 

Parameters
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
NpgsqlParameter
��/ >
(
��> ?
$str
��? K
+
��L M
posicion
��N V
,
��V W
NpgsqlDbType
��X d
.
��d e
Bytea
��e j
)
��j k
)
��k l
;
��l m
command
�� 
.
�� 

Parameters
�� &
[
��& '
$str
��' 3
+
��4 5
posicion
��6 >
]
��> ?
.
��? @
Value
��@ E
=
��F G
(
��H I
byte
��I M
[
��M N
]
��N O
)
��O P

��P ]
[
��] ^
posicion
��^ f
]
��f g
;
��g h
}
�� 
command
�� 
.
�� 
Transaction
�� #
=
��$ %
trans
��& +
.
��+ ,
MyTrans
��, 3
;
��3 4
var
�� 
numReg
�� 
=
�� 
command
�� $
.
��$ %
ExecuteNonQuery
��% 4
(
��4 5
)
��5 6
;
��6 7
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "

ConexionBd
�� 
.
�� 
Close
��  
(
��  !
)
��! "
;
��" #
return
�� 
numReg
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� /
,
��/ 0
query
��1 6
)
��6 7
;
��7 8
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
int
�� 
UpdateBd
�� 
(
�� 
string
�� "
nomTabla
��# +
,
��+ ,
	ArrayList
��- 6
arrColumnasSet
��7 E
,
��E F
	ArrayList
��G P

��Q ^
,
��^ _
	ArrayList
�� %
arrColumnasWhere
��& 6
,
��6 7
	ArrayList
��8 A
arrValoresWhere
��B Q
,
��Q R
string
��S Y&
strParametrosAdicionales
��Z r
)
��r s
{
�� 	
var
�� 
encoding
�� 
=
�� 
new
�� 

�� ,
(
��, -
)
��- .
;
��. /
var
�� 
arrParam
�� 
=
�� 
encoding
�� #
.
��# $
GetBytes
��$ ,
(
��, -
$str
��- 5
)
��5 6
;
��6 7
var
�� 
arrPosicionByte
�� 
=
��  !
new
��" %
	ArrayList
��& /
(
��/ 0
)
��0 1
;
��1 2
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
try
�� 
{
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! *
+
��+ ,
nomTabla
��- 5
+
��6 7
$str
��8 ?
)
��? @
;
��@ A
var
�� 
boolBandera
�� 
=
��  !
false
��" '
;
��' (
for
�� 
(
�� 
var
�� 
intContador
�� $
=
��% &
$num
��' (
;
��( )
intContador
��* 5
<
��6 7

��8 E
.
��E F
Count
��F K
;
��K L
intContador
��M X
++
��X Z
)
��Z [
{
�� 
if
�� 
(
�� 

�� %
[
��% &
intContador
��& 1
]
��1 2
==
��3 5
null
��6 :
)
��: ;
{
�� 
if
�� 
(
�� 
boolBandera
�� '
)
��' (
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
$str
��- 2
+
��3 4
arrColumnasSet
��5 C
[
��C D
intContador
��D O
]
��O P
+
��Q R
$str
��S ]
)
��] ^
;
��^ _
}
�� 
else
�� 
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
arrColumnasSet
��- ;
[
��; <
intContador
��< G
]
��G H
+
��I J
$str
��K U
)
��U V
;
��V W
boolBandera
�� '
=
��( )
true
��* .
;
��. /
}
�� 
}
�� 
else
�� 
{
�� 
string
�� 
strValorSet
�� *
;
��* +
if
�� 
(
�� 

�� )
[
��) *
intContador
��* 5
]
��5 6
.
��6 7
GetType
��7 >
(
��> ?
)
��? @
==
��A C
arrParam
��D L
.
��L M
GetType
��M T
(
��T U
)
��U V
)
��V W
{
�� 
strValorSet
�� '
=
��( )
$str
��* -
;
��- .
arrPosicionByte
�� +
.
��+ ,
Add
��, /
(
��/ 0
intContador
��0 ;
)
��; <
;
��< =
}
�� 
else
�� 
{
�� 
strValorSet
�� '
=
��( )

��* 7
[
��7 8
intContador
��8 C
]
��C D
.
��D E
ToString
��E M
(
��M N
)
��N O
;
��O P
}
�� 
if
�� 
(
�� 
boolBandera
�� '
)
��' (
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
$str
��- 2
+
��3 4
arrColumnasSet
��5 C
[
��C D
intContador
��D O
]
��O P
+
��Q R
$str
��S X
+
��Y Z
strValorSet
��[ f
)
��f g
;
��g h
}
�� 
else
�� 
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
arrColumnasSet
��- ;
[
��; <
intContador
��< G
]
��G H
+
��I J
$str
��K P
+
��Q R
strValorSet
��S ^
)
��^ _
;
��_ `
boolBandera
�� '
=
��( )
true
��* .
;
��. /
}
�� 
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! *
)
��* +
;
��+ ,
boolBandera
�� 
=
�� 
false
�� #
;
��# $
for
�� 
(
�� 
var
�� 
intContador
�� $
=
��% &
$num
��' (
;
��( )
intContador
��* 5
<
��6 7
arrValoresWhere
��8 G
.
��G H
Count
��H M
;
��M N
intContador
��O Z
++
��Z \
)
��\ ]
{
�� 
if
�� 
(
�� 
boolBandera
�� #
)
��# $
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
$str
��) 0
+
��1 2
arrColumnasWhere
��3 C
[
��C D
intContador
��D O
]
��O P
+
��Q R
$str
��S X
+
��Y Z
arrValoresWhere
��[ j
[
��j k
intContador
��k v
]
��v w
)
��w x
;
��x y
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
arrColumnasWhere
��) 9
[
��9 :
intContador
��: E
]
��E F
+
��G H
$str
��I N
+
��O P
arrValoresWhere
��Q `
[
��` a
intContador
��a l
]
��l m
+
��n o
$str
��p r
)
��r s
;
��s t
boolBandera
�� #
=
��$ %
true
��& *
;
��* +
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !&
strParametrosAdicionales
��! 9
)
��9 :
;
��: ;
if
�� 
(
�� 

ConexionBd
�� 
.
�� 
State
�� $
==
��% '
ConnectionState
��( 7
.
��7 8
Closed
��8 >
)
��> ?
{
�� 

ConexionBd
�� 
.
�� 
Open
�� #
(
��# $
)
��$ %
;
��% &
}
�� 
var
�� 
command
�� 
=
�� 
new
�� !

��" /
(
��/ 0
query
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A

ConexionBd
��B L
)
��L M
;
��M N
foreach
�� 
(
�� 
int
�� 
posicion
�� %
in
��& (
arrPosicionByte
��) 8
)
��8 9
{
�� 
command
�� 
.
�� 

Parameters
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
NpgsqlParameter
��/ >
(
��> ?
$str
��? K
+
��L M
posicion
��N V
,
��V W
NpgsqlDbType
��X d
.
��d e
Bytea
��e j
)
��j k
)
��k l
;
��l m
command
�� 
.
�� 

Parameters
�� &
[
��& '
$str
��' 3
+
��4 5
posicion
��6 >
]
��> ?
.
��? @
Value
��@ E
=
��F G
(
��H I
byte
��I M
[
��M N
]
��N O
)
��O P

��P ]
[
��] ^
posicion
��^ f
]
��f g
;
��g h
}
�� 
var
�� 
numReg
�� 
=
�� 
command
�� $
.
��$ %
ExecuteNonQuery
��% 4
(
��4 5
)
��5 6
;
��6 7
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "

ConexionBd
�� 
.
�� 
Close
��  
(
��  !
)
��! "
;
��" #
return
�� 
numReg
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� /
,
��/ 0
query
��1 6
)
��6 7
;
��7 8
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
int
�� 
UpdateBd
�� 
(
�� 
string
�� "
nomTabla
��# +
,
��+ ,
	ArrayList
��- 6
arrColumnasSet
��7 E
,
��E F
	ArrayList
��G P

��Q ^
,
��^ _
	ArrayList
�� %
arrColumnasWhere
��& 6
,
��6 7
	ArrayList
��8 A
arrValoresWhere
��B Q
,
��Q R
string
��S Y&
strParametrosAdicionales
��Z r
,
��r s
ref
�� 
CTrans
��  &
trans
��' ,
)
��, -
{
�� 	
var
�� 
encoding
�� 
=
�� 
new
�� 

�� ,
(
��, -
)
��- .
;
��. /
var
�� 
arrParam
�� 
=
�� 
encoding
�� #
.
��# $
GetBytes
��$ ,
(
��, -
$str
��- 5
)
��5 6
;
��6 7
var
�� 
arrPosicionByte
�� 
=
��  !
new
��" %
	ArrayList
��& /
(
��/ 0
)
��0 1
;
��1 2
var
�� 
query
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
try
�� 
{
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! *
+
��+ ,
nomTabla
��- 5
+
��6 7
$str
��8 ?
)
��? @
;
��@ A
var
�� 
boolBandera
�� 
=
��  !
false
��" '
;
��' (
for
�� 
(
�� 
var
�� 
intContador
�� $
=
��% &
$num
��' (
;
��( )
intContador
��* 5
<
��6 7

��8 E
.
��E F
Count
��F K
;
��K L
intContador
��M X
++
��X Z
)
��Z [
{
�� 
if
�� 
(
�� 

�� %
[
��% &
intContador
��& 1
]
��1 2
==
��3 5
null
��6 :
)
��: ;
{
�� 
if
�� 
(
�� 
boolBandera
�� '
)
��' (
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
$str
��- 2
+
��3 4
arrColumnasSet
��5 C
[
��C D
intContador
��D O
]
��O P
+
��Q R
$str
��S ]
)
��] ^
;
��^ _
}
�� 
else
�� 
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
arrColumnasSet
��- ;
[
��; <
intContador
��< G
]
��G H
+
��I J
$str
��K U
)
��U V
;
��V W
boolBandera
�� '
=
��( )
true
��* .
;
��. /
}
�� 
}
�� 
else
�� 
{
�� 
string
�� 
strValorSet
�� *
;
��* +
if
�� 
(
�� 

�� )
[
��) *
intContador
��* 5
]
��5 6
.
��6 7
GetType
��7 >
(
��> ?
)
��? @
==
��A C
arrParam
��D L
.
��L M
GetType
��M T
(
��T U
)
��U V
)
��V W
{
�� 
strValorSet
�� '
=
��( )
$str
��* -
;
��- .
arrPosicionByte
�� +
.
��+ ,
Add
��, /
(
��/ 0
intContador
��0 ;
)
��; <
;
��< =
}
�� 
else
�� 
{
�� 
strValorSet
�� '
=
��( )

��* 7
[
��7 8
intContador
��8 C
]
��C D
.
��D E
ToString
��E M
(
��M N
)
��N O
;
��O P
}
�� 
if
�� 
(
�� 
boolBandera
�� '
)
��' (
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
$str
��- 2
+
��3 4
arrColumnasSet
��5 C
[
��C D
intContador
��D O
]
��O P
+
��Q R
$str
��S X
+
��Y Z
strValorSet
��[ f
)
��f g
;
��g h
}
�� 
else
�� 
{
�� 
query
�� !
.
��! "

AppendLine
��" ,
(
��, -
arrColumnasSet
��- ;
[
��; <
intContador
��< G
]
��G H
+
��I J
$str
��K P
+
��Q R
strValorSet
��S ^
)
��^ _
;
��_ `
boolBandera
�� '
=
��( )
true
��* .
;
��. /
}
�� 
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !
$str
��! *
)
��* +
;
��+ ,
boolBandera
�� 
=
�� 
false
�� #
;
��# $
for
�� 
(
�� 
var
�� 
intContador
�� $
=
��% &
$num
��' (
;
��( )
intContador
��* 5
<
��6 7
arrValoresWhere
��8 G
.
��G H
Count
��H M
;
��M N
intContador
��O Z
++
��Z \
)
��\ ]
{
�� 
if
�� 
(
�� 
boolBandera
�� #
)
��# $
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
$str
��) 0
+
��1 2
arrColumnasWhere
��3 C
[
��C D
intContador
��D O
]
��O P
+
��Q R
$str
��S X
+
��Y Z
arrValoresWhere
��[ j
[
��j k
intContador
��k v
]
��v w
)
��w x
;
��x y
}
�� 
else
�� 
{
�� 
query
�� 
.
�� 

AppendLine
�� (
(
��( )
arrColumnasWhere
��) 9
[
��9 :
intContador
��: E
]
��E F
+
��G H
$str
��I N
+
��O P
arrValoresWhere
��Q `
[
��` a
intContador
��a l
]
��l m
+
��n o
$str
��p r
)
��r s
;
��s t
boolBandera
�� #
=
��$ %
true
��& *
;
��* +
}
�� 
}
�� 
query
�� 
.
�� 

AppendLine
��  
(
��  !&
strParametrosAdicionales
��! 9
)
��9 :
;
��: ;
var
�� 
command
�� 
=
�� 
new
�� !

��" /
(
��/ 0
query
��0 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A
trans
��B G
.
��G H
MyConn
��H N
)
��N O
;
��O P
foreach
�� 
(
�� 
int
�� 
posicion
�� %
in
��& (
arrPosicionByte
��) 8
)
��8 9
{
�� 
command
�� 
.
�� 

Parameters
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
NpgsqlParameter
��/ >
(
��> ?
$str
��? K
+
��L M
posicion
��N V
,
��V W
NpgsqlDbType
��X d
.
��d e
Bytea
��e j
)
��j k
)
��k l
;
��l m
command
�� 
.
�� 

Parameters
�� &
[
��& '
$str
��' 3
+
��4 5
posicion
��6 >
]
��> ?
.
��? @
Value
��@ E
=
��F G
(
��H I
byte
��I M
[
��M N
]
��N O
)
��O P

��P ]
[
��] ^
posicion
��^ f
]
��f g
;
��g h
}
�� 
command
�� 
.
�� 
Transaction
�� #
=
��$ %
trans
��& +
.
��+ ,
MyTrans
��, 3
;
��3 4
var
�� 
numReg
�� 
=
�� 
command
�� $
.
��$ %
ExecuteNonQuery
��% 4
(
��4 5
)
��5 6
;
��6 7
command
�� 
.
�� 
Dispose
�� 
(
��  
)
��  !
;
��! "

ConexionBd
�� 
.
�� 
Close
��  
(
��  !
)
��! "
;
��" #
return
�� 
numReg
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� /
,
��/ 0
query
��1 6
)
��6 7
;
��7 8
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
	DataTable
�� #
ExecStoreProcedureSel
�� .
(
��. /
string
��/ 5
strNombreTabla
��6 D
)
��D E
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O T
)
��T U
;
��U V
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� #
ExecStoreProcedureSel
�� .
(
��. /
string
��/ 5
strNombreTabla
��6 D
,
��D E
ref
��F I
CTrans
��J P
myTrans
��Q X
)
��X Y
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O T
,
��T U
ref
��V Y
myTrans
��Z a
)
��a b
;
��b c
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� #
ExecStoreProcedureSel
�� .
(
��. /
string
��/ 5
strNombreTabla
��6 D
,
��D E
	ArrayList
��F O!
arrParametrosSelect
��P c
)
��c d
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
}
��? @
;
��@ A
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. /!
strParametrosSelect
��/ B
.
��B C
ToString
��C K
(
��K L
)
��L M
}
��M N
;
��N O
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O X
,
��X Y!
arrNombreParametros
��Z m
,
��m n

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� #
ExecStoreProcedureSel
�� .
(
��. /
string
��/ 5
strNombreTabla
��6 D
,
��D E
	ArrayList
��F O!
arrParametrosSelect
��P c
,
��c d
ref
��e h
CTrans
��i o
myTrans
��p w
)
��w x
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
}
��? @
;
��@ A
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. /!
strParametrosSelect
��/ B
.
��B C
ToString
��C K
(
��K L
)
��L M
}
��M N
;
��N O
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O X
,
��X Y!
arrNombreParametros
��Z m
,
��m n

��7 D
,
��D E
ref
��F I
myTrans
��J Q
)
��Q R
;
��R S
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� #
ExecStoreProcedureSel
�� .
(
��. /
string
��/ 5
strNombreTabla
��6 D
,
��D E
	ArrayList
��F O 
arrParametrosWhere
��P b
,
��b c
	ArrayList
��/ 8"
arrParametrosValores
��9 M
)
��M N
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 9
+
��: ; 
strParametrosWhere
��< N
)
��N O
;
��O P
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 D
}
��D E
;
��E F
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. / 
strParametrosWhere
��/ A
.
��A B
ToString
��B J
(
��J K
)
��K L
}
��L M
;
��M N
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O W
,
��W X!
arrNombreParametros
��Y l
,
��l m

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� #
ExecStoreProcedureSel
�� .
(
��. /
string
��/ 5
strNombreTabla
��6 D
,
��D E
	ArrayList
��F O 
arrParametrosWhere
��P b
,
��b c
	ArrayList
��/ 8"
arrParametrosValores
��9 M
,
��M N
ref
��O R
CTrans
��S Y
myTrans
��Z a
)
��a b
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 9
+
��: ; 
strParametrosWhere
��< N
)
��N O
;
��O P
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 D
}
��D E
;
��E F
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. / 
strParametrosWhere
��/ A
.
��A B
ToString
��B J
(
��J K
)
��K L
}
��L M
;
��M N
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O W
,
��W X!
arrNombreParametros
��Y l
,
��l m

��7 D
,
��D E
ref
��F I
myTrans
��J Q
)
��Q R
;
��R S
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� #
ExecStoreProcedureSel
�� .
(
��. /
string
��/ 5
strNombreTabla
��6 D
,
��D E
	ArrayList
��F O!
arrParametrosSelect
��P c
,
��c d
	ArrayList
��/ 8 
arrParametrosWhere
��9 K
,
��K L
	ArrayList
��M V"
arrParametrosValores
��W k
)
��k l
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3!
strParametrosSelect
��3 F
+
��G H
$str
��I M
+
��N O
	strSelect
��P Y
)
��Y Z
;
��Z [
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 9
+
��: ; 
strParametrosWhere
��< N
)
��N O
;
��O P
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
(
��3 4
)
��4 5
;
��5 6!
arrNombreParametros
�� 
.
��  
Add
��  #
(
��# $
$str
��$ .
)
��. /
;
��/ 0!
arrNombreParametros
�� 
.
��  
Add
��  #
(
��# $
$str
��$ 3
)
��3 4
;
��4 5
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
(
��- .
)
��. /
;
��/ 0

�� 
.
�� 
Add
�� 
(
�� !
strParametrosSelect
�� 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
)
��< =
;
��= >

�� 
.
�� 
Add
�� 
(
��  
strParametrosWhere
�� 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
)
��; <
;
��< =
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O [
,
��[ \!
arrNombreParametros
��] p
,
��p q

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� #
ExecStoreProcedureSel
�� .
(
��. /
string
��/ 5
strNombreTabla
��6 D
,
��D E
	ArrayList
��F O!
arrParametrosSelect
��P c
,
��c d
	ArrayList
��/ 8 
arrParametrosWhere
��9 K
,
��K L
	ArrayList
��M V"
arrParametrosValores
��W k
,
��k l
ref
��/ 2
CTrans
��3 9
myTrans
��: A
)
��A B
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 9
+
��: ; 
strParametrosWhere
��< N
)
��N O
;
��O P
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
}
��P Q
;
��Q R
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. /!
strParametrosSelect
��/ B
.
��B C
ToString
��C K
(
��K L
)
��L M
,
��M N 
strParametrosWhere
��O a
.
��a b
ToString
��b j
(
��j k
)
��k l
}
��l m
;
��m n
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O [
,
��[ \!
arrNombreParametros
��] p
,
��p q

��7 D
,
��D E
ref
��F I
myTrans
��J Q
)
��Q R
;
��R S
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� #
ExecStoreProcedureSel
�� .
(
��. /
string
��/ 5
strNombreTabla
��6 D
,
��D E
	ArrayList
��F O!
arrParametrosSelect
��P c
,
��c d
	ArrayList
��/ 8 
arrParametrosWhere
��9 K
,
��K L
	ArrayList
��M V"
arrParametrosValores
��W k
,
��k l
string
��/ 5!
strParamAdicionales
��6 I
)
��I J
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3!
strParametrosSelect
��3 F
+
��G H
$str
��I M
+
��N O
	strSelect
��P Y
)
��Y Z
;
��Z [
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 9
+
��: ; 
strParametrosWhere
��< N
)
��N O
;
��O P
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
,
��P Q
$str
��R ^
}
��^ _
;
��_ `
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
�� 
strParametrosSelect
�� #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
,
��. / 
strParametrosWhere
�� "
.
��" #
ToString
��# +
(
��+ ,
)
��, -
,
��- .!
strParamAdicionales
�� #
}
�� 
;
��
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O ^
,
��^ _!
arrNombreParametros
��` s
,
��s t

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� #
ExecStoreProcedureSel
�� .
(
��. /
string
��/ 5
strNombreTabla
��6 D
,
��D E
	ArrayList
��F O!
arrParametrosSelect
��P c
,
��c d
	ArrayList
��/ 8 
arrParametrosWhere
��9 K
,
��K L
	ArrayList
��M V"
arrParametrosValores
��W k
,
��k l
string
��/ 5!
strParamAdicionales
��6 I
,
��I J
ref
��K N
CTrans
��O U
myTrans
��V ]
)
��] ^
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 9
+
��: ; 
strParametrosWhere
��< N
)
��N O
;
��O P
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
,
��P Q
$str
��R ^
}
��^ _
;
��_ `
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
�� 
strParametrosSelect
�� #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
,
��. / 
strParametrosWhere
�� "
.
��" #
ToString
��# +
(
��+ ,
)
��, -
,
��- .!
strParamAdicionales
�� #
}
�� 
;
��
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O ^
,
��^ _!
arrNombreParametros
��` s
,
��s t

��7 D
,
��D E
ref
��F I
myTrans
��J Q
)
��Q R
;
��R S
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� %
ExecStoreProcedureSelOr
�� 0
(
��0 1
string
��1 7
strNombreTabla
��8 F
,
��F G
	ArrayList
��H Q!
arrParametrosSelect
��R e
,
��e f
	ArrayList
��1 : 
arrParametrosWhere
��; M
,
��M N
	ArrayList
��O X"
arrParametrosValores
��Y m
)
��m n
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 8
+
��9 : 
strParametrosWhere
��; M
)
��M N
;
��N O
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
}
��P Q
;
��Q R
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
�� 
strParametrosSelect
�� #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
,
��. / 
strParametrosWhere
�� "
.
��" #
ToString
��# +
(
��+ ,
)
��, -
}
�� 
;
��
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O [
,
��[ \!
arrNombreParametros
��] p
,
��p q

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� %
ExecStoreProcedureSelOr
�� 0
(
��0 1
string
��1 7
strNombreTabla
��8 F
,
��F G
	ArrayList
��H Q!
arrParametrosSelect
��R e
,
��e f
	ArrayList
��1 : 
arrParametrosWhere
��; M
,
��M N
	ArrayList
��O X"
arrParametrosValores
��Y m
,
��m n
ref
��1 4
CTrans
��5 ;
myTrans
��< C
)
��C D
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 8
+
��9 : 
strParametrosWhere
��; M
)
��M N
;
��N O
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
}
��P Q
;
��Q R
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. /!
strParametrosSelect
��/ B
.
��B C
ToString
��C K
(
��K L
)
��L M
,
��M N 
strParametrosWhere
��O a
.
��a b
ToString
��b j
(
��j k
)
��k l
}
��l m
;
��m n
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O [
,
��[ \!
arrNombreParametros
��] p
,
��p q

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� %
ExecStoreProcedureSelOr
�� 0
(
��0 1
string
��1 7
strNombreTabla
��8 F
,
��F G
	ArrayList
��H Q!
arrParametrosSelect
��R e
,
��e f
	ArrayList
��1 : 
arrParametrosWhere
��; M
,
��M N
	ArrayList
��O X"
arrParametrosValores
��Y m
,
��m n
string
��1 7!
strParamAdicionales
��8 K
)
��K L
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 8
+
��9 : 
strParametrosWhere
��; M
)
��M N
;
��N O
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
,
��P Q
$str
��R ^
}
��^ _
;
��_ `
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
�� 
strParametrosSelect
�� #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
,
��. / 
strParametrosWhere
�� "
.
��" #
ToString
��# +
(
��+ ,
)
��, -
,
��- .!
strParamAdicionales
�� #
}
�� 
;
��
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O ^
,
��^ _!
arrNombreParametros
��` s
,
��s t

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� %
ExecStoreProcedureSelOr
�� 0
(
��0 1
string
��1 7
strNombreTabla
��8 F
,
��F G
	ArrayList
��H Q!
arrParametrosSelect
��R e
,
��e f
	ArrayList
��1 : 
arrParametrosWhere
��; M
,
��M N
	ArrayList
��O X"
arrParametrosValores
��Y m
,
��m n
string
��1 7!
strParamAdicionales
��8 K
,
��K L
ref
��M P
CTrans
��Q W
myTrans
��X _
)
��_ `
{
�� 	
	DataTable
�� 
dtTemp
�� 
;
�� 
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 8
+
��9 : 
strParametrosWhere
��; M
)
��M N
;
��N O
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
,
��P Q
$str
��R ^
}
��^ _
;
��_ `
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
�� 
strParametrosSelect
�� #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
,
��. / 
strParametrosWhere
�� "
.
��" #
ToString
��# +
(
��+ ,
)
��, -
,
��- .!
strParamAdicionales
�� #
}
�� 
;
��
try
�� 
{
�� 
dtTemp
�� 
=
�� +
ExecStoreProcedureToDataTable
�� 6
(
��6 7
$str
��7 ;
+
��< =
strNombreTabla
��> L
+
��M N
$str
��O ^
,
��^ _!
arrNombreParametros
��` s
,
��s t

��7 D
,
��D E
ref
��F I
myTrans
��J Q
)
��Q R
;
��R S
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
dtTemp
�� 
;
�� 
}
�� 	
public
�� 
DbDataReader
�� -
ExecStoreProcedureDataReaderSel
�� ;
(
��; <
string
��< B
strNombreTabla
��C Q
)
��Q R
{
�� 	
try
�� 
{
�� 
return
�� .
 ExecStoreProcedureToDbDataReader
�� 7
(
��7 8
$str
��8 <
+
��= >
strNombreTabla
��? M
+
��N O
$str
��P U
)
��U V
;
��V W
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
DbDataReader
�� -
ExecStoreProcedureDataReaderSel
�� ;
(
��; <
string
��< B
strNombreTabla
��C Q
,
��Q R
ref
��S V
CTrans
��W ]
myTrans
��^ e
)
��e f
{
�� 	
try
�� 
{
�� 
return
�� .
 ExecStoreProcedureToDbDataReader
�� 7
(
��7 8
$str
��8 <
+
��= >
strNombreTabla
��? M
+
��N O
$str
��P U
,
��U V
ref
��W Z
myTrans
��[ b
)
��b c
;
��c d
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
DbDataReader
�� -
ExecStoreProcedureDataReaderSel
�� ;
(
��; <
string
��< B
strNombreTabla
��C Q
,
��Q R
	ArrayList
��S \!
arrParametrosSelect
��] p
)
��p q
{
�� 	
DbDataReader
�� 
drReader
�� !
;
��! "
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
}
��? @
;
��@ A
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. /!
strParametrosSelect
��/ B
.
��B C
ToString
��C K
(
��K L
)
��L M
}
��M N
;
��N O
try
�� 
{
�� 
drReader
�� 
=
�� .
 ExecStoreProcedureToDbDataReader
�� ;
(
��; <
$str
��< @
+
��A B
strNombreTabla
��C Q
+
��R S
$str
��T ]
,
��] ^!
arrNombreParametros
��_ r
,
��r s

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
drReader
�� 
;
�� 
}
�� 	
public
�� 
DbDataReader
�� -
ExecStoreProcedureDataReaderSel
�� ;
(
��; <
string
��< B
strNombreTabla
��C Q
,
��Q R
	ArrayList
��S \!
arrParametrosSelect
��] p
,
��p q
ref
��r u
CTrans
��v |
myTrans��} �
)��� �
{
�� 	
DbDataReader
�� 
drReader
�� !
;
��! "
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
}
��? @
;
��@ A
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. /!
strParametrosSelect
��/ B
.
��B C
ToString
��C K
(
��K L
)
��L M
}
��M N
;
��N O
try
�� 
{
�� 
drReader
�� 
=
�� .
 ExecStoreProcedureToDbDataReader
�� ;
(
��; <
$str
��< @
+
��A B
strNombreTabla
��C Q
+
��R S
$str
��T ]
,
��] ^!
arrNombreParametros
��_ r
,
��r s

��7 D
,
��D E
ref
��F I
myTrans
��J Q
)
��Q R
;
��R S
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
drReader
�� 
;
�� 
}
�� 	
public
�� 
DbDataReader
�� -
ExecStoreProcedureDataReaderSel
�� ;
(
��; <
string
��< B
strNombreTabla
��C Q
,
��Q R
	ArrayList
��S \ 
arrParametrosWhere
��] o
,
��o p
	ArrayList
��/ 8"
arrParametrosValores
��9 M
)
��M N
{
�� 	
DbDataReader
�� 
drReader
�� !
;
��! "
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 9
+
��: ; 
strParametrosWhere
��< N
)
��N O
;
��O P
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 D
}
��D E
;
��E F
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. / 
strParametrosWhere
��/ A
.
��A B
ToString
��B J
(
��J K
)
��K L
}
��L M
;
��M N
try
�� 
{
�� 
drReader
�� 
=
�� .
 ExecStoreProcedureToDbDataReader
�� ;
(
��; <
$str
��< @
+
��A B
strNombreTabla
��C Q
+
��R S
$str
��T \
,
��\ ]!
arrNombreParametros
��^ q
,
��q r

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
drReader
�� 
;
�� 
}
�� 	
public
�� 
DbDataReader
�� -
ExecStoreProcedureDataReaderSel
�� ;
(
��; <
string
��< B
strNombreTabla
��C Q
,
��Q R
	ArrayList
��S \ 
arrParametrosWhere
��] o
,
��o p
	ArrayList
��/ 8"
arrParametrosValores
��9 M
,
��M N
ref
��O R
CTrans
��S Y
myTrans
��Z a
)
��a b
{
�� 	
DbDataReader
�� 
drReader
�� !
;
��! "
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 9
+
��: ; 
strParametrosWhere
��< N
)
��N O
;
��O P
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 D
}
��D E
;
��E F
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. / 
strParametrosWhere
��/ A
.
��A B
ToString
��B J
(
��J K
)
��K L
}
��L M
;
��M N
try
�� 
{
�� 
drReader
�� 
=
�� .
 ExecStoreProcedureToDbDataReader
�� ;
(
��; <
$str
��< @
+
��A B
strNombreTabla
��C Q
+
��R S
$str
��T \
,
��\ ]!
arrNombreParametros
��^ q
,
��q r

��7 D
,
��D E
ref
��F I
myTrans
��J Q
)
��Q R
;
��R S
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
drReader
�� 
;
�� 
}
�� 	
public
�� 
DbDataReader
�� -
ExecStoreProcedureDataReaderSel
�� ;
(
��; <
string
��< B
strNombreTabla
��C Q
,
��Q R
	ArrayList
��S \!
arrParametrosSelect
��] p
,
��p q
	ArrayList
��/ 8 
arrParametrosWhere
��9 K
,
��K L
	ArrayList
��M V"
arrParametrosValores
��W k
)
��k l
{
�� 	
DbDataReader
�� 
drReader
�� !
;
��! "
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 9
+
��: ; 
strParametrosWhere
��< N
)
��N O
;
��O P
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
}
��P Q
;
��Q R
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. /!
strParametrosSelect
��/ B
.
��B C
ToString
��C K
(
��K L
)
��L M
,
��M N 
strParametrosWhere
��O a
.
��a b
ToString
��b j
(
��j k
)
��k l
}
��l m
;
��m n
try
�� 
{
�� 
drReader
�� 
=
�� .
 ExecStoreProcedureToDbDataReader
�� ;
(
��; <
$str
��< @
+
��A B
strNombreTabla
��C Q
+
��R S
$str
��T `
,
��` a!
arrNombreParametros
��b u
,
��u v

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
drReader
�� 
;
�� 
}
�� 	
public
�� 
DbDataReader
�� -
ExecStoreProcedureDataReaderSel
�� ;
(
��; <
string
��< B
strNombreTabla
��C Q
,
��Q R
	ArrayList
��S \!
arrParametrosSelect
��] p
,
��p q
	ArrayList
��/ 8 
arrParametrosWhere
��9 K
,
��K L
	ArrayList
��M V"
arrParametrosValores
��W k
,
��k l
ref
��/ 2
CTrans
��3 9
myTrans
��: A
)
��A B
{
�� 	
DbDataReader
�� 
drReader
�� !
;
��! "
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 9
+
��: ; 
strParametrosWhere
��< N
)
��N O
;
��O P
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
}
��P Q
;
��Q R
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. /!
strParametrosSelect
��/ B
.
��B C
ToString
��C K
(
��K L
)
��L M
,
��M N 
strParametrosWhere
��O a
.
��a b
ToString
��b j
(
��j k
)
��k l
}
��l m
;
��m n
try
�� 
{
�� 
drReader
�� 
=
�� .
 ExecStoreProcedureToDbDataReader
�� ;
(
��; <
$str
��< @
+
��A B
strNombreTabla
��C Q
+
��R S
$str
��T `
,
��` a!
arrNombreParametros
��b u
,
��u v

��7 D
,
��D E
ref
��F I
myTrans
��J Q
)
��Q R
;
��R S
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
drReader
�� 
;
�� 
}
�� 	
public
�� 
DbDataReader
�� -
ExecStoreProcedureDataReaderSel
�� ;
(
��; <
string
��< B
strNombreTabla
��C Q
,
��Q R
	ArrayList
��S \!
arrParametrosSelect
��] p
,
��p q
	ArrayList
��/ 8 
arrParametrosWhere
��9 K
,
��K L
	ArrayList
��M V"
arrParametrosValores
��W k
,
��k l
string
��/ 5!
strParamAdicionales
��6 I
)
��I J
{
�� 	
DbDataReader
�� 
drReader
�� !
;
��! "
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 9
+
��: ; 
strParametrosWhere
��< N
)
��N O
;
��O P
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
,
��P Q
$str
��R ^
}
��^ _
;
��_ `
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
�� 
strParametrosSelect
�� #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
,
��. / 
strParametrosWhere
�� "
.
��" #
ToString
��# +
(
��+ ,
)
��, -
,
��- .!
strParamAdicionales
�� #
}
�� 
;
��
try
�� 
{
�� 
drReader
�� 
=
�� .
 ExecStoreProcedureToDbDataReader
�� ;
(
��; <
$str
��< @
+
��A B
strNombreTabla
��C Q
+
��R S
$str
��T c
,
��c d!
arrNombreParametros
��e x
,
��x y

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
drReader
�� 
;
�� 
}
�� 	
public
�� 
DbDataReader
�� -
ExecStoreProcedureDataReaderSel
�� ;
(
��; <
string
��< B
strNombreTabla
��C Q
,
��Q R
	ArrayList
��S \!
arrParametrosSelect
��] p
,
��p q
	ArrayList
��/ 8 
arrParametrosWhere
��9 K
,
��K L
	ArrayList
��M V"
arrParametrosValores
��W k
,
��k l
string
��/ 5!
strParamAdicionales
��6 I
,
��I J
ref
��K N
CTrans
��O U
myTrans
��V ]
)
��] ^
{
�� 	
DbDataReader
�� 
drReader
�� !
;
��! "
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 9
+
��: ; 
strParametrosWhere
��< N
)
��N O
;
��O P
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
,
��P Q
$str
��R ^
}
��^ _
;
��_ `
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
�� 
strParametrosSelect
�� #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
,
��. / 
strParametrosWhere
�� "
.
��" #
ToString
��# +
(
��+ ,
)
��, -
,
��- .!
strParamAdicionales
�� #
}
�� 
;
��
try
�� 
{
�� 
drReader
�� 
=
�� .
 ExecStoreProcedureToDbDataReader
�� ;
(
��; <
$str
��< @
+
��A B
strNombreTabla
��C Q
+
��R S
$str
��T c
,
��c d!
arrNombreParametros
��e x
,
��x y

��7 D
,
��D E
ref
��F I
myTrans
��J Q
)
��Q R
;
��R S
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
drReader
�� 
;
�� 
}
�� 	
public
�� 
DbDataReader
�� /
!ExecStoreProcedureDataReaderSelOr
�� =
(
��= >
string
��> D
strNombreTabla
��E S
,
��S T
	ArrayList
��U ^!
arrParametrosSelect
��_ r
,
��r s
	ArrayList
��1 : 
arrParametrosWhere
��; M
,
��M N
	ArrayList
��O X"
arrParametrosValores
��Y m
)
��m n
{
�� 	
DbDataReader
�� 
drReader
�� !
;
��! "
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 8
+
��9 : 
strParametrosWhere
��; M
)
��M N
;
��N O
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
}
��P Q
;
��Q R
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. /!
strParametrosSelect
��/ B
.
��B C
ToString
��C K
(
��K L
)
��L M
,
��M N 
strParametrosWhere
��O a
.
��a b
ToString
��b j
(
��j k
)
��k l
}
��l m
;
��m n
try
�� 
{
�� 
drReader
�� 
=
�� .
 ExecStoreProcedureToDbDataReader
�� ;
(
��; <
$str
��< @
+
��A B
strNombreTabla
��C Q
+
��R S
$str
��T `
,
��` a!
arrNombreParametros
��b u
,
��u v

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
drReader
�� 
;
�� 
}
�� 	
public
�� 
DbDataReader
�� /
!ExecStoreProcedureDataReaderSelOr
�� =
(
��= >
string
��> D
strNombreTabla
��E S
,
��S T
	ArrayList
��U ^!
arrParametrosSelect
��_ r
,
��r s
	ArrayList
��1 : 
arrParametrosWhere
��; M
,
��M N
	ArrayList
��O X"
arrParametrosValores
��Y m
,
��m n
ref
��1 4
CTrans
��5 ;
myTrans
��< C
)
��C D
{
�� 	
DbDataReader
�� 
drReader
�� !
;
��! "
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 8
+
��9 : 
strParametrosWhere
��; M
)
��M N
;
��N O
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
}
��P Q
;
��Q R
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
��. /!
strParametrosSelect
��/ B
.
��B C
ToString
��C K
(
��K L
)
��L M
,
��M N 
strParametrosWhere
��O a
.
��a b
ToString
��b j
(
��j k
)
��k l
}
��l m
;
��m n
try
�� 
{
�� 
drReader
�� 
=
�� .
 ExecStoreProcedureToDbDataReader
�� ;
(
��; <
$str
��< @
+
��A B
strNombreTabla
��C Q
+
��R S
$str
��T `
,
��` a!
arrNombreParametros
��b u
,
��u v

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
drReader
�� 
;
�� 
}
�� 	
public
�� 
DbDataReader
�� /
!ExecStoreProcedureDataReaderSelOr
�� =
(
��= >
string
��> D
strNombreTabla
��E S
,
��S T
	ArrayList
��U ^!
arrParametrosSelect
��_ r
,
��r s
	ArrayList
��1 : 
arrParametrosWhere
��; M
,
��M N
	ArrayList
��O X"
arrParametrosValores
��Y m
,
��m n
string
��1 7!
strParamAdicionales
��8 K
)
��K L
{
�� 	
DbDataReader
�� 
drReader
�� !
;
��! "
var
�� !
strParametrosSelect
�� #
=
��$ %
new
��& )

��* 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
bPrimerElemento
�� 
=
��  !
true
��" &
;
��& '
foreach
�� 
(
�� 
string
�� 
	strSelect
�� %
in
��& (!
arrParametrosSelect
��) <
)
��< =
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
	strSelect
��3 <
)
��< =
;
��= >
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
�� !
strParametrosSelect
�� '
.
��' (

AppendLine
��( 2
(
��2 3
$str
��3 7
+
��8 9
	strSelect
��: C
)
��C D
;
��D E
}
�� 
}
�� 
var
��  
strParametrosWhere
�� "
=
��# $
new
��% (

��) 6
(
��6 7
)
��7 8
;
��8 9
bPrimerElemento
�� 
=
�� 
true
�� "
;
��" #
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
��  
arrParametrosWhere
��  2
.
��2 3
Count
��3 8
-
��9 :
$num
��; <
;
��< =
i
��> ?
++
��? A
)
��A B
{
�� 
if
�� 
(
�� 
bPrimerElemento
�� #
)
��# $
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2 
arrParametrosWhere
��2 D
[
��D E
i
��E F
]
��F G
+
��H I
$str
��J O
+
��P Q"
arrParametrosValores
��R f
[
��f g
i
��g h
]
��h i
)
��i j
;
��j k
bPrimerElemento
�� #
=
��$ %
false
��& +
;
��+ ,
}
�� 
else
�� 
{
��  
strParametrosWhere
�� &
.
��& '

AppendLine
��' 1
(
��1 2
$str
��2 8
+
��9 : 
strParametrosWhere
��; M
)
��M N
;
��N O
}
�� 
}
�� 
var
�� !
arrNombreParametros
�� #
=
��$ %
new
��& )
	ArrayList
��* 3
{
��4 5
$str
��5 ?
,
��? @
$str
��A P
,
��P Q
$str
��R ^
}
��^ _
;
��_ `
var
�� 

�� 
=
�� 
new
��  #
	ArrayList
��$ -
{
�� 
strParametrosSelect
�� #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
,
��. / 
strParametrosWhere
�� "
.
��" #
ToString
��# +
(
��+ ,
)
��, -
,
��- .!
strParamAdicionales
�� #
}
�� 
;
��
try
�� 
{
�� 
drReader
�� 
=
�� .
 ExecStoreProcedureToDbDataReader
�� ;
(
��; <
$str
��< @
+
��A B
strNombreTabla
��C Q
+
��R S
$str
��T c
,
��c d!
arrNombreParametros
��e x
,
��x y

��7 D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
ex
�� 
.
�� 
Data
�� 
.
�� 
Add
�� 
(
�� 
$str
�� 3
,
��3 4
strNombreTabla
��5 C
)
��C D
;
��D E
throw
�� 
;
�� 
}
�� 
return
�� 
drReader
�� 
;
�� 
}
� �  	
public
� �  
DbDataReader
� �  /
!ExecStoreProcedureDataReaderSelOr
� �  =
(
� � = >
string
� � > D
strNombreTabla
� � E S
,
� � S T
	ArrayList
� � U ^!
arrParametrosSelect
� � _ r
,
� � r s
	ArrayList
� � 1 : 
arrParametrosWhere
� � ; M
,
� � M N
	ArrayList
� � O X"
arrParametrosValores
� � Y m
,
� � m n
string
� � 1 7!
strParamAdicionales
� � 8 K
,
� � K L
ref
� � M P
CTrans
� � Q W
myTrans
� � X _
)
� � _ `
{
� �  	
DbDataReader
� �  
drReader
� �  !
;
� � ! "
var
� �  !
strParametrosSelect
� �  #
=
� � $ %
new
� � & )

� � * 7
(
� � 7 8
)
� � 8 9
;
� � 9 :
var
� �  
bPrimerElemento
� �  
=
� �   !
true
� � " &
;
� � & '
foreach
� �  
(
� �  
string
� �  
	strSelect
� �  %
in
� � & (!
arrParametrosSelect
� � ) <
)
� � < =
{
� �  
if
� �  
(
� �  
bPrimerElemento
� �  #
)
� � # $
{
� �  !
strParametrosSelect
� �  '
.
� � ' (

AppendLine
� � ( 2
(
� � 2 3
	strSelect
� � 3 <
)
� � < =
;
� � = >
bPrimerElemento
� �  #
=
� � $ %
false
� � & +
;
� � + ,
}
� �  
else
� �  
{
� �  !
strParametrosSelect
� �  '
.
� � ' (

AppendLine
� � ( 2
(
� � 2 3
$str
� � 3 7
+
� � 8 9
	strSelect
� � : C
)
� � C D
;
� � D E
}
� �  
}
� �  
var
� �   
strParametrosWhere
� �  "
=
� � # $
new
� � % (

� � ) 6
(
� � 6 7
)
� � 7 8
;
� � 8 9
bPrimerElemento
� �  
=
� �  
true
� �  "
;
� � " #
for
� �  
(
� �  
var
� �  
i
� �  
=
� �  
$num
� �  
;
� �  
i
� �  
<
� �   
arrParametrosWhere
� �   2
.
� � 2 3
Count
� � 3 8
-
� � 9 :
$num
� � ; <
;
� � < =
i
� � > ?
++
� � ? A
)
� � A B
{
� �  
if
� �  
(
� �  
bPrimerElemento
� �  #
)
� � # $
{
� �   
strParametrosWhere
� �  &
.
� � & '

AppendLine
� � ' 1
(
� � 1 2 
arrParametrosWhere
� � 2 D
[
� � D E
i
� � E F
]
� � F G
+
� � H I
$str
� � J O
+
� � P Q"
arrParametrosValores
� � R f
[
� � f g
i
� � g h
]
� � h i
)
� � i j
;
� � j k
bPrimerElemento
� �  #
=
� � $ %
false
� � & +
;
� � + ,
}
� �  
else
� �  
{
� �   
strParametrosWhere
� �  &
.
� � & '

AppendLine
� � ' 1
(
� � 1 2
$str
� � 2 8
+
� � 9 : 
strParametrosWhere
� � ; M
)
� � M N
;
� � N O
}
� �  
}
� �  
var
� �  !
arrNombreParametros
� �  #
=
� � $ %
new
� � & )
	ArrayList
� � * 3
{
� � 4 5
$str
� � 5 ?
,
� � ? @
$str
� � A P
,
� � P Q
$str
� � R ^
}
� � ^ _
;
� � _ `
var
� �  

� �  
=
� �  
new
� �   #
	ArrayList
� � $ -
{
� �  
strParametrosSelect
� �  #
.
� � # $
ToString
� � $ ,
(
� � , -
)
� � - .
,
� � . / 
strParametrosWhere
� �  "
.
� � " #
ToString
� � # +
(
� � + ,
)
� � , -
,
� � - .!
strParamAdicionales
� �  #
}
� �  
;
� � 
try
� �  
{
� �  
drReader
� �  
=
� �  .
 ExecStoreProcedureToDbDataReader
� �  ;
(
� � ; <
$str
� � < @
+
� � A B
strNombreTabla
� � C Q
+
� � R S
$str
� � T c
,
� � c d!
arrNombreParametros
� � e x
,
� � x y

� � 7 D
,
� � D E
ref
� � F I
myTrans
� � J Q
)
� � Q R
;
� � R S
}
� �  
catch
� �  
(
� �  
	Exception
� �  
ex
� �  
)
� �   
{
� �  
ex
� �  
.
� �  
Data
� �  
.
� �  
Add
� �  
(
� �  
$str
� �  3
,
� � 3 4
strNombreTabla
� � 5 C
)
� � C D
;
� � D E
throw
� �  
;
� �  
}
� �  
return
� �  
drReader
� �  
;
� �  
}
� �  	
public
� �  
bool
� �   
ExecStoreProcedure
� �  &
(
� � & '
string
� � ' -
nombreSp
� � . 6
,
� � 6 7
	ArrayList
� � 8 A

� � B O
)
� � O P
{
� �  	
var
� �  
command
� �  
=
� �  
new
� �  

� �  +
(
� � + ,
)
� � , -
;
� � - .
command
� �  
.
� �  
CommandText
� �  
=
� �   !
nombreSp
� � " *
;
� � * +
command
� �  
.
� �  
CommandType
� �  
=
� �   !
CommandType
� � " -
.
� � - .
StoredProcedure
� � . =
;
� � = >
try
� �  
{
� �  
for
� �  
(
� �  
var
� �  
intContador
� �  $
=
� � % &
$num
� � ' (
;
� � ( )
intContador
� � * 5
<
� � 6 7

� � 8 E
.
� � E F
Count
� � F K
;
� � K L
intContador
� � M X
++
� � X Z
)
� � Z [
{
� �  
if
� �  
(
� �  

� �  %
[
� � % &
intContador
� � & 1
]
� � 1 2
==
� � 3 5
null
� � 6 :
)
� � : ;
{
� �  
command
� �  
.
� �   

Parameters
� �   *
.
� � * +
Add
� � + .
(
� � . /
new
� � / 2
NpgsqlParameter
� � 3 B
(
� � B C
$str
� � C F
+
� � G H
intContador
� � I T
,
� � T U
DBNull
� � V \
.
� � \ ]
Value
� � ] b
)
� � b c
)
� � c d
;
� � d e
}
� �  
else
� �  
{
� �  
switch
� �  
(
� �   

� �   -
[
� � - .
intContador
� � . 9
]
� � 9 :
.
� � : ;
GetType
� � ; B
(
� � B C
)
� � C D
.
� � D E
ToString
� � E M
(
� � M N
)
� � N O
)
� � O P
{
� �  
case
� �   
$str
� � ! /
:
� � / 0
case
� �   
$str
� � ! /
:
� � / 0
case
� �   
$str
� � ! 1
:
� � 1 2
if
� �   "
(
� � # $

� � $ 1
[
� � 1 2
intContador
� � 2 =
]
� � = >
==
� � ? A
null
� � B F
)
� � F G
{
� �   !
command
� � $ +
.
� � + ,

Parameters
� � , 6
.
� � 6 7
Add
� � 7 :
(
� � : ;
new
� � ; >
NpgsqlParameter
� � ? N
(
� � N O
$str
� � O R
+
� � S T
intContador
� � U `
,
� � ` a
NpgsqlDbType
� � b n
.
� � n o
Numeric
� � o v
,
� � v w
$num
� � x y
,
� � y z
$str
� � { }
,
� � } ~ 
ParameterDirection
� � O a
.
� � a b
Input
� � b g
,
� � g h
false
� � i n
,
� � n o
$num
� � p q
,
� � q r
$num
� � s t
,
� � t u
DataRowVersion
� � O ]
.
� � ] ^
Proposed
� � ^ f
,
� � f g
DBNull
� � O U
.
� � U V
Value
� � V [
)
� � [ \
)
� � \ ]
;
� � ] ^
}
� �   !
else
� �   $
{
� �   !
command
� � $ +
.
� � + ,

Parameters
� � , 6
.
� � 6 7
Add
� � 7 :
(
� � : ;
new
� � ; >
NpgsqlParameter
� � ? N
(
� � N O
$str
� � O R
+
� � S T
intContador
� � U `
,
� � ` a
NpgsqlDbType
� � b n
.
� � n o
Numeric
� � o v
,
� � v w
$num
� � x y
,
� � y z
$str
� � { }
,
� � } ~ 
ParameterDirection
� � O a
.
� � a b
Input
� � b g
,
� � g h
false
� � i n
,
� � n o
$num
� � p q
,
� � q r
$num
� � s t
,
� � t u
DataRowVersion
� � O ]
.
� � ] ^
Proposed
� � ^ f
,
� � f g

� � O \
[
� � \ ]
intContador
� � ] h
]
� � h i
)
� � i j
)
� � j k
;
� � k l
}
� �   !
break
� �   %
;
� � % &
case
�!�!  
$str
�!�!! 0
:
�!�!0 1
if
�!�!  "
(
�!�!# $

�!�!$ 1
[
�!�!1 2
intContador
�!�!2 =
]
�!�!= >
==
�!�!? A
null
�!�!B F
)
�!�!F G
{
�!�!  !
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
.
�!�!6 7
Add
�!�!7 :
(
�!�!: ;
new
�!�!; >
NpgsqlParameter
�!�!? N
(
�!�!N O
$str
�!�!O R
+
�!�!S T
intContador
�!�!U `
,
�!�!` a
DBNull
�!�!b h
.
�!�!h i
Value
�!�!i n
)
�!�!n o
)
�!�!o p
;
�!�!p q
}
�!�!  !
else
�!�!  $
{
�!�!  !
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
.
�!�!6 7
Add
�!�!7 :
(
�!�!: ;
new
�!�!; >
NpgsqlParameter
�!�!? N
(
�!�!N O
$str
�!�!O R
+
�!�!S T
intContador
�!�!U `
,
�!�!` a

�!�!O \
[
�!�!\ ]
intContador
�!�!] h
]
�!�!h i
)
�!�!i j
)
�!�!j k
;
�!�!k l
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
[
�!�!6 7
$str
�!�!7 :
+
�!�!; <
intContador
�!�!= H
]
�!�!H I
.
�!�!I J
NpgsqlDbType
�!�!J V
=
�!�!W X
NpgsqlDbType
�!�!Y e
.
�!�!e f
Text
�!�!f j
;
�!�!j k
}
�!�!  !
break
�!�!  %
;
�!�!% &
case
�!�!  
$str
�!�!! 2
:
�!�!2 3
if
�!�!  "
(
�!�!# $

�!�!$ 1
[
�!�!1 2
intContador
�!�!2 =
]
�!�!= >
==
�!�!? A
null
�!�!B F
)
�!�!F G
{
�!�!  !
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
.
�!�!6 7
Add
�!�!7 :
(
�!�!: ;
new
�!�!; >
NpgsqlParameter
�!�!? N
(
�!�!N O
$str
�!�!O R
+
�!�!S T
intContador
�!�!U `
,
�!�!` a
DBNull
�!�!b h
.
�!�!h i
Value
�!�!i n
)
�!�!n o
)
�!�!o p
;
�!�!p q
}
�!�!  !
else
�!�!  $
{
�!�!  !
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
.
�!�!6 7
Add
�!�!7 :
(
�!�!: ;
new
�!�!; >
NpgsqlParameter
�!�!? N
(
�!�!N O
$str
�!�!O R
+
�!�!S T
intContador
�!�!U `
,
�!�!` a

�!�!O \
[
�!�!\ ]
intContador
�!�!] h
]
�!�!h i
)
�!�!i j
)
�!�!j k
;
�!�!k l
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
[
�!�!6 7
$str
�!�!7 :
+
�!�!; <
intContador
�!�!= H
]
�!�!H I
.
�!�!I J
NpgsqlDbType
�!�!J V
=
�!�!W X
NpgsqlDbType
�!�!Y e
.
�!�!e f
	Timestamp
�!�!f o
;
�!�!o p
}
�!�!  !
break
�!�!  %
;
�!�!% &
case
�!�!  
$str
�!�!! =
:
�!�!= >
if
�!�!  "
(
�!�!# $

�!�!$ 1
[
�!�!1 2
intContador
�!�!2 =
]
�!�!= >
==
�!�!? A
null
�!�!B F
)
�!�!F G
{
�!�!  !
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
.
�!�!6 7
Add
�!�!7 :
(
�!�!: ;
new
�!�!; >
NpgsqlParameter
�!�!? N
(
�!�!N O
$str
�!�!O R
+
�!�!S T
intContador
�!�!U `
,
�!�!` a
DBNull
�!�!b h
.
�!�!h i
Value
�!�!i n
)
�!�!n o
)
�!�!o p
;
�!�!p q
}
�!�!  !
else
�!�!  $
{
�!�!  !
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
.
�!�!6 7
Add
�!�!7 :
(
�!�!: ;
new
�!�!; >
NpgsqlParameter
�!�!? N
(
�!�!N O
$str
�!�!O R
+
�!�!S T
intContador
�!�!U `
,
�!�!` a

�!�!O \
[
�!�!\ ]
intContador
�!�!] h
]
�!�!h i
)
�!�!i j
)
�!�!j k
;
�!�!k l
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
[
�!�!6 7
$str
�!�!7 :
+
�!�!; <
intContador
�!�!= H
]
�!�!H I
.
�!�!I J
NpgsqlDbType
�!�!J V
=
�!�!W X
NpgsqlDbType
�!�!Y e
.
�!�!e f
Bigint
�!�!f l
;
�!�!l m
}
�!�!  !
break
�!�!  %
;
�!�!% &
default
�!�! #
:
�!�!# $
if
�!�!  "
(
�!�!# $

�!�!$ 1
[
�!�!1 2
intContador
�!�!2 =
]
�!�!= >
==
�!�!? A
null
�!�!B F
)
�!�!F G
{
�!�!  !
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
.
�!�!6 7
Add
�!�!7 :
(
�!�!: ;
new
�!�!; >
NpgsqlParameter
�!�!? N
(
�!�!N O
$str
�!�!O R
+
�!�!S T
intContador
�!�!U `
,
�!�!` a
DBNull
�!�!O U
.
�!�!U V
Value
�!�!V [
)
�!�![ \
)
�!�!\ ]
;
�!�!] ^
}
�!�!  !
else
�!�!  $
{
�!�!  !
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
.
�!�!6 7
Add
�!�!7 :
(
�!�!: ;
new
�!�!; >
NpgsqlParameter
�!�!? N
(
�!�!N O
$str
�!�!O R
+
�!�!S T
intContador
�!�!U `
,
�!�!` a

�!�!O \
[
�!�!\ ]
intContador
�!�!] h
]
�!�!h i
)
�!�!i j
)
�!�!j k
;
�!�!k l
}
�!�!  !
break
�!�!  %
;
�!�!% &
}
�!�! 
}
�!�! 
}
�!�! 
command
�!�! 
.
�!�! 

Connection
�!�! "
=
�!�!# $

ConexionBd
�!�!% /
;
�!�!/ 0
command
�!�! 
.
�!�! 
ExecuteNonQuery
�!�! '
(
�!�!' (
)
�!�!( )
;
�!�!) *
command
�!�! 
.
�!�! 

Connection
�!�! "
.
�!�!" #
Close
�!�!# (
(
�!�!( )
)
�!�!) *
;
�!�!* +
command
�!�! 
.
�!�! 
Dispose
�!�! 
(
�!�!  
)
�!�!  !
;
�!�!! "
return
�!�! 
true
�!�! 
;
�!�! 
}
�!�! 
catch
�!�! 
(
�!�! 
	Exception
�!�! 
ex
�!�! 
)
�!�!  
{
�!�! 
ex
�!�! 
.
�!�! 
Data
�!�! 
.
�!�! 
Add
�!�! 
(
�!�! 
$str
�!�! -
,
�!�!- .
nombreSp
�!�!/ 7
)
�!�!7 8
;
�!�!8 9
throw
�!�! 
;
�!�! 
}
�!�! 
}
�!�! 	
public
�!�! 
bool
�!�!  
ExecStoreProcedure
�!�! &
(
�!�!& '
string
�!�!' -
nombreSp
�!�!. 6
,
�!�!6 7
	ArrayList
�!�!8 A

�!�!B O
,
�!�!O P
ref
�!�!Q T
CTrans
�!�!U [
myTrans
�!�!\ c
)
�!�!c d
{
�!�! 	
var
�!�! 
command
�!�! 
=
�!�! 
new
�!�! 

�!�! +
{
�!�! 
CommandText
�!�! 
=
�!�! 
nombreSp
�!�! &
,
�!�!& '
CommandType
�!�! 
=
�!�! 
CommandType
�!�! )
.
�!�!) *
StoredProcedure
�!�!* 9
}
�!�! 
;
�!�!
try
�!�! 
{
�!�! 
for
�!�! 
(
�!�! 
var
�!�! 
intContador
�!�! $
=
�!�!% &
$num
�!�!' (
;
�!�!( )
intContador
�!�!* 5
<
�!�!6 7

�!�!8 E
.
�!�!E F
Count
�!�!F K
;
�!�!K L
intContador
�!�!M X
++
�!�!X Z
)
�!�!Z [
{
�!�! 
if
�!�! 
(
�!�! 

�!�! %
[
�!�!% &
intContador
�!�!& 1
]
�!�!1 2
==
�!�!3 5
null
�!�!6 :
)
�!�!: ;
{
�!�! 
command
�!�! 
.
�!�!  

Parameters
�!�!  *
.
�!�!* +
Add
�!�!+ .
(
�!�!. /
new
�!�!/ 2
NpgsqlParameter
�!�!3 B
(
�!�!B C
$str
�!�!C F
+
�!�!G H
intContador
�!�!I T
,
�!�!T U
DBNull
�!�!V \
.
�!�!\ ]
Value
�!�!] b
)
�!�!b c
)
�!�!c d
;
�!�!d e
}
�!�! 
else
�!�! 
{
�!�! 
switch
�!�! 
(
�!�!  

�!�!  -
[
�!�!- .
intContador
�!�!. 9
]
�!�!9 :
.
�!�!: ;
GetType
�!�!; B
(
�!�!B C
)
�!�!C D
.
�!�!D E
ToString
�!�!E M
(
�!�!M N
)
�!�!N O
)
�!�!O P
{
�!�! 
case
�!�!  
$str
�!�!! /
:
�!�!/ 0
case
�!�!  
$str
�!�!! /
:
�!�!/ 0
case
�!�!  
$str
�!�!! 1
:
�!�!1 2
if
�!�!  "
(
�!�!# $

�!�!$ 1
[
�!�!1 2
intContador
�!�!2 =
]
�!�!= >
==
�!�!? A
null
�!�!B F
)
�!�!F G
{
�!�!  !
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
.
�!�!6 7
Add
�!�!7 :
(
�!�!: ;
new
�!�!; >
NpgsqlParameter
�!�!? N
(
�!�!N O
$str
�!�!O R
+
�!�!S T
intContador
�!�!U `
,
�!�!` a
NpgsqlDbType
�!�!b n
.
�!�!n o
Numeric
�!�!o v
,
�!�!v w
$num
�!�!x y
,
�!�!y z
$str
�!�!{ }
,
�!�!} ~ 
ParameterDirection
�!�!O a
.
�!�!a b
Input
�!�!b g
,
�!�!g h
false
�!�!i n
,
�!�!n o
$num
�!�!p q
,
�!�!q r
$num
�!�!s t
,
�!�!t u
DataRowVersion
�!�!O ]
.
�!�!] ^
Proposed
�!�!^ f
,
�!�!f g
DBNull
�!�!O U
.
�!�!U V
Value
�!�!V [
)
�!�![ \
)
�!�!\ ]
;
�!�!] ^
}
�!�!  !
else
�!�!  $
{
�!�!  !
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
.
�!�!6 7
Add
�!�!7 :
(
�!�!: ;
new
�!�!; >
NpgsqlParameter
�!�!? N
(
�!�!N O
$str
�!�!O R
+
�!�!S T
intContador
�!�!U `
,
�!�!` a
NpgsqlDbType
�!�!b n
.
�!�!n o
Numeric
�!�!o v
,
�!�!v w
$num
�!�!x y
,
�!�!y z
$str
�!�!{ }
,
�!�!} ~ 
ParameterDirection
�!�!O a
.
�!�!a b
Input
�!�!b g
,
�!�!g h
false
�!�!i n
,
�!�!n o
$num
�!�!p q
,
�!�!q r
$num
�!�!s t
,
�!�!t u
DataRowVersion
�!�!O ]
.
�!�!] ^
Proposed
�!�!^ f
,
�!�!f g

�!�!O \
[
�!�!\ ]
intContador
�!�!] h
]
�!�!h i
)
�!�!i j
)
�!�!j k
;
�!�!k l
}
�!�!  !
break
�!�!  %
;
�!�!% &
case
�!�!  
$str
�!�!! 0
:
�!�!0 1
if
�!�!  "
(
�!�!# $

�!�!$ 1
[
�!�!1 2
intContador
�!�!2 =
]
�!�!= >
==
�!�!? A
null
�!�!B F
)
�!�!F G
{
�!�!  !
command
�!�!$ +
.
�!�!+ ,

Parameters
�!�!, 6
.
�!�!6 7
Add
�!�!7 :
(
�!�!: ;
new
�!�!; >
NpgsqlParameter
�!�!? N
(
�!�!N O
$str
�!�!O R
+
�!�!S T
intContador
�!�!U `
,
�!�!` a
DBNull
�!�!b h
.
�!�!h i
Value
�!�!i n
)
�!�!n o
)
�!�!o p
;
�!�!p q
}
�!�!  !
else
�"�"  $
{
�"�"  !
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
.
�"�"6 7
Add
�"�"7 :
(
�"�": ;
new
�"�"; >
NpgsqlParameter
�"�"? N
(
�"�"N O
$str
�"�"O R
+
�"�"S T
intContador
�"�"U `
,
�"�"` a

�"�"O \
[
�"�"\ ]
intContador
�"�"] h
]
�"�"h i
)
�"�"i j
)
�"�"j k
;
�"�"k l
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
[
�"�"6 7
$str
�"�"7 :
+
�"�"; <
intContador
�"�"= H
]
�"�"H I
.
�"�"I J
NpgsqlDbType
�"�"J V
=
�"�"W X
NpgsqlDbType
�"�"Y e
.
�"�"e f
Text
�"�"f j
;
�"�"j k
}
�"�"  !
break
�"�"  %
;
�"�"% &
case
�"�"  
$str
�"�"! 2
:
�"�"2 3
if
�"�"  "
(
�"�"# $

�"�"$ 1
[
�"�"1 2
intContador
�"�"2 =
]
�"�"= >
==
�"�"? A
null
�"�"B F
)
�"�"F G
{
�"�"  !
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
.
�"�"6 7
Add
�"�"7 :
(
�"�": ;
new
�"�"; >
NpgsqlParameter
�"�"? N
(
�"�"N O
$str
�"�"O R
+
�"�"S T
intContador
�"�"U `
,
�"�"` a
DBNull
�"�"b h
.
�"�"h i
Value
�"�"i n
)
�"�"n o
)
�"�"o p
;
�"�"p q
}
�"�"  !
else
�"�"  $
{
�"�"  !
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
.
�"�"6 7
Add
�"�"7 :
(
�"�": ;
new
�"�"; >
NpgsqlParameter
�"�"? N
(
�"�"N O
$str
�"�"O R
+
�"�"S T
intContador
�"�"U `
,
�"�"` a

�"�"O \
[
�"�"\ ]
intContador
�"�"] h
]
�"�"h i
)
�"�"i j
)
�"�"j k
;
�"�"k l
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
[
�"�"6 7
$str
�"�"7 :
+
�"�"; <
intContador
�"�"= H
]
�"�"H I
.
�"�"I J
NpgsqlDbType
�"�"J V
=
�"�"W X
NpgsqlDbType
�"�"Y e
.
�"�"e f
	Timestamp
�"�"f o
;
�"�"o p
}
�"�"  !
break
�"�"  %
;
�"�"% &
case
�"�"  
$str
�"�"! =
:
�"�"= >
if
�"�"  "
(
�"�"# $

�"�"$ 1
[
�"�"1 2
intContador
�"�"2 =
]
�"�"= >
==
�"�"? A
null
�"�"B F
)
�"�"F G
{
�"�"  !
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
.
�"�"6 7
Add
�"�"7 :
(
�"�": ;
new
�"�"; >
NpgsqlParameter
�"�"? N
(
�"�"N O
$str
�"�"O R
+
�"�"S T
intContador
�"�"U `
,
�"�"` a
DBNull
�"�"b h
.
�"�"h i
Value
�"�"i n
)
�"�"n o
)
�"�"o p
;
�"�"p q
}
�"�"  !
else
�"�"  $
{
�"�"  !
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
.
�"�"6 7
Add
�"�"7 :
(
�"�": ;
new
�"�"; >
NpgsqlParameter
�"�"? N
(
�"�"N O
$str
�"�"O R
+
�"�"S T
intContador
�"�"U `
,
�"�"` a

�"�"O \
[
�"�"\ ]
intContador
�"�"] h
]
�"�"h i
)
�"�"i j
)
�"�"j k
;
�"�"k l
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
[
�"�"6 7
$str
�"�"7 :
+
�"�"; <
intContador
�"�"= H
]
�"�"H I
.
�"�"I J
NpgsqlDbType
�"�"J V
=
�"�"W X
NpgsqlDbType
�"�"Y e
.
�"�"e f
Bigint
�"�"f l
;
�"�"l m
}
�"�"  !
break
�"�"  %
;
�"�"% &
default
�"�" #
:
�"�"# $
if
�"�"  "
(
�"�"# $

�"�"$ 1
[
�"�"1 2
intContador
�"�"2 =
]
�"�"= >
==
�"�"? A
null
�"�"B F
)
�"�"F G
{
�"�"  !
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
.
�"�"6 7
Add
�"�"7 :
(
�"�": ;
new
�"�"; >
NpgsqlParameter
�"�"? N
(
�"�"N O
$str
�"�"O R
+
�"�"S T
intContador
�"�"U `
,
�"�"` a
DBNull
�"�"O U
.
�"�"U V
Value
�"�"V [
)
�"�"[ \
)
�"�"\ ]
;
�"�"] ^
}
�"�"  !
else
�"�"  $
{
�"�"  !
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
.
�"�"6 7
Add
�"�"7 :
(
�"�": ;
new
�"�"; >
NpgsqlParameter
�"�"? N
(
�"�"N O
$str
�"�"O R
+
�"�"S T
intContador
�"�"U `
,
�"�"` a

�"�"O \
[
�"�"\ ]
intContador
�"�"] h
]
�"�"h i
)
�"�"i j
)
�"�"j k
;
�"�"k l
}
�"�"  !
break
�"�"  %
;
�"�"% &
}
�"�" 
}
�"�" 
}
�"�" 
command
�"�" 
.
�"�" 

Connection
�"�" "
=
�"�"# $
myTrans
�"�"% ,
.
�"�", -
MyConn
�"�"- 3
;
�"�"3 4
command
�"�" 
.
�"�" 
ExecuteNonQuery
�"�" '
(
�"�"' (
)
�"�"( )
;
�"�") *
command
�"�" 
.
�"�" 

Connection
�"�" "
.
�"�"" #
Close
�"�"# (
(
�"�"( )
)
�"�") *
;
�"�"* +
command
�"�" 
.
�"�" 
Dispose
�"�" 
(
�"�"  
)
�"�"  !
;
�"�"! "
return
�"�" 
true
�"�" 
;
�"�" 
}
�"�" 
catch
�"�" 
(
�"�" 
	Exception
�"�" 
ex
�"�" 
)
�"�"  
{
�"�" 
ex
�"�" 
.
�"�" 
Data
�"�" 
.
�"�" 
Add
�"�" 
(
�"�" 
$str
�"�" -
,
�"�"- .
nombreSp
�"�"/ 7
)
�"�"7 8
;
�"�"8 9
throw
�"�" 
;
�"�" 
}
�"�" 
}
�"�" 	
public
�"�" 
int
�"�"  
ExecStoreProcedure
�"�" %
(
�"�"% &
string
�"�"& ,
nombreSp
�"�"- 5
,
�"�"5 6
	ArrayList
�"�"7 @!
arrNombreParametros
�"�"A T
,
�"�"T U
	ArrayList
�"�"V _

�"�"` m
)
�"�"m n
{
�"�" 	
var
�"�" 
command
�"�" 
=
�"�" 
new
�"�" 

�"�" +
(
�"�"+ ,
)
�"�", -
;
�"�"- .
command
�"�" 
.
�"�" 
CommandText
�"�" 
=
�"�"  !
nombreSp
�"�"" *
;
�"�"* +
command
�"�" 
.
�"�" 
CommandType
�"�" 
=
�"�"  !
CommandType
�"�"" -
.
�"�"- .
StoredProcedure
�"�". =
;
�"�"= >
try
�"�" 
{
�"�" 
for
�"�" 
(
�"�" 
var
�"�" 
intContador
�"�" $
=
�"�"% &
$num
�"�"' (
;
�"�"( )
intContador
�"�"* 5
<
�"�"6 7

�"�"8 E
.
�"�"E F
Count
�"�"F K
;
�"�"K L
intContador
�"�"M X
++
�"�"X Z
)
�"�"Z [
{
�"�" 
if
�"�" 
(
�"�" 

�"�" %
[
�"�"% &
intContador
�"�"& 1
]
�"�"1 2
==
�"�"3 5
null
�"�"6 :
)
�"�": ;
{
�"�" 
command
�"�" 
.
�"�"  

Parameters
�"�"  *
.
�"�"* +
Add
�"�"+ .
(
�"�". /
new
�"�"/ 2
NpgsqlParameter
�"�"3 B
(
�"�"B C
$str
�"�"C F
+
�"�"G H!
arrNombreParametros
�"�"I \
[
�"�"\ ]
intContador
�"�"] h
]
�"�"h i
,
�"�"i j
DBNull
�"�"k q
.
�"�"q r
Value
�"�"r w
)
�"�"w x
)
�"�"x y
;
�"�"y z
command
�"�" 
.
�"�"  

Parameters
�"�"  *
[
�"�"* +
$str
�"�"+ .
+
�"�"/ 0!
arrNombreParametros
�"�"1 D
[
�"�"D E
intContador
�"�"E P
]
�"�"P Q
]
�"�"Q R
.
�"�"R S
NpgsqlDbType
�"�"S _
=
�"�"` a
NpgsqlDbType
�"�"b n
.
�"�"n o
Text
�"�"o s
;
�"�"s t
}
�"�" 
else
�"�" 
{
�"�" 
switch
�"�" 
(
�"�"  

�"�"  -
[
�"�"- .
intContador
�"�". 9
]
�"�"9 :
.
�"�": ;
GetType
�"�"; B
(
�"�"B C
)
�"�"C D
.
�"�"D E
ToString
�"�"E M
(
�"�"M N
)
�"�"N O
)
�"�"O P
{
�"�" 
case
�"�"  
$str
�"�"! 0
:
�"�"0 1
if
�"�"  "
(
�"�"# $

�"�"$ 1
[
�"�"1 2
intContador
�"�"2 =
]
�"�"= >
==
�"�"? A
null
�"�"B F
)
�"�"F G
{
�"�"  !
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
.
�"�"6 7
Add
�"�"7 :
(
�"�": ;
new
�"�"; >
NpgsqlParameter
�"�"? N
(
�"�"N O
$str
�"�"O R
+
�"�"S T!
arrNombreParametros
�"�"U h
[
�"�"h i
intContador
�"�"i t
]
�"�"t u
,
�"�"u v
DBNull
�"�"w }
.
�"�"} ~
Value�"�"~ �
)�"�"� �
)�"�"� �
;�"�"� �
}
�"�"  !
else
�"�"  $
{
�"�"  !
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
.
�"�"6 7
Add
�"�"7 :
(
�"�": ;
new
�"�"; >
NpgsqlParameter
�"�"? N
(
�"�"N O
$str
�"�"O R
+
�"�"S T!
arrNombreParametros
�"�"U h
[
�"�"h i
intContador
�"�"i t
]
�"�"t u
,
�"�"u v

[�"�"� �
intContador�"�"� �
]�"�"� �
)�"�"� �
)�"�"� �
;�"�"� �
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
[
�"�"6 7
$str
�"�"7 :
+
�"�"; <!
arrNombreParametros
�"�"= P
[
�"�"P Q
intContador
�"�"Q \
]
�"�"\ ]
]
�"�"] ^
.
�"�"^ _
NpgsqlDbType
�"�"_ k
=
�"�"l m
NpgsqlDbType
�"�"n z
.
�"�"z {
Bytea�"�"{ �
;�"�"� �
}
�"�"  !
break
�"�"  %
;
�"�"% &
case
�"�"  
$str
�"�"! /
:
�"�"/ 0
case
�"�"  
$str
�"�"! /
:
�"�"/ 0
case
�"�"  
$str
�"�"! 1
:
�"�"1 2
if
�"�"  "
(
�"�"# $

�"�"$ 1
[
�"�"1 2
intContador
�"�"2 =
]
�"�"= >
==
�"�"? A
null
�"�"B F
)
�"�"F G
{
�"�"  !
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
.
�"�"6 7
Add
�"�"7 :
(
�"�": ;
new
�"�"; >
NpgsqlParameter
�"�"? N
(
�"�"N O
$str
�"�"O R
+
�"�"S T!
arrNombreParametros
�"�"U h
[
�"�"h i
intContador
�"�"i t
]
�"�"t u
,
�"�"u v
NpgsqlDbType�"�"w �
.�"�"� �
Numeric�"�"� �
,�"�"� �
$num�"�"� �
,�"�"� �
$str�"�"� �
,�"�"� � 
ParameterDirection
�"�"O a
.
�"�"a b
Input
�"�"b g
,
�"�"g h
false
�"�"i n
,
�"�"n o
$num
�"�"p q
,
�"�"q r
$num
�"�"s t
,
�"�"t u
DataRowVersion
�"�"O ]
.
�"�"] ^
Proposed
�"�"^ f
,
�"�"f g
DBNull
�"�"O U
.
�"�"U V
Value
�"�"V [
)
�"�"[ \
)
�"�"\ ]
;
�"�"] ^
}
�"�"  !
else
�"�"  $
{
�"�"  !
command
�"�"$ +
.
�"�"+ ,

Parameters
�"�", 6
.
�"�"6 7
Add
�"�"7 :
(
�"�": ;
new
�"�"; >
NpgsqlParameter
�"�"? N
(
�"�"N O
$str
�"�"O R
+
�"�"S T!
arrNombreParametros
�"�"U h
[
�"�"h i
intContador
�"�"i t
]
�"�"t u
,
�"�"u v
NpgsqlDbType�"�"w �
.�"�"� �
Numeric�"�"� �
,�"�"� �
$num�"�"� �
,�"�"� �
$str�"�"� �
,�"�"� � 
ParameterDirection
�"�"O a
.
�"�"a b
Input
�"�"b g
,
�"�"g h
false
�"�"i n
,
�"�"n o
$num
�"�"p q
,
�"�"q r
$num
�"�"s t
,
�"�"t u
DataRowVersion
�"�"O ]
.
�"�"] ^
Proposed
�"�"^ f
,
�"�"f g

�"�"O \
[
�"�"\ ]
intContador
�"�"] h
]
�"�"h i
)
�"�"i j
)
�"�"j k
;
�"�"k l
}
�"�"  !
break
�"�"  %
;
�"�"% &
case
�#�#  
$str
�#�#! 0
:
�#�#0 1
if
�#�#  "
(
�#�## $

�#�#$ 1
[
�#�#1 2
intContador
�#�#2 =
]
�#�#= >
==
�#�#? A
null
�#�#B F
)
�#�#F G
{
�#�#  !
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
.
�#�#6 7
Add
�#�#7 :
(
�#�#: ;
new
�#�#; >
NpgsqlParameter
�#�#? N
(
�#�#N O
$str
�#�#O R
+
�#�#S T!
arrNombreParametros
�#�#U h
[
�#�#h i
intContador
�#�#i t
]
�#�#t u
,
�#�#u v
DBNull
�#�#w }
.
�#�#} ~
Value�#�#~ �
)�#�#� �
)�#�#� �
;�#�#� �
}
�#�#  !
else
�#�#  $
{
�#�#  !
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
.
�#�#6 7
Add
�#�#7 :
(
�#�#: ;
new
�#�#; >
NpgsqlParameter
�#�#? N
(
�#�#N O
$str
�#�#O R
+
�#�#S T!
arrNombreParametros
�#�#U h
[
�#�#h i
intContador
�#�#i t
]
�#�#t u
,
�#�#u v

�#�#O \
[
�#�#\ ]
intContador
�#�#] h
]
�#�#h i
)
�#�#i j
)
�#�#j k
;
�#�#k l
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
[
�#�#6 7
$str
�#�#7 :
+
�#�#; <!
arrNombreParametros
�#�#= P
[
�#�#P Q
intContador
�#�#Q \
]
�#�#\ ]
]
�#�#] ^
.
�#�#^ _
NpgsqlDbType
�#�#_ k
=
�#�#l m
NpgsqlDbType
�#�#n z
.
�#�#z {
Text
�#�#{ 
;�#�# �
}
�#�#  !
break
�#�#  %
;
�#�#% &
case
�#�#  
$str
�#�#! 2
:
�#�#2 3
if
�#�#  "
(
�#�## $

�#�#$ 1
[
�#�#1 2
intContador
�#�#2 =
]
�#�#= >
==
�#�#? A
null
�#�#B F
)
�#�#F G
{
�#�#  !
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
.
�#�#6 7
Add
�#�#7 :
(
�#�#: ;
new
�#�#; >
NpgsqlParameter
�#�#? N
(
�#�#N O
$str
�#�#O R
+
�#�#S T!
arrNombreParametros
�#�#U h
[
�#�#h i
intContador
�#�#i t
]
�#�#t u
,
�#�#u v
DBNull
�#�#w }
.
�#�#} ~
Value�#�#~ �
)�#�#� �
)�#�#� �
;�#�#� �
}
�#�#  !
else
�#�#  $
{
�#�#  !
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
.
�#�#6 7
Add
�#�#7 :
(
�#�#: ;
new
�#�#; >
NpgsqlParameter
�#�#? N
(
�#�#N O
$str
�#�#O R
+
�#�#S T!
arrNombreParametros
�#�#U h
[
�#�#h i
intContador
�#�#i t
]
�#�#t u
,
�#�#u v

�#�#O \
[
�#�#\ ]
intContador
�#�#] h
]
�#�#h i
)
�#�#i j
)
�#�#j k
;
�#�#k l
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
[
�#�#6 7
$str
�#�#7 :
+
�#�#; <!
arrNombreParametros
�#�#= P
[
�#�#P Q
intContador
�#�#Q \
]
�#�#\ ]
]
�#�#] ^
.
�#�#^ _
NpgsqlDbType
�#�#_ k
=
�#�#l m
NpgsqlDbType
�#�#n z
.
�#�#z {
	Timestamp�#�#{ �
;�#�#� �
}
�#�#  !
break
�#�#  %
;
�#�#% &
case
�#�#  
$str
�#�#! =
:
�#�#= >
if
�#�#  "
(
�#�## $

�#�#$ 1
[
�#�#1 2
intContador
�#�#2 =
]
�#�#= >
==
�#�#? A
null
�#�#B F
)
�#�#F G
{
�#�#  !
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
.
�#�#6 7
Add
�#�#7 :
(
�#�#: ;
new
�#�#; >
NpgsqlParameter
�#�#? N
(
�#�#N O
$str
�#�#O R
+
�#�#S T!
arrNombreParametros
�#�#U h
[
�#�#h i
intContador
�#�#i t
]
�#�#t u
,
�#�#u v
DBNull
�#�#w }
.
�#�#} ~
Value�#�#~ �
)�#�#� �
)�#�#� �
;�#�#� �
}
�#�#  !
else
�#�#  $
{
�#�#  !
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
.
�#�#6 7
Add
�#�#7 :
(
�#�#: ;
new
�#�#; >
NpgsqlParameter
�#�#? N
(
�#�#N O
$str
�#�#O R
+
�#�#S T!
arrNombreParametros
�#�#U h
[
�#�#h i
intContador
�#�#i t
]
�#�#t u
,
�#�#u v

�#�#O \
[
�#�#\ ]
intContador
�#�#] h
]
�#�#h i
)
�#�#i j
)
�#�#j k
;
�#�#k l
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
[
�#�#6 7
$str
�#�#7 :
+
�#�#; <!
arrNombreParametros
�#�#= P
[
�#�#P Q
intContador
�#�#Q \
]
�#�#\ ]
]
�#�#] ^
.
�#�#^ _
NpgsqlDbType
�#�#_ k
=
�#�#l m
NpgsqlDbType
�#�#n z
.
�#�#z {
Bigint�#�#{ �
;�#�#� �
}
�#�#  !
break
�#�#  %
;
�#�#% &
default
�#�# #
:
�#�## $
if
�#�#  "
(
�#�## $

�#�#$ 1
[
�#�#1 2
intContador
�#�#2 =
]
�#�#= >
==
�#�#? A
null
�#�#B F
)
�#�#F G
{
�#�#  !
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
.
�#�#6 7
Add
�#�#7 :
(
�#�#: ;
new
�#�#; >
NpgsqlParameter
�#�#? N
(
�#�#N O
$str
�#�#O R
+
�#�#S T!
arrNombreParametros
�#�#U h
[
�#�#h i
intContador
�#�#i t
]
�#�#t u
,
�#�#u v
DBNull
�#�#O U
.
�#�#U V
Value
�#�#V [
)
�#�#[ \
)
�#�#\ ]
;
�#�#] ^
}
�#�#  !
else
�#�#  $
{
�#�#  !
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
.
�#�#6 7
Add
�#�#7 :
(
�#�#: ;
new
�#�#; >
NpgsqlParameter
�#�#? N
(
�#�#N O
$str
�#�#O R
+
�#�#S T!
arrNombreParametros
�#�#U h
[
�#�#h i
intContador
�#�#i t
]
�#�#t u
,
�#�#u v

[�#�#� �
intContador�#�#� �
]�#�#� �
)�#�#� �
)�#�#� �
;�#�#� �
}
�#�#  !
break
�#�#  %
;
�#�#% &
}
�#�# 
}
�#�# 
}
�#�# 
command
�#�# 
.
�#�# 

Connection
�#�# "
=
�#�## $

ConexionBd
�#�#% /
;
�#�#/ 0
command
�#�# 
.
�#�# 

Connection
�#�# "
.
�#�#" #
Open
�#�## '
(
�#�#' (
)
�#�#( )
;
�#�#) *
var
�#�# 
intRes
�#�# 
=
�#�# 
command
�#�# $
.
�#�#$ %
ExecuteNonQuery
�#�#% 4
(
�#�#4 5
)
�#�#5 6
;
�#�#6 7
command
�#�# 
.
�#�# 

Connection
�#�# "
.
�#�#" #
Close
�#�## (
(
�#�#( )
)
�#�#) *
;
�#�#* +
command
�#�# 
.
�#�# 
Dispose
�#�# 
(
�#�#  
)
�#�#  !
;
�#�#! "
return
�#�# 
intRes
�#�# 
;
�#�# 
}
�#�# 
catch
�#�# 
(
�#�# 
	Exception
�#�# 
ex
�#�# 
)
�#�#  
{
�#�# 
ex
�#�# 
.
�#�# 
Data
�#�# 
.
�#�# 
Add
�#�# 
(
�#�# 
$str
�#�# -
,
�#�#- .
nombreSp
�#�#/ 7
)
�#�#7 8
;
�#�#8 9
throw
�#�# 
;
�#�# 
}
�#�# 
}
�#�# 	
public
�#�# 
int
�#�#  
ExecStoreProcedure
�#�# %
(
�#�#% &
string
�#�#& ,
nombreSp
�#�#- 5
,
�#�#5 6
	ArrayList
�#�#7 @!
arrNombreParametros
�#�#A T
,
�#�#T U
	ArrayList
�#�#V _

�#�#` m
,
�#�#m n
ref
�#�#& )
CTrans
�#�#* 0
trans
�#�#1 6
)
�#�#6 7
{
�#�# 	
var
�#�# 
command
�#�# 
=
�#�# 
new
�#�# 

�#�# +
(
�#�#+ ,
)
�#�#, -
;
�#�#- .
command
�#�# 
.
�#�# 
CommandText
�#�# 
=
�#�#  !
nombreSp
�#�#" *
;
�#�#* +
command
�#�# 
.
�#�# 
CommandType
�#�# 
=
�#�#  !
CommandType
�#�#" -
.
�#�#- .
StoredProcedure
�#�#. =
;
�#�#= >
try
�#�# 
{
�#�# 
for
�#�# 
(
�#�# 
var
�#�# 
intContador
�#�# $
=
�#�#% &
$num
�#�#' (
;
�#�#( )
intContador
�#�#* 5
<
�#�#6 7

�#�#8 E
.
�#�#E F
Count
�#�#F K
;
�#�#K L
intContador
�#�#M X
++
�#�#X Z
)
�#�#Z [
{
�#�# 
if
�#�# 
(
�#�# 

�#�# %
[
�#�#% &
intContador
�#�#& 1
]
�#�#1 2
==
�#�#3 5
null
�#�#6 :
)
�#�#: ;
{
�#�# 
command
�#�# 
.
�#�#  

Parameters
�#�#  *
.
�#�#* +
Add
�#�#+ .
(
�#�#. /
new
�#�#/ 2
NpgsqlParameter
�#�#3 B
(
�#�#B C
$str
�#�#C F
+
�#�#G H!
arrNombreParametros
�#�#I \
[
�#�#\ ]
intContador
�#�#] h
]
�#�#h i
,
�#�#i j
DBNull
�#�#C I
.
�#�#I J
Value
�#�#J O
)
�#�#O P
)
�#�#P Q
;
�#�#Q R
}
�#�# 
else
�#�# 
{
�#�# 
switch
�#�# 
(
�#�#  

�#�#  -
[
�#�#- .
intContador
�#�#. 9
]
�#�#9 :
.
�#�#: ;
GetType
�#�#; B
(
�#�#B C
)
�#�#C D
.
�#�#D E
ToString
�#�#E M
(
�#�#M N
)
�#�#N O
)
�#�#O P
{
�#�# 
case
�#�#  
$str
�#�#! 0
:
�#�#0 1
if
�#�#  "
(
�#�## $

�#�#$ 1
[
�#�#1 2
intContador
�#�#2 =
]
�#�#= >
==
�#�#? A
null
�#�#B F
)
�#�#F G
{
�#�#  !
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
.
�#�#6 7
Add
�#�#7 :
(
�#�#: ;
new
�#�#; >
NpgsqlParameter
�#�#? N
(
�#�#N O
$str
�#�#O R
+
�#�#S T!
arrNombreParametros
�#�#U h
[
�#�#h i
intContador
�#�#i t
]
�#�#t u
,
�#�#u v
DBNull
�#�#w }
.
�#�#} ~
Value�#�#~ �
)�#�#� �
)�#�#� �
;�#�#� �
}
�#�#  !
else
�#�#  $
{
�#�#  !
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
.
�#�#6 7
Add
�#�#7 :
(
�#�#: ;
new
�#�#; >
NpgsqlParameter
�#�#? N
(
�#�#N O
$str
�#�#O R
+
�#�#S T!
arrNombreParametros
�#�#U h
[
�#�#h i
intContador
�#�#i t
]
�#�#t u
,
�#�#u v

[�#�#� �
intContador�#�#� �
]�#�#� �
)�#�#� �
)�#�#� �
;�#�#� �
command
�#�#$ +
.
�#�#+ ,

Parameters
�#�#, 6
[
�#�#6 7
$str
�#�#7 :
+
�#�#; <!
arrNombreParametros
�#�#= P
[
�#�#P Q
intContador
�#�#Q \
]
�#�#\ ]
]
�#�#] ^
.
�#�#^ _
NpgsqlDbType
�#�#_ k
=
�#�#l m
NpgsqlDbType
�#�#n z
.
�#�#z {
Bytea�#�#{ �
;�#�#� �
}
�#�#  !
break
�#�#  %
;
�#�#% &
case
�#�#  
$str
�#�#! /
:
�#�#/ 0
case
�#�#  
$str
�#�#! /
:
�#�#/ 0
case
�#�#  
$str
�#�#! 1
:
�#�#1 2
if
�#�#  "
(
�#�## $

�#�#$ 1
[
�#�#1 2
intContador
�#�#2 =
]
�#�#= >
==
�#�#? A
null
�#�#B F
)
�#�#F G
{
�#�#  !
command
�$�$$ +
.
�$�$+ ,

Parameters
�$�$, 6
.
�$�$6 7
Add
�$�$7 :
(
�$�$: ;
new
�$�$; >
NpgsqlParameter
�$�$? N
(
�$�$N O
$str
�$�$O R
+
�$�$S T!
arrNombreParametros
�$�$U h
[
�$�$h i
intContador
�$�$i t
]
�$�$t u
,
�$�$u v
NpgsqlDbType�$�$w �
.�$�$� �
Numeric�$�$� �
,�$�$� �
$num�$�$� �
,�$�$� �
$str�$�$� �
,�$�$� � 
ParameterDirection
�$�$O a
.
�$�$a b
Input
�$�$b g
,
�$�$g h
false
�$�$i n
,
�$�$n o
$num
�$�$p q
,
�$�$q r
$num
�$�$s t
,
�$�$t u
DataRowVersion
�$�$O ]
.
�$�$] ^
Proposed
�$�$^ f
,
�$�$f g
DBNull
�$�$O U
.
�$�$U V
Value
�$�$V [
)
�$�$[ \
)
�$�$\ ]
;
�$�$] ^
}
�$�$  !
else
�$�$  $
{
�$�$  !
command
�$�$$ +
.
�$�$+ ,

Parameters
�$�$, 6
.
�$�$6 7
Add
�$�$7 :
(
�$�$: ;
new
�$�$; >
NpgsqlParameter
�$�$? N
(
�$�$N O
$str
�$�$O R
+
�$�$S T!
arrNombreParametros
�$�$U h
[
�$�$h i
intContador
�$�$i t
]
�$�$t u
,
�$�$u v
NpgsqlDbType�$�$w �
.�$�$� �
Numeric�$�$� �
,�$�$� �
$num�$�$� �
,�$�$� �
$str�$�$� �
,�$�$� � 
ParameterDirection
�$�$O a
.
�$�$a b
Input
�$�$b g
,
�$�$g h
false
�$�$i n
,
�$�$n o
$num
�$�$p q
,
�$�$q r
$num
�$�$s t
,
�$�$t u
DataRowVersion
�$�$O ]
.
�$�$] ^
Proposed
�$�$^ f
,
�$�$f g

�$�$O \
[
�$�$\ ]
intContador
�$�$] h
]
�$�$h i
)
�$�$i j
)
�$�$j k
;
�$�$k l
}
�$�$  !
break
�$�$  %
;
�$�$% &
case
�$�$  
$str
�$�$! 0
:
�$�$0 1
if
�$�$  "
(
�$�$# $

�$�$$ 1
[
�$�$1 2
intContador
�$�$2 =
]
�$�$= >
==
�$�$? A
null
�$�$B F
)
�$�$F G
{
�$�$  !
command
�$�$$ +
.
�$�$+ ,

Parameters
�$�$, 6
.
�$�$6 7
Add
�$�$7 :
(
�$�$: ;
new
�$�$; >
NpgsqlParameter
�$�$? N
(
�$�$N O
$str
�$�$O R
+
�$�$S T!
arrNombreParametros
�$�$U h
[
�$�$h i
intContador
�$�$i t
]
�$�$t u
,
�$�$u v
DBNull
�$�$w }
.
�$�$} ~
Value�$�$~ �
)�$�$� �
)�$�$� �
;�$�$� �
}
�$�$  !
else
�$�$  $
{
�$�$  !
command
�$�$$ +
.
�$�$+ ,

Parameters
�$�$, 6
.
�$�$6 7
Add
�$�$7 :
(
�$�$: ;
new
�$�$; >
NpgsqlParameter
�$�$? N
(
�$�$N O
$str
�$�$O R
+
�$�$S T!
arrNombreParametros
�$�$U h
[
�$�$h i
intContador
�$�$i t
]
�$�$t u
,
�$�$u v

�$�$O \
[
�$�$\ ]
intContador
�$�$] h
]
�$�$h i
)
�$�$i j
)
�$�$j k
;
�$�$k l
command
�$�$$ +
.
�$�$+ ,

Parameters
�$�$, 6
[
�$�$6 7
$str
�$�$7 :
+
�$�$; <!
arrNombreParametros
�$�$= P
[
�$�$P Q
intContador
�$�$Q \
]
�$�$\ ]
]
�$�$] ^
.
�$�$^ _
NpgsqlDbType
�$�$_ k
=
�$�$l m
NpgsqlDbType
�$�$n z
.
�$�$z {
Text
�$�${ 
;�$�$ �
}
�$�$  !
break
�$�$  %
;
�$�$% &
case
�$�$  
$str
�$�$! 2
:
�$�$2 3
if
�$�$  "
(
�$�$# $

�$�$$ 1
[
�$�$1 2
intContador
�$�$2 =
]
�$�$= >
==
�$�$? A
null
�$�$B F
)
�$�$F G
{
�$�$  !
command
�$�$$ +
.
�$�$+ ,

Parameters
�$�$, 6
.
�$�$6 7
Add
�$�$7 :
(
�$�$: ;
new
�$�$; >
NpgsqlParameter
�$�$? N
(
�$�$N O
$str
�$�$O R
+
�$�$S T!
arrNombreParametros
�$�$U h
[
�$�$h i
intContador
�$�$i t
]
�$�$t u
,
�$�$u v
DBNull
�$�$w }
.
�$�$} ~
Value�$�$~ �
)�$�$� �
)�$�$� �
;�$�$� �
}
�$�$  !
else
�$�$  $
{
�$�$  !
command
�$�$$ +
.
�$�$+ ,

Parameters
�$�$, 6
.
�$�$6 7
Add
�$�$7 :
(
�$�$: ;
new
�$�$; >
NpgsqlParameter
�$�$? N
(
�$�$N O
$str
�$�$O R
+
�$�$S T!
arrNombreParametros
�$�$U h
[
�$�$h i
intContador
�$�$i t
]
�$�$t u
,
�$�$u v

�$�$O \
[
�$�$\ ]
intContador
�$�$] h
]
�$�$h i
)
�$�$i j
)
�$�$j k
;
�$�$k l
command
�$�$$ +
.
�$�$+ ,

Parameters
�$�$, 6
[
�$�$6 7
$str
�$�$7 :
+
�$�$; <!
arrNombreParametros
�$�$= P
[
�$�$P Q
intContador
�$�$Q \
]
�$�$\ ]
]
�$�$] ^
.
�$�$^ _
NpgsqlDbType
�$�$_ k
=
�$�$l m
NpgsqlDbType
�$�$n z
.
�$�$z {
	Timestamp�$�${ �
;�$�$� �
}
�$�$  !
break
�$�$  %
;
�$�$% &
case
�$�$  
$str
�$�$! =
:
�$�$= >
if
�$�$  "
(
�$�$# $

�$�$$ 1
[
�$�$1 2
intContador
�$�$2 =
]
�$�$= >
==
�$�$? A
null
�$�$B F
)
�$�$F G
{
�$�$  !
command
�$�$$ +
.
�$�$+ ,

Parameters
�$�$, 6
.
�$�$6 7
Add
�$�$7 :
(
�$�$: ;
new
�$�$; >
NpgsqlParameter
�$�$? N
(
�$�$N O
$str
�$�$O R
+
�$�$S T!
arrNombreParametros
�$�$U h
[
�$�$h i
intContador
�$�$i t
]
�$�$t u
,
�$�$u v
DBNull
�$�$w }
.
�$�$} ~
Value�$�$~ �
)�$�$� �
)�$�$� �
;�$�$� �
}
�$�$  !
else
�$�$  $
{
�$�$  !
command
�$�$$ +
.
�$�$+ ,

Parameters
�$�$, 6
.
�$�$6 7
Add
�$�$7 :
(
�$�$: ;
new
�$�$; >
NpgsqlParameter
�$�$? N
(
�$�$N O
$str
�$�$O R
+
�$�$S T!
arrNombreParametros
�$�$U h
[
�$�$h i
intContador
�$�$i t
]
�$�$t u
,
�$�$u v

�$�$O \
[
�$�$\ ]
intContador
�$�$] h
]
�$�$h i
)
�$�$i j
)
�$�$j k
;
�$�$k l
command
�$�$$ +
.
�$�$+ ,

Parameters
�$�$, 6
[
�$�$6 7
$str
�$�$7 :
+
�$�$; <!
arrNombreParametros
�$�$= P
[
�$�$P Q
intContador
�$�$Q \
]
�$�$\ ]
]
�$�$] ^
.
�$�$^ _
NpgsqlDbType
�$�$_ k
=
�$�$l m
NpgsqlDbType
�$�$n z
.
�$�$z {
Bigint�$�${ �
;�$�$� �
}
�$�$  !
break
�$�$  %
;
�$�$% &
default
�$�$ #
:
�$�$# $
if
�$�$  "
(
�$�$# $

�$�$$ 1
[
�$�$1 2
intContador
�$�$2 =
]
�$�$= >
==
�$�$? A
null
�$�$B F
)
�$�$F G
{
�$�$  !
command
�$�$$ +
.
�$�$+ ,

Parameters
�$�$, 6
.
�$�$6 7
Add
�$�$7 :
(
�$�$: ;
new
�$�$; >
NpgsqlParameter
�$�$? N
(
�$�$N O
$str
�$�$O R
+
�$�$S T!
arrNombreParametros
�$�$U h
[
�$�$h i
intContador
�$�$i t
]
�$�$t u
,
�$�$u v
DBNull
�$�$O U
.
�$�$U V
Value
�$�$V [
)
�$�$[ \
)
�$�$\ ]
;
�$�$] ^
}
�$�$  !
else
�$�$  $
{
�$�$  !
command
�$�$$ +
.
�$�$+ ,

Parameters
�$�$, 6
.
�$�$6 7
Add
�$�$7 :
(
�$�$: ;
new
�$�$; >
NpgsqlParameter
�$�$? N
(
�$�$N O
$str
�$�$O R
+
�$�$S T!
arrNombreParametros
�$�$U h
[
�$�$h i
intContador
�$�$i t
]
�$�$t u
,
�$�$u v

�$�$O \
[
�$�$\ ]
intContador
�$�$] h
]
�$�$h i
)
�$�$i j
)
�$�$j k
;
�$�$k l
}
�$�$  !
break
�$�$  %
;
�$�$% &
}
�$�$ 
}
�$�$ 
}
�$�$ 
command
�$�$ 
.
�$�$ 

Connection
�$�$ "
=
�$�$# $
trans
�$�$% *
.
�$�$* +
MyConn
�$�$+ 1
;
�$�$1 2
command
�$�$ 
.
�$�$ 
Transaction
�$�$ #
=
�$�$$ %
trans
�$�$& +
.
�$�$+ ,
MyTrans
�$�$, 3
;
�$�$3 4
var
�$�$ 
intRes
�$�$ 
=
�$�$ 
command
�$�$ $
.
�$�$$ %
ExecuteNonQuery
�$�$% 4
(
�$�$4 5
)
�$�$5 6
;
�$�$6 7
return
�$�$ 
intRes
�$�$ 
;
�$�$ 
}
�$�$ 
catch
�$�$ 
(
�$�$ 
	Exception
�$�$ 
ex
�$�$ 
)
�$�$  
{
�$�$ 
ex
�$�$ 
.
�$�$ 
Data
�$�$ 
.
�$�$ 
Add
�$�$ 
(
�$�$ 
$str
�$�$ -
,
�$�$- .
nombreSp
�$�$/ 7
)
�$�$7 8
;
�$�$8 9
throw
�$�$ 
;
�$�$ 
}
�$�$ 
}
�$�$ 	
public
�$�$ 
object
�$�$ (
ExecStoreProcedureIdentity
�$�$ 0
(
�$�$0 1
string
�$�$1 7
nombreSp
�$�$8 @
,
�$�$@ A
	ArrayList
�$�$B K!
arrNombreParametros
�$�$L _
,
�$�$_ `
	ArrayList
�$�$a j

�$�$k x
)
�$�$x y
{
�$�$ 	
var
�$�$ 
command
�$�$ 
=
�$�$ 
new
�$�$ 

�$�$ +
(
�$�$+ ,
)
�$�$, -
;
�$�$- .
command
�$�$ 
.
�$�$ 
CommandText
�$�$ 
=
�$�$  !
nombreSp
�$�$" *
;
�$�$* +
command
�$�$ 
.
�$�$ 
CommandType
�$�$ 
=
�$�$  !
CommandType
�$�$" -
.
�$�$- .
StoredProcedure
�$�$. =
;
�$�$= >
try
�$�$ 
{
�$�$ 
command
�$�$ 
.
�$�$ 

Parameters
�$�$ "
.
�$�$" #
Add
�$�$# &
(
�$�$& '
new
�$�$' *
NpgsqlParameter
�$�$+ :
(
�$�$: ;
$str
�$�$; >
+
�$�$? @!
arrNombreParametros
�$�$A T
[
�$�$T U
$num
�$�$U V
]
�$�$V W
,
�$�$W X

�$�$Y f
[
�$�$f g
$num
�$�$g h
]
�$�$h i
)
�$�$i j
)
�$�$j k
;
�$�$k l
command
�$�$ 
.
�$�$ 

Parameters
�$�$ "
[
�$�$" #
$str
�$�$# &
+
�$�$' (!
arrNombreParametros
�$�$) <
[
�$�$< =
$num
�$�$= >
]
�$�$> ?
]
�$�$? @
.
�$�$@ A
	Direction
�$�$A J
=
�$�$K L 
ParameterDirection
�$�$M _
.
�$�$_ `
Output
�$�$` f
;
�$�$f g
command
�$�$ 
.
�$�$ 

Parameters
�$�$ "
[
�$�$" #
$str
�$�$# &
+
�$�$' (!
arrNombreParametros
�$�$) <
[
�$�$< =
$num
�$�$= >
]
�$�$> ?
]
�$�$? @
.
�$�$@ A
Size
�$�$A E
=
�$�$F G
$num
�$�$H J
;
�$�$J K
for
�$�$ 
(
�$�$ 
var
�$�$ 
intContador
�$�$ $
=
�$�$% &
$num
�$�$' (
;
�$�$( )
intContador
�$�$* 5
<
�$�$6 7

�$�$8 E
.
�$�$E F
Count
�$�$F K
;
�$�$K L
intContador
�$�$M X
++
�$�$X Z
)
�$�$Z [
{
�$�$ 
if
�$�$ 
(
�$�$ 

�$�$ %
[
�$�$% &
intContador
�$�$& 1
]
�$�$1 2
==
�$�$3 5
null
�$�$6 :
)
�$�$: ;
{
�$�$ 
command
�$�$ 
.
�$�$  

Parameters
�$�$  *
.
�$�$* +
Add
�$�$+ .
(
�$�$. /
new
�$�$/ 2
NpgsqlParameter
�$�$3 B
(
�$�$B C
$str
�$�$C F
+
�$�$G H!
arrNombreParametros
�$�$I \
[
�$�$\ ]
intContador
�$�$] h
]
�$�$h i
,
�$�$i j
DBNull
�$�$C I
.
�$�$I J
Value
�$�$J O
)
�$�$O P
)
�$�$P Q
;
�$�$Q R
}
�$�$ 
else
�$�$ 
{
�$�$ 
switch
�$�$ 
(
�$�$  

�$�$  -
[
�$�$- .
intContador
�$�$. 9
]
�$�$9 :
.
�$�$: ;
GetType
�$�$; B
(
�$�$B C
)
�$�$C D
.
�$�$D E
ToString
�$�$E M
(
�$�$M N
)
�$�$N O
)
�$�$O P
{
�$�$ 
case
�$�$  
$str
�$�$! 0
:
�$�$0 1
if
�$�$  "
(
�$�$# $

�$�$$ 1
[
�$�$1 2
intContador
�$�$2 =
]
�$�$= >
==
�$�$? A
null
�$�$B F
)
�$�$F G
{
�%�%  !
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
.
�%�%6 7
Add
�%�%7 :
(
�%�%: ;
new
�%�%; >
NpgsqlParameter
�%�%? N
(
�%�%N O
$str
�%�%O R
+
�%�%S T!
arrNombreParametros
�%�%U h
[
�%�%h i
intContador
�%�%i t
]
�%�%t u
,
�%�%u v
DBNull
�%�%w }
.
�%�%} ~
Value�%�%~ �
)�%�%� �
)�%�%� �
;�%�%� �
}
�%�%  !
else
�%�%  $
{
�%�%  !
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
.
�%�%6 7
Add
�%�%7 :
(
�%�%: ;
new
�%�%; >
NpgsqlParameter
�%�%? N
(
�%�%N O
$str
�%�%O R
+
�%�%S T!
arrNombreParametros
�%�%U h
[
�%�%h i
intContador
�%�%i t
]
�%�%t u
,
�%�%u v

[�%�%� �
intContador�%�%� �
]�%�%� �
)�%�%� �
)�%�%� �
;�%�%� �
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
[
�%�%6 7
$str
�%�%7 :
+
�%�%; <!
arrNombreParametros
�%�%= P
[
�%�%P Q
intContador
�%�%Q \
]
�%�%\ ]
]
�%�%] ^
.
�%�%^ _
NpgsqlDbType
�%�%_ k
=
�%�%l m
NpgsqlDbType
�%�%n z
.
�%�%z {
Bytea�%�%{ �
;�%�%� �
}
�%�%  !
break
�%�%  %
;
�%�%% &
case
�%�%  
$str
�%�%! /
:
�%�%/ 0
case
�%�%  
$str
�%�%! /
:
�%�%/ 0
case
�%�%  
$str
�%�%! 1
:
�%�%1 2
if
�%�%  "
(
�%�%# $

�%�%$ 1
[
�%�%1 2
intContador
�%�%2 =
]
�%�%= >
==
�%�%? A
null
�%�%B F
)
�%�%F G
{
�%�%  !
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
.
�%�%6 7
Add
�%�%7 :
(
�%�%: ;
new
�%�%; >
NpgsqlParameter
�%�%? N
(
�%�%N O
$str
�%�%O R
+
�%�%S T!
arrNombreParametros
�%�%U h
[
�%�%h i
intContador
�%�%i t
]
�%�%t u
,
�%�%u v
NpgsqlDbType�%�%w �
.�%�%� �
Numeric�%�%� �
,�%�%� �
$num�%�%� �
,�%�%� �
$str�%�%� �
,�%�%� � 
ParameterDirection
�%�%O a
.
�%�%a b
Input
�%�%b g
,
�%�%g h
false
�%�%i n
,
�%�%n o
$num
�%�%p q
,
�%�%q r
$num
�%�%s t
,
�%�%t u
DataRowVersion
�%�%O ]
.
�%�%] ^
Proposed
�%�%^ f
,
�%�%f g
DBNull
�%�%O U
.
�%�%U V
Value
�%�%V [
)
�%�%[ \
)
�%�%\ ]
;
�%�%] ^
}
�%�%  !
else
�%�%  $
{
�%�%  !
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
.
�%�%6 7
Add
�%�%7 :
(
�%�%: ;
new
�%�%; >
NpgsqlParameter
�%�%? N
(
�%�%N O
$str
�%�%O R
+
�%�%S T!
arrNombreParametros
�%�%U h
[
�%�%h i
intContador
�%�%i t
]
�%�%t u
,
�%�%u v
NpgsqlDbType�%�%w �
.�%�%� �
Numeric�%�%� �
,�%�%� �
$num�%�%� �
,�%�%� �
$str�%�%� �
,�%�%� � 
ParameterDirection
�%�%O a
.
�%�%a b
Input
�%�%b g
,
�%�%g h
false
�%�%i n
,
�%�%n o
$num
�%�%p q
,
�%�%q r
$num
�%�%s t
,
�%�%t u
DataRowVersion
�%�%O ]
.
�%�%] ^
Proposed
�%�%^ f
,
�%�%f g

�%�%O \
[
�%�%\ ]
intContador
�%�%] h
]
�%�%h i
)
�%�%i j
)
�%�%j k
;
�%�%k l
}
�%�%  !
break
�%�%  %
;
�%�%% &
case
�%�%  
$str
�%�%! 0
:
�%�%0 1
if
�%�%  "
(
�%�%# $

�%�%$ 1
[
�%�%1 2
intContador
�%�%2 =
]
�%�%= >
==
�%�%? A
null
�%�%B F
)
�%�%F G
{
�%�%  !
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
.
�%�%6 7
Add
�%�%7 :
(
�%�%: ;
new
�%�%; >
NpgsqlParameter
�%�%? N
(
�%�%N O
$str
�%�%O R
+
�%�%S T!
arrNombreParametros
�%�%U h
[
�%�%h i
intContador
�%�%i t
]
�%�%t u
,
�%�%u v
DBNull
�%�%w }
.
�%�%} ~
Value�%�%~ �
)�%�%� �
)�%�%� �
;�%�%� �
}
�%�%  !
else
�%�%  $
{
�%�%  !
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
.
�%�%6 7
Add
�%�%7 :
(
�%�%: ;
new
�%�%; >
NpgsqlParameter
�%�%? N
(
�%�%N O
$str
�%�%O R
+
�%�%S T!
arrNombreParametros
�%�%U h
[
�%�%h i
intContador
�%�%i t
]
�%�%t u
,
�%�%u v

�%�%O \
[
�%�%\ ]
intContador
�%�%] h
]
�%�%h i
)
�%�%i j
)
�%�%j k
;
�%�%k l
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
[
�%�%6 7
$str
�%�%7 :
+
�%�%; <!
arrNombreParametros
�%�%= P
[
�%�%P Q
intContador
�%�%Q \
]
�%�%\ ]
]
�%�%] ^
.
�%�%^ _
NpgsqlDbType
�%�%_ k
=
�%�%l m
NpgsqlDbType
�%�%n z
.
�%�%z {
Text
�%�%{ 
;�%�% �
}
�%�%  !
break
�%�%  %
;
�%�%% &
case
�%�%  
$str
�%�%! 2
:
�%�%2 3
if
�%�%  "
(
�%�%# $

�%�%$ 1
[
�%�%1 2
intContador
�%�%2 =
]
�%�%= >
==
�%�%? A
null
�%�%B F
)
�%�%F G
{
�%�%  !
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
.
�%�%6 7
Add
�%�%7 :
(
�%�%: ;
new
�%�%; >
NpgsqlParameter
�%�%? N
(
�%�%N O
$str
�%�%O R
+
�%�%S T!
arrNombreParametros
�%�%U h
[
�%�%h i
intContador
�%�%i t
]
�%�%t u
,
�%�%u v
DBNull
�%�%w }
.
�%�%} ~
Value�%�%~ �
)�%�%� �
)�%�%� �
;�%�%� �
}
�%�%  !
else
�%�%  $
{
�%�%  !
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
.
�%�%6 7
Add
�%�%7 :
(
�%�%: ;
new
�%�%; >
NpgsqlParameter
�%�%? N
(
�%�%N O
$str
�%�%O R
+
�%�%S T!
arrNombreParametros
�%�%U h
[
�%�%h i
intContador
�%�%i t
]
�%�%t u
,
�%�%u v

�%�%O \
[
�%�%\ ]
intContador
�%�%] h
]
�%�%h i
)
�%�%i j
)
�%�%j k
;
�%�%k l
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
[
�%�%6 7
$str
�%�%7 :
+
�%�%; <!
arrNombreParametros
�%�%= P
[
�%�%P Q
intContador
�%�%Q \
]
�%�%\ ]
]
�%�%] ^
.
�%�%^ _
NpgsqlDbType
�%�%_ k
=
�%�%l m
NpgsqlDbType
�%�%n z
.
�%�%z {
	Timestamp�%�%{ �
;�%�%� �
}
�%�%  !
break
�%�%  %
;
�%�%% &
case
�%�%  
$str
�%�%! =
:
�%�%= >
if
�%�%  "
(
�%�%# $

�%�%$ 1
[
�%�%1 2
intContador
�%�%2 =
]
�%�%= >
==
�%�%? A
null
�%�%B F
)
�%�%F G
{
�%�%  !
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
.
�%�%6 7
Add
�%�%7 :
(
�%�%: ;
new
�%�%; >
NpgsqlParameter
�%�%? N
(
�%�%N O
$str
�%�%O R
+
�%�%S T!
arrNombreParametros
�%�%U h
[
�%�%h i
intContador
�%�%i t
]
�%�%t u
,
�%�%u v
DBNull
�%�%w }
.
�%�%} ~
Value�%�%~ �
)�%�%� �
)�%�%� �
;�%�%� �
}
�%�%  !
else
�%�%  $
{
�%�%  !
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
.
�%�%6 7
Add
�%�%7 :
(
�%�%: ;
new
�%�%; >
NpgsqlParameter
�%�%? N
(
�%�%N O
$str
�%�%O R
+
�%�%S T!
arrNombreParametros
�%�%U h
[
�%�%h i
intContador
�%�%i t
]
�%�%t u
,
�%�%u v

�%�%O \
[
�%�%\ ]
intContador
�%�%] h
]
�%�%h i
)
�%�%i j
)
�%�%j k
;
�%�%k l
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
[
�%�%6 7
$str
�%�%7 :
+
�%�%; <!
arrNombreParametros
�%�%= P
[
�%�%P Q
intContador
�%�%Q \
]
�%�%\ ]
]
�%�%] ^
.
�%�%^ _
NpgsqlDbType
�%�%_ k
=
�%�%l m
NpgsqlDbType
�%�%n z
.
�%�%z {
Bigint�%�%{ �
;�%�%� �
}
�%�%  !
break
�%�%  %
;
�%�%% &
default
�%�% #
:
�%�%# $
if
�%�%  "
(
�%�%# $

�%�%$ 1
[
�%�%1 2
intContador
�%�%2 =
]
�%�%= >
==
�%�%? A
null
�%�%B F
)
�%�%F G
{
�%�%  !
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
.
�%�%6 7
Add
�%�%7 :
(
�%�%: ;
new
�%�%; >
NpgsqlParameter
�%�%? N
(
�%�%N O
$str
�%�%O R
+
�%�%S T!
arrNombreParametros
�%�%U h
[
�%�%h i
intContador
�%�%i t
]
�%�%t u
,
�%�%u v
DBNull
�%�%O U
.
�%�%U V
Value
�%�%V [
)
�%�%[ \
)
�%�%\ ]
;
�%�%] ^
}
�%�%  !
else
�%�%  $
{
�%�%  !
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
.
�%�%6 7
Add
�%�%7 :
(
�%�%: ;
new
�%�%; >
NpgsqlParameter
�%�%? N
(
�%�%N O
$str
�%�%O R
+
�%�%S T!
arrNombreParametros
�%�%U h
[
�%�%h i
intContador
�%�%i t
]
�%�%t u
,
�%�%u v

�%�%O \
[
�%�%\ ]
intContador
�%�%] h
]
�%�%h i
)
�%�%i j
)
�%�%j k
;
�%�%k l
}
�%�%  !
break
�%�%  %
;
�%�%% &
}
�%�% 
}
�%�% 
}
�%�% 
command
�%�% 
.
�%�% 

Connection
�%�% "
=
�%�%# $

ConexionBd
�%�%% /
;
�%�%/ 0
command
�%�% 
.
�%�% 

Connection
�%�% "
.
�%�%" #
Open
�%�%# '
(
�%�%' (
)
�%�%( )
;
�%�%) *
command
�%�% 
.
�%�% 
ExecuteNonQuery
�%�% '
(
�%�%' (
)
�%�%( )
;
�%�%) *
var
�%�% 

�%�% !
=
�%�%" #
command
�%�%$ +
.
�%�%+ ,

Parameters
�%�%, 6
[
�%�%6 7
$str
�%�%7 :
+
�%�%; <!
arrNombreParametros
�%�%= P
[
�%�%P Q
$num
�%�%Q R
]
�%�%R S
]
�%�%S T
.
�%�%T U
Value
�%�%U Z
;
�%�%Z [
command
�%�% 
.
�%�% 

Connection
�%�% "
.
�%�%" #
Close
�%�%# (
(
�%�%( )
)
�%�%) *
;
�%�%* +
command
�%�% 
.
�%�% 
Dispose
�%�% 
(
�%�%  
)
�%�%  !
;
�%�%! "
return
�%�% 

�%�% $
;
�%�%$ %
}
�%�% 
catch
�%�% 
(
�%�% 
	Exception
�%�% 
ex
�%�% 
)
�%�%  
{
�%�% 
ex
�%�% 
.
�%�% 
Data
�%�% 
.
�%�% 
Add
�%�% 
(
�%�% 
$str
�%�% -
,
�%�%- .
nombreSp
�%�%/ 7
)
�%�%7 8
;
�%�%8 9
throw
�%�% 
;
�%�% 
}
�%�% 
}
�%�% 	
public
�%�% 
object
�%�% (
ExecStoreProcedureIdentity
�%�% 0
(
�%�%0 1
string
�%�%1 7
nombreSp
�%�%8 @
,
�%�%@ A
	ArrayList
�%�%B K!
arrNombreParametros
�%�%L _
,
�%�%_ `
	ArrayList
�%�%a j

�%�%k x
,
�%�%x y
ref
�%�%1 4
CTrans
�%�%5 ;
trans
�%�%< A
)
�%�%A B
{
�%�% 	
var
�&�& 
command
�&�& 
=
�&�& 
new
�&�& 

�&�& +
(
�&�&+ ,
)
�&�&, -
;
�&�&- .
command
�&�& 
.
�&�& 
CommandText
�&�& 
=
�&�&  !
nombreSp
�&�&" *
;
�&�&* +
command
�&�& 
.
�&�& 
CommandType
�&�& 
=
�&�&  !
CommandType
�&�&" -
.
�&�&- .
StoredProcedure
�&�&. =
;
�&�&= >
try
�&�& 
{
�&�& 
command
�&�& 
.
�&�& 

Parameters
�&�& "
.
�&�&" #
Add
�&�&# &
(
�&�&& '
new
�&�&' *
NpgsqlParameter
�&�&+ :
(
�&�&: ;
$str
�&�&; >
+
�&�&? @!
arrNombreParametros
�&�&A T
[
�&�&T U
$num
�&�&U V
]
�&�&V W
,
�&�&W X

�&�&Y f
[
�&�&f g
$num
�&�&g h
]
�&�&h i
)
�&�&i j
)
�&�&j k
;
�&�&k l
command
�&�& 
.
�&�& 

Parameters
�&�& "
[
�&�&" #
$str
�&�&# &
+
�&�&' (!
arrNombreParametros
�&�&) <
[
�&�&< =
$num
�&�&= >
]
�&�&> ?
]
�&�&? @
.
�&�&@ A
	Direction
�&�&A J
=
�&�&K L 
ParameterDirection
�&�&M _
.
�&�&_ `
Output
�&�&` f
;
�&�&f g
command
�&�& 
.
�&�& 

Parameters
�&�& "
[
�&�&" #
$str
�&�&# &
+
�&�&' (!
arrNombreParametros
�&�&) <
[
�&�&< =
$num
�&�&= >
]
�&�&> ?
]
�&�&? @
.
�&�&@ A
Size
�&�&A E
=
�&�&F G
$num
�&�&H J
;
�&�&J K
for
�&�& 
(
�&�& 
var
�&�& 
intContador
�&�& $
=
�&�&% &
$num
�&�&' (
;
�&�&( )
intContador
�&�&* 5
<
�&�&6 7

�&�&8 E
.
�&�&E F
Count
�&�&F K
;
�&�&K L
intContador
�&�&M X
++
�&�&X Z
)
�&�&Z [
{
�&�& 
if
�&�& 
(
�&�& 

�&�& %
[
�&�&% &
intContador
�&�&& 1
]
�&�&1 2
==
�&�&3 5
null
�&�&6 :
)
�&�&: ;
{
�&�& 
command
�&�& 
.
�&�&  

Parameters
�&�&  *
.
�&�&* +
Add
�&�&+ .
(
�&�&. /
new
�&�&/ 2
NpgsqlParameter
�&�&3 B
(
�&�&B C
$str
�&�&C F
+
�&�&G H!
arrNombreParametros
�&�&I \
[
�&�&\ ]
intContador
�&�&] h
]
�&�&h i
,
�&�&i j
DBNull
�&�&C I
.
�&�&I J
Value
�&�&J O
)
�&�&O P
)
�&�&P Q
;
�&�&Q R
}
�&�& 
else
�&�& 
{
�&�& 
switch
�&�& 
(
�&�&  

�&�&  -
[
�&�&- .
intContador
�&�&. 9
]
�&�&9 :
.
�&�&: ;
GetType
�&�&; B
(
�&�&B C
)
�&�&C D
.
�&�&D E
ToString
�&�&E M
(
�&�&M N
)
�&�&N O
)
�&�&O P
{
�&�& 
case
�&�&  
$str
�&�&! 0
:
�&�&0 1
if
�&�&  "
(
�&�&# $

�&�&$ 1
[
�&�&1 2
intContador
�&�&2 =
]
�&�&= >
==
�&�&? A
null
�&�&B F
)
�&�&F G
{
�&�&  !
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
.
�&�&6 7
Add
�&�&7 :
(
�&�&: ;
new
�&�&; >
NpgsqlParameter
�&�&? N
(
�&�&N O
$str
�&�&O R
+
�&�&S T!
arrNombreParametros
�&�&U h
[
�&�&h i
intContador
�&�&i t
]
�&�&t u
,
�&�&u v
DBNull
�&�&w }
.
�&�&} ~
Value�&�&~ �
)�&�&� �
)�&�&� �
;�&�&� �
}
�&�&  !
else
�&�&  $
{
�&�&  !
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
.
�&�&6 7
Add
�&�&7 :
(
�&�&: ;
new
�&�&; >
NpgsqlParameter
�&�&? N
(
�&�&N O
$str
�&�&O R
+
�&�&S T!
arrNombreParametros
�&�&U h
[
�&�&h i
intContador
�&�&i t
]
�&�&t u
,
�&�&u v

[�&�&� �
intContador�&�&� �
]�&�&� �
)�&�&� �
)�&�&� �
;�&�&� �
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
[
�&�&6 7
$str
�&�&7 :
+
�&�&; <!
arrNombreParametros
�&�&= P
[
�&�&P Q
intContador
�&�&Q \
]
�&�&\ ]
]
�&�&] ^
.
�&�&^ _
NpgsqlDbType
�&�&_ k
=
�&�&l m
NpgsqlDbType
�&�&n z
.
�&�&z {
Bytea�&�&{ �
;�&�&� �
}
�&�&  !
break
�&�&  %
;
�&�&% &
case
�&�&  
$str
�&�&! /
:
�&�&/ 0
case
�&�&  
$str
�&�&! /
:
�&�&/ 0
case
�&�&  
$str
�&�&! 1
:
�&�&1 2
if
�&�&  "
(
�&�&# $

�&�&$ 1
[
�&�&1 2
intContador
�&�&2 =
]
�&�&= >
==
�&�&? A
null
�&�&B F
)
�&�&F G
{
�&�&  !
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
.
�&�&6 7
Add
�&�&7 :
(
�&�&: ;
new
�&�&; >
NpgsqlParameter
�&�&? N
(
�&�&N O
$str
�&�&O R
+
�&�&S T!
arrNombreParametros
�&�&U h
[
�&�&h i
intContador
�&�&i t
]
�&�&t u
,
�&�&u v
NpgsqlDbType�&�&w �
.�&�&� �
Numeric�&�&� �
,�&�&� �
$num
�&�&O P
,
�&�&P Q
$str
�&�&R T
,
�&�&T U 
ParameterDirection
�&�&O a
.
�&�&a b
Input
�&�&b g
,
�&�&g h
false
�&�&i n
,
�&�&n o
$num
�&�&p q
,
�&�&q r
$num
�&�&s t
,
�&�&t u
DataRowVersion
�&�&O ]
.
�&�&] ^
Proposed
�&�&^ f
,
�&�&f g
DBNull
�&�&O U
.
�&�&U V
Value
�&�&V [
)
�&�&[ \
)
�&�&\ ]
;
�&�&] ^
}
�&�&  !
else
�&�&  $
{
�&�&  !
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
.
�&�&6 7
Add
�&�&7 :
(
�&�&: ;
new
�&�&; >
NpgsqlParameter
�&�&? N
(
�&�&N O
$str
�&�&O R
+
�&�&S T!
arrNombreParametros
�&�&U h
[
�&�&h i
intContador
�&�&i t
]
�&�&t u
,
�&�&u v
NpgsqlDbType�&�&w �
.�&�&� �
Numeric�&�&� �
,�&�&� �
$num
�&�&O P
,
�&�&P Q
$str
�&�&R T
,
�&�&T U 
ParameterDirection
�&�&O a
.
�&�&a b
Input
�&�&b g
,
�&�&g h
false
�&�&i n
,
�&�&n o
$num
�&�&p q
,
�&�&q r
$num
�&�&s t
,
�&�&t u
DataRowVersion
�&�&O ]
.
�&�&] ^
Proposed
�&�&^ f
,
�&�&f g

�&�&O \
[
�&�&\ ]
intContador
�&�&] h
]
�&�&h i
)
�&�&i j
)
�&�&j k
;
�&�&k l
}
�&�&  !
break
�&�&  %
;
�&�&% &
case
�&�&  
$str
�&�&! 2
:
�&�&2 3
if
�&�&  "
(
�&�&# $

�&�&$ 1
[
�&�&1 2
intContador
�&�&2 =
]
�&�&= >
==
�&�&? A
null
�&�&B F
)
�&�&F G
{
�&�&  !
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
.
�&�&6 7
Add
�&�&7 :
(
�&�&: ;
new
�&�&; >
NpgsqlParameter
�&�&? N
(
�&�&N O
$str
�&�&O R
+
�&�&S T!
arrNombreParametros
�&�&U h
[
�&�&h i
intContador
�&�&i t
]
�&�&t u
,
�&�&u v
DBNull
�&�&w }
.
�&�&} ~
Value�&�&~ �
)�&�&� �
)�&�&� �
;�&�&� �
}
�&�&  !
else
�&�&  $
{
�&�&  !
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
.
�&�&6 7
Add
�&�&7 :
(
�&�&: ;
new
�&�&( +
NpgsqlParameter
�&�&, ;
(
�&�&; <
$str
�&�&< ?
+
�&�&@ A!
arrNombreParametros
�&�&B U
[
�&�&U V
intContador
�&�&V a
]
�&�&a b
,
�&�&b c

�&�&< I
[
�&�&I J
intContador
�&�&J U
]
�&�&U V
)
�&�&V W
)
�&�&W X
;
�&�&X Y
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
[
�&�&6 7
$str
�&�&7 :
+
�&�&; <!
arrNombreParametros
�&�&= P
[
�&�&P Q
intContador
�&�&Q \
]
�&�&\ ]
]
�&�&] ^
.
�&�&^ _
NpgsqlDbType
�&�&_ k
=
�&�&l m
NpgsqlDbType
�&�&( 4
.
�&�&4 5
	Timestamp
�&�&5 >
;
�&�&> ?
}
�&�&  !
break
�&�&  %
;
�&�&% &
case
�&�&  
$str
�&�&! =
:
�&�&= >
if
�&�&  "
(
�&�&# $

�&�&$ 1
[
�&�&1 2
intContador
�&�&2 =
]
�&�&= >
==
�&�&? A
null
�&�&B F
)
�&�&F G
{
�&�&  !
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
.
�&�&6 7
Add
�&�&7 :
(
�&�&: ;
new
�&�&; >
NpgsqlParameter
�&�&? N
(
�&�&N O
$str
�&�&O R
+
�&�&S T!
arrNombreParametros
�&�&U h
[
�&�&h i
intContador
�&�&i t
]
�&�&t u
,
�&�&u v
DBNull
�&�&w }
.
�&�&} ~
Value�&�&~ �
)�&�&� �
)�&�&� �
;�&�&� �
}
�&�&  !
else
�&�&  $
{
�&�&  !
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
.
�&�&6 7
Add
�&�&7 :
(
�&�&: ;
new
�&�&( +
NpgsqlParameter
�&�&, ;
(
�&�&; <
$str
�&�&< ?
+
�&�&@ A!
arrNombreParametros
�&�&B U
[
�&�&U V
intContador
�&�&V a
]
�&�&a b
,
�&�&b c

�&�&< I
[
�&�&I J
intContador
�&�&J U
]
�&�&U V
)
�&�&V W
)
�&�&W X
;
�&�&X Y
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
[
�&�&6 7
$str
�&�&7 :
+
�&�&; <!
arrNombreParametros
�&�&= P
[
�&�&P Q
intContador
�&�&Q \
]
�&�&\ ]
]
�&�&] ^
.
�&�&^ _
NpgsqlDbType
�&�&_ k
=
�&�&l m
NpgsqlDbType
�&�&( 4
.
�&�&4 5
Bigint
�&�&5 ;
;
�&�&; <
}
�&�&  !
break
�&�&  %
;
�&�&% &
default
�&�& #
:
�&�&# $
if
�&�&  "
(
�&�&# $

�&�&$ 1
[
�&�&1 2
intContador
�&�&2 =
]
�&�&= >
==
�&�&? A
null
�&�&B F
)
�&�&F G
{
�&�&  !
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
.
�&�&6 7
Add
�&�&7 :
(
�&�&: ;
new
�&�&( +
NpgsqlParameter
�&�&, ;
(
�&�&; <
$str
�&�&< ?
+
�&�&@ A!
arrNombreParametros
�&�&B U
[
�&�&U V
intContador
�&�&V a
]
�&�&a b
,
�&�&b c
DBNull
�&�&< B
.
�&�&B C
Value
�&�&C H
)
�&�&H I
)
�&�&I J
;
�&�&J K
}
�&�&  !
else
�&�&  $
{
�&�&  !
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
.
�&�&6 7
Add
�&�&7 :
(
�&�&: ;
new
�&�&( +
NpgsqlParameter
�&�&, ;
(
�&�&; <
$str
�&�&< ?
+
�&�&@ A!
arrNombreParametros
�&�&B U
[
�&�&U V
intContador
�&�&V a
]
�&�&a b
,
�&�&b c

�&�&< I
[
�&�&I J
intContador
�&�&J U
]
�&�&U V
)
�&�&V W
)
�&�&W X
;
�&�&X Y
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
[
�&�&6 7
$str
�&�&7 :
+
�&�&; <!
arrNombreParametros
�&�&= P
[
�&�&P Q
intContador
�&�&Q \
]
�&�&\ ]
]
�&�&] ^
.
�&�&^ _
NpgsqlDbType
�&�&_ k
=
�&�&l m
NpgsqlDbType
�&�&( 4
.
�&�&4 5
Text
�&�&5 9
;
�&�&9 :
}
�&�&  !
break
�&�&  %
;
�&�&% &
}
�&�& 
}
�&�& 
}
�&�& 
command
�&�& 
.
�&�& 

Connection
�&�& "
=
�&�&# $
trans
�&�&% *
.
�&�&* +
MyConn
�&�&+ 1
;
�&�&1 2
command
�&�& 
.
�&�& 
Transaction
�&�& #
=
�&�&$ %
trans
�&�&& +
.
�&�&+ ,
MyTrans
�&�&, 3
;
�&�&3 4
command
�&�& 
.
�&�& 
ExecuteNonQuery
�&�& '
(
�&�&' (
)
�&�&( )
;
�&�&) *
var
�&�& 

�&�& !
=
�&�&" #
command
�&�&$ +
.
�&�&+ ,

Parameters
�&�&, 6
[
�&�&6 7
$str
�&�&7 :
+
�&�&; <!
arrNombreParametros
�&�&= P
[
�&�&P Q
$num
�&�&Q R
]
�&�&R S
]
�&�&S T
.
�&�&T U
Value
�&�&U Z
;
�&�&Z [
return
�&�& 

�&�& $
;
�&�&$ %
}
�&�& 
catch
�&�& 
(
�&�& 
	Exception
�&�& 
ex
�&�& 
)
�&�&  
{
�&�& 
ex
�&�& 
.
�&�& 
Data
�&�& 
.
�&�& 
Add
�&�& 
(
�&�& 
$str
�&�& -
,
�&�&- .
nombreSp
�&�&/ 7
)
�&�&7 8
;
�&�&8 9
throw
�&�& 
;
�&�& 
}
�&�& 
}
�&�& 	
public
�'�' 
	DataTable
�'�' +
ExecStoreProcedureToDataTable
�'�' 6
(
�'�'6 7
string
�'�'7 =
nombreSp
�'�'> F
)
�'�'F G
{
�'�' 	
var
�'�' 
command
�'�' 
=
�'�' 
new
�'�' 

�'�' +
(
�'�'+ ,
)
�'�', -
;
�'�'- .
command
�'�' 
.
�'�' 
CommandText
�'�' 
=
�'�'  !
nombreSp
�'�'" *
;
�'�'* +
command
�'�' 
.
�'�' 
CommandType
�'�' 
=
�'�'  !
CommandType
�'�'" -
.
�'�'- .
StoredProcedure
�'�'. =
;
�'�'= >
try
�'�' 
{
�'�' 
command
�'�' 
.
�'�' 

Connection
�'�' "
=
�'�'# $

ConexionBd
�'�'% /
;
�'�'/ 0
var
�'�' 
da
�'�' 
=
�'�' 
new
�'�' 
NpgsqlDataAdapter
�'�' .
(
�'�'. /
command
�'�'/ 6
)
�'�'6 7
;
�'�'7 8
var
�'�' 
dtTemp
�'�' 
=
�'�' 
new
�'�'  
	DataTable
�'�'! *
(
�'�'* +
)
�'�'+ ,
;
�'�', -
da
�'�' 
.
�'�' 
Fill
�'�' 
(
�'�' 
dtTemp
�'�' 
)
�'�' 
;
�'�'  
command
�'�' 
.
�'�' 

Connection
�'�' "
.
�'�'" #
Close
�'�'# (
(
�'�'( )
)
�'�') *
;
�'�'* +
command
�'�' 
.
�'�' 
Dispose
�'�' 
(
�'�'  
)
�'�'  !
;
�'�'! "
return
�'�' 
dtTemp
�'�' 
;
�'�' 
}
�'�' 
catch
�'�' 
(
�'�' 
	Exception
�'�' 
ex
�'�' 
)
�'�'  
{
�'�' 
ex
�'�' 
.
�'�' 
Data
�'�' 
.
�'�' 
Add
�'�' 
(
�'�' 
$str
�'�' -
,
�'�'- .
nombreSp
�'�'/ 7
)
�'�'7 8
;
�'�'8 9
throw
�'�' 
;
�'�' 
}
�'�' 
}
�'�' 	
public
�'�' 
	DataTable
�'�' +
ExecStoreProcedureToDataTable
�'�' 6
(
�'�'6 7
string
�'�'7 =
nombreSp
�'�'> F
,
�'�'F G
ref
�'�'H K
CTrans
�'�'L R
myTrans
�'�'S Z
)
�'�'Z [
{
�'�' 	
var
�'�' 
command
�'�' 
=
�'�' 
new
�'�' 

�'�' +
(
�'�'+ ,
)
�'�', -
;
�'�'- .
command
�'�' 
.
�'�' 
CommandText
�'�' 
=
�'�'  !
nombreSp
�'�'" *
;
�'�'* +
command
�'�' 
.
�'�' 
CommandType
�'�' 
=
�'�'  !
CommandType
�'�'" -
.
�'�'- .
StoredProcedure
�'�'. =
;
�'�'= >
try
�'�' 
{
�'�' 
command
�'�' 
.
�'�' 

Connection
�'�' "
=
�'�'# $
myTrans
�'�'% ,
.
�'�', -
MyConn
�'�'- 3
;
�'�'3 4
command
�'�' 
.
�'�' 
Transaction
�'�' #
=
�'�'$ %
myTrans
�'�'& -
.
�'�'- .
MyTrans
�'�'. 5
;
�'�'5 6
var
�'�' 
da
�'�' 
=
�'�' 
new
�'�' 
NpgsqlDataAdapter
�'�' .
(
�'�'. /
command
�'�'/ 6
)
�'�'6 7
;
�'�'7 8
var
�'�' 
dtTemp
�'�' 
=
�'�' 
new
�'�'  
	DataTable
�'�'! *
(
�'�'* +
)
�'�'+ ,
;
�'�', -
da
�'�' 
.
�'�' 
Fill
�'�' 
(
�'�' 
dtTemp
�'�' 
)
�'�' 
;
�'�'  
command
�'�' 
.
�'�' 

Connection
�'�' "
.
�'�'" #
Close
�'�'# (
(
�'�'( )
)
�'�') *
;
�'�'* +
command
�'�' 
.
�'�' 
Dispose
�'�' 
(
�'�'  
)
�'�'  !
;
�'�'! "
return
�'�' 
dtTemp
�'�' 
;
�'�' 
}
�'�' 
catch
�'�' 
(
�'�' 
	Exception
�'�' 
ex
�'�' 
)
�'�'  
{
�'�' 
ex
�'�' 
.
�'�' 
Data
�'�' 
.
�'�' 
Add
�'�' 
(
�'�' 
$str
�'�' -
,
�'�'- .
nombreSp
�'�'/ 7
)
�'�'7 8
;
�'�'8 9
throw
�'�' 
;
�'�' 
}
�'�' 
}
�'�' 	
public
�'�' 
	DataTable
�'�' +
ExecStoreProcedureToDataTable
�'�' 6
(
�'�'6 7
string
�'�'7 =
nombreSp
�'�'> F
,
�'�'F G
	ArrayList
�'�'H Q

�'�'R _
)
�'�'_ `
{
�'�' 	
var
�'�' 
command
�'�' 
=
�'�' 
new
�'�' 

�'�' +
(
�'�'+ ,
)
�'�', -
;
�'�'- .
command
�'�' 
.
�'�' 
CommandText
�'�' 
=
�'�'  !
nombreSp
�'�'" *
;
�'�'* +
command
�'�' 
.
�'�' 
CommandType
�'�' 
=
�'�'  !
CommandType
�'�'" -
.
�'�'- .
StoredProcedure
�'�'. =
;
�'�'= >
try
�'�' 
{
�'�' 
for
�'�' 
(
�'�' 
var
�'�' 
intContador
�'�' $
=
�'�'% &
$num
�'�'' (
;
�'�'( )
intContador
�'�'* 5
<
�'�'6 7

�'�'8 E
.
�'�'E F
Count
�'�'F K
;
�'�'K L
intContador
�'�'M X
++
�'�'X Z
)
�'�'Z [
{
�'�' 
if
�'�' 
(
�'�' 

�'�' %
[
�'�'% &
intContador
�'�'& 1
]
�'�'1 2
==
�'�'3 5
null
�'�'6 :
)
�'�': ;
{
�'�' 
command
�'�' 
.
�'�'  

Parameters
�'�'  *
.
�'�'* +
Add
�'�'+ .
(
�'�'. /
new
�'�'/ 2
NpgsqlParameter
�'�'3 B
(
�'�'B C

�'�'C P
[
�'�'P Q
intContador
�'�'Q \
]
�'�'\ ]
.
�'�'] ^
ToString
�'�'^ f
(
�'�'f g
)
�'�'g h
,
�'�'h i
DBNull
�'�'j p
.
�'�'p q
Value
�'�'q v
)
�'�'v w
)
�'�'w x
;
�'�'x y
}
�'�' 
else
�'�' 
{
�'�' 
switch
�'�' 
(
�'�'  

�'�'  -
[
�'�'- .
intContador
�'�'. 9
]
�'�'9 :
.
�'�': ;
GetType
�'�'; B
(
�'�'B C
)
�'�'C D
.
�'�'D E
ToString
�'�'E M
(
�'�'M N
)
�'�'N O
)
�'�'O P
{
�'�' 
case
�'�'  
$str
�'�'! /
:
�'�'/ 0
case
�'�'  
$str
�'�'! /
:
�'�'/ 0
case
�'�'  
$str
�'�'! 1
:
�'�'1 2
if
�'�'  "
(
�'�'# $

�'�'$ 1
[
�'�'1 2
intContador
�'�'2 =
]
�'�'= >
==
�'�'? A
null
�'�'B F
)
�'�'F G
{
�'�'  !
command
�'�'$ +
.
�'�'+ ,

Parameters
�'�', 6
.
�'�'6 7
Add
�'�'7 :
(
�'�': ;
new
�'�'; >
NpgsqlParameter
�'�'? N
(
�'�'N O
$str
�'�'O R
+
�'�'S T
intContador
�'�'U `
,
�'�'` a
NpgsqlDbType
�'�'b n
.
�'�'n o
Numeric
�'�'o v
,
�'�'v w
$num
�'�'x y
,
�'�'y z
$str
�'�'{ }
,
�'�'} ~ 
ParameterDirection
�'�'O a
.
�'�'a b
Input
�'�'b g
,
�'�'g h
false
�'�'i n
,
�'�'n o
$num
�'�'p q
,
�'�'q r
$num
�'�'s t
,
�'�'t u
DataRowVersion
�'�'O ]
.
�'�'] ^
Proposed
�'�'^ f
,
�'�'f g
DBNull
�'�'O U
.
�'�'U V
Value
�'�'V [
)
�'�'[ \
)
�'�'\ ]
;
�'�'] ^
}
�'�'  !
else
�'�'  $
{
�'�'  !
command
�'�'$ +
.
�'�'+ ,

Parameters
�'�', 6
.
�'�'6 7
Add
�'�'7 :
(
�'�': ;
new
�'�'; >
NpgsqlParameter
�'�'? N
(
�'�'N O
$str
�'�'O R
+
�'�'S T
intContador
�'�'U `
,
�'�'` a
NpgsqlDbType
�'�'b n
.
�'�'n o
Numeric
�'�'o v
,
�'�'v w
$num
�'�'x y
,
�'�'y z
$str
�'�'{ }
,
�'�'} ~ 
ParameterDirection
�'�'O a
.
�'�'a b
Input
�'�'b g
,
�'�'g h
false
�'�'i n
,
�'�'n o
$num
�'�'p q
,
�'�'q r
$num
�'�'s t
,
�'�'t u
DataRowVersion
�'�'O ]
.
�'�'] ^
Proposed
�'�'^ f
,
�'�'f g

�'�'O \
[
�'�'\ ]
intContador
�'�'] h
]
�'�'h i
)
�'�'i j
)
�'�'j k
;
�'�'k l
}
�'�'  !
break
�'�'  %
;
�'�'% &
case
�(�(  
$str
�(�(! 0
:
�(�(0 1
if
�(�(  "
(
�(�(# $

�(�($ 1
[
�(�(1 2
intContador
�(�(2 =
]
�(�(= >
==
�(�(? A
null
�(�(B F
)
�(�(F G
{
�(�(  !
command
�(�($ +
.
�(�(+ ,

Parameters
�(�(, 6
.
�(�(6 7
Add
�(�(7 :
(
�(�(: ;
new
�(�(; >
NpgsqlParameter
�(�(? N
(
�(�(N O
$str
�(�(O R
+
�(�(S T
intContador
�(�(U `
,
�(�(` a
DBNull
�(�(b h
.
�(�(h i
Value
�(�(i n
)
�(�(n o
)
�(�(o p
;
�(�(p q
}
�(�(  !
else
�(�(  $
{
�(�(  !
command
�(�($ +
.
�(�(+ ,

Parameters
�(�(, 6
.
�(�(6 7
Add
�(�(7 :
(
�(�(: ;
new
�(�(; >
NpgsqlParameter
�(�(? N
(
�(�(N O
$str
�(�(O R
+
�(�(S T
intContador
�(�(U `
,
�(�(` a

�(�(O \
[
�(�(\ ]
intContador
�(�(] h
]
�(�(h i
)
�(�(i j
)
�(�(j k
;
�(�(k l
command
�(�($ +
.
�(�(+ ,

Parameters
�(�(, 6
[
�(�(6 7
$str
�(�(7 :
+
�(�(; <
intContador
�(�(= H
]
�(�(H I
.
�(�(I J
NpgsqlDbType
�(�(J V
=
�(�(W X
NpgsqlDbType
�(�(Y e
.
�(�(e f
Text
�(�(f j
;
�(�(j k
}
�(�(  !
break
�(�(  %
;
�(�(% &
case
�(�(  
$str
�(�(! 2
:
�(�(2 3
if
�(�(  "
(
�(�(# $

�(�($ 1
[
�(�(1 2
intContador
�(�(2 =
]
�(�(= >
==
�(�(? A
null
�(�(B F
)
�(�(F G
{
�(�(  !
command
�(�($ +
.
�(�(+ ,

Parameters
�(�(, 6
.
�(�(6 7
Add
�(�(7 :
(
�(�(: ;
new
�(�(; >
NpgsqlParameter
�(�(? N
(
�(�(N O
$str
�(�(O R
+
�(�(S T
intContador
�(�(U `
,
�(�(` a
DBNull
�(�(b h
.
�(�(h i
Value
�(�(i n
)
�(�(n o
)
�(�(o p
;
�(�(p q
}
�(�(  !
else
�(�(  $
{
�(�(  !
command
�(�($ +
.
�(�(+ ,

Parameters
�(�(, 6
.
�(�(6 7
Add
�(�(7 :
(
�(�(: ;
new
�(�(; >
NpgsqlParameter
�(�(? N
(
�(�(N O
$str
�(�(O R
+
�(�(S T
intContador
�(�(U `
,
�(�(` a

�(�(O \
[
�(�(\ ]
intContador
�(�(] h
]
�(�(h i
)
�(�(i j
)
�(�(j k
;
�(�(k l
command
�(�($ +
.
�(�(+ ,

Parameters
�(�(, 6
[
�(�(6 7
$str
�(�(7 :
+
�(�(; <
intContador
�(�(= H
]
�(�(H I
.
�(�(I J
NpgsqlDbType
�(�(J V
=
�(�(W X
NpgsqlDbType
�(�(Y e
.
�(�(e f
	Timestamp
�(�(f o
;
�(�(o p
}
�(�(  !
break
�(�(  %
;
�(�(% &
default
�(�( #
:
�(�(# $
if
�(�(  "
(
�(�(# $

�(�($ 1
[
�(�(1 2
intContador
�(�(2 =
]
�(�(= >
==
�(�(? A
null
�(�(B F
)
�(�(F G
{
�(�(  !
command
�(�($ +
.
�(�(+ ,

Parameters
�(�(, 6
.
�(�(6 7
Add
�(�(7 :
(
�(�(: ;
new
�(�(; >
NpgsqlParameter
�(�(? N
(
�(�(N O
$str
�(�(O R
+
�(�(S T
intContador
�(�(U `
,
�(�(` a
DBNull
�(�(O U
.
�(�(U V
Value
�(�(V [
)
�(�([ \
)
�(�(\ ]
;
�(�(] ^
}
�(�(  !
else
�(�(  $
{
�(�(  !
command
�(�($ +
.
�(�(+ ,

Parameters
�(�(, 6
.
�(�(6 7
Add
�(�(7 :
(
�(�(: ;
new
�(�(; >
NpgsqlParameter
�(�(? N
(
�(�(N O
$str
�(�(O R
+
�(�(S T
intContador
�(�(U `
,
�(�(` a

�(�(O \
[
�(�(\ ]
intContador
�(�(] h
]
�(�(h i
)
�(�(i j
)
�(�(j k
;
�(�(k l
}
�(�(  !
break
�(�(  %
;
�(�(% &
}
�(�( 
}
�(�( 
}
�(�( 
command
�(�( 
.
�(�( 

Connection
�(�( "
=
�(�(# $

ConexionBd
�(�(% /
;
�(�(/ 0
var
�(�( 
da
�(�( 
=
�(�( 
new
�(�( 
NpgsqlDataAdapter
�(�( .
(
�(�(. /
command
�(�(/ 6
)
�(�(6 7
;
�(�(7 8
var
�(�( 
dtTemp
�(�( 
=
�(�( 
new
�(�(  
	DataTable
�(�(! *
(
�(�(* +
)
�(�(+ ,
;
�(�(, -
da
�(�( 
.
�(�( 
Fill
�(�( 
(
�(�( 
dtTemp
�(�( 
)
�(�( 
;
�(�(  
command
�(�( 
.
�(�( 

Connection
�(�( "
.
�(�(" #
Close
�(�(# (
(
�(�(( )
)
�(�() *
;
�(�(* +
command
�(�( 
.
�(�( 
Dispose
�(�( 
(
�(�(  
)
�(�(  !
;
�(�(! "
return
�(�( 
dtTemp
�(�( 
;
�(�( 
}
�(�( 
catch
�(�( 
(
�(�( 
	Exception
�(�( 
ex
�(�( 
)
�(�(  
{
�(�( 
ex
�(�( 
.
�(�( 
Data
�(�( 
.
�(�( 
Add
�(�( 
(
�(�( 
$str
�(�( -
,
�(�(- .
nombreSp
�(�(/ 7
)
�(�(7 8
;
�(�(8 9
throw
�(�( 
;
�(�( 
}
�(�( 
}
�(�( 	
public
�(�( 
	DataTable
�(�( +
ExecStoreProcedureToDataTable
�(�( 6
(
�(�(6 7
string
�(�(7 =
nombreSp
�(�(> F
,
�(�(F G
	ArrayList
�(�(H Q

�(�(R _
,
�(�(_ `
ref
�(�(a d
CTrans
�(�(e k
trans
�(�(l q
)
�(�(q r
{
�(�( 	
var
�(�( 
command
�(�( 
=
�(�( 
new
�(�( 

�(�( +
(
�(�(+ ,
)
�(�(, -
;
�(�(- .
command
�(�( 
.
�(�( 
CommandText
�(�( 
=
�(�(  !
nombreSp
�(�(" *
;
�(�(* +
command
�(�( 
.
�(�( 
CommandType
�(�( 
=
�(�(  !
CommandType
�(�(" -
.
�(�(- .
StoredProcedure
�(�(. =
;
�(�(= >
try
�(�( 
{
�(�( 
for
�(�( 
(
�(�( 
var
�(�( 
intContador
�(�( $
=
�(�(% &
$num
�(�(' (
;
�(�(( )
intContador
�(�(* 5
<
�(�(6 7

�(�(8 E
.
�(�(E F
Count
�(�(F K
;
�(�(K L
intContador
�(�(M X
++
�(�(X Z
)
�(�(Z [
{
�(�( 
if
�(�( 
(
�(�( 

�(�( %
[
�(�(% &
intContador
�(�(& 1
]
�(�(1 2
==
�(�(3 5
null
�(�(6 :
)
�(�(: ;
{
�(�( 
command
�(�( 
.
�(�(  

Parameters
�(�(  *
.
�(�(* +
Add
�(�(+ .
(
�(�(. /
new
�(�(/ 2
NpgsqlParameter
�(�(3 B
(
�(�(B C

�(�(C P
[
�(�(P Q
intContador
�(�(Q \
]
�(�(\ ]
.
�(�(] ^
ToString
�(�(^ f
(
�(�(f g
)
�(�(g h
,
�(�(h i
DBNull
�(�(j p
.
�(�(p q
Value
�(�(q v
)
�(�(v w
)
�(�(w x
;
�(�(x y
}
�(�( 
else
�(�( 
{
�(�( 
switch
�(�( 
(
�(�(  

�(�(  -
[
�(�(- .
intContador
�(�(. 9
]
�(�(9 :
.
�(�(: ;
GetType
�(�(; B
(
�(�(B C
)
�(�(C D
.
�(�(D E
ToString
�(�(E M
(
�(�(M N
)
�(�(N O
)
�(�(O P
{
�(�( 
case
�(�(  
$str
�(�(! /
:
�(�(/ 0
case
�(�(  
$str
�(�(! /
:
�(�(/ 0
case
�(�(  
$str
�(�(! 1
:
�(�(1 2
if
�(�(  "
(
�(�(# $

�(�($ 1
[
�(�(1 2
intContador
�(�(2 =
]
�(�(= >
==
�(�(? A
null
�(�(B F
)
�(�(F G
{
�(�(  !
command
�(�($ +
.
�(�(+ ,

Parameters
�(�(, 6
.
�(�(6 7
Add
�(�(7 :
(
�(�(: ;
new
�(�(; >
NpgsqlParameter
�(�(? N
(
�(�(N O
$str
�(�(O R
+
�(�(S T
intContador
�(�(U `
,
�(�(` a
NpgsqlDbType
�(�(b n
.
�(�(n o
Numeric
�(�(o v
,
�(�(v w
$num
�(�(x y
,
�(�(y z
$str
�(�({ }
,
�(�(} ~ 
ParameterDirection
�(�(O a
.
�(�(a b
Input
�(�(b g
,
�(�(g h
false
�(�(i n
,
�(�(n o
$num
�(�(p q
,
�(�(q r
$num
�(�(s t
,
�(�(t u
DataRowVersion
�(�(O ]
.
�(�(] ^
Proposed
�(�(^ f
,
�(�(f g
DBNull
�(�(O U
.
�(�(U V
Value
�(�(V [
)
�(�([ \
)
�(�(\ ]
;
�(�(] ^
}
�(�(  !
else
�(�(  $
{
�(�(  !
command
�(�($ +
.
�(�(+ ,

Parameters
�(�(, 6
.
�(�(6 7
Add
�(�(7 :
(
�(�(: ;
new
�(�(; >
NpgsqlParameter
�(�(? N
(
�(�(N O
$str
�(�(O R
+
�(�(S T
intContador
�(�(U `
,
�(�(` a
NpgsqlDbType
�(�(b n
.
�(�(n o
Numeric
�(�(o v
,
�(�(v w
$num
�(�(x y
,
�(�(y z
$str
�(�({ }
,
�(�(} ~ 
ParameterDirection
�(�(O a
.
�(�(a b
Input
�(�(b g
,
�(�(g h
false
�(�(i n
,
�(�(n o
$num
�(�(p q
,
�(�(q r
$num
�(�(s t
,
�(�(t u
DataRowVersion
�(�(O ]
.
�(�(] ^
Proposed
�(�(^ f
,
�(�(f g

�(�(O \
[
�(�(\ ]
intContador
�(�(] h
]
�(�(h i
)
�(�(i j
)
�(�(j k
;
�(�(k l
}
�(�(  !
break
�(�(  %
;
�(�(% &
case
�(�(  
$str
�(�(! 0
:
�(�(0 1
if
�(�(  "
(
�(�(# $

�(�($ 1
[
�(�(1 2
intContador
�(�(2 =
]
�(�(= >
==
�(�(? A
null
�(�(B F
)
�(�(F G
{
�(�(  !
command
�(�($ +
.
�(�(+ ,

Parameters
�(�(, 6
.
�(�(6 7
Add
�(�(7 :
(
�(�(: ;
new
�(�(; >
NpgsqlParameter
�(�(? N
(
�(�(N O
$str
�(�(O R
+
�(�(S T
intContador
�(�(U `
,
�(�(` a
DBNull
�(�(b h
.
�(�(h i
Value
�(�(i n
)
�(�(n o
)
�(�(o p
;
�(�(p q
}
�(�(  !
else
�(�(  $
{
�(�(  !
command
�(�($ +
.
�(�(+ ,

Parameters
�(�(, 6
.
�(�(6 7
Add
�(�(7 :
(
�(�(: ;
new
�(�(; >
NpgsqlParameter
�(�(? N
(
�(�(N O
$str
�(�(O R
+
�(�(S T
intContador
�(�(U `
,
�(�(` a

�(�(O \
[
�(�(\ ]
intContador
�(�(] h
]
�(�(h i
)
�(�(i j
)
�(�(j k
;
�(�(k l
command
�(�($ +
.
�(�(+ ,

Parameters
�(�(, 6
[
�(�(6 7
$str
�(�(7 :
+
�(�(; <
intContador
�(�(= H
]
�(�(H I
.
�(�(I J
NpgsqlDbType
�(�(J V
=
�(�(W X
NpgsqlDbType
�(�(Y e
.
�(�(e f
Text
�(�(f j
;
�(�(j k
}
�(�(  !
break
�(�(  %
;
�(�(% &
case
�(�(  
$str
�(�(! 2
:
�(�(2 3
if
�)�)  "
(
�)�)# $

�)�)$ 1
[
�)�)1 2
intContador
�)�)2 =
]
�)�)= >
==
�)�)? A
null
�)�)B F
)
�)�)F G
{
�)�)  !
command
�)�)$ +
.
�)�)+ ,

Parameters
�)�), 6
.
�)�)6 7
Add
�)�)7 :
(
�)�): ;
new
�)�); >
NpgsqlParameter
�)�)? N
(
�)�)N O
$str
�)�)O R
+
�)�)S T
intContador
�)�)U `
,
�)�)` a
DBNull
�)�)b h
.
�)�)h i
Value
�)�)i n
)
�)�)n o
)
�)�)o p
;
�)�)p q
}
�)�)  !
else
�)�)  $
{
�)�)  !
command
�)�)$ +
.
�)�)+ ,

Parameters
�)�), 6
.
�)�)6 7
Add
�)�)7 :
(
�)�): ;
new
�)�); >
NpgsqlParameter
�)�)? N
(
�)�)N O
$str
�)�)O R
+
�)�)S T
intContador
�)�)U `
,
�)�)` a

�)�)O \
[
�)�)\ ]
intContador
�)�)] h
]
�)�)h i
)
�)�)i j
)
�)�)j k
;
�)�)k l
command
�)�)$ +
.
�)�)+ ,

Parameters
�)�), 6
[
�)�)6 7
$str
�)�)7 :
+
�)�); <
intContador
�)�)= H
]
�)�)H I
.
�)�)I J
NpgsqlDbType
�)�)J V
=
�)�)W X
NpgsqlDbType
�)�)Y e
.
�)�)e f
	Timestamp
�)�)f o
;
�)�)o p
}
�)�)  !
break
�)�)  %
;
�)�)% &
default
�)�) #
:
�)�)# $
if
�)�)  "
(
�)�)# $

�)�)$ 1
[
�)�)1 2
intContador
�)�)2 =
]
�)�)= >
==
�)�)? A
null
�)�)B F
)
�)�)F G
{
�)�)  !
command
�)�)$ +
.
�)�)+ ,

Parameters
�)�), 6
.
�)�)6 7
Add
�)�)7 :
(
�)�): ;
new
�)�); >
NpgsqlParameter
�)�)? N
(
�)�)N O
$str
�)�)O R
+
�)�)S T
intContador
�)�)U `
,
�)�)` a
DBNull
�)�)O U
.
�)�)U V
Value
�)�)V [
)
�)�)[ \
)
�)�)\ ]
;
�)�)] ^
}
�)�)  !
else
�)�)  $
{
�)�)  !
command
�)�)$ +
.
�)�)+ ,

Parameters
�)�), 6
.
�)�)6 7
Add
�)�)7 :
(
�)�): ;
new
�)�); >
NpgsqlParameter
�)�)? N
(
�)�)N O
$str
�)�)O R
+
�)�)S T
intContador
�)�)U `
,
�)�)` a

�)�)O \
[
�)�)\ ]
intContador
�)�)] h
]
�)�)h i
)
�)�)i j
)
�)�)j k
;
�)�)k l
}
�)�)  !
break
�)�)  %
;
�)�)% &
}
�)�) 
}
�)�) 
}
�)�) 
command
�)�) 
.
�)�) 

Connection
�)�) "
=
�)�)# $
trans
�)�)% *
.
�)�)* +
MyConn
�)�)+ 1
;
�)�)1 2
command
�)�) 
.
�)�) 
Transaction
�)�) #
=
�)�)$ %
trans
�)�)& +
.
�)�)+ ,
MyTrans
�)�), 3
;
�)�)3 4
var
�)�) 
da
�)�) 
=
�)�) 
new
�)�) 
NpgsqlDataAdapter
�)�) .
(
�)�). /
command
�)�)/ 6
)
�)�)6 7
;
�)�)7 8
var
�)�) 
dtTemp
�)�) 
=
�)�) 
new
�)�)  
	DataTable
�)�)! *
(
�)�)* +
)
�)�)+ ,
;
�)�), -
da
�)�) 
.
�)�) 
Fill
�)�) 
(
�)�) 
dtTemp
�)�) 
)
�)�) 
;
�)�)  
command
�)�) 
.
�)�) 

Connection
�)�) "
.
�)�)" #
Close
�)�)# (
(
�)�)( )
)
�)�)) *
;
�)�)* +
command
�)�) 
.
�)�) 
Dispose
�)�) 
(
�)�)  
)
�)�)  !
;
�)�)! "
return
�)�) 
dtTemp
�)�) 
;
�)�) 
}
�)�) 
catch
�)�) 
(
�)�) 
	Exception
�)�) 
ex
�)�) 
)
�)�)  
{
�)�) 
ex
�)�) 
.
�)�) 
Data
�)�) 
.
�)�) 
Add
�)�) 
(
�)�) 
$str
�)�) -
,
�)�)- .
nombreSp
�)�)/ 7
)
�)�)7 8
;
�)�)8 9
throw
�)�) 
;
�)�) 
}
�)�) 
}
�)�) 	
public
�)�) 
	DataTable
�)�) +
ExecStoreProcedureToDataTable
�)�) 6
(
�)�)6 7
string
�)�)7 =
nombreSp
�)�)> F
,
�)�)F G
	ArrayList
�)�)H Q!
arrNombreParametros
�)�)R e
,
�)�)e f
	ArrayList
�)�)7 @

�)�)A N
)
�)�)N O
{
�)�) 	
var
�)�) 
command
�)�) 
=
�)�) 
new
�)�) 

�)�) +
(
�)�)+ ,
)
�)�), -
;
�)�)- .
command
�)�) 
.
�)�) 
CommandText
�)�) 
=
�)�)  !
nombreSp
�)�)" *
;
�)�)* +
command
�)�) 
.
�)�) 
CommandType
�)�) 
=
�)�)  !
CommandType
�)�)" -
.
�)�)- .
StoredProcedure
�)�). =
;
�)�)= >
try
�)�) 
{
�)�) 
for
�)�) 
(
�)�) 
var
�)�) 
intContador
�)�) $
=
�)�)% &
$num
�)�)' (
;
�)�)( )
intContador
�)�)* 5
<
�)�)6 7

�)�)8 E
.
�)�)E F
Count
�)�)F K
;
�)�)K L
intContador
�)�)M X
++
�)�)X Z
)
�)�)Z [
{
�)�) 
if
�)�) 
(
�)�) 

�)�) %
[
�)�)% &
intContador
�)�)& 1
]
�)�)1 2
==
�)�)3 5
null
�)�)6 :
)
�)�): ;
{
�)�) 
command
�)�) 
.
�)�)  

Parameters
�)�)  *
.
�)�)* +
Add
�)�)+ .
(
�)�). /
new
�)�)/ 2
NpgsqlParameter
�)�)3 B
(
�)�)B C!
arrNombreParametros
�)�)C V
[
�)�)V W
intContador
�)�)W b
]
�)�)b c
.
�)�)c d
ToString
�)�)d l
(
�)�)l m
)
�)�)m n
,
�)�)n o
DBNull
�)�)C I
.
�)�)I J
Value
�)�)J O
)
�)�)O P
)
�)�)P Q
;
�)�)Q R
}
�)�) 
else
�)�) 
{
�)�) 
switch
�)�) 
(
�)�)  

�)�)  -
[
�)�)- .
intContador
�)�). 9
]
�)�)9 :
.
�)�): ;
GetType
�)�); B
(
�)�)B C
)
�)�)C D
.
�)�)D E
ToString
�)�)E M
(
�)�)M N
)
�)�)N O
)
�)�)O P
{
�)�) 
case
�)�)  
$str
�)�)! /
:
�)�)/ 0
case
�)�)  
$str
�)�)! /
:
�)�)/ 0
case
�)�)  
$str
�)�)! 1
:
�)�)1 2
if
�)�)  "
(
�)�)# $

�)�)$ 1
[
�)�)1 2
intContador
�)�)2 =
]
�)�)= >
==
�)�)? A
null
�)�)B F
)
�)�)F G
{
�)�)  !
command
�)�)$ +
.
�)�)+ ,

Parameters
�)�), 6
.
�)�)6 7
Add
�)�)7 :
(
�)�): ;
new
�)�); >
NpgsqlParameter
�)�)? N
(
�)�)N O
$str
�)�)O R
+
�)�)S T!
arrNombreParametros
�)�)U h
[
�)�)h i
intContador
�)�)i t
]
�)�)t u
,
�)�)u v
NpgsqlDbType�)�)w �
.�)�)� �
Numeric�)�)� �
,�)�)� �
$num�)�)� �
,�)�)� �
$str�)�)� �
,�)�)� � 
ParameterDirection
�)�)O a
.
�)�)a b
Input
�)�)b g
,
�)�)g h
false
�)�)i n
,
�)�)n o
$num
�)�)p q
,
�)�)q r
$num
�)�)s t
,
�)�)t u
DataRowVersion
�)�)O ]
.
�)�)] ^
Proposed
�)�)^ f
,
�)�)f g
DBNull
�)�)O U
.
�)�)U V
Value
�)�)V [
)
�)�)[ \
)
�)�)\ ]
;
�)�)] ^
}
�)�)  !
else
�)�)  $
{
�)�)  !
command
�)�)$ +
.
�)�)+ ,

Parameters
�)�), 6
.
�)�)6 7
Add
�)�)7 :
(
�)�): ;
new
�)�); >
NpgsqlParameter
�)�)? N
(
�)�)N O
$str
�)�)O R
+
�)�)S T!
arrNombreParametros
�)�)U h
[
�)�)h i
intContador
�)�)i t
]
�)�)t u
,
�)�)u v
NpgsqlDbType�)�)w �
.�)�)� �
Numeric�)�)� �
,�)�)� �
$num�)�)� �
,�)�)� �
$str�)�)� �
,�)�)� � 
ParameterDirection
�)�)O a
.
�)�)a b
Input
�)�)b g
,
�)�)g h
false
�)�)i n
,
�)�)n o
$num
�)�)p q
,
�)�)q r
$num
�)�)s t
,
�)�)t u
DataRowVersion
�)�)O ]
.
�)�)] ^
Proposed
�)�)^ f
,
�)�)f g

�)�)O \
[
�)�)\ ]
intContador
�)�)] h
]
�)�)h i
)
�)�)i j
)
�)�)j k
;
�)�)k l
}
�)�)  !
break
�)�)  %
;
�)�)% &
case
�)�)  
$str
�)�)! 0
:
�)�)0 1
if
�)�)  "
(
�)�)# $

�)�)$ 1
[
�)�)1 2
intContador
�)�)2 =
]
�)�)= >
==
�)�)? A
null
�)�)B F
)
�)�)F G
{
�)�)  !
command
�)�)$ +
.
�)�)+ ,

Parameters
�)�), 6
.
�)�)6 7
Add
�)�)7 :
(
�)�): ;
new
�)�); >
NpgsqlParameter
�)�)? N
(
�)�)N O
$str
�)�)O R
+
�)�)S T!
arrNombreParametros
�)�)U h
[
�)�)h i
intContador
�)�)i t
]
�)�)t u
,
�)�)u v
DBNull
�)�)w }
.
�)�)} ~
Value�)�)~ �
)�)�)� �
)�)�)� �
;�)�)� �
}
�)�)  !
else
�)�)  $
{
�)�)  !
command
�)�)$ +
.
�)�)+ ,

Parameters
�)�), 6
.
�)�)6 7
Add
�)�)7 :
(
�)�): ;
new
�)�); >
NpgsqlParameter
�)�)? N
(
�)�)N O
$str
�)�)O R
+
�)�)S T!
arrNombreParametros
�)�)U h
[
�)�)h i
intContador
�)�)i t
]
�)�)t u
,
�)�)u v

�)�)O \
[
�)�)\ ]
intContador
�)�)] h
]
�)�)h i
)
�)�)i j
)
�)�)j k
;
�)�)k l
command
�)�)$ +
.
�)�)+ ,

Parameters
�)�), 6
[
�)�)6 7
$str
�)�)7 :
+
�)�); <!
arrNombreParametros
�)�)= P
[
�)�)P Q
intContador
�)�)Q \
]
�)�)\ ]
]
�)�)] ^
.
�)�)^ _
NpgsqlDbType
�)�)_ k
=
�)�)l m
NpgsqlDbType
�)�)n z
.
�)�)z {
Text
�)�){ 
;�)�) �
}
�)�)  !
break
�)�)  %
;
�)�)% &
case
�)�)  
$str
�)�)! 2
:
�)�)2 3
if
�)�)  "
(
�)�)# $

�)�)$ 1
[
�)�)1 2
intContador
�)�)2 =
]
�)�)= >
==
�)�)? A
null
�)�)B F
)
�)�)F G
{
�)�)  !
command
�)�)$ +
.
�)�)+ ,

Parameters
�)�), 6
.
�)�)6 7
Add
�)�)7 :
(
�)�): ;
new
�)�); >
NpgsqlParameter
�)�)? N
(
�)�)N O
$str
�)�)O R
+
�)�)S T!
arrNombreParametros
�)�)U h
[
�)�)h i
intContador
�)�)i t
]
�)�)t u
,
�)�)u v
DBNull
�)�)w }
.
�)�)} ~
Value�)�)~ �
)�)�)� �
)�)�)� �
;�)�)� �
}
�)�)  !
else
�)�)  $
{
�)�)  !
command
�)�)$ +
.
�)�)+ ,

Parameters
�)�), 6
.
�)�)6 7
Add
�)�)7 :
(
�)�): ;
new
�)�); >
NpgsqlParameter
�)�)? N
(
�)�)N O
$str
�)�)O R
+
�)�)S T!
arrNombreParametros
�)�)U h
[
�)�)h i
intContador
�)�)i t
]
�)�)t u
,
�)�)u v

�)�)O \
[
�)�)\ ]
intContador
�)�)] h
]
�)�)h i
)
�)�)i j
)
�)�)j k
;
�)�)k l
command
�)�)$ +
.
�)�)+ ,

Parameters
�)�), 6
[
�)�)6 7
$str
�)�)7 :
+
�)�); <!
arrNombreParametros
�)�)= P
[
�)�)P Q
intContador
�)�)Q \
]
�)�)\ ]
]
�)�)] ^
.
�)�)^ _
NpgsqlDbType
�)�)_ k
=
�)�)l m
NpgsqlDbType
�)�)n z
.
�)�)z {
	Timestamp�)�){ �
;�)�)� �
}
�*�*  !
break
�*�*  %
;
�*�*% &
default
�*�* #
:
�*�*# $
if
�*�*  "
(
�*�*# $

�*�*$ 1
[
�*�*1 2
intContador
�*�*2 =
]
�*�*= >
==
�*�*? A
null
�*�*B F
)
�*�*F G
{
�*�*  !
command
�*�*$ +
.
�*�*+ ,

Parameters
�*�*, 6
.
�*�*6 7
Add
�*�*7 :
(
�*�*: ;
new
�*�*; >
NpgsqlParameter
�*�*? N
(
�*�*N O
$str
�*�*O R
+
�*�*S T!
arrNombreParametros
�*�*U h
[
�*�*h i
intContador
�*�*i t
]
�*�*t u
,
�*�*u v
DBNull
�*�*O U
.
�*�*U V
Value
�*�*V [
)
�*�*[ \
)
�*�*\ ]
;
�*�*] ^
}
�*�*  !
else
�*�*  $
{
�*�*  !
command
�*�*$ +
.
�*�*+ ,

Parameters
�*�*, 6
.
�*�*6 7
Add
�*�*7 :
(
�*�*: ;
new
�*�*; >
NpgsqlParameter
�*�*? N
(
�*�*N O
$str
�*�*O R
+
�*�*S T!
arrNombreParametros
�*�*U h
[
�*�*h i
intContador
�*�*i t
]
�*�*t u
,
�*�*u v

�*�*O \
[
�*�*\ ]
intContador
�*�*] h
]
�*�*h i
)
�*�*i j
)
�*�*j k
;
�*�*k l
}
�*�*  !
break
�*�*  %
;
�*�*% &
}
�*�* 
}
�*�* 
}
�*�* 
command
�*�* 
.
�*�* 

Connection
�*�* "
=
�*�*# $

ConexionBd
�*�*% /
;
�*�*/ 0
var
�*�* 
da
�*�* 
=
�*�* 
new
�*�* 
NpgsqlDataAdapter
�*�* .
(
�*�*. /
command
�*�*/ 6
)
�*�*6 7
;
�*�*7 8
var
�*�* 
dtTemp
�*�* 
=
�*�* 
new
�*�*  
	DataTable
�*�*! *
(
�*�** +
)
�*�*+ ,
;
�*�*, -
da
�*�* 
.
�*�* 
Fill
�*�* 
(
�*�* 
dtTemp
�*�* 
)
�*�* 
;
�*�*  
command
�*�* 
.
�*�* 

Connection
�*�* "
.
�*�*" #
Close
�*�*# (
(
�*�*( )
)
�*�*) *
;
�*�** +
command
�*�* 
.
�*�* 
Dispose
�*�* 
(
�*�*  
)
�*�*  !
;
�*�*! "
return
�*�* 
dtTemp
�*�* 
;
�*�* 
}
�*�* 
catch
�*�* 
(
�*�* 
	Exception
�*�* 
ex
�*�* 
)
�*�*  
{
�*�* 
ex
�*�* 
.
�*�* 
Data
�*�* 
.
�*�* 
Add
�*�* 
(
�*�* 
$str
�*�* -
,
�*�*- .
nombreSp
�*�*/ 7
)
�*�*7 8
;
�*�*8 9
throw
�*�* 
;
�*�* 
}
�*�* 
}
�*�* 	
public
�*�* 
	DataTable
�*�* +
ExecStoreProcedureToDataTable
�*�* 6
(
�*�*6 7
string
�*�*7 =
nombreSp
�*�*> F
,
�*�*F G
	ArrayList
�*�*H Q!
arrNombreParametros
�*�*R e
,
�*�*e f
	ArrayList
�*�*7 @

�*�*A N
,
�*�*N O
ref
�*�*P S
CTrans
�*�*T Z
trans
�*�*[ `
)
�*�*` a
{
�*�* 	
var
�*�* 
command
�*�* 
=
�*�* 
new
�*�* 

�*�* +
(
�*�*+ ,
)
�*�*, -
;
�*�*- .
command
�*�* 
.
�*�* 
CommandText
�*�* 
=
�*�*  !
nombreSp
�*�*" *
;
�*�** +
command
�*�* 
.
�*�* 
CommandType
�*�* 
=
�*�*  !
CommandType
�*�*" -
.
�*�*- .
StoredProcedure
�*�*. =
;
�*�*= >
try
�*�* 
{
�*�* 
if
�*�* 
(
�*�* !
arrNombreParametros
�*�* '
.
�*�*' (
Count
�*�*( -
!=
�*�*. 0

�*�*1 >
.
�*�*> ?
Count
�*�*? D
)
�*�*D E
{
�*�* 
throw
�*�* 
new
�*�* 
ArgumentException
�*�* /
(
�*�*/ 0
$str�*�* �
)�*�*� �
;�*�*� �
}
�*�* 
for
�*�* 
(
�*�* 
var
�*�* 
intContador
�*�* $
=
�*�*% &
$num
�*�*' (
;
�*�*( )
intContador
�*�** 5
<
�*�*6 7

�*�*8 E
.
�*�*E F
Count
�*�*F K
;
�*�*K L
intContador
�*�*M X
++
�*�*X Z
)
�*�*Z [
{
�*�* 
if
�*�* 
(
�*�* 

�*�* %
[
�*�*% &
intContador
�*�*& 1
]
�*�*1 2
==
�*�*3 5
null
�*�*6 :
)
�*�*: ;
{
�*�* 
command
�*�* 
.
�*�*  

Parameters
�*�*  *
.
�*�** +
Add
�*�*+ .
(
�*�*. /
new
�*�*/ 2
NpgsqlParameter
�*�*3 B
(
�*�*B C!
arrNombreParametros
�*�*C V
[
�*�*V W
intContador
�*�*W b
]
�*�*b c
.
�*�*c d
ToString
�*�*d l
(
�*�*l m
)
�*�*m n
,
�*�*n o
DBNull
�*�*C I
.
�*�*I J
Value
�*�*J O
)
�*�*O P
)
�*�*P Q
;
�*�*Q R
}
�*�* 
else
�*�* 
{
�*�* 
switch
�*�* 
(
�*�*  

�*�*  -
[
�*�*- .
intContador
�*�*. 9
]
�*�*9 :
.
�*�*: ;
GetType
�*�*; B
(
�*�*B C
)
�*�*C D
.
�*�*D E
ToString
�*�*E M
(
�*�*M N
)
�*�*N O
)
�*�*O P
{
�*�* 
case
�*�*  
$str
�*�*! /
:
�*�*/ 0
case
�*�*  
$str
�*�*! /
:
�*�*/ 0
case
�*�*  
$str
�*�*! 1
:
�*�*1 2
if
�*�*  "
(
�*�*# $

�*�*$ 1
[
�*�*1 2
intContador
�*�*2 =
]
�*�*= >
==
�*�*? A
null
�*�*B F
)
�*�*F G
{
�*�*  !
command
�*�*$ +
.
�*�*+ ,

Parameters
�*�*, 6
.
�*�*6 7
Add
�*�*7 :
(
�*�*: ;
new
�*�*; >
NpgsqlParameter
�*�*? N
(
�*�*N O
$str
�*�*O R
+
�*�*S T!
arrNombreParametros
�*�*U h
[
�*�*h i
intContador
�*�*i t
]
�*�*t u
,
�*�*u v
NpgsqlDbType�*�*w �
.�*�*� �
Numeric�*�*� �
,�*�*� �
$num�*�*� �
,�*�*� �
$str�*�*� �
,�*�*� � 
ParameterDirection
�*�*O a
.
�*�*a b
Input
�*�*b g
,
�*�*g h
false
�*�*i n
,
�*�*n o
$num
�*�*p q
,
�*�*q r
$num
�*�*s t
,
�*�*t u
DataRowVersion
�*�*O ]
.
�*�*] ^
Proposed
�*�*^ f
,
�*�*f g
DBNull
�*�*O U
.
�*�*U V
Value
�*�*V [
)
�*�*[ \
)
�*�*\ ]
;
�*�*] ^
}
�*�*  !
else
�*�*  $
{
�*�*  !
command
�*�*$ +
.
�*�*+ ,

Parameters
�*�*, 6
.
�*�*6 7
Add
�*�*7 :
(
�*�*: ;
new
�*�*; >
NpgsqlParameter
�*�*? N
(
�*�*N O
$str
�*�*O R
+
�*�*S T!
arrNombreParametros
�*�*U h
[
�*�*h i
intContador
�*�*i t
]
�*�*t u
,
�*�*u v
NpgsqlDbType�*�*w �
.�*�*� �
Numeric�*�*� �
,�*�*� �
$num�*�*� �
,�*�*� �
$str�*�*� �
,�*�*� � 
ParameterDirection
�*�*O a
.
�*�*a b
Input
�*�*b g
,
�*�*g h
false
�*�*i n
,
�*�*n o
$num
�*�*p q
,
�*�*q r
$num
�*�*s t
,
�*�*t u
DataRowVersion
�*�*O ]
.
�*�*] ^
Proposed
�*�*^ f
,
�*�*f g

�*�*O \
[
�*�*\ ]
intContador
�*�*] h
]
�*�*h i
)
�*�*i j
)
�*�*j k
;
�*�*k l
}
�*�*  !
break
�*�*  %
;
�*�*% &
case
�*�*  
$str
�*�*! 0
:
�*�*0 1
if
�*�*  "
(
�*�*# $

�*�*$ 1
[
�*�*1 2
intContador
�*�*2 =
]
�*�*= >
==
�*�*? A
null
�*�*B F
)
�*�*F G
{
�*�*  !
command
�*�*$ +
.
�*�*+ ,

Parameters
�*�*, 6
.
�*�*6 7
Add
�*�*7 :
(
�*�*: ;
new
�*�*; >
NpgsqlParameter
�*�*? N
(
�*�*N O
$str
�*�*O R
+
�*�*S T!
arrNombreParametros
�*�*U h
[
�*�*h i
intContador
�*�*i t
]
�*�*t u
,
�*�*u v
DBNull
�*�*w }
.
�*�*} ~
Value�*�*~ �
)�*�*� �
)�*�*� �
;�*�*� �
}
�*�*  !
else
�*�*  $
{
�*�*  !
command
�*�*$ +
.
�*�*+ ,

Parameters
�*�*, 6
.
�*�*6 7
Add
�*�*7 :
(
�*�*: ;
new
�*�*; >
NpgsqlParameter
�*�*? N
(
�*�*N O
$str
�*�*O R
+
�*�*S T!
arrNombreParametros
�*�*U h
[
�*�*h i
intContador
�*�*i t
]
�*�*t u
,
�*�*u v

�*�*O \
[
�*�*\ ]
intContador
�*�*] h
]
�*�*h i
)
�*�*i j
)
�*�*j k
;
�*�*k l
command
�*�*$ +
.
�*�*+ ,

Parameters
�*�*, 6
[
�*�*6 7
$str
�*�*7 :
+
�*�*; <!
arrNombreParametros
�*�*= P
[
�*�*P Q
intContador
�*�*Q \
]
�*�*\ ]
]
�*�*] ^
.
�*�*^ _
NpgsqlDbType
�*�*_ k
=
�*�*l m
NpgsqlDbType
�*�*n z
.
�*�*z {
Text
�*�*{ 
;�*�* �
}
�*�*  !
break
�*�*  %
;
�*�*% &
case
�*�*  
$str
�*�*! 2
:
�*�*2 3
if
�*�*  "
(
�*�*# $

�*�*$ 1
[
�*�*1 2
intContador
�*�*2 =
]
�*�*= >
==
�*�*? A
null
�*�*B F
)
�*�*F G
{
�*�*  !
command
�*�*$ +
.
�*�*+ ,

Parameters
�*�*, 6
.
�*�*6 7
Add
�*�*7 :
(
�*�*: ;
new
�*�*; >
NpgsqlParameter
�*�*? N
(
�*�*N O
$str
�*�*O R
+
�*�*S T!
arrNombreParametros
�*�*U h
[
�*�*h i
intContador
�*�*i t
]
�*�*t u
,
�*�*u v
DBNull
�*�*w }
.
�*�*} ~
Value�*�*~ �
)�*�*� �
)�*�*� �
;�*�*� �
}
�*�*  !
else
�*�*  $
{
�*�*  !
command
�*�*$ +
.
�*�*+ ,

Parameters
�*�*, 6
.
�*�*6 7
Add
�*�*7 :
(
�*�*: ;
new
�*�*; >
NpgsqlParameter
�*�*? N
(
�*�*N O
$str
�*�*O R
+
�*�*S T!
arrNombreParametros
�*�*U h
[
�*�*h i
intContador
�*�*i t
]
�*�*t u
,
�*�*u v

�*�*O \
[
�*�*\ ]
intContador
�*�*] h
]
�*�*h i
)
�*�*i j
)
�*�*j k
;
�*�*k l
command
�*�*$ +
.
�*�*+ ,

Parameters
�*�*, 6
[
�*�*6 7
$str
�*�*7 :
+
�*�*; <!
arrNombreParametros
�*�*= P
[
�*�*P Q
intContador
�*�*Q \
]
�*�*\ ]
]
�*�*] ^
.
�*�*^ _
NpgsqlDbType
�*�*_ k
=
�*�*l m
NpgsqlDbType
�*�*n z
.
�*�*z {
	Timestamp�*�*{ �
;�*�*� �
}
�+�+  !
break
�+�+  %
;
�+�+% &
default
�+�+ #
:
�+�+# $
if
�+�+  "
(
�+�+# $

�+�+$ 1
[
�+�+1 2
intContador
�+�+2 =
]
�+�+= >
==
�+�+? A
null
�+�+B F
)
�+�+F G
{
�+�+  !
command
�+�+$ +
.
�+�++ ,

Parameters
�+�+, 6
.
�+�+6 7
Add
�+�+7 :
(
�+�+: ;
new
�+�+; >
NpgsqlParameter
�+�+? N
(
�+�+N O
$str
�+�+O R
+
�+�+S T!
arrNombreParametros
�+�+U h
[
�+�+h i
intContador
�+�+i t
]
�+�+t u
,
�+�+u v
DBNull
�+�+O U
.
�+�+U V
Value
�+�+V [
)
�+�+[ \
)
�+�+\ ]
;
�+�+] ^
}
�+�+  !
else
�+�+  $
{
�+�+  !
command
�+�+$ +
.
�+�++ ,

Parameters
�+�+, 6
.
�+�+6 7
Add
�+�+7 :
(
�+�+: ;
new
�+�+; >
NpgsqlParameter
�+�+? N
(
�+�+N O
$str
�+�+O R
+
�+�+S T!
arrNombreParametros
�+�+U h
[
�+�+h i
intContador
�+�+i t
]
�+�+t u
,
�+�+u v

�+�+O \
[
�+�+\ ]
intContador
�+�+] h
]
�+�+h i
)
�+�+i j
)
�+�+j k
;
�+�+k l
}
�+�+  !
break
�+�+  %
;
�+�+% &
}
�+�+ 
}
�+�+ 
}
�+�+ 
command
�+�+ 
.
�+�+ 

Connection
�+�+ "
=
�+�+# $
trans
�+�+% *
.
�+�+* +
MyConn
�+�++ 1
;
�+�+1 2
command
�+�+ 
.
�+�+ 
Transaction
�+�+ #
=
�+�+$ %
trans
�+�+& +
.
�+�++ ,
MyTrans
�+�+, 3
;
�+�+3 4
var
�+�+ 
da
�+�+ 
=
�+�+ 
new
�+�+ 
NpgsqlDataAdapter
�+�+ .
(
�+�+. /
command
�+�+/ 6
)
�+�+6 7
;
�+�+7 8
var
�+�+ 
dtTemp
�+�+ 
=
�+�+ 
new
�+�+  
	DataTable
�+�+! *
(
�+�+* +
)
�+�++ ,
;
�+�+, -
da
�+�+ 
.
�+�+ 
Fill
�+�+ 
(
�+�+ 
dtTemp
�+�+ 
)
�+�+ 
;
�+�+  
command
�+�+ 
.
�+�+ 
Dispose
�+�+ 
(
�+�+  
)
�+�+  !
;
�+�+! "
return
�+�+ 
dtTemp
�+�+ 
;
�+�+ 
}
�+�+ 
catch
�+�+ 
(
�+�+ 
	Exception
�+�+ 
ex
�+�+ 
)
�+�+  
{
�+�+ 
ex
�+�+ 
.
�+�+ 
Data
�+�+ 
.
�+�+ 
Add
�+�+ 
(
�+�+ 
$str
�+�+ -
,
�+�+- .
nombreSp
�+�+/ 7
)
�+�+7 8
;
�+�+8 9
throw
�+�+ 
;
�+�+ 
}
�+�+ 
}
�+�+ 	
public
�+�+ 
DbDataReader
�+�+ .
 ExecStoreProcedureToDbDataReader
�+�+ <
(
�+�+< =
string
�+�+= C
nombreSp
�+�+D L
)
�+�+L M
{
�+�+ 	
var
�+�+ 
command
�+�+ 
=
�+�+ 
new
�+�+ 

�+�+ +
(
�+�++ ,
)
�+�+, -
;
�+�+- .
command
�+�+ 
.
�+�+ 
CommandText
�+�+ 
=
�+�+  !
nombreSp
�+�+" *
;
�+�+* +
command
�+�+ 
.
�+�+ 
CommandType
�+�+ 
=
�+�+  !
CommandType
�+�+" -
.
�+�+- .
StoredProcedure
�+�+. =
;
�+�+= >
try
�+�+ 
{
�+�+ 
command
�+�+ 
.
�+�+ 

Connection
�+�+ "
=
�+�+# $

ConexionBd
�+�+% /
;
�+�+/ 0
if
�+�+ 
(
�+�+ 
command
�+�+ 
.
�+�+ 

Connection
�+�+ &
.
�+�+& '
State
�+�+' ,
==
�+�+- /
ConnectionState
�+�+0 ?
.
�+�+? @
Closed
�+�+@ F
)
�+�+F G
{
�+�+ 
command
�+�+ 
.
�+�+ 

Connection
�+�+ &
.
�+�+& '
Open
�+�+' +
(
�+�++ ,
)
�+�+, -
;
�+�+- .
}
�+�+ 
DbDataReader
�+�+ 
dr
�+�+ 
=
�+�+  !
command
�+�+" )
.
�+�+) *

�+�+* 7
(
�+�+7 8
CommandBehavior
�+�+8 G
.
�+�+G H
CloseConnection
�+�+H W
)
�+�+W X
;
�+�+X Y
if
�+�+ 
(
�+�+ 
command
�+�+ 
.
�+�+ 

Connection
�+�+ &
.
�+�+& '
State
�+�+' ,
!=
�+�+- /
ConnectionState
�+�+0 ?
.
�+�+? @
Closed
�+�+@ F
)
�+�+F G
{
�+�+ 
command
�+�+ 
.
�+�+ 

Connection
�+�+ &
.
�+�+& '
Close
�+�+' ,
(
�+�+, -
)
�+�+- .
;
�+�+. /
}
�+�+ 
command
�+�+ 
.
�+�+ 
Dispose
�+�+ 
(
�+�+  
)
�+�+  !
;
�+�+! "
return
�+�+ 
dr
�+�+ 
;
�+�+ 
}
�+�+ 
catch
�+�+ 
(
�+�+ 
	Exception
�+�+ 
ex
�+�+ 
)
�+�+  
{
�+�+ 
ex
�+�+ 
.
�+�+ 
Data
�+�+ 
.
�+�+ 
Add
�+�+ 
(
�+�+ 
$str
�+�+ -
,
�+�+- .
nombreSp
�+�+/ 7
)
�+�+7 8
;
�+�+8 9
throw
�+�+ 
;
�+�+ 
}
�+�+ 
}
�+�+ 	
public
�+�+ 
DbDataReader
�+�+ .
 ExecStoreProcedureToDbDataReader
�+�+ <
(
�+�+< =
string
�+�+= C
nombreSp
�+�+D L
,
�+�+L M
ref
�+�+N Q
CTrans
�+�+R X
myTrans
�+�+Y `
)
�+�+` a
{
�+�+ 	
var
�+�+ 
command
�+�+ 
=
�+�+ 
new
�+�+ 

�+�+ +
(
�+�++ ,
)
�+�+, -
;
�+�+- .
command
�+�+ 
.
�+�+ 
CommandText
�+�+ 
=
�+�+  !
nombreSp
�+�+" *
;
�+�+* +
command
�+�+ 
.
�+�+ 
CommandType
�+�+ 
=
�+�+  !
CommandType
�+�+" -
.
�+�+- .
StoredProcedure
�+�+. =
;
�+�+= >
try
�+�+ 
{
�+�+ 
command
�+�+ 
.
�+�+ 

Connection
�+�+ "
=
�+�+# $
myTrans
�+�+% ,
.
�+�+, -
MyConn
�+�+- 3
;
�+�+3 4
command
�+�+ 
.
�+�+ 
Transaction
�+�+ #
=
�+�+$ %
myTrans
�+�+& -
.
�+�+- .
MyTrans
�+�+. 5
;
�+�+5 6
if
�+�+ 
(
�+�+ 
command
�+�+ 
.
�+�+ 

Connection
�+�+ &
.
�+�+& '
State
�+�+' ,
==
�+�+- /
ConnectionState
�+�+0 ?
.
�+�+? @
Closed
�+�+@ F
)
�+�+F G
{
�+�+ 
command
�+�+ 
.
�+�+ 

Connection
�+�+ &
.
�+�+& '
Open
�+�+' +
(
�+�++ ,
)
�+�+, -
;
�+�+- .
}
�+�+ 
DbDataReader
�+�+ 
dr
�+�+ 
=
�+�+  !
command
�+�+" )
.
�+�+) *

�+�+* 7
(
�+�+7 8
CommandBehavior
�+�+8 G
.
�+�+G H
Default
�+�+H O
)
�+�+O P
;
�+�+P Q
command
�+�+ 
.
�+�+ 
Dispose
�+�+ 
(
�+�+  
)
�+�+  !
;
�+�+! "
return
�+�+ 
dr
�+�+ 
;
�+�+ 
}
�+�+ 
catch
�+�+ 
(
�+�+ 
	Exception
�+�+ 
ex
�+�+ 
)
�+�+  
{
�+�+ 
ex
�+�+ 
.
�+�+ 
Data
�+�+ 
.
�+�+ 
Add
�+�+ 
(
�+�+ 
$str
�+�+ -
,
�+�+- .
nombreSp
�+�+/ 7
)
�+�+7 8
;
�+�+8 9
throw
�+�+ 
;
�+�+ 
}
�+�+ 
}
�+�+ 	
public
�,�, 
DbDataReader
�,�, .
 ExecStoreProcedureToDbDataReader
�,�, <
(
�,�,< =
string
�,�,= C
nombreSp
�,�,D L
,
�,�,L M
	ArrayList
�,�,N W

�,�,X e
)
�,�,e f
{
�,�, 	
var
�,�, 
command
�,�, 
=
�,�, 
new
�,�, 

�,�, +
(
�,�,+ ,
)
�,�,, -
;
�,�,- .
command
�,�, 
.
�,�, 
CommandText
�,�, 
=
�,�,  !
nombreSp
�,�," *
;
�,�,* +
command
�,�, 
.
�,�, 
CommandType
�,�, 
=
�,�,  !
CommandType
�,�," -
.
�,�,- .
StoredProcedure
�,�,. =
;
�,�,= >
try
�,�, 
{
�,�, 
for
�,�, 
(
�,�, 
var
�,�, 
intContador
�,�, $
=
�,�,% &
$num
�,�,' (
;
�,�,( )
intContador
�,�,* 5
<
�,�,6 7

�,�,8 E
.
�,�,E F
Count
�,�,F K
;
�,�,K L
intContador
�,�,M X
++
�,�,X Z
)
�,�,Z [
{
�,�, 
if
�,�, 
(
�,�, 

�,�, %
[
�,�,% &
intContador
�,�,& 1
]
�,�,1 2
==
�,�,3 5
null
�,�,6 :
)
�,�,: ;
{
�,�, 
command
�,�, 
.
�,�,  

Parameters
�,�,  *
.
�,�,* +
Add
�,�,+ .
(
�,�,. /
new
�,�,/ 2
NpgsqlParameter
�,�,3 B
(
�,�,B C

�,�,C P
[
�,�,P Q
intContador
�,�,Q \
]
�,�,\ ]
.
�,�,] ^
ToString
�,�,^ f
(
�,�,f g
)
�,�,g h
,
�,�,h i
DBNull
�,�,j p
.
�,�,p q
Value
�,�,q v
)
�,�,v w
)
�,�,w x
;
�,�,x y
}
�,�, 
else
�,�, 
{
�,�, 
switch
�,�, 
(
�,�,  

�,�,  -
[
�,�,- .
intContador
�,�,. 9
]
�,�,9 :
.
�,�,: ;
GetType
�,�,; B
(
�,�,B C
)
�,�,C D
.
�,�,D E
ToString
�,�,E M
(
�,�,M N
)
�,�,N O
)
�,�,O P
{
�,�, 
case
�,�,  
$str
�,�,! /
:
�,�,/ 0
case
�,�,  
$str
�,�,! /
:
�,�,/ 0
case
�,�,  
$str
�,�,! 1
:
�,�,1 2
if
�,�,  "
(
�,�,# $

�,�,$ 1
[
�,�,1 2
intContador
�,�,2 =
]
�,�,= >
==
�,�,? A
null
�,�,B F
)
�,�,F G
{
�,�,  !
command
�,�,$ +
.
�,�,+ ,

Parameters
�,�,, 6
.
�,�,6 7
Add
�,�,7 :
(
�,�,: ;
new
�,�,; >
NpgsqlParameter
�,�,? N
(
�,�,N O
$str
�,�,O R
+
�,�,S T
intContador
�,�,U `
,
�,�,` a
NpgsqlDbType
�,�,b n
.
�,�,n o
Numeric
�,�,o v
,
�,�,v w
$num
�,�,x y
,
�,�,y z
$str
�,�,{ }
,
�,�,} ~ 
ParameterDirection
�,�,O a
.
�,�,a b
Input
�,�,b g
,
�,�,g h
false
�,�,i n
,
�,�,n o
$num
�,�,p q
,
�,�,q r
$num
�,�,s t
,
�,�,t u
DataRowVersion
�,�,O ]
.
�,�,] ^
Proposed
�,�,^ f
,
�,�,f g
DBNull
�,�,O U
.
�,�,U V
Value
�,�,V [
)
�,�,[ \
)
�,�,\ ]
;
�,�,] ^
}
�,�,  !
else
�,�,  $
{
�,�,  !
command
�,�,$ +
.
�,�,+ ,

Parameters
�,�,, 6
.
�,�,6 7
Add
�,�,7 :
(
�,�,: ;
new
�,�,; >
NpgsqlParameter
�,�,? N
(
�,�,N O
$str
�,�,O R
+
�,�,S T
intContador
�,�,U `
,
�,�,` a
NpgsqlDbType
�,�,b n
.
�,�,n o
Numeric
�,�,o v
,
�,�,v w
$num
�,�,x y
,
�,�,y z
$str
�,�,{ }
,
�,�,} ~ 
ParameterDirection
�,�,O a
.
�,�,a b
Input
�,�,b g
,
�,�,g h
false
�,�,i n
,
�,�,n o
$num
�,�,p q
,
�,�,q r
$num
�,�,s t
,
�,�,t u
DataRowVersion
�,�,O ]
.
�,�,] ^
Proposed
�,�,^ f
,
�,�,f g

�,�,O \
[
�,�,\ ]
intContador
�,�,] h
]
�,�,h i
)
�,�,i j
)
�,�,j k
;
�,�,k l
}
�,�,  !
break
�,�,  %
;
�,�,% &
case
�,�,  
$str
�,�,! 0
:
�,�,0 1
if
�,�,  "
(
�,�,# $

�,�,$ 1
[
�,�,1 2
intContador
�,�,2 =
]
�,�,= >
==
�,�,? A
null
�,�,B F
)
�,�,F G
{
�,�,  !
command
�,�,$ +
.
�,�,+ ,

Parameters
�,�,, 6
.
�,�,6 7
Add
�,�,7 :
(
�,�,: ;
new
�,�,; >
NpgsqlParameter
�,�,? N
(
�,�,N O
$str
�,�,O R
+
�,�,S T
intContador
�,�,U `
,
�,�,` a
DBNull
�,�,b h
.
�,�,h i
Value
�,�,i n
)
�,�,n o
)
�,�,o p
;
�,�,p q
}
�,�,  !
else
�,�,  $
{
�,�,  !
command
�,�,$ +
.
�,�,+ ,

Parameters
�,�,, 6
.
�,�,6 7
Add
�,�,7 :
(
�,�,: ;
new
�,�,; >
NpgsqlParameter
�,�,? N
(
�,�,N O
$str
�,�,O R
+
�,�,S T
intContador
�,�,U `
,
�,�,` a

�,�,O \
[
�,�,\ ]
intContador
�,�,] h
]
�,�,h i
)
�,�,i j
)
�,�,j k
;
�,�,k l
command
�,�,$ +
.
�,�,+ ,

Parameters
�,�,, 6
[
�,�,6 7
$str
�,�,7 :
+
�,�,; <
intContador
�,�,= H
]
�,�,H I
.
�,�,I J
NpgsqlDbType
�,�,J V
=
�,�,W X
NpgsqlDbType
�,�,Y e
.
�,�,e f
Text
�,�,f j
;
�,�,j k
}
�,�,  !
break
�,�,  %
;
�,�,% &
case
�,�,  
$str
�,�,! 2
:
�,�,2 3
if
�,�,  "
(
�,�,# $

�,�,$ 1
[
�,�,1 2
intContador
�,�,2 =
]
�,�,= >
==
�,�,? A
null
�,�,B F
)
�,�,F G
{
�,�,  !
command
�,�,$ +
.
�,�,+ ,

Parameters
�,�,, 6
.
�,�,6 7
Add
�,�,7 :
(
�,�,: ;
new
�,�,; >
NpgsqlParameter
�,�,? N
(
�,�,N O
$str
�,�,O R
+
�,�,S T
intContador
�,�,U `
,
�,�,` a
DBNull
�,�,b h
.
�,�,h i
Value
�,�,i n
)
�,�,n o
)
�,�,o p
;
�,�,p q
}
�,�,  !
else
�,�,  $
{
�,�,  !
command
�,�,$ +
.
�,�,+ ,

Parameters
�,�,, 6
.
�,�,6 7
Add
�,�,7 :
(
�,�,: ;
new
�,�,; >
NpgsqlParameter
�,�,? N
(
�,�,N O
$str
�,�,O R
+
�,�,S T
intContador
�,�,U `
,
�,�,` a

�,�,O \
[
�,�,\ ]
intContador
�,�,] h
]
�,�,h i
)
�,�,i j
)
�,�,j k
;
�,�,k l
command
�,�,$ +
.
�,�,+ ,

Parameters
�,�,, 6
[
�,�,6 7
$str
�,�,7 :
+
�,�,; <
intContador
�,�,= H
]
�,�,H I
.
�,�,I J
NpgsqlDbType
�,�,J V
=
�,�,W X
NpgsqlDbType
�,�,Y e
.
�,�,e f
	Timestamp
�,�,f o
;
�,�,o p
}
�,�,  !
break
�,�,  %
;
�,�,% &
default
�,�, #
:
�,�,# $
if
�,�,  "
(
�,�,# $

�,�,$ 1
[
�,�,1 2
intContador
�,�,2 =
]
�,�,= >
==
�,�,? A
null
�,�,B F
)
�,�,F G
{
�,�,  !
command
�,�,$ +
.
�,�,+ ,

Parameters
�,�,, 6
.
�,�,6 7
Add
�,�,7 :
(
�,�,: ;
new
�,�,; >
NpgsqlParameter
�,�,? N
(
�,�,N O
$str
�,�,O R
+
�,�,S T
intContador
�,�,U `
,
�,�,` a
DBNull
�,�,O U
.
�,�,U V
Value
�,�,V [
)
�,�,[ \
)
�,�,\ ]
;
�,�,] ^
}
�,�,  !
else
�,�,  $
{
�,�,  !
command
�,�,$ +
.
�,�,+ ,

Parameters
�,�,, 6
.
�,�,6 7
Add
�,�,7 :
(
�,�,: ;
new
�,�,; >
NpgsqlParameter
�,�,? N
(
�,�,N O
$str
�,�,O R
+
�,�,S T
intContador
�,�,U `
,
�,�,` a

�,�,O \
[
�,�,\ ]
intContador
�,�,] h
]
�,�,h i
)
�,�,i j
)
�,�,j k
;
�,�,k l
}
�,�,  !
break
�,�,  %
;
�,�,% &
}
�,�, 
}
�,�, 
}
�,�, 
command
�,�, 
.
�,�, 

Connection
�,�, "
=
�,�,# $

ConexionBd
�,�,% /
;
�,�,/ 0
if
�,�, 
(
�,�, 
command
�,�, 
.
�,�, 

Connection
�,�, &
.
�,�,& '
State
�,�,' ,
==
�,�,- /
ConnectionState
�,�,0 ?
.
�,�,? @
Closed
�,�,@ F
)
�,�,F G
{
�,�, 
command
�,�, 
.
�,�, 

Connection
�,�, &
.
�,�,& '
Open
�,�,' +
(
�,�,+ ,
)
�,�,, -
;
�,�,- .
}
�,�, 
DbDataReader
�,�, 
dr
�,�, 
=
�,�,  !
command
�,�," )
.
�,�,) *

�,�,* 7
(
�,�,7 8
CommandBehavior
�,�,8 G
.
�,�,G H
CloseConnection
�,�,H W
)
�,�,W X
;
�,�,X Y
if
�,�, 
(
�,�, 
command
�,�, 
.
�,�, 

Connection
�,�, &
.
�,�,& '
State
�,�,' ,
!=
�,�,- /
ConnectionState
�,�,0 ?
.
�,�,? @
Closed
�,�,@ F
)
�,�,F G
{
�,�, 
command
�,�, 
.
�,�, 

Connection
�,�, &
.
�,�,& '
Close
�,�,' ,
(
�,�,, -
)
�,�,- .
;
�,�,. /
}
�,�, 
command
�,�, 
.
�,�, 
Dispose
�,�, 
(
�,�,  
)
�,�,  !
;
�,�,! "
return
�,�, 
dr
�,�, 
;
�,�, 
}
�,�, 
catch
�,�, 
(
�,�, 
	Exception
�,�, 
ex
�,�, 
)
�,�,  
{
�,�, 
ex
�,�, 
.
�,�, 
Data
�,�, 
.
�,�, 
Add
�,�, 
(
�,�, 
$str
�,�, -
,
�,�,- .
nombreSp
�,�,/ 7
)
�,�,7 8
;
�,�,8 9
throw
�,�, 
;
�,�, 
}
�,�, 
}
�,�, 	
public
�,�, 
DbDataReader
�,�, .
 ExecStoreProcedureToDbDataReader
�,�, <
(
�,�,< =
string
�,�,= C
nombreSp
�,�,D L
,
�,�,L M
	ArrayList
�,�,N W

�,�,X e
,
�,�,e f
ref
�,�,g j
CTrans
�,�,k q
trans
�,�,r w
)
�,�,w x
{
�,�, 	
var
�,�, 
command
�,�, 
=
�,�, 
new
�,�, 

�,�, +
(
�,�,+ ,
)
�,�,, -
;
�,�,- .
command
�-�- 
.
�-�- 
CommandText
�-�- 
=
�-�-  !
nombreSp
�-�-" *
;
�-�-* +
command
�-�- 
.
�-�- 
CommandType
�-�- 
=
�-�-  !
CommandType
�-�-" -
.
�-�-- .
StoredProcedure
�-�-. =
;
�-�-= >
try
�-�- 
{
�-�- 
for
�-�- 
(
�-�- 
var
�-�- 
intContador
�-�- $
=
�-�-% &
$num
�-�-' (
;
�-�-( )
intContador
�-�-* 5
<
�-�-6 7

�-�-8 E
.
�-�-E F
Count
�-�-F K
;
�-�-K L
intContador
�-�-M X
++
�-�-X Z
)
�-�-Z [
{
�-�- 
if
�-�- 
(
�-�- 

�-�- %
[
�-�-% &
intContador
�-�-& 1
]
�-�-1 2
==
�-�-3 5
null
�-�-6 :
)
�-�-: ;
{
�-�- 
command
�-�- 
.
�-�-  

Parameters
�-�-  *
.
�-�-* +
Add
�-�-+ .
(
�-�-. /
new
�-�-/ 2
NpgsqlParameter
�-�-3 B
(
�-�-B C

�-�-C P
[
�-�-P Q
intContador
�-�-Q \
]
�-�-\ ]
.
�-�-] ^
ToString
�-�-^ f
(
�-�-f g
)
�-�-g h
,
�-�-h i
DBNull
�-�-j p
.
�-�-p q
Value
�-�-q v
)
�-�-v w
)
�-�-w x
;
�-�-x y
}
�-�- 
else
�-�- 
{
�-�- 
switch
�-�- 
(
�-�-  

�-�-  -
[
�-�-- .
intContador
�-�-. 9
]
�-�-9 :
.
�-�-: ;
GetType
�-�-; B
(
�-�-B C
)
�-�-C D
.
�-�-D E
ToString
�-�-E M
(
�-�-M N
)
�-�-N O
)
�-�-O P
{
�-�- 
case
�-�-  
$str
�-�-! /
:
�-�-/ 0
case
�-�-  
$str
�-�-! /
:
�-�-/ 0
case
�-�-  
$str
�-�-! 1
:
�-�-1 2
if
�-�-  "
(
�-�-# $

�-�-$ 1
[
�-�-1 2
intContador
�-�-2 =
]
�-�-= >
==
�-�-? A
null
�-�-B F
)
�-�-F G
{
�-�-  !
command
�-�-$ +
.
�-�-+ ,

Parameters
�-�-, 6
.
�-�-6 7
Add
�-�-7 :
(
�-�-: ;
new
�-�-; >
NpgsqlParameter
�-�-? N
(
�-�-N O
$str
�-�-O R
+
�-�-S T
intContador
�-�-U `
,
�-�-` a
NpgsqlDbType
�-�-b n
.
�-�-n o
Numeric
�-�-o v
,
�-�-v w
$num
�-�-x y
,
�-�-y z
$str
�-�-{ }
,
�-�-} ~ 
ParameterDirection
�-�-O a
.
�-�-a b
Input
�-�-b g
,
�-�-g h
false
�-�-i n
,
�-�-n o
$num
�-�-p q
,
�-�-q r
$num
�-�-s t
,
�-�-t u
DataRowVersion
�-�-O ]
.
�-�-] ^
Proposed
�-�-^ f
,
�-�-f g
DBNull
�-�-O U
.
�-�-U V
Value
�-�-V [
)
�-�-[ \
)
�-�-\ ]
;
�-�-] ^
}
�-�-  !
else
�-�-  $
{
�-�-  !
command
�-�-$ +
.
�-�-+ ,

Parameters
�-�-, 6
.
�-�-6 7
Add
�-�-7 :
(
�-�-: ;
new
�-�-; >
NpgsqlParameter
�-�-? N
(
�-�-N O
$str
�-�-O R
+
�-�-S T
intContador
�-�-U `
,
�-�-` a
NpgsqlDbType
�-�-b n
.
�-�-n o
Numeric
�-�-o v
,
�-�-v w
$num
�-�-x y
,
�-�-y z
$str
�-�-{ }
,
�-�-} ~ 
ParameterDirection
�-�-O a
.
�-�-a b
Input
�-�-b g
,
�-�-g h
false
�-�-i n
,
�-�-n o
$num
�-�-p q
,
�-�-q r
$num
�-�-s t
,
�-�-t u
DataRowVersion
�-�-O ]
.
�-�-] ^
Proposed
�-�-^ f
,
�-�-f g

�-�-O \
[
�-�-\ ]
intContador
�-�-] h
]
�-�-h i
)
�-�-i j
)
�-�-j k
;
�-�-k l
}
�-�-  !
break
�-�-  %
;
�-�-% &
case
�-�-  
$str
�-�-! 0
:
�-�-0 1
if
�-�-  "
(
�-�-# $

�-�-$ 1
[
�-�-1 2
intContador
�-�-2 =
]
�-�-= >
==
�-�-? A
null
�-�-B F
)
�-�-F G
{
�-�-  !
command
�-�-$ +
.
�-�-+ ,

Parameters
�-�-, 6
.
�-�-6 7
Add
�-�-7 :
(
�-�-: ;
new
�-�-; >
NpgsqlParameter
�-�-? N
(
�-�-N O
$str
�-�-O R
+
�-�-S T
intContador
�-�-U `
,
�-�-` a
DBNull
�-�-b h
.
�-�-h i
Value
�-�-i n
)
�-�-n o
)
�-�-o p
;
�-�-p q
}
�-�-  !
else
�-�-  $
{
�-�-  !
command
�-�-$ +
.
�-�-+ ,

Parameters
�-�-, 6
.
�-�-6 7
Add
�-�-7 :
(
�-�-: ;
new
�-�-; >
NpgsqlParameter
�-�-? N
(
�-�-N O
$str
�-�-O R
+
�-�-S T
intContador
�-�-U `
,
�-�-` a

�-�-O \
[
�-�-\ ]
intContador
�-�-] h
]
�-�-h i
)
�-�-i j
)
�-�-j k
;
�-�-k l
command
�-�-$ +
.
�-�-+ ,

Parameters
�-�-, 6
[
�-�-6 7
$str
�-�-7 :
+
�-�-; <
intContador
�-�-= H
]
�-�-H I
.
�-�-I J
NpgsqlDbType
�-�-J V
=
�-�-W X
NpgsqlDbType
�-�-Y e
.
�-�-e f
Text
�-�-f j
;
�-�-j k
}
�-�-  !
break
�-�-  %
;
�-�-% &
case
�-�-  
$str
�-�-! 2
:
�-�-2 3
if
�-�-  "
(
�-�-# $

�-�-$ 1
[
�-�-1 2
intContador
�-�-2 =
]
�-�-= >
==
�-�-? A
null
�-�-B F
)
�-�-F G
{
�-�-  !
command
�-�-$ +
.
�-�-+ ,

Parameters
�-�-, 6
.
�-�-6 7
Add
�-�-7 :
(
�-�-: ;
new
�-�-; >
NpgsqlParameter
�-�-? N
(
�-�-N O
$str
�-�-O R
+
�-�-S T
intContador
�-�-U `
,
�-�-` a
DBNull
�-�-b h
.
�-�-h i
Value
�-�-i n
)
�-�-n o
)
�-�-o p
;
�-�-p q
}
�-�-  !
else
�-�-  $
{
�-�-  !
command
�-�-$ +
.
�-�-+ ,

Parameters
�-�-, 6
.
�-�-6 7
Add
�-�-7 :
(
�-�-: ;
new
�-�-; >
NpgsqlParameter
�-�-? N
(
�-�-N O
$str
�-�-O R
+
�-�-S T
intContador
�-�-U `
,
�-�-` a

�-�-O \
[
�-�-\ ]
intContador
�-�-] h
]
�-�-h i
)
�-�-i j
)
�-�-j k
;
�-�-k l
command
�-�-$ +
.
�-�-+ ,

Parameters
�-�-, 6
[
�-�-6 7
$str
�-�-7 :
+
�-�-; <
intContador
�-�-= H
]
�-�-H I
.
�-�-I J
NpgsqlDbType
�-�-J V
=
�-�-W X
NpgsqlDbType
�-�-Y e
.
�-�-e f
	Timestamp
�-�-f o
;
�-�-o p
}
�-�-  !
break
�-�-  %
;
�-�-% &
default
�-�- #
:
�-�-# $
if
�-�-  "
(
�-�-# $

�-�-$ 1
[
�-�-1 2
intContador
�-�-2 =
]
�-�-= >
==
�-�-? A
null
�-�-B F
)
�-�-F G
{
�-�-  !
command
�-�-$ +
.
�-�-+ ,

Parameters
�-�-, 6
.
�-�-6 7
Add
�-�-7 :
(
�-�-: ;
new
�-�-; >
NpgsqlParameter
�-�-? N
(
�-�-N O
$str
�-�-O R
+
�-�-S T
intContador
�-�-U `
,
�-�-` a
DBNull
�-�-O U
.
�-�-U V
Value
�-�-V [
)
�-�-[ \
)
�-�-\ ]
;
�-�-] ^
}
�-�-  !
else
�-�-  $
{
�-�-  !
command
�-�-$ +
.
�-�-+ ,

Parameters
�-�-, 6
.
�-�-6 7
Add
�-�-7 :
(
�-�-: ;
new
�-�-; >
NpgsqlParameter
�-�-? N
(
�-�-N O
$str
�-�-O R
+
�-�-S T
intContador
�-�-U `
,
�-�-` a

�-�-O \
[
�-�-\ ]
intContador
�-�-] h
]
�-�-h i
)
�-�-i j
)
�-�-j k
;
�-�-k l
}
�-�-  !
break
�-�-  %
;
�-�-% &
}
�-�- 
}
�-�- 
}
�-�- 
command
�-�- 
.
�-�- 

Connection
�-�- "
=
�-�-# $
trans
�-�-% *
.
�-�-* +
MyConn
�-�-+ 1
;
�-�-1 2
command
�-�- 
.
�-�- 
Transaction
�-�- #
=
�-�-$ %
trans
�-�-& +
.
�-�-+ ,
MyTrans
�-�-, 3
;
�-�-3 4
if
�-�- 
(
�-�- 
command
�-�- 
.
�-�- 

Connection
�-�- &
.
�-�-& '
State
�-�-' ,
==
�-�-- /
ConnectionState
�-�-0 ?
.
�-�-? @
Closed
�-�-@ F
)
�-�-F G
{
�-�- 
command
�-�- 
.
�-�- 

Connection
�-�- &
.
�-�-& '
Open
�-�-' +
(
�-�-+ ,
)
�-�-, -
;
�-�-- .
}
�-�- 
DbDataReader
�-�- 
dr
�-�- 
=
�-�-  !
command
�-�-" )
.
�-�-) *

�-�-* 7
(
�-�-7 8
CommandBehavior
�-�-8 G
.
�-�-G H
Default
�-�-H O
)
�-�-O P
;
�-�-P Q
command
�-�- 
.
�-�- 
Dispose
�-�- 
(
�-�-  
)
�-�-  !
;
�-�-! "
return
�-�- 
dr
�-�- 
;
�-�- 
}
�-�- 
catch
�-�- 
(
�-�- 
	Exception
�-�- 
ex
�-�- 
)
�-�-  
{
�-�- 
ex
�-�- 
.
�-�- 
Data
�-�- 
.
�-�- 
Add
�-�- 
(
�-�- 
$str
�-�- -
,
�-�-- .
nombreSp
�-�-/ 7
)
�-�-7 8
;
�-�-8 9
throw
�-�- 
;
�-�- 
}
�-�- 
}
�-�- 	
public
�-�- 
DbDataReader
�-�- .
 ExecStoreProcedureToDbDataReader
�-�- <
(
�-�-< =
string
�-�-= C
nombreSp
�-�-D L
,
�-�-L M
	ArrayList
�-�-N W!
arrNombreParametros
�-�-X k
,
�-�-k l
	ArrayList
�-�-7 @

�-�-A N
)
�-�-N O
{
�-�- 	
var
�-�- 
command
�-�- 
=
�-�- 
new
�-�- 

�-�- +
(
�-�-+ ,
)
�-�-, -
;
�-�-- .
command
�-�- 
.
�-�- 
CommandText
�-�- 
=
�-�-  !
nombreSp
�-�-" *
;
�-�-* +
command
�-�- 
.
�-�- 
CommandType
�-�- 
=
�-�-  !
CommandType
�-�-" -
.
�-�-- .
StoredProcedure
�-�-. =
;
�-�-= >
try
�-�- 
{
�-�- 
for
�-�- 
(
�-�- 
var
�-�- 
intContador
�-�- $
=
�-�-% &
$num
�-�-' (
;
�-�-( )
intContador
�-�-* 5
<
�-�-6 7

�-�-8 E
.
�-�-E F
Count
�-�-F K
;
�-�-K L
intContador
�-�-M X
++
�-�-X Z
)
�-�-Z [
{
�-�- 
if
�-�- 
(
�-�- 

�-�- %
[
�-�-% &
intContador
�-�-& 1
]
�-�-1 2
==
�-�-3 5
null
�-�-6 :
)
�-�-: ;
{
�-�- 
command
�-�- 
.
�-�-  

Parameters
�-�-  *
.
�-�-* +
Add
�-�-+ .
(
�-�-. /
new
�-�-/ 2
NpgsqlParameter
�-�-3 B
(
�-�-B C!
arrNombreParametros
�-�-C V
[
�-�-V W
intContador
�-�-W b
]
�-�-b c
.
�-�-c d
ToString
�-�-d l
(
�-�-l m
)
�-�-m n
,
�-�-n o
DBNull
�-�-C I
.
�-�-I J
Value
�-�-J O
)
�-�-O P
)
�-�-P Q
;
�-�-Q R
}
�.�. 
else
�.�. 
{
�.�. 
switch
�.�. 
(
�.�.  

�.�.  -
[
�.�.- .
intContador
�.�.. 9
]
�.�.9 :
.
�.�.: ;
GetType
�.�.; B
(
�.�.B C
)
�.�.C D
.
�.�.D E
ToString
�.�.E M
(
�.�.M N
)
�.�.N O
)
�.�.O P
{
�.�. 
case
�.�.  
$str
�.�.! /
:
�.�./ 0
case
�.�.  
$str
�.�.! /
:
�.�./ 0
case
�.�.  
$str
�.�.! 1
:
�.�.1 2
if
�.�.  "
(
�.�.# $

�.�.$ 1
[
�.�.1 2
intContador
�.�.2 =
]
�.�.= >
==
�.�.? A
null
�.�.B F
)
�.�.F G
{
�.�.  !
command
�.�.$ +
.
�.�.+ ,

Parameters
�.�., 6
.
�.�.6 7
Add
�.�.7 :
(
�.�.: ;
new
�.�.; >
NpgsqlParameter
�.�.? N
(
�.�.N O
$str
�.�.O R
+
�.�.S T!
arrNombreParametros
�.�.U h
[
�.�.h i
intContador
�.�.i t
]
�.�.t u
,
�.�.u v
NpgsqlDbType�.�.w �
.�.�.� �
Numeric�.�.� �
,�.�.� �
$num�.�.� �
,�.�.� �
$str�.�.� �
,�.�.� � 
ParameterDirection
�.�.O a
.
�.�.a b
Input
�.�.b g
,
�.�.g h
false
�.�.i n
,
�.�.n o
$num
�.�.p q
,
�.�.q r
$num
�.�.s t
,
�.�.t u
DataRowVersion
�.�.O ]
.
�.�.] ^
Proposed
�.�.^ f
,
�.�.f g
DBNull
�.�.O U
.
�.�.U V
Value
�.�.V [
)
�.�.[ \
)
�.�.\ ]
;
�.�.] ^
}
�.�.  !
else
�.�.  $
{
�.�.  !
command
�.�.$ +
.
�.�.+ ,

Parameters
�.�., 6
.
�.�.6 7
Add
�.�.7 :
(
�.�.: ;
new
�.�.; >
NpgsqlParameter
�.�.? N
(
�.�.N O
$str
�.�.O R
+
�.�.S T!
arrNombreParametros
�.�.U h
[
�.�.h i
intContador
�.�.i t
]
�.�.t u
,
�.�.u v
NpgsqlDbType�.�.w �
.�.�.� �
Numeric�.�.� �
,�.�.� �
$num�.�.� �
,�.�.� �
$str�.�.� �
,�.�.� � 
ParameterDirection
�.�.O a
.
�.�.a b
Input
�.�.b g
,
�.�.g h
false
�.�.i n
,
�.�.n o
$num
�.�.p q
,
�.�.q r
$num
�.�.s t
,
�.�.t u
DataRowVersion
�.�.O ]
.
�.�.] ^
Proposed
�.�.^ f
,
�.�.f g

�.�.O \
[
�.�.\ ]
intContador
�.�.] h
]
�.�.h i
)
�.�.i j
)
�.�.j k
;
�.�.k l
}
�.�.  !
break
�.�.  %
;
�.�.% &
case
�.�.  
$str
�.�.! 0
:
�.�.0 1
if
�.�.  "
(
�.�.# $

�.�.$ 1
[
�.�.1 2
intContador
�.�.2 =
]
�.�.= >
==
�.�.? A
null
�.�.B F
)
�.�.F G
{
�.�.  !
command
�.�.$ +
.
�.�.+ ,

Parameters
�.�., 6
.
�.�.6 7
Add
�.�.7 :
(
�.�.: ;
new
�.�.; >
NpgsqlParameter
�.�.? N
(
�.�.N O
$str
�.�.O R
+
�.�.S T!
arrNombreParametros
�.�.U h
[
�.�.h i
intContador
�.�.i t
]
�.�.t u
,
�.�.u v
DBNull
�.�.w }
.
�.�.} ~
Value�.�.~ �
)�.�.� �
)�.�.� �
;�.�.� �
}
�.�.  !
else
�.�.  $
{
�.�.  !
command
�.�.$ +
.
�.�.+ ,

Parameters
�.�., 6
.
�.�.6 7
Add
�.�.7 :
(
�.�.: ;
new
�.�.; >
NpgsqlParameter
�.�.? N
(
�.�.N O
$str
�.�.O R
+
�.�.S T!
arrNombreParametros
�.�.U h
[
�.�.h i
intContador
�.�.i t
]
�.�.t u
,
�.�.u v

�.�.O \
[
�.�.\ ]
intContador
�.�.] h
]
�.�.h i
)
�.�.i j
)
�.�.j k
;
�.�.k l
command
�.�.$ +
.
�.�.+ ,

Parameters
�.�., 6
[
�.�.6 7
$str
�.�.7 :
+
�.�.; <!
arrNombreParametros
�.�.= P
[
�.�.P Q
intContador
�.�.Q \
]
�.�.\ ]
]
�.�.] ^
.
�.�.^ _
NpgsqlDbType
�.�._ k
=
�.�.l m
NpgsqlDbType
�.�.n z
.
�.�.z {
Text
�.�.{ 
;�.�. �
}
�.�.  !
break
�.�.  %
;
�.�.% &
case
�.�.  
$str
�.�.! 2
:
�.�.2 3
if
�.�.  "
(
�.�.# $

�.�.$ 1
[
�.�.1 2
intContador
�.�.2 =
]
�.�.= >
==
�.�.? A
null
�.�.B F
)
�.�.F G
{
�.�.  !
command
�.�.$ +
.
�.�.+ ,

Parameters
�.�., 6
.
�.�.6 7
Add
�.�.7 :
(
�.�.: ;
new
�.�.; >
NpgsqlParameter
�.�.? N
(
�.�.N O
$str
�.�.O R
+
�.�.S T!
arrNombreParametros
�.�.U h
[
�.�.h i
intContador
�.�.i t
]
�.�.t u
,
�.�.u v
DBNull
�.�.w }
.
�.�.} ~
Value�.�.~ �
)�.�.� �
)�.�.� �
;�.�.� �
}
�.�.  !
else
�.�.  $
{
�.�.  !
command
�.�.$ +
.
�.�.+ ,

Parameters
�.�., 6
.
�.�.6 7
Add
�.�.7 :
(
�.�.: ;
new
�.�.; >
NpgsqlParameter
�.�.? N
(
�.�.N O
$str
�.�.O R
+
�.�.S T!
arrNombreParametros
�.�.U h
[
�.�.h i
intContador
�.�.i t
]
�.�.t u
,
�.�.u v

�.�.O \
[
�.�.\ ]
intContador
�.�.] h
]
�.�.h i
)
�.�.i j
)
�.�.j k
;
�.�.k l
command
�.�.$ +
.
�.�.+ ,

Parameters
�.�., 6
[
�.�.6 7
$str
�.�.7 :
+
�.�.; <!
arrNombreParametros
�.�.= P
[
�.�.P Q
intContador
�.�.Q \
]
�.�.\ ]
]
�.�.] ^
.
�.�.^ _
NpgsqlDbType
�.�._ k
=
�.�.l m
NpgsqlDbType
�.�.n z
.
�.�.z {
	Timestamp�.�.{ �
;�.�.� �
}
�.�.  !
break
�.�.  %
;
�.�.% &
default
�.�. #
:
�.�.# $
if
�.�.  "
(
�.�.# $

�.�.$ 1
[
�.�.1 2
intContador
�.�.2 =
]
�.�.= >
==
�.�.? A
null
�.�.B F
)
�.�.F G
{
�.�.  !
command
�.�.$ +
.
�.�.+ ,

Parameters
�.�., 6
.
�.�.6 7
Add
�.�.7 :
(
�.�.: ;
new
�.�.; >
NpgsqlParameter
�.�.? N
(
�.�.N O
$str
�.�.O R
+
�.�.S T!
arrNombreParametros
�.�.U h
[
�.�.h i
intContador
�.�.i t
]
�.�.t u
,
�.�.u v
DBNull
�.�.O U
.
�.�.U V
Value
�.�.V [
)
�.�.[ \
)
�.�.\ ]
;
�.�.] ^
}
�.�.  !
else
�.�.  $
{
�.�.  !
command
�.�.$ +
.
�.�.+ ,

Parameters
�.�., 6
.
�.�.6 7
Add
�.�.7 :
(
�.�.: ;
new
�.�.; >
NpgsqlParameter
�.�.? N
(
�.�.N O
$str
�.�.O R
+
�.�.S T!
arrNombreParametros
�.�.U h
[
�.�.h i
intContador
�.�.i t
]
�.�.t u
,
�.�.u v

�.�.O \
[
�.�.\ ]
intContador
�.�.] h
]
�.�.h i
)
�.�.i j
)
�.�.j k
;
�.�.k l
}
�.�.  !
break
�.�.  %
;
�.�.% &
}
�.�. 
}
�.�. 
}
�.�. 
command
�.�. 
.
�.�. 

Connection
�.�. "
=
�.�.# $

ConexionBd
�.�.% /
;
�.�./ 0
if
�.�. 
(
�.�. 
command
�.�. 
.
�.�. 

Connection
�.�. &
.
�.�.& '
State
�.�.' ,
==
�.�.- /
ConnectionState
�.�.0 ?
.
�.�.? @
Closed
�.�.@ F
)
�.�.F G
{
�.�. 
command
�.�. 
.
�.�. 

Connection
�.�. &
.
�.�.& '
Open
�.�.' +
(
�.�.+ ,
)
�.�., -
;
�.�.- .
}
�.�. 
DbDataReader
�.�. 
dr
�.�. 
=
�.�.  !
command
�.�." )
.
�.�.) *

�.�.* 7
(
�.�.7 8
CommandBehavior
�.�.8 G
.
�.�.G H
CloseConnection
�.�.H W
)
�.�.W X
;
�.�.X Y
if
�.�. 
(
�.�. 
command
�.�. 
.
�.�. 

Connection
�.�. &
.
�.�.& '
State
�.�.' ,
!=
�.�.- /
ConnectionState
�.�.0 ?
.
�.�.? @
Closed
�.�.@ F
)
�.�.F G
{
�.�. 
command
�.�. 
.
�.�. 

Connection
�.�. &
.
�.�.& '
Close
�.�.' ,
(
�.�., -
)
�.�.- .
;
�.�.. /
}
�.�. 
command
�.�. 
.
�.�. 
Dispose
�.�. 
(
�.�.  
)
�.�.  !
;
�.�.! "
return
�.�. 
dr
�.�. 
;
�.�. 
}
�.�. 
catch
�.�. 
(
�.�. 
	Exception
�.�. 
ex
�.�. 
)
�.�.  
{
�.�. 
ex
�.�. 
.
�.�. 
Data
�.�. 
.
�.�. 
Add
�.�. 
(
�.�. 
$str
�.�. -
,
�.�.- .
nombreSp
�.�./ 7
)
�.�.7 8
;
�.�.8 9
throw
�.�. 
;
�.�. 
}
�.�. 
}
�.�. 	
public
�.�. 
DbDataReader
�.�. .
 ExecStoreProcedureToDbDataReader
�.�. <
(
�.�.< =
string
�.�.= C
nombreSp
�.�.D L
,
�.�.L M
	ArrayList
�.�.N W!
arrNombreParametros
�.�.X k
,
�.�.k l
	ArrayList
�.�.7 @

�.�.A N
,
�.�.N O
ref
�.�.P S
CTrans
�.�.T Z
trans
�.�.[ `
)
�.�.` a
{
�.�. 	
var
�.�. 
command
�.�. 
=
�.�. 
new
�.�. 

�.�. +
(
�.�.+ ,
)
�.�., -
;
�.�.- .
command
�.�. 
.
�.�. 
CommandText
�.�. 
=
�.�.  !
nombreSp
�.�." *
;
�.�.* +
command
�.�. 
.
�.�. 
CommandType
�.�. 
=
�.�.  !
CommandType
�.�." -
.
�.�.- .
StoredProcedure
�.�.. =
;
�.�.= >
try
�.�. 
{
�.�. 
if
�.�. 
(
�.�. !
arrNombreParametros
�.�. '
.
�.�.' (
Count
�.�.( -
!=
�.�.. 0

�.�.1 >
.
�.�.> ?
Count
�.�.? D
)
�.�.D E
{
�.�. 
throw
�.�. 
new
�.�. 
ArgumentException
�.�. /
(
�.�./ 0
$str�.�. �
)�.�.� �
;�.�.� �
}
�.�. 
for
�.�. 
(
�.�. 
var
�.�. 
intContador
�.�. $
=
�.�.% &
$num
�.�.' (
;
�.�.( )
intContador
�.�.* 5
<
�.�.6 7

�.�.8 E
.
�.�.E F
Count
�.�.F K
;
�.�.K L
intContador
�.�.M X
++
�.�.X Z
)
�.�.Z [
{
�.�. 
if
�.�. 
(
�.�. 

�.�. %
[
�.�.% &
intContador
�.�.& 1
]
�.�.1 2
==
�.�.3 5
null
�.�.6 :
)
�.�.: ;
{
�/�/ 
command
�/�/ 
.
�/�/  

Parameters
�/�/  *
.
�/�/* +
Add
�/�/+ .
(
�/�/. /
new
�/�// 2
NpgsqlParameter
�/�/3 B
(
�/�/B C!
arrNombreParametros
�/�/C V
[
�/�/V W
intContador
�/�/W b
]
�/�/b c
.
�/�/c d
ToString
�/�/d l
(
�/�/l m
)
�/�/m n
,
�/�/n o
DBNull
�/�/C I
.
�/�/I J
Value
�/�/J O
)
�/�/O P
)
�/�/P Q
;
�/�/Q R
}
�/�/ 
else
�/�/ 
{
�/�/ 
switch
�/�/ 
(
�/�/  

�/�/  -
[
�/�/- .
intContador
�/�/. 9
]
�/�/9 :
.
�/�/: ;
GetType
�/�/; B
(
�/�/B C
)
�/�/C D
.
�/�/D E
ToString
�/�/E M
(
�/�/M N
)
�/�/N O
)
�/�/O P
{
�/�/ 
case
�/�/  
$str
�/�/! /
:
�/�// 0
case
�/�/  
$str
�/�/! /
:
�/�// 0
case
�/�/  
$str
�/�/! 1
:
�/�/1 2
if
�/�/  "
(
�/�/# $

�/�/$ 1
[
�/�/1 2
intContador
�/�/2 =
]
�/�/= >
==
�/�/? A
null
�/�/B F
)
�/�/F G
{
�/�/  !
command
�/�/$ +
.
�/�/+ ,

Parameters
�/�/, 6
.
�/�/6 7
Add
�/�/7 :
(
�/�/: ;
new
�/�/; >
NpgsqlParameter
�/�/? N
(
�/�/N O
$str
�/�/O R
+
�/�/S T!
arrNombreParametros
�/�/U h
[
�/�/h i
intContador
�/�/i t
]
�/�/t u
,
�/�/u v
NpgsqlDbType�/�/w �
.�/�/� �
Numeric�/�/� �
,�/�/� �
$num�/�/� �
,�/�/� �
$str�/�/� �
,�/�/� � 
ParameterDirection
�/�/O a
.
�/�/a b
Input
�/�/b g
,
�/�/g h
false
�/�/i n
,
�/�/n o
$num
�/�/p q
,
�/�/q r
$num
�/�/s t
,
�/�/t u
DataRowVersion
�/�/O ]
.
�/�/] ^
Proposed
�/�/^ f
,
�/�/f g
DBNull
�/�/O U
.
�/�/U V
Value
�/�/V [
)
�/�/[ \
)
�/�/\ ]
;
�/�/] ^
}
�/�/  !
else
�/�/  $
{
�/�/  !
command
�/�/$ +
.
�/�/+ ,

Parameters
�/�/, 6
.
�/�/6 7
Add
�/�/7 :
(
�/�/: ;
new
�/�/; >
NpgsqlParameter
�/�/? N
(
�/�/N O
$str
�/�/O R
+
�/�/S T!
arrNombreParametros
�/�/U h
[
�/�/h i
intContador
�/�/i t
]
�/�/t u
,
�/�/u v
NpgsqlDbType�/�/w �
.�/�/� �
Numeric�/�/� �
,�/�/� �
$num�/�/� �
,�/�/� �
$str�/�/� �
,�/�/� � 
ParameterDirection
�/�/O a
.
�/�/a b
Input
�/�/b g
,
�/�/g h
false
�/�/i n
,
�/�/n o
$num
�/�/p q
,
�/�/q r
$num
�/�/s t
,
�/�/t u
DataRowVersion
�/�/O ]
.
�/�/] ^
Proposed
�/�/^ f
,
�/�/f g

�/�/O \
[
�/�/\ ]
intContador
�/�/] h
]
�/�/h i
)
�/�/i j
)
�/�/j k
;
�/�/k l
}
�/�/  !
break
�/�/  %
;
�/�/% &
case
�/�/  
$str
�/�/! 0
:
�/�/0 1
if
�/�/  "
(
�/�/# $

�/�/$ 1
[
�/�/1 2
intContador
�/�/2 =
]
�/�/= >
==
�/�/? A
null
�/�/B F
)
�/�/F G
{
�/�/  !
command
�/�/$ +
.
�/�/+ ,

Parameters
�/�/, 6
.
�/�/6 7
Add
�/�/7 :
(
�/�/: ;
new
�/�/; >
NpgsqlParameter
�/�/? N
(
�/�/N O
$str
�/�/O R
+
�/�/S T!
arrNombreParametros
�/�/U h
[
�/�/h i
intContador
�/�/i t
]
�/�/t u
,
�/�/u v
DBNull
�/�/w }
.
�/�/} ~
Value�/�/~ �
)�/�/� �
)�/�/� �
;�/�/� �
}
�/�/  !
else
�/�/  $
{
�/�/  !
command
�/�/$ +
.
�/�/+ ,

Parameters
�/�/, 6
.
�/�/6 7
Add
�/�/7 :
(
�/�/: ;
new
�/�/; >
NpgsqlParameter
�/�/? N
(
�/�/N O
$str
�/�/O R
+
�/�/S T!
arrNombreParametros
�/�/U h
[
�/�/h i
intContador
�/�/i t
]
�/�/t u
,
�/�/u v

�/�/O \
[
�/�/\ ]
intContador
�/�/] h
]
�/�/h i
)
�/�/i j
)
�/�/j k
;
�/�/k l
command
�/�/$ +
.
�/�/+ ,

Parameters
�/�/, 6
[
�/�/6 7
$str
�/�/7 :
+
�/�/; <!
arrNombreParametros
�/�/= P
[
�/�/P Q
intContador
�/�/Q \
]
�/�/\ ]
]
�/�/] ^
.
�/�/^ _
NpgsqlDbType
�/�/_ k
=
�/�/l m
NpgsqlDbType
�/�/n z
.
�/�/z {
Text
�/�/{ 
;�/�/ �
}
�/�/  !
break
�/�/  %
;
�/�/% &
case
�/�/  
$str
�/�/! 2
:
�/�/2 3
if
�/�/  "
(
�/�/# $

�/�/$ 1
[
�/�/1 2
intContador
�/�/2 =
]
�/�/= >
==
�/�/? A
null
�/�/B F
)
�/�/F G
{
�/�/  !
command
�/�/$ +
.
�/�/+ ,

Parameters
�/�/, 6
.
�/�/6 7
Add
�/�/7 :
(
�/�/: ;
new
�/�/; >
NpgsqlParameter
�/�/? N
(
�/�/N O
$str
�/�/O R
+
�/�/S T!
arrNombreParametros
�/�/U h
[
�/�/h i
intContador
�/�/i t
]
�/�/t u
,
�/�/u v
DBNull
�/�/w }
.
�/�/} ~
Value�/�/~ �
)�/�/� �
)�/�/� �
;�/�/� �
}
�/�/  !
else
�/�/  $
{
�/�/  !
command
�/�/$ +
.
�/�/+ ,

Parameters
�/�/, 6
.
�/�/6 7
Add
�/�/7 :
(
�/�/: ;
new
�/�/; >
NpgsqlParameter
�/�/? N
(
�/�/N O
$str
�/�/O R
+
�/�/S T!
arrNombreParametros
�/�/U h
[
�/�/h i
intContador
�/�/i t
]
�/�/t u
,
�/�/u v

�/�/O \
[
�/�/\ ]
intContador
�/�/] h
]
�/�/h i
)
�/�/i j
)
�/�/j k
;
�/�/k l
command
�/�/$ +
.
�/�/+ ,

Parameters
�/�/, 6
[
�/�/6 7
$str
�/�/7 :
+
�/�/; <!
arrNombreParametros
�/�/= P
[
�/�/P Q
intContador
�/�/Q \
]
�/�/\ ]
]
�/�/] ^
.
�/�/^ _
NpgsqlDbType
�/�/_ k
=
�/�/l m
NpgsqlDbType
�/�/n z
.
�/�/z {
	Timestamp�/�/{ �
;�/�/� �
}
�/�/  !
break
�/�/  %
;
�/�/% &
default
�/�/ #
:
�/�/# $
if
�/�/  "
(
�/�/# $

�/�/$ 1
[
�/�/1 2
intContador
�/�/2 =
]
�/�/= >
==
�/�/? A
null
�/�/B F
)
�/�/F G
{
�/�/  !
command
�/�/$ +
.
�/�/+ ,

Parameters
�/�/, 6
.
�/�/6 7
Add
�/�/7 :
(
�/�/: ;
new
�/�/; >
NpgsqlParameter
�/�/? N
(
�/�/N O
$str
�/�/O R
+
�/�/S T!
arrNombreParametros
�/�/U h
[
�/�/h i
intContador
�/�/i t
]
�/�/t u
,
�/�/u v
DBNull
�/�/O U
.
�/�/U V
Value
�/�/V [
)
�/�/[ \
)
�/�/\ ]
;
�/�/] ^
}
�/�/  !
else
�/�/  $
{
�/�/  !
command
�/�/$ +
.
�/�/+ ,

Parameters
�/�/, 6
.
�/�/6 7
Add
�/�/7 :
(
�/�/: ;
new
�/�/; >
NpgsqlParameter
�/�/? N
(
�/�/N O
$str
�/�/O R
+
�/�/S T!
arrNombreParametros
�/�/U h
[
�/�/h i
intContador
�/�/i t
]
�/�/t u
,
�/�/u v

�/�/O \
[
�/�/\ ]
intContador
�/�/] h
]
�/�/h i
)
�/�/i j
)
�/�/j k
;
�/�/k l
}
�/�/  !
break
�/�/  %
;
�/�/% &
}
�/�/ 
}
�/�/ 
}
�/�/ 
command
�/�/ 
.
�/�/ 

Connection
�/�/ "
=
�/�/# $
trans
�/�/% *
.
�/�/* +
MyConn
�/�/+ 1
;
�/�/1 2
command
�/�/ 
.
�/�/ 
Transaction
�/�/ #
=
�/�/$ %
trans
�/�/& +
.
�/�/+ ,
MyTrans
�/�/, 3
;
�/�/3 4
if
�/�/ 
(
�/�/ 
command
�/�/ 
.
�/�/ 

Connection
�/�/ &
.
�/�/& '
State
�/�/' ,
==
�/�/- /
ConnectionState
�/�/0 ?
.
�/�/? @
Closed
�/�/@ F
)
�/�/F G
{
�/�/ 
command
�/�/ 
.
�/�/ 

Connection
�/�/ &
.
�/�/& '
Open
�/�/' +
(
�/�/+ ,
)
�/�/, -
;
�/�/- .
}
�/�/ 
DbDataReader
�/�/ 
dr
�/�/ 
=
�/�/  !
command
�/�/" )
.
�/�/) *

�/�/* 7
(
�/�/7 8
CommandBehavior
�/�/8 G
.
�/�/G H
Default
�/�/H O
)
�/�/O P
;
�/�/P Q
command
�/�/ 
.
�/�/ 
Dispose
�/�/ 
(
�/�/  
)
�/�/  !
;
�/�/! "
return
�/�/ 
dr
�/�/ 
;
�/�/ 
}
�/�/ 
catch
�/�/ 
(
�/�/ 
	Exception
�/�/ 
ex
�/�/ 
)
�/�/  
{
�/�/ 
ex
�/�/ 
.
�/�/ 
Data
�/�/ 
.
�/�/ 
Add
�/�/ 
(
�/�/ 
$str
�/�/ -
,
�/�/- .
nombreSp
�/�// 7
)
�/�/7 8
;
�/�/8 9
throw
�/�/ 
;
�/�/ 
}
�/�/ 
}
�/�/ 	
public
�/�/ 
int
�/�/ 

�/�/  
(
�/�/  !
string
�/�/! '
strQuery
�/�/( 0
)
�/�/0 1
{
�/�/ 	
try
�/�/ 
{
�/�/ 
if
�/�/ 
(
�/�/ 

ConexionBd
�/�/ 
.
�/�/ 
State
�/�/ $
==
�/�/% '
ConnectionState
�/�/( 7
.
�/�/7 8
Closed
�/�/8 >
)
�/�/> ?
{
�/�/ 

ConexionBd
�/�/ 
.
�/�/ 
Open
�/�/ #
(
�/�/# $
)
�/�/$ %
;
�/�/% &
}
�/�/ 
var
�/�/ 
command
�/�/ 
=
�/�/ 
new
�/�/ !

�/�/" /
(
�/�// 0
strQuery
�/�/0 8
,
�/�/8 9

ConexionBd
�/�/: D
)
�/�/D E
;
�/�/E F
var
�/�/ 
numReg
�/�/ 
=
�/�/ 
command
�/�/ $
.
�/�/$ %
ExecuteNonQuery
�/�/% 4
(
�/�/4 5
)
�/�/5 6
;
�/�/6 7
command
�/�/ 
.
�/�/ 
Dispose
�/�/ 
(
�/�/  
)
�/�/  !
;
�/�/! "

ConexionBd
�/�/ 
.
�/�/ 
Close
�/�/  
(
�/�/  !
)
�/�/! "
;
�/�/" #
return
�/�/ 
numReg
�/�/ 
;
�/�/ 
}
�/�/ 
catch
�/�/ 
(
�/�/ 
	Exception
�/�/ 
ex
�/�/ 
)
�/�/  
{
�/�/ 
ex
�/�/ 
.
�/�/ 
Data
�/�/ 
.
�/�/ 
Add
�/�/ 
(
�/�/ 
$str
�/�/ /
,
�/�// 0
strQuery
�/�/1 9
)
�/�/9 :
;
�/�/: ;
throw
�/�/ 
;
�/�/ 
}
�/�/ 
}
�/�/ 	
}
�/�/ 
}�/�/ �
CC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Dal\CTrans.cs
	namespace

 	
ReAl


 
.

 
Lumino

 
.

 
	Encuestas

 
.

  
Dal

  #
{ 
public 

class 
CTrans 
{
internal 
NpgsqlTransaction "
MyTrans# *
;* +
internal 
NpgsqlConnection !
MyConn" (
;( )
public 
CTrans 
( 
string 
strConn $
)$ %
{ 	
CConn 
tempConnWebService $
=% &
new' *
CConn+ 0
(0 1
strConn1 8
)8 9
;9 :
MyConn 
= 
tempConnWebService '
.' (

ConexionBd( 2
;2 3
MyConn 
. 
Open 
( 
) 
; 
MyTrans 
= 
MyConn 
. 
BeginTransaction -
(- .
). /
;/ 0
} 	
public 
void  
ConfirmarTransaccion (
(( )
)) *
{   	
try!! 
{"" 
MyTrans## 
.## 
Commit## 
(## 
)##  
;##  !
}$$ 
catch%% 
(%% 
	Exception%% 
)%% 
{&& 
MyTrans'' 
.'' 
Rollback''  
(''  !
)''! "
;''" #
if(( 
((( 
MyConn(( 
.(( 
State((  
==((! #
ConnectionState(($ 3
.((3 4
Open((4 8
)((8 9
{)) 
MyConn** 
.** 
Close**  
(**  !
)**! "
;**" #
}++ 
throw,, 
;,, 
}-- 
}.. 	
public33 
void33 
AnularTransaccion33 %
(33% &
)33& '
{44 	
try55 
{66 
MyTrans77 
.77 
Rollback77  
(77  !
)77! "
;77" #
MyConn88 
.88 
Close88 
(88 
)88 
;88 
}99 
catch:: 
(:: 
	Exception:: 
):: 
{;; 
MyTrans<< 
.<< 
Rollback<<  
(<<  !
)<<! "
;<<" #
if== 
(== 
MyConn== 
.== 
State==  
====! #
ConnectionState==$ 3
.==3 4
Open==4 8
)==8 9
{>> 
MyConn?? 
.?? 
Close??  
(??  !
)??! "
;??" #
}@@ 
throwAA 
;AA 
}BB 
}CC 	
}DD 
}EE ��
DC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Dal\RnVista.cs
	namespace

 	
ReAl


 
.

 
Lumino

 
.

 
	Encuestas

 
.

  
Dal

  #
{ 
public 

class 
RnVista 
{
private 
readonly 
string 
_strConn  (
;( )
public 
RnVista 
( 
string 
strConn %
)% &
{ 	
_strConn 
= 
strConn 
; 
} 	
public 
RnVista 
( %
ConnectionStringsSettings 0
strConn1 8
)8 9
{ 	
_strConn 
= 
strConn 
. (
DataAccessPostgreSqlProvider ;
;; <
} 	
public 
	DataTable 
ObtenerDatos %
(% &
string& ,
vista- 2
)2 3
{   	
var!! 
arrColumnasWhere!!  
=!!! "
new!!# &
	ArrayList!!' 0
{!!1 2
$str!!2 7
}!!7 8
;!!8 9
var"" 
arrValoresWhere"" 
=""  !
new""" %
	ArrayList""& /
{""0 1
$str""1 6
}""6 7
;""7 8
var$$ 
arrColumnas$$ 
=$$ 
new$$ !
	ArrayList$$" +
{$$, -
$str$$- 0
}$$0 1
;$$1 2
var&& 
local&& 
=&& 
new&& 
CConn&& !
(&&! "
_strConn&&" *
)&&* +
;&&+ ,
var'' 
table'' 
='' 
local'' 
.'' 
CargarDataTableAnd'' 0
(''0 1
vista''1 6
,''6 7
arrColumnas''8 C
,''C D
arrColumnasWhere''E U
,''U V
arrValoresWhere''W f
)''f g
;''g h
return)) 
table)) 
;)) 
}** 	
public22 
	DataTable22 
ObtenerDatos22 %
(22% &
string22& ,
vista22- 2
,222 3
	ArrayList224 =
arrColumnas22> I
)22I J
{33 	
var44 
arrColumnasWhere44  
=44! "
new44# &
	ArrayList44' 0
{441 2
$str442 7
}447 8
;448 9
var55 
arrValoresWhere55 
=55  !
new55" %
	ArrayList55& /
{550 1
$str551 6
}556 7
;557 8
var77 
local77 
=77 
new77 
CConn77 !
(77! "
_strConn77" *
)77* +
;77+ ,
var88 
table88 
=88 
local88 
.88 
CargarDataTableAnd88 0
(880 1
vista881 6
,886 7
arrColumnas888 C
,88C D
arrColumnasWhere88E U
,88U V
arrValoresWhere88W f
)88f g
;88g h
return:: 
table:: 
;:: 
};; 	
publicDD 
	DataTableDD 
ObtenerDatosDD %
(DD% &
stringDD& ,
vistaDD- 2
,DD2 3
	ArrayListDD4 =
arrColumnasDD> I
,DDI J
stringDDK Q$
strParametrosAdicionalesDDR j
)DDj k
{EE 	
varFF 
arrColumnasWhereFF  
=FF! "
newFF# &
	ArrayListFF' 0
{FF1 2
$strFF2 7
}FF7 8
;FF8 9
varGG 
arrValoresWhereGG 
=GG  !
newGG" %
	ArrayListGG& /
{GG0 1
$strGG1 6
}GG6 7
;GG7 8
varII 
localII 
=II 
newII 
CConnII !
(II! "
_strConnII" *
)II* +
;II+ ,
varJJ 
tableJJ 
=JJ 
localJJ 
.JJ 
CargarDataTableAndJJ 0
(JJ0 1
vistaJJ1 6
,JJ6 7
arrColumnasJJ8 C
,JJC D
arrColumnasWhereJJE U
,JJU V
arrValoresWhereJJW f
,JJf g%
strParametrosAdicionales	JJh �
)
JJ� �
;
JJ� �
returnLL 
tableLL 
;LL 
}MM 	
publicVV 
	DataTableVV 
ObtenerDatosVV %
(VV% &
stringVV& ,
vistaVV- 2
,VV2 3
	ArrayListVV4 =
arrColumnasWhereVV> N
,VVN O
	ArrayListVVP Y
arrValoresWhereVVZ i
)VVi j
{WW 	
varXX 
arrColumnasXX 
=XX 
newXX !
	ArrayListXX" +
{XX, -
$strXX- 0
}XX0 1
;XX1 2
varZZ 
localZZ 
=ZZ 
newZZ 
CConnZZ !
(ZZ! "
_strConnZZ" *
)ZZ* +
;ZZ+ ,
var[[ 
table[[ 
=[[ 
local[[ 
.[[ 
CargarDataTableAnd[[ 0
([[0 1
vista[[1 6
,[[6 7
arrColumnas[[8 C
,[[C D
arrColumnasWhere[[E U
,[[U V
arrValoresWhere[[W f
)[[f g
;[[g h
return]] 
table]] 
;]] 
}^^ 	
public`` 
	DataTable`` 
ObtenerDatos`` %
(``% &
string``& ,
vista``- 2
,``2 3
	Hashtable``4 =
	htbFiltro``> G
)``G H
{aa 	
returnbb 
ObtenerDatosbb 
(bb  
vistabb  %
,bb% &
	htbFiltrobb' 0
,bb0 1
$strbb2 4
)bb4 5
;bb5 6
}cc 	
publicee 
	DataTableee 
ObtenerDatosee %
(ee% &
stringee& ,
vistaee- 2
,ee2 3
	Hashtableee4 =
	htbFiltroee> G
,eeG H
stringeeI O$
strParametrosAdicionaleseeP h
)eeh i
{ff 	
vargg 
arrColumnasWheregg  
=gg! "
newgg# &
	ArrayListgg' 0
(gg0 1
)gg1 2
;gg2 3
varhh 
arrValoresWherehh 
=hh  !
newhh! $
	ArrayListhh% .
(hh. /
)hh/ 0
;hh0 1
foreachjj 
(jj 
DictionaryEntryjj $
entryjj% *
injj+ -
	htbFiltrojj. 7
)jj7 8
{kk 
arrColumnasWherell  
.ll  !
Addll! $
(ll$ %
entryll% *
.ll* +
Keyll+ .
.ll. /
ToStringll/ 7
(ll7 8
)ll8 9
)ll9 :
;ll: ;
arrValoresWheremm 
.mm  
Addmm  #
(mm# $
entrymm$ )
.mm) *
Valuemm* /
.mm/ 0
ToStringmm0 8
(mm8 9
)mm9 :
)mm: ;
;mm; <
}nn 
returnpp 
ObtenerDatospp 
(pp  
vistapp  %
,pp% &
arrColumnasWherepp' 7
,pp7 8
arrValoresWherepp9 H
,ppH I$
strParametrosAdicionalesppJ b
)ppb c
;ppc d
}qq 	
public}} 
	DataTable}} 
ObtenerDatos}} %
(}}% &
string}}& ,
vista}}- 2
,}}2 3
	ArrayList}}4 =
arrColumnas}}> I
,}}I J
	ArrayList}}K T
arrColumnasWhere}}U e
,}}e f
	ArrayList~~& /
arrValoresWhere~~0 ?
,~~? @
string~~A G$
strParametrosAdicionales~~H `
)~~` a
{ 	
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
table
�� 
=
�� 
local
�� 
.
��  
CargarDataTableAnd
�� 0
(
��0 1
vista
��1 6
,
��6 7
arrColumnas
��8 C
,
��C D
arrColumnasWhere
��E U
,
��U V
arrValoresWhere
��W f
,
��f g&
strParametrosAdicionales
�� (
)
��( )
;
��) *
return
�� 
table
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� 
ObtenerDatosLike
�� )
(
��) *
string
��* 0
vista
��1 6
,
��6 7
	ArrayList
��8 A
arrColumnas
��B M
,
��M N
	ArrayList
��O X
arrColumnasWhere
��Y i
,
��i j
	ArrayList
��k t
arrValoresWhere��u �
,��� �
string��� �(
strParametrosAdicionales��� �
)��� �
{
�� 	
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
table
�� 
=
�� 
local
�� 
.
�� !
CargarDataTableLike
�� 1
(
��1 2
vista
��2 7
,
��7 8
arrColumnas
��9 D
,
��D E
arrColumnasWhere
��F V
,
��V W
arrValoresWhere
��X g
,
��g h&
strParametrosAdicionales
�� (
)
��( )
;
��) *
return
�� 
table
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� 
ObtenerDatos
�� %
(
��% &
string
��& ,
vista
��- 2
,
��2 3
	ArrayList
��4 =
arrColumnas
��> I
,
��I J
	ArrayList
��K T
arrColumnasWhere
��U e
,
��e f
	ArrayList
��& /
arrValoresWhere
��0 ?
)
��? @
{
�� 	
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
table
�� 
=
�� 
local
�� 
.
��  
CargarDataTableAnd
�� 0
(
��0 1
vista
��1 6
,
��6 7
arrColumnas
��8 C
,
��C D
arrColumnasWhere
��E U
,
��U V
arrValoresWhere
��W f
)
��f g
;
��g h
return
�� 
table
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� 
ObtenerDatos
�� %
(
��% &
string
��& ,
vista
��- 2
,
��2 3
	ArrayList
��4 =
arrColumnasWhere
��> N
,
��N O
	ArrayList
��P Y
arrValoresWhere
��Z i
,
��i j
string
��& ,&
strParametrosAdicionales
��- E
)
��E F
{
�� 	
var
�� 
arrColumnas
�� 
=
�� 
new
�� !
	ArrayList
��" +
{
��, -
$str
��- 0
}
��0 1
;
��1 2
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
table
�� 
=
�� 
local
�� 
.
��  
CargarDataTableAnd
�� 0
(
��0 1
vista
��1 6
,
��6 7
arrColumnas
��8 C
,
��C D
arrColumnasWhere
��E U
,
��U V
arrValoresWhere
��W f
,
��f g&
strParametrosAdicionales
�� (
)
��( )
;
��) *
return
�� 
table
�� 
;
�� 
}
�� 	
public
�� 
DbDataReader
�� 
ObtenerDataReader
�� -
(
��- .
string
��. 4
vista
��5 :
,
��: ;
	ArrayList
��< E
arrColumnasWhere
��F V
,
��V W
	ArrayList
��X a
arrValoresWhere
��b q
,
��q r
string
�� &
strParametrosAdicionales
�� +
)
��+ ,
{
�� 	
var
�� 
arrColumnas
�� 
=
�� 
new
�� !
	ArrayList
��" +
{
��, -
$str
��- 0
}
��0 1
;
��1 2
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
table
�� 
=
�� 
local
�� 
.
�� !
CargarDataReaderAnd
�� 1
(
��1 2
vista
��2 7
,
��7 8
arrColumnas
��9 D
,
��D E
arrColumnasWhere
��F V
,
��V W
arrValoresWhere
��X g
,
��g h&
strParametrosAdicionales
�� (
)
��( )
;
��) *
return
�� 
table
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� 
ObtenerDatos
�� %
(
��% &
string
��& ,
vista
��- 2
,
��2 3
string
��4 :
condicionesWhere
��; K
)
��K L
{
�� 	
var
�� 
arrColumnas
�� 
=
�� 
new
�� !
	ArrayList
��" +
{
��, -
$str
��- 0
}
��0 1
;
��1 2
var
�� 
arrColumnasWhere
��  
=
��! "
new
��# &
	ArrayList
��' 0
{
��1 2
$str
��2 7
}
��7 8
;
��8 9
var
�� 
arrValoresWhere
�� 
=
��  !
new
��" %
	ArrayList
��& /
{
��0 1
$str
��1 6
}
��6 7
;
��7 8
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
table
�� 
=
�� 
local
�� 
.
�� 
CargarDataTableOr
�� /
(
��/ 0
vista
��0 5
,
��5 6
arrColumnas
��7 B
,
��B C
arrColumnasWhere
��D T
,
��T U
arrValoresWhere
��V e
,
��e f
$str
�� 
+
�� 
condicionesWhere
�� +
+
��, -
$str
��. 1
)
��1 2
;
��2 3
return
�� 
table
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� 
ObtenerDatosOr
�� '
(
��' (
string
��( .
vista
��/ 4
,
��4 5
	ArrayList
��6 ?
arrColumnasWhere
��@ P
,
��P Q
	ArrayList
��R [
arrValoresWhere
��\ k
)
��k l
{
�� 	
var
�� 
arrColumnas
�� 
=
�� 
new
�� !
	ArrayList
��" +
{
��, -
$str
��- 0
}
��0 1
;
��1 2
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
table
�� 
=
�� 
local
�� 
.
�� 
CargarDataTableOr
�� /
(
��/ 0
vista
��0 5
,
��5 6
arrColumnas
��7 B
,
��B C
arrColumnasWhere
��D T
,
��T U
arrValoresWhere
��V e
)
��e f
;
��f g
return
�� 
table
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� 
ObtenerDatosOr
�� '
(
��' (
string
��( .
vista
��/ 4
,
��4 5
	ArrayList
��6 ?
arrColumnas
��@ K
,
��K L
	ArrayList
��M V
arrColumnasWhere
��W g
,
��g h
	ArrayList
��( 1
arrValoresWhere
��2 A
,
��A B
string
��C I&
strParametrosAdicionales
��J b
)
��b c
{
�� 	
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
table
�� 
=
�� 
local
�� 
.
�� 
CargarDataTableOr
�� /
(
��/ 0
vista
��0 5
,
��5 6
arrColumnas
��7 B
,
��B C
arrColumnasWhere
��D T
,
��T U
arrValoresWhere
��V e
,
��e f&
strParametrosAdicionales
�� (
)
��( )
;
��) *
return
�� 
table
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� 
ObtenerDatosOr
�� '
(
��' (
string
��( .
vista
��/ 4
,
��4 5
	ArrayList
��6 ?
arrColumnasWhere
��@ P
,
��P Q
	ArrayList
��R [
arrValoresWhere
��\ k
,
��k l
string
��( .&
strParametrosAdicionales
��/ G
)
��G H
{
�� 	
var
�� 
arrColumnas
�� 
=
�� 
new
�� !
	ArrayList
��" +
{
��, -
$str
��- 0
}
��0 1
;
��1 2
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
table
�� 
=
�� 
local
�� 
.
�� 
CargarDataTableOr
�� /
(
��/ 0
vista
��0 5
,
��5 6
arrColumnas
��7 B
,
��B C
arrColumnasWhere
��D T
,
��T U
arrValoresWhere
��V e
,
��e f&
strParametrosAdicionales
�� (
)
��( )
;
��) *
return
�� 
table
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� !
ObtenerDatosProcAlm
�� ,
(
��, -
string
��- 3

��4 A
,
��A B
	ArrayList
��C L

��M Z
)
��Z [
{
�� 	
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
table
�� 
=
�� 
local
�� 
.
�� +
ExecStoreProcedureToDataTable
�� ;
(
��; <

��< I
,
��I J

��K X
)
��X Y
;
��Y Z
return
�� 
table
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� !
ObtenerDatosProcAlm
�� ,
(
��, -
string
��- 3

��4 A
)
��A B
{
�� 	
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
table
�� 
=
�� 
local
�� 
.
�� +
ExecStoreProcedureToDataTable
�� ;
(
��; <

��< I
)
��I J
;
��J K
return
�� 
table
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� !
ObtenerDatosProcAlm
�� ,
(
��, -
string
��- 3

��4 A
,
��A B
	ArrayList
��C L!
arrNombreParametros
��M `
,
��` a
	ArrayList
��b k

��l y
)
��y z
{
�� 	
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
table
�� 
=
�� 
local
�� 
.
�� +
ExecStoreProcedureToDataTable
�� ;
(
��; <

��< I
,
��I J!
arrNombreParametros
��K ^
,
��^ _

��` m
)
��m n
;
��n o
return
�� 
table
�� 
;
�� 
}
�� 	
public
�� 
	DataTable
�� !
ObtenerDatosProcAlm
�� ,
(
��, -
string
��- 3

��4 A
,
��A B
	ArrayList
��C L!
arrNombreParametros
��M `
,
��` a
	ArrayList
��b k

��l y
,
��y z
ref
��{ ~
CTrans�� �
myTrans��� �
)��� �
{
�� 	
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
table
�� 
=
�� 
local
�� 
.
�� +
ExecStoreProcedureToDataTable
�� ;
(
��; <

��< I
,
��I J!
arrNombreParametros
��K ^
,
��^ _

��` m
,
��m n
ref
��o r
myTrans
��s z
)
��z {
;
��{ |
return
�� 
table
�� 
;
�� 
}
�� 	
public
�� 
int
�� 
EjecutarProcAlm
�� "
(
��" #
string
��# )

��* 7
)
��7 8
{
�� 	
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
iTotal
�� 
=
�� 
local
�� 
.
��  
ExecStoreProcedure
�� 1
(
��1 2

��2 ?
)
��? @
?
��A B
$num
��C D
:
��E F
$num
��G H
;
��H I
return
�� 
iTotal
�� 
;
�� 
}
�� 	
public
�� 
int
�� 
EjecutarProcAlm
�� "
(
��" #
string
��# )

��* 7
,
��7 8
	ArrayList
��9 B

��C P
)
��P Q
{
�� 	
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
iTotal
�� 
=
�� 
local
�� 
.
��  
ExecStoreProcedure
�� 1
(
��1 2

��2 ?
,
��? @

��A N
)
��N O
?
��P Q
$num
��R S
:
��T U
$num
��V W
;
��W X
return
�� 
iTotal
�� 
;
�� 
}
�� 	
public
�� 
int
�� 
EjecutarProcAlm
�� "
(
��" #
string
��# )

��* 7
,
��7 8
	ArrayList
��9 B!
arrNombreParametros
��C V
,
��V W
	ArrayList
��X a

��b o
)
��o p
{
�� 	
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
iTotal
�� 
=
�� 
local
�� 
.
��  
ExecStoreProcedure
�� 1
(
��1 2

��2 ?
,
��? @!
arrNombreParametros
��A T
,
��T U

��V c
)
��c d
;
��d e
return
�� 
iTotal
�� 
;
�� 
}
�� 	
public
�� 
int
�� 
EjecutarProcAlm
�� "
(
��" #
string
��# )

��* 7
,
��7 8
	ArrayList
��9 B!
arrNombreParametros
��C V
,
��V W
	ArrayList
��X a

��b o
,
��o p
ref
��q t
CTrans
��u {
myTrans��| �
)��� �
{
�� 	
var
�� 
local
�� 
=
�� 
new
�� 
CConn
�� !
(
��! "
_strConn
��" *
)
��* +
;
��+ ,
var
�� 
iTotal
�� 
=
�� 
local
�� 
.
��  
ExecStoreProcedure
�� 1
(
��1 2

��2 ?
,
��? @!
arrNombreParametros
��A T
,
��T U

��V c
,
��c d
ref
��e h
myTrans
��i p
)
��p q
;
��q r
return
�� 
iTotal
�� 
;
�� 
}
�� 	
}
�� 
}�� �
KC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Helpers\CFunciones.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Helpers  '
{ 
public		 

static		 
class		 

CFunciones		 "
{

 
public 
static 
string 

GenerarMd5 '
(' (
string( .
cadena/ 5
)5 6
{ 	
var
md5
=
new
MD5CryptoServiceProvider
(
)
;
var 

= 
Encoding  (
.( )
Default) 0
.0 1
GetBytes1 9
(9 :
cadena: @
)@ A
;A B
var 
encodedBytes 
= 
md5 "
." #
ComputeHash# .
(. /

)< =
;= >
return 
BitConverter 
.  
ToString  (
(( )
encodedBytes) 5
)5 6
.6 7
Replace7 >
(> ?
$str? B
,B C
$strD F
)F G
;G H
} 	
public 
static 
string 
GetContentType +
(+ ,
string, 2
path3 7
)7 8
{ 	
var 
types 
= 
GetMimeTypes $
($ %
)% &
;& '
var 
ext 
= 
Path 
. 
GetExtension '
(' (
path( ,
), -
.- .
ToLowerInvariant. >
(> ?
)? @
;@ A
return 
types 
[ 
ext 
] 
; 
} 	
private 
static 

Dictionary !
<! "
string" (
,( )
string* 0
>0 1
GetMimeTypes2 >
(> ?
)? @
{ 	
return 
new 

Dictionary !
<! "
string" (
,( )
string* 0
>0 1
{ 
{ 
$str 
, 
$str %
}% &
,& '
{   
$str   
,   
$str   *
}  * +
,  + ,
{!! 
$str!! 
,!! 
$str!! 2
}!!2 3
,!!3 4
{"" 
$str"" 
,"" 
$str"" 3
}""3 4
,""4 5
{## 
$str## 
,## 
$str## 3
}##3 4
,##4 5
{$$ 
$str$$ 
,$$ 
$str$$ :
}$$: ;
,$$; <
{%% 
$str%% 
,%% 
$str%% $
}%%$ %
,%%% &
{&& 
$str&& 
,&& 
$str&& %
}&&% &
,&&& '
{'' 
$str'' 
,'' 
$str'' &
}''& '
,''' (
{(( 
$str(( 
,(( 
$str(( $
}(($ %
,((% &
{)) 
$str)) 
,)) 
$str)) #
}))# $
}** 
;**
}++ 
},, 
}-- �,
GC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Helpers\CMenus.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Helpers  '
{
public 

static 
class 
CMenus 
{ 
public 
static 
bool 
EsPar  
(  !
int! $
numero% +
)+ ,
{ 	
return 
numero 
% 
$num 
==  
$num! "
;" #
} 	
public 
static 
List 
< 
SegAplicaciones *
>* +
GetAplicaciones, ;
(; <
db_encuestasContext< O
contextP W
,W X
longY ]
idRol^ c
)c d
{ 	
return 
context 
. 
SegAplicaciones *
. 
Join 
( 
context 
. 

SegPaginas (
,( )
app* -
=>. 0
app1 4
.4 5
Idsap5 :
,: ;
pag< ?
=>@ B
pagC F
.F G
IdsapG L
,L M
(N O
appO R
,R S
pagT W
)W X
=>Y [
new\ _
{` a
appa d
,d e
pagf i
}i j
)j k
. 
Join 
( 
context 
. 
SegRolesPagina ,
,, -
pag. 1
=>2 4
pag5 8
.8 9
pag9 <
.< =
Idspg= B
,B C
rolpagD J
=>K M
rolpagN T
.T U
IdspgU Z
,Z [
(\ ]
pag] `
,` a
rolpagb h
)h i
=>j l
newm p
{q r
pagr u
,u v
rolpagw }
}} ~
)~ 
. 
Where 
( 
@t 
=> 
@t 
.  
rolpag  &
.& '
Idsro' ,
==- /
idRol0 5
)5 6
. 
Select 
( 
@t 
=> 
@t  
.  !
pag! $
.$ %
app% (
)( )
.) *
Distinct* 2
(2 3
)3 4
.4 5
ToList5 ;
(; <
)< =
;= >
} 	
public 
static 
List 
< 

SegPaginas %
>% &
GetPages' /
(/ 0
HttpContext0 ;

miContexto< F
,F G
db_encuestasContextH [
context\ c
,c d
longe i
idRolj o
)o p
{ 	
var   

currentApp   
=   
$str   !
;  ! "
if!! 
(!! 

miContexto!! 
.!! 
Session!! "
.!!" #
Keys!!# '
.!!' (
Contains!!( 0
(!!0 1
$str!!1 =
)!!= >
)!!> ?
{"" 

currentApp## 
=## 

miContexto## (
.##( )
Session##) 0
.##0 1
	GetString##1 :
(##: ;
$str##; G
)##G H
;##H I
}$$ 
var'' 
objApp'' 
='' 
context''  
.''  !
SegAplicaciones''! 0
.''0 1
SingleOrDefault''1 @
(''@ A
app''A D
=>''E G
app''H K
.''K L
Sigla''L Q
==''R T

currentApp''U _
)''_ `
;''` a
if)) 
()) 
objApp)) 
==)) 
null)) 
))) 
{** 
return++ 
new++ 
List++ 
<++  

SegPaginas++  *
>++* +
(+++ ,
)++, -
;++- .
},, 
return.. 
context.. 
... 

SegPaginas.. %
.// 
Join// 
(// 
context// 
.// 
SegRolesPagina// ,
,//, -
pag//. 1
=>//2 4
pag//5 8
.//8 9
Idspg//9 >
,//> ?
rolpag//@ F
=>//G I
rolpag//J P
.//P Q
Idspg//Q V
,//V W
(00 
pag00 
,00 
rolpag00  
)00  !
=>00" $
new00% (
{00) *
pag00* -
,00- .
rolpag00/ 5
}005 6
)006 7
.11 
Where11 
(11 
@t11 
=>11 
(11 
@t11  
.11  !
pag11! $
.11$ %
Idsap11% *
==11+ -
objApp11. 4
.114 5
Idsap115 :
)11: ;
)11; <
.22 
Where22 
(22 
@t22 
=>22 
(22 
@t22  
.22  !
rolpag22! '
.22' (
Idsro22( -
==22. 0
idRol221 6
)226 7
)227 8
.33 
Select33 
(33 
@t33 
=>33 
@t33  
.33  !
pag33! $
)33$ %
.44 
OrderBy44 
(44 
paginas44  
=>44! #
paginas44$ +
.44+ ,
	Prioridad44, 5
)445 6
.446 7
ToList447 =
(44= >
)44> ?
;44? @
}55 	
}77 
}88 �
ZC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Helpers\ConnectionStringsSettings.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Helpers  '
{ 
public		 

class		 %
ConnectionStringsSettings		 *
{

 
public 
string (
DataAccessPostgreSqlProvider 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
}
QC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Helpers\ExtensionMethods.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Helpers  '
{ 
public

static
class
ExtensionMethods
{ 
public 
static 
string 
ToUnderscoreCase -
(- .
this. 2
string3 9
str: =
)= >
{ 	
return 
string 
. 
Concat  
(  !
str! $
.$ %
Select% +
(+ ,
(, -
x- .
,. /
i0 1
)1 2
=>3 5
i6 7
>8 9
$num: ;
&&< >
char? C
.C D
IsUpperD K
(K L
xL M
)M N
?O P
$strQ T
+U V
xW X
.X Y
ToStringY a
(a b
)b c
:d e
xf g
.g h
ToStringh p
(p q
)q r
)r s
)s t
.t u
ToLowerInvariant	u �
(
� �
)
� �
;
� �
} 	
public 
static 
string 
ToCamelCase (
(( )
this) -
string. 4
str5 8
)8 9
{ 	
return 
str 
. 
Split 
( 
new  
[  !
]! "
{# $
$str% (
}) *
,* +
StringSplitOptions, >
.> ?
RemoveEmptyEntries? Q
)Q R
.R S
SelectS Y
(Y Z
sZ [
=>\ ^
char_ c
.c d
ToUpperInvariantd t
(t u
su v
[v w
$numw x
]x y
)y z
+{ |
s} ~
.~ 
	Substring	 �
(
� �
$num
� �
,
� �
s
� �
.
� �
Length
� �
-
� �
$num
� �
)
� �
)
� �
.
� �
	Aggregate
� �
(
� �
string
� �
.
� �
Empty
� �
,
� �
(
� �
s1
� �
,
� �
s2
� �
)
� �
=>
� �
s1
� �
+
� �
s2
� �
)
� �
;
� �
} 	
public 
static 
string 
ToPascalCase )
() *
this* .
string/ 5
str6 9
)9 :
{ 	
var 
words 
= 
str 
. 
Split !
(! "
new" %
[% &
]& '
{( )
$char* -
,- .
$char/ 2
}3 4
,4 5
StringSplitOptions6 H
.H I
RemoveEmptyEntriesI [
)[ \
. 
Select 
( 
word 
=> 
word  $
.$ %
	Substring% .
(. /
$num/ 0
,0 1
$num2 3
)3 4
.4 5
ToUpperInvariant5 E
(E F
)F G
+H I
word  $
.$ %
	Substring% .
(. /
$num/ 0
)0 1
.1 2
ToLowerInvariant2 B
(B C
)C D
)D E
;E F
var 
result 
= 
string 
.  
Concat  &
(& '
words' ,
), -
;- .
return   
result   
;   
}!! 	
}"" 
}## �
SC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Helpers\IdentityExtensions.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Helpers  '
{ 
public 

static 
class 
IdentityExtensions *
{ 
public 
static 
string 
GetGivenName )
() *
this* .
	IIdentity/ 8
identity9 A
)A B
{		 	
return

 
(

 
identity

 
as

 
ClaimsIdentity

  .
)

. /
?

/ 0
.

0 1
FirstOrNull

1 <
(

< =

ClaimTypes

= G
.

G H
	GivenName

H Q
)

Q R
;

R S
} 	
public 
static 
string 
GetRole $
($ %
this% )
	IIdentity* 3
identity4 <
)< =
{ 	
return 
( 
identity 
as 
ClaimsIdentity  .
). /
?/ 0
.0 1
FirstOrNull1 <
(< =

ClaimTypes= G
.G H
RoleH L
)L M
;M N
} 	
public 
static 
string 
GetGroupSid (
(( )
this) -
	IIdentity. 7
identity8 @
)@ A
{ 	
return 
( 
identity 
as 
ClaimsIdentity  .
). /
?/ 0
.0 1
FirstOrNull1 <
(< =

ClaimTypes= G
.G H
GroupSidH P
)P Q
;Q R
} 	
public 
static 
string 

(* +
this+ /
	IIdentity0 9
identity: B
)B C
{ 	
return 
( 
identity 
as 
ClaimsIdentity  .
). /
?/ 0
.0 1
FirstOrNull1 <
(< =

ClaimTypes= G
.G H

PrimarySidH R
)R S
;S T
} 	
internal 
static 
string 
FirstOrNull *
(* +
this+ /
ClaimsIdentity0 >
identity? G
,G H
stringI O
	claimTypeP Y
)Y Z
{ 	
var 
val 
= 
identity 
. 
	FindFirst (
(( )
	claimType) 2
)2 3
;3 4
return   
val   
?   
.   
Value   
;   
}!! 	
}"" 
}## �>
MC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Models\BasePageModel.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Models  &
{ 
public		 

class		 

:		  
	PageModel		! *
{

 
	protected 
readonly 
db_encuestasContext .
_context/ 7
;7 8
	protected 
List 
< 
SegAplicaciones &
>& '
ListApp( /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
	protected
List
<

SegPaginas
>
	ListPages
{
get
;
set
;
}
	protected 
string 
Usuario  
{! "
get# &
;& '
set( +
;+ ,
}- .
	protected 
string 

CurrentApp #
{$ %
get& )
;) *
set+ .
;. /
}0 1
	protected 
string 
ErrorDb  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 

( 
db_encuestasContext 0
context1 8
)8 9
{ 	
_context 
= 
context 
; 
} 	
public 
string 

(# $
)$ %
{ 	
return 
HttpContext 
. 
Session &
.& '
Keys' +
.+ ,
Contains, 4
(4 5
$str5 A
)A B
?C D
HttpContextE P
.P Q
SessionQ X
.X Y
	GetStringY b
(b c
$strc o
)o p
:q r
nulls w
;w x
} 	
public 
string 
GetLogin 
( 
)  
{ 	
return 
User 
. 
Identity  
.  !
IsAuthenticated! 0
?1 2
User3 7
.7 8
Identity8 @
.@ A
NameA E
:F G
nullH L
;L M
} 	
public!! 
string!! 
GetUserName!! !
(!!! "
)!!" #
{"" 	
if## 
(## 
!## 
User## 
.## 
Identity## 
.## 
IsAuthenticated## .
)##. /
{$$ 
return%% 
null%% 
;%% 
}&& 
var'' 
obj'' 
='' 
_context'' 
.'' 
SegUsuarios'' *
.''* +
SingleOrDefault''+ :
('': ;
m''; <
=>''= ?
m''@ A
.''A B
Login''B G
==''H J
User''K O
.''O P
Identity''P X
.''X Y
GetGivenName''Y e
(''e f
)''f g
)''g h
;''h i
if(( 
((( 
obj(( 
==(( 
null(( 
)(( 
{)) 
return** 
User** 
.** 
Identity** $
.**$ %
GetGivenName**% 1
(**1 2
)**2 3
.**3 4
Length**4 :
>**; <
$num**= ?
?**@ A
User**B F
.**F G
Identity**G O
.**O P
GetGivenName**P \
(**\ ]
)**] ^
.**^ _
Split**_ d
(**d e
$char**e h
)**h i
[**i j
$num**j k
]**k l
:**m n
User**o s
.**s t
Identity**t |
.**| }
GetGivenName	**} �
(
**� �
)
**� �
;
**� �
}++ 
return,, 
(,, 
(,, 
obj,, 
.,, 
Nombres,,  
+,,! "
$str,,# &
+,,' (
obj,,) ,
.,,, -
	Apellidos,,- 6
),,6 7
.,,7 8
Length,,8 >
>,,? @
$num,,A C
),,C D
?,,F G
obj,,H K
.,,K L
Nombres,,L S
:,,S T
obj,,U X
.,,X Y
Nombres,,Y `
+,,a b
$str,,c f
+,,g h
obj,,i l
.,,l m
	Apellidos,,m v
;,,v w
}-- 	
public// 
SegUsuarios// 
GetUser// "
(//" #
)//# $
{00 	
if11 
(11 
!11 
User11 
.11 
Identity11 
.11 
IsAuthenticated11 .
)11. /
{22 
return33 
null33 
;33 
}44 
var55 
obj55 
=55 
_context55 
.55 
SegUsuarios55 *
.55* +
SingleOrDefault55+ :
(55: ;
m55; <
=>55= ?
m55@ A
.55A B
Login55B G
==55H J
User55K O
.55O P
Identity55P X
.55X Y
GetGivenName55Y e
(55e f
)55f g
)55g h
;55h i
return66 
obj66 
;66 
}88 	
public:: 
SegRoles:: 
GetUserRole:: #
(::# $
)::$ %
{;; 	
if<< 
(<< 
!<< 
User<< 
.<< 
Identity<< 
.<< 
IsAuthenticated<< .
)<<. /
{== 
return>> 
null>> 
;>> 
}?? 
var@@ 
obj@@ 
=@@ 
_context@@ 
.@@ 
SegRoles@@ '
.@@' (
SingleOrDefault@@( 7
(@@7 8
m@@8 9
=>@@: <
m@@= >
.@@> ?
Idsro@@? D
.@@D E
ToString@@E M
(@@M N
)@@N O
==@@P R
User@@S W
.@@W X
Identity@@X `
.@@` a
GetRole@@a h
(@@h i
)@@i j
)@@j k
;@@k l
returnAA 
objAA 
;AA 
}CC 	
	protectedEE 
ListEE 
<EE 
SegAplicacionesEE &
>EE& '
GetAplicacionesEE( 7
(EE7 8
)EE8 9
{FF 	
varGG 
objRolGG 
=GG 
GetUserRoleGG $
(GG$ %
)GG% &
;GG& '
returnHH 
objRolHH 
==HH 
nullHH !
?HH" #
CMenusHH$ *
.HH* +
GetAplicacionesHH+ :
(HH: ;
_contextHH; C
,HHC D
-HHE F
$numHHF G
)HHG H
:HHI J
CMenusHHK Q
.HHQ R
GetAplicacionesHHR a
(HHa b
_contextHHb j
,HHj k
objRolHHl r
.HHr s
IdsroHHs x
)HHx y
;HHy z
}II 	
	protectedKK 
ListKK 
<KK 

SegPaginasKK !
>KK! "
GetPagesKK# +
(KK+ ,
)KK, -
{LL 	
varMM 
objRolMM 
=MM 
GetUserRoleMM $
(MM$ %
)MM% &
;MM& '
returnNN 
objRolNN 
==NN 
nullNN !
?NN" #
CMenusNN$ *
.NN* +
GetPagesNN+ 3
(NN3 4
HttpContextNN4 ?
,NN? @
_contextNNA I
,NNI J
-NNJ K
$numNNK L
)NNL M
:NNN O
CMenusNNP V
.NNV W
GetPagesNNW _
(NN_ `
HttpContextNN` k
,NNk l
_contextNNm u
,NNu v
objRolNNv |
.NN| }
Idsro	NN} �
)
NN� �
;
NN� �
}OO 	
}QQ 
}RR �m
PC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Models\CatDepartamentos.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Models  &
{ 
[ 
Table 
( 
$str 
) 
] 
public 
class 
CatDepartamentos 
{ 
public 
static	 
readonly 
string  
StrNombreTabla! /
=0 1
$str2 E
;E F
public 
static	 
readonly 
string  

=/ 0
$str1 D
;D E
public 
enum	 
Fields 
{   
Idcde!! 
,"" 
Codigo"" 

,## 
Nombre## 

,$$ 
Latitud$$ 
,%% 
Longitud%% 
,&& 
Abreviatura&& 
,'' 
	Apiestado'' 
,(( 
Apitransaccion(( 
,)) 
Usucre)) 

,** 
Feccre** 

,++ 
Usumod++ 

,,, 
Fecmod,, 

}-- 
public11 
CatDepartamentos11	 
(11 
)11 
{22 
OpeBrigadas33 
=33 
new33 
HashSet33 
<33 
OpeBrigadas33 (
>33( )
(33) *
)33* +
;33+ ,
OpeUpms44 

=44 
new44
HashSet44 
<44 
OpeUpms44  
>44  !
(44! "
)44" #
;44# $"
SegUsuariosRestriccion55 
=55 
new55 
HashSet55  '
<55' ("
SegUsuariosRestriccion55( >
>55> ?
(55? @
)55@ A
;55A B
SegUsuarios66 
=66 
new66 
HashSet66 
<66 
SegUsuarios66 (
>66( )
(66) *
)66* +
;66+ ,
Codigo99 	
=99
 
null99 
;99 
Nombre:: 	
=::
 
null:: 
;:: 
Latitud;; 

=;; 
null;;
;;; 
Longitud<< 
=<< 
null<< 
;<< 
Abreviatura== 
=== 
null== 
;== 
	Apiestado>> 
=>>
null>> 
;>> 
Apitransaccion?? 
=?? 
null?? 
;?? 
Usucre@@ 	
=@@
 
null@@ 
;@@ 
UsumodAA 	
=AA
 
nullAA 
;AA 
FecmodBB 	
=BB
 
nullBB 
;BB 
}CC 
publicEE 
CatDepartamentosEE	 
(EE 
CatDepartamentosEE *
objEE+ .
)EE. /
{FF 
OpeBrigadasGG 
=GG 
newGG 
HashSetGG 
<GG 
OpeBrigadasGG (
>GG( )
(GG) *
)GG* +
;GG+ ,
OpeUpmsHH 

=HH 
newHH
HashSetHH 
<HH 
OpeUpmsHH  
>HH  !
(HH! "
)HH" #
;HH# $"
SegUsuariosRestriccionII 
=II 
newII 
HashSetII  '
<II' ("
SegUsuariosRestriccionII( >
>II> ?
(II? @
)II@ A
;IIA B
SegUsuariosJJ 
=JJ 
newJJ 
HashSetJJ 
<JJ 
SegUsuariosJJ (
>JJ( )
(JJ) *
)JJ* +
;JJ+ ,
IdcdeLL 
=LL	 

objLL 
.LL 
IdcdeLL 
;LL 
CodigoMM 	
=MM
 
objMM 
.MM 
CodigoMM 
;MM 
NombreNN 	
=NN
 
objNN 
.NN 
NombreNN 
;NN 
LatitudOO 

=OO 
objOO
.OO 
LatitudOO 
;OO 
LongitudPP 
=PP 
objPP 
.PP 
LongitudPP 
;PP 
AbreviaturaQQ 
=QQ 
objQQ 
.QQ 
AbreviaturaQQ  
;QQ  !
	ApiestadoRR 
=RR
objRR 
.RR 
	ApiestadoRR 
;RR 
ApitransaccionSS 
=SS 
objSS 
.SS 
ApitransaccionSS &
;SS& '
UsucreTT 	
=TT
 
objTT 
.TT 
UsucreTT 
;TT 
FeccreUU 	
=UU
 
objUU 
.UU 
FeccreUU 
;UU 
UsumodVV 	
=VV
 
objVV 
.VV 
UsumodVV 
;VV 
FecmodWW 	
=WW
 
objWW 
.WW 
FecmodWW 
;WW 
}XX 
[dd 
Columndd 	
(dd	 

$strdd
 
)dd 
]dd 
[ee 
Displayee 

(ee
 
Nameee 
=ee 
$stree 
,ee 
Descriptionee &
=ee' (
$stree) \
)ee\ ]
]ee] ^
[ff 
Requiredff 
(ff 
ErrorMessageff 
=ff 
$strff 9
)ff9 :
]ff: ;
[gg 
Keygg 
]gg 
publichh 
longhh	 
Idcdehh 
{hh 
gethh 
;hh 
sethh 
;hh 
}hh  !
[rr 
Columnrr 	
(rr	 

$strrr
 
)rr 
]rr 
[ss 
StringLengthss 
(ss 
$numss 
,ss 

=ss  !
$numss! "
)ss" #
]ss# $
[tt 
Displaytt 

(tt
 
Namett 
=tt 
$strtt 
,tt 
Descriptiontt '
=tt( )
$strtt* B
)ttB C
]ttC D
publicuu 
stringuu	 
Codigouu 
{uu 
getuu 
;uu 
setuu !
;uu! "
}uu# $
[ 
Column 	
(	 

$str
 
) 
] 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

�� !
=
��! "
$num
��" #
)
��# $
]
��$ %
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� '
=
��( )
$str
��* C
)
��C D
]
��D E
public
�� 
string
��	 
Nombre
�� 
{
�� 
get
�� 
;
�� 
set
�� !
;
��! "
}
��# $
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� (
=
��) *
$str
��+ a
)
��a b
]
��b c
public
�� 
Decimal
��	 
?
�� 
Latitud
�� 
{
�� 
get
�� 
;
��  
set
��! $
;
��$ %
}
��& '
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� )
=
��* +
$str
��, c
)
��c d
]
��d e
public
�� 
Decimal
��	 
?
�� 
Longitud
�� 
{
�� 
get
��  
;
��  !
set
��" %
;
��% &
}
��' (
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

��  
=
��  !
$num
��! "
)
��" #
]
��# $
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
��  
Description
��! ,
=
��- .
$str
��/ M
)
��M N
]
��N O
public
�� 
string
��	 
Abreviatura
�� 
{
�� 
get
�� !
;
��! "
set
��# &
;
��& '
}
��( )
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

�� !
=
��! "
$num
��" #
)
��# $
]
��$ %
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� *
=
��+ ,
$str
��- X
)
��X Y
]
��Y Z
public
�� 
string
��	 
	Apiestado
�� 
{
�� 
get
�� 
;
��  
set
��! $
;
��$ %
}
��& '
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

�� !
=
��! "
$num
��" #
)
��# $
]
��$ %
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� "
,
��" #
Description
��$ /
=
��0 1
$str
��2 _
)
��_ `
]
��` a
public
�� 
string
��	 
Apitransaccion
�� 
{
��  
get
��! $
;
��$ %
set
��& )
;
��) *
}
��+ ,
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

�� !
=
��! "
$num
��" #
)
��# $
]
��$ %
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� '
=
��( )
$str
��* _
)
��_ `
]
��` a
public
�� 
string
��	 
Usucre
�� 
{
�� 
get
�� 
;
�� 
set
�� !
;
��! "
}
��# $
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� '
=
��( )
$str
��* J
)
��J K
]
��K L
public
�� 
DateTime
��	 
Feccre
�� 
{
�� 
get
�� 
;
�� 
set
��  #
;
��# $
}
��% &
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

�� !
=
��! "
$num
��" #
)
��# $
]
��$ %
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� '
=
��( )
$str
��* v
)
��v w
]
��w x
public
�� 
string
��	 
Usumod
�� 
{
�� 
get
�� 
;
�� 
set
�� !
;
��! "
}
��# $
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� '
=
��( )
$str
��* k
)
��k l
]
��l m
public
�� 
DateTime
��	 
?
�� 
Fecmod
�� 
{
�� 
get
�� 
;
��  
set
��! $
;
��$ %
}
��& '
[
�� 
InverseProperty
�� 
(
�� 
$str
�� $
)
��$ %
]
��% &
public
�� 
ICollection
��	 
<
�� 
OpeBrigadas
��  
>
��  !
OpeBrigadas
��" -
{
��. /
get
��0 3
;
��3 4
set
��5 8
;
��8 9
}
��: ;
[
�� 
InverseProperty
�� 
(
�� 
$str
�� $
)
��$ %
]
��% &
public
�� 
ICollection
��	 
<
�� 
OpeUpms
�� 
>
�� 
OpeUpms
�� %
{
��& '
get
��( +
;
��+ ,
set
��- 0
;
��0 1
}
��2 3
[
�� 
InverseProperty
�� 
(
�� 
$str
�� $
)
��$ %
]
��% &
public
�� 
ICollection
��	 
<
�� $
SegUsuariosRestriccion
�� +
>
��+ ,$
SegUsuariosRestriccion
��- C
{
��D E
get
��F I
;
��I J
set
��K N
;
��N O
}
��P Q
[
�� 
InverseProperty
�� 
(
�� 
$str
�� $
)
��$ %
]
��% &
public
�� 
ICollection
��	 
<
�� 
SegUsuarios
��  
>
��  !
SegUsuarios
��" -
{
��. /
get
��0 3
;
��3 4
set
��5 8
;
��8 9
}
��: ;
}
�� 
}�� �Q
JC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Models\CatNiveles.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Models  &
{ 
[ 
Table 
( 
$str 
) 
] 
public 
class 

CatNiveles 
{ 
public 
static	 
readonly 
string 
StrNombreTabla  .
=/ 0
$str1 >
;> ?
public 
static	 
readonly 
string 

=. /
$str0 =
;= >
public 
enum	 
Fields 
{   
Idcnv!! 
,"" 
Nivel"" 	
,## 
Descripcion## 
,$$ 
	Apiestado$$ 
,%% 
Apitransaccion%% 
,&& 
Usucre&& 

,'' 
Feccre'' 

,(( 
Usumod(( 

,)) 
Fecmod)) 

}** 
public.. 

CatNiveles..	 
(.. 
).. 
{// 
EncSecciones00 
=00 
new00 
HashSet00 
<00 
EncSecciones00 *
>00* +
(00+ ,
)00, -
;00- .
EncPreguntas11 
=11 
new11 
HashSet11 
<11 
EncPreguntas11 *
>11* +
(11+ ,
)11, -
;11- .
EncInformantes22 
=22 
new22 
HashSet22 
<22  
EncInformantes22  .
>22. /
(22/ 0
)220 1
;221 2
Nivel55 
=55	 

null55 
;55 
Descripcion66 
=66 
null66 
;66 
	Apiestado77 
=77
null77 
;77 
Apitransaccion88 
=88 
null88 
;88 
Usucre99 	
=99
 
null99 
;99 
Usumod:: 	
=::
 
null:: 
;:: 
Fecmod;; 	
=;;
 
null;; 
;;; 
}<< 
public>> 

CatNiveles>>	 
(>> 

CatNiveles>> 
obj>> "
)>>" #
{?? 
EncSecciones@@ 
=@@ 
new@@ 
HashSet@@ 
<@@ 
EncSecciones@@ *
>@@* +
(@@+ ,
)@@, -
;@@- .
EncPreguntasAA 
=AA 
newAA 
HashSetAA 
<AA 
EncPreguntasAA *
>AA* +
(AA+ ,
)AA, -
;AA- .
EncInformantesBB 
=BB 
newBB 
HashSetBB 
<BB  
EncInformantesBB  .
>BB. /
(BB/ 0
)BB0 1
;BB1 2
IdcnvDD 
=DD	 

objDD 
.DD 
IdcnvDD 
;DD 
NivelEE 
=EE	 

objEE 
.EE 
NivelEE 
;EE 
DescripcionFF 
=FF 
objFF 
.FF 
DescripcionFF  
;FF  !
	ApiestadoGG 
=GG
objGG 
.GG 
	ApiestadoGG 
;GG 
ApitransaccionHH 
=HH 
objHH 
.HH 
ApitransaccionHH &
;HH& '
UsucreII 	
=II
 
objII 
.II 
UsucreII 
;II 
FeccreJJ 	
=JJ
 
objJJ 
.JJ 
FeccreJJ 
;JJ 
UsumodKK 	
=KK
 
objKK 
.KK 
UsumodKK 
;KK 
FecmodLL 	
=LL
 
objLL 
.LL 
FecmodLL 
;LL 
}MM 
[YY 
ColumnYY 	
(YY	 

$strYY
 
)YY 
]YY 
[ZZ 
DisplayZZ 

(ZZ
 
NameZZ 
=ZZ 
$strZZ 
,ZZ 
DescriptionZZ &
=ZZ' (
$strZZ) k
)ZZk l
]ZZl m
[[[ 
Required[[ 
([[ 
ErrorMessage[[ 
=[[ 
$str[[ 9
)[[9 :
][[: ;
[\\ 
Key\\ 
]\\ 
public]] 
long]]	 
Idcnv]] 
{]] 
get]] 
;]] 
set]] 
;]] 
}]]  !
[gg 
Columngg 	
(gg	 

$strgg
 
)gg 
]gg 
[hh 
Displayhh 

(hh
 
Namehh 
=hh 
$strhh 
,hh 
Descriptionhh &
=hh' (
$strhh) @
)hh@ A
]hhA B
publicii 
intii	 
?ii 
Nivelii 
{ii 
getii 
;ii 
setii 
;ii 
}ii  !
[ss 
Columnss 	
(ss	 

$strss
 
)ss 
]ss 
[tt 
Displaytt 

(tt
 
Namett 
=tt 
$strtt 
,tt  
Descriptiontt! ,
=tt- .
$strtt/ L
)ttL M
]ttM N
publicuu 
stringuu	 
Descripcionuu 
{uu 
getuu !
;uu! "
setuu# &
;uu& '
}uu( )
[ 
Column 	
(	 

$str
 
) 
] 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

�� !
=
��! "
$num
��" #
)
��# $
]
��$ %
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� *
=
��+ ,
$str
��- X
)
��X Y
]
��Y Z
public
�� 
string
��	 
	Apiestado
�� 
{
�� 
get
�� 
;
��  
set
��! $
;
��$ %
}
��& '
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

�� !
=
��! "
$num
��" #
)
��# $
]
��$ %
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� "
,
��" #
Description
��$ /
=
��0 1
$str
��2 _
)
��_ `
]
��` a
public
�� 
string
��	 
Apitransaccion
�� 
{
��  
get
��! $
;
��$ %
set
��& )
;
��) *
}
��+ ,
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

�� !
=
��! "
$num
��" #
)
��# $
]
��$ %
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� '
=
��( )
$str
��* _
)
��_ `
]
��` a
public
�� 
string
��	 
Usucre
�� 
{
�� 
get
�� 
;
�� 
set
�� !
;
��! "
}
��# $
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� '
=
��( )
$str
��* J
)
��J K
]
��K L
public
�� 
DateTime
��	 
Feccre
�� 
{
�� 
get
�� 
;
�� 
set
��  #
;
��# $
}
��% &
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

�� !
=
��! "
$num
��" #
)
��# $
]
��$ %
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� '
=
��( )
$str
��* v
)
��v w
]
��w x
public
�� 
string
��	 
Usumod
�� 
{
�� 
get
�� 
;
�� 
set
�� !
;
��! "
}
��# $
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� '
=
��( )
$str
��* k
)
��k l
]
��l m
public
�� 
DateTime
��	 
?
�� 
Fecmod
�� 
{
�� 
get
�� 
;
��  
set
��! $
;
��$ %
}
��& '
[
�� 
InverseProperty
�� 
(
�� 
$str
�� $
)
��$ %
]
��% &
public
�� 
ICollection
��	 
<
�� 
EncSecciones
�� !
>
��! "
EncSecciones
��# /
{
��0 1
get
��2 5
;
��5 6
set
��7 :
;
��: ;
}
��< =
[
�� 
InverseProperty
�� 
(
�� 
$str
�� $
)
��$ %
]
��% &
public
�� 
ICollection
��	 
<
�� 
EncPreguntas
�� !
>
��! "
EncPreguntas
��# /
{
��0 1
get
��2 5
;
��5 6
set
��7 :
;
��: ;
}
��< =
[
�� 
InverseProperty
�� 
(
�� 
$str
�� $
)
��$ %
]
��% &
public
�� 
ICollection
��	 
<
�� 
EncInformantes
�� #
>
��# $
EncInformantes
��% 3
{
��4 5
get
��6 9
;
��9 :
set
��; >
;
��> ?
}
��@ A
}
�� 
}�� �S
PC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Models\CatTiposPregunta.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Models  &
{ 
[ 
Table 
( 
$str 
) 
] 
public 
class 
CatTiposPregunta 
{ 
public 
static	 
readonly 
string  
StrNombreTabla! /
=0 1
$str2 F
;F G
public 
static	 
readonly 
string  

=/ 0
$str1 E
;E F
public 
enum	 
Fields 
{   
Idctp!! 
,"" 
TipoPregunta"" 
,## 
Descripcion## 
,$$ 
RespuestaValor$$ 
,%% 
ExportarCodigo%% 
,&& 
	Apiestado&& 
,'' 
Apitransaccion'' 
,(( 
Usucre(( 

,)) 
Feccre)) 

,** 
Usumod** 

,++ 
Fecmod++ 

},, 
public00 
CatTiposPregunta00	 
(00 
)00 
{11 
EncPreguntas22 
=22 
new22 
HashSet22 
<22 
EncPreguntas22 *
>22* +
(22+ ,
)22, -
;22- .
TipoPregunta55 
=55 
null55 
;55 
Descripcion66 
=66 
null66 
;66 
RespuestaValor77 
=77 
null77 
;77 
	Apiestado88 
=88
null88 
;88 
Apitransaccion99 
=99 
null99 
;99 
Usucre:: 	
=::
 
null:: 
;:: 
Usumod;; 	
=;;
 
null;; 
;;; 
Fecmod<< 	
=<<
 
null<< 
;<< 
}== 
public?? 
CatTiposPregunta??	 
(?? 
CatTiposPregunta?? *
obj??+ .
)??. /
{@@ 
EncPreguntasAA 
=AA 
newAA 
HashSetAA 
<AA 
EncPreguntasAA *
>AA* +
(AA+ ,
)AA, -
;AA- .
IdctpCC 
=CC	 

objCC 
.CC 
IdctpCC 
;CC 
TipoPreguntaDD 
=DD 
objDD 
.DD 
TipoPreguntaDD "
;DD" #
DescripcionEE 
=EE 
objEE 
.EE 
DescripcionEE  
;EE  !
RespuestaValorFF 
=FF 
objFF 
.FF 
RespuestaValorFF &
;FF& '
ExportarCodigoGG 
=GG 
objGG 
.GG 
ExportarCodigoGG &
;GG& '
	ApiestadoHH 
=HH
objHH 
.HH 
	ApiestadoHH 
;HH 
ApitransaccionII 
=II 
objII 
.II 
ApitransaccionII &
;II& '
UsucreJJ 	
=JJ
 
objJJ 
.JJ 
UsucreJJ 
;JJ 
FeccreKK 	
=KK
 
objKK 
.KK 
FeccreKK 
;KK 
UsumodLL 	
=LL
 
objLL 
.LL 
UsumodLL 
;LL 
FecmodMM 	
=MM
 
objMM 
.MM 
FecmodMM 
;MM 
}NN 
[ZZ 
ColumnZZ 	
(ZZ	 

$strZZ
 
)ZZ 
]ZZ 
[[[ 
Display[[ 

([[
 
Name[[ 
=[[ 
$str[[ 
,[[ 
Description[[ &
=[[' (
$str[[) k
)[[k l
][[l m
[\\ 
Required\\ 
(\\ 
ErrorMessage\\ 
=\\ 
$str\\ 9
)\\9 :
]\\: ;
[]] 
Key]] 
]]] 
public^^ 
long^^	 
Idctp^^ 
{^^ 
get^^ 
;^^ 
set^^ 
;^^ 
}^^  !
[hh 
Columnhh 	
(hh	 

$strhh
 
)hh 
]hh 
[ii 
Displayii 

(ii
 
Nameii 
=ii 
$strii  
,ii  !
Descriptionii" -
=ii. /
$strii0 N
)iiN O
]iiO P
publicjj 
stringjj	 
TipoPreguntajj 
{jj 
getjj "
;jj" #
setjj$ '
;jj' (
}jj) *
[tt 
Columntt 	
(tt	 

$strtt
 
)tt 
]tt 
[uu 
Displayuu 

(uu
 
Nameuu 
=uu 
$struu 
,uu  
Descriptionuu! ,
=uu- .
$struu/ W
)uuW X
]uuX Y
publicvv 
stringvv	 
Descripcionvv 
{vv 
getvv !
;vv! "
setvv# &
;vv& '
}vv( )
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� "
,
��" #
Description
��$ /
=
��0 1
$str��2 �
)��� �
]��� �
public
�� 
string
��	 
RespuestaValor
�� 
{
��  
get
��! $
;
��$ %
set
��& )
;
��) *
}
��+ ,
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� "
,
��" #
Description
��$ /
=
��0 1
$str��2 �
)��� �
]��� �
[
�� 
Required
�� 
(
�� 
ErrorMessage
�� 
=
�� 
$str
�� B
)
��B C
]
��C D
public
�� 
int
��	 
ExportarCodigo
��
{
�� 
get
�� !
;
��! "
set
��# &
;
��& '
}
��( )
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

�� !
=
��! "
$num
��" #
)
��# $
]
��$ %
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� *
=
��+ ,
$str
��- X
)
��X Y
]
��Y Z
public
�� 
string
��	 
	Apiestado
�� 
{
�� 
get
�� 
;
��  
set
��! $
;
��$ %
}
��& '
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

�� !
=
��! "
$num
��" #
)
��# $
]
��$ %
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� "
,
��" #
Description
��$ /
=
��0 1
$str
��2 _
)
��_ `
]
��` a
public
�� 
string
��	 
Apitransaccion
�� 
{
��  
get
��! $
;
��$ %
set
��& )
;
��) *
}
��+ ,
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

�� !
=
��! "
$num
��" #
)
��# $
]
��$ %
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� '
=
��( )
$str
��* _
)
��_ `
]
��` a
public
�� 
string
��	 
Usucre
�� 
{
�� 
get
�� 
;
�� 
set
�� !
;
��! "
}
��# $
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� '
=
��( )
$str
��* J
)
��J K
]
��K L
public
�� 
DateTime
��	 
Feccre
�� 
{
�� 
get
�� 
;
�� 
set
��  #
;
��# $
}
��% &
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
StringLength
�� 
(
�� 
$num
�� 
,
�� 

�� !
=
��! "
$num
��" #
)
��# $
]
��$ %
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� '
=
��( )
$str
��* v
)
��v w
]
��w x
public
�� 
string
��	 
Usumod
�� 
{
�� 
get
�� 
;
�� 
set
�� !
;
��! "
}
��# $
[
�� 
Column
�� 	
(
��	 

$str
��
 
)
�� 
]
�� 
[
�� 
Display
�� 

(
��
 
Name
�� 
=
�� 
$str
�� 
,
�� 
Description
�� '
=
��( )
$str
��* k
)
��k l
]
��l m
public
�� 
DateTime
��	 
?
�� 
Fecmod
�� 
{
�� 
get
�� 
;
��  
set
��! $
;
��$ %
}
��& '
[
�� 
InverseProperty
�� 
(
�� 
$str
�� $
)
��$ %
]
��% &
public
�� 
ICollection
��	 
<
�� 
EncPreguntas
�� !
>
��! "
EncPreguntas
��# /
{
��0 1
get
��2 5
;
��5 6
set
��7 :
;
��: ;
}
��< =
}
�� 
}�� ��
SC:\VSCode\ReAl.Lumino.Encuestas\ReAl.Lumino.Encuestas\Models\db_encuestasContext.cs
	namespace 	
ReAl
 
. 
Lumino 
. 
	Encuestas 
.  
Models  &
{ 
public 

partial 
class 
db_encuestasContext ,
:- .
	DbContext/ 8
{ 
public		 
virtual		 
DbSet		 
<		 
CatDepartamentos		 -
>		- .
CatDepartamentos		/ ?
{		@ A
get		B E
;		E F
set		G J
;		J K
}		L M
public

 
virtual

 
DbSet

 
<

 

CatNiveles

 '
>

' (

CatNiveles

) 3
{

4 5
get

6 9
;

9 :
set

; >
;

> ?
}

@ A
public 
virtual 
DbSet 
< 
CatTiposPregunta -
>- .
CatTiposPregunta/ ?
{@ A
getB E
;E F
setG J
;J K
}L M
public 
virtual 
DbSet 
< 
EncEncuestas )
>) *
EncEncuestas+ 7
{8 9
get: =
;= >
set? B
;B C
}D E
public
virtual
DbSet
<
	EncFlujos
>
	EncFlujos
{
get
;
set
;
}
public 
virtual 
DbSet 
< 
EncInformantes +
>+ ,
EncInformantes- ;
{< =
get> A
;A B
setC F
;F G
}H I
public 
virtual 
DbSet 
< 
EncPreguntas )
>) *
EncPreguntas+ 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
virtual 
DbSet 
< 

>* +

{: ;
get< ?
;? @
setA D
;D E
}F G
public 
virtual 
DbSet 
< 
EncSecciones )
>) *
EncSecciones+ 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
virtual 
DbSet 
< 
OpeBrigadas (
>( )
OpeBrigadas* 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
virtual 
DbSet 
< 
OpeMovimientos +
>+ ,
OpeMovimientos- ;
{< =
get> A
;A B
setC F
;F G
}H I
public 
virtual 
DbSet 
< 
OpeProyectos )
>) *
OpeProyectos+ 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
virtual 
DbSet 
< 
OpeUpms $
>$ %
OpeUpms& -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
virtual 
DbSet 
< 
SegAplicaciones ,
>, -
SegAplicaciones. =
{> ?
get@ C
;C D
setE H
;H I
}J K
public 
virtual 
DbSet 
< 
SegConfiguracion -
>- .
SegConfiguracion/ ?
{@ A
getB E
;E F
setG J
;J K
}L M
public 
virtual 
DbSet 
< 

SegEstados '
>' (

SegEstados) 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
virtual 
DbSet 
< 
	SegGlosas &
>& '
	SegGlosas( 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
virtual 
DbSet 
< 
SegMensajes (
>( )
SegMensajes* 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
virtual 
DbSet 
< 

SegPaginas '
>' (

SegPaginas) 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
virtual 
DbSet 
< 
SegRoles %
>% &
SegRoles' /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
virtual 
DbSet 
< 
SegRolesPagina +
>+ ,
SegRolesPagina- ;
{< =
get> A
;A B
setC F
;F G
}H I
public 
virtual 
DbSet 
< $
SegRolesTablaTransaccion 5
>5 6$
SegRolesTablaTransaccion7 O
{P Q
getR U
;U V
setW Z
;Z [
}\ ]
public 
virtual 
DbSet 
< 
	SegTablas &
>& '
	SegTablas( 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public   
virtual   
DbSet   
<   
SegTransacciones   -
>  - .
SegTransacciones  / ?
{  @ A
get  B E
;  E F
set  G J
;  J K
}  L M
public!! 
virtual!! 
DbSet!! 
<!! 
SegTransiciones!! ,
>!!, -
SegTransiciones!!. =
{!!> ?
get!!@ C
;!!C D
set!!E H
;!!H I
}!!J K
public"" 
virtual"" 
DbSet"" 
<"" 
SegUsuarios"" (
>""( )
SegUsuarios""* 5
{""6 7
get""8 ;
;""; <
set""= @
;""@ A
}""B C
public## 
virtual## 
DbSet## 
<## "
SegUsuariosRestriccion## 3
>##3 4"
SegUsuariosRestriccion##5 K
{##L M
get##N Q
;##Q R
set##S V
;##V W
}##X Y
	protected%% 
override%% 
void%% 

(%%- .#
DbContextOptionsBuilder%%. E
optionsBuilder%%F T
)%%T U
{&& 	
if'' 
('' 
!'' 
optionsBuilder'' 
.''  
IsConfigured''  ,
)'', -
{(( 
optionsBuilder** 
.** 
	UseNpgsql** (
(**( )
$str**) t
)**t u
;**u v
}++ 
optionsBuilder,, 
.,, &
EnableSensitiveDataLogging,, 5
(,,5 6
),,6 7
;,,7 8
}-- 	
	protected// 
override// 
void// 
OnModelCreating//  /
(/// 0
ModelBuilder//0 <
modelBuilder//= I
)//I J
{00 	
modelBuilder11 
.11 
Entity11 
<11  
CatDepartamentos11  0
>110 1
(111 2
entity112 8
=>119 ;
{22 
entity33 
.33 
ForNpgsqlHasComment33 *
(33* +
$str33+ b
)33b c
;33c d
entity55 
.55 
Property55 
(55  
e55  !
=>55" $
e55% &
.55& '
Idcde55' ,
)55, -
.66 
HasDefaultValueSql66 '
(66' (
$str66( Y
)66Y Z
.77 
ForNpgsqlHasComment77 (
(77( )
$str77) \
)77\ ]
;77] ^
entity99 
.99 
Property99 
(99  
e99  !
=>99" $
e99% &
.99& '
Abreviatura99' 2
)992 3
.993 4
ForNpgsqlHasComment994 G
(99G H
$str99H f
)99f g
;99g h
entity;; 
.;; 
Property;; 
(;;  
e;;  !
=>;;" $
e;;% &
.;;& '
	Apiestado;;' 0
);;0 1
.<< 
HasDefaultValueSql<< '
(<<' (
$str<<( H
)<<H I
.== 
ForNpgsqlHasComment== (
(==( )
$str==) T
)==T U
;==U V
entity?? 
.?? 
Property?? 
(??  
e??  !
=>??" $
e??% &
.??& '
Apitransaccion??' 5
)??5 6
.@@ 
HasDefaultValueSql@@ '
(@@' (
$str@@( D
)@@D E
.AA 
ForNpgsqlHasCommentAA (
(AA( )
$strAA) V
)AAV W
;AAW X
entityCC 
.CC 
PropertyCC 
(CC  
eCC  !
=>CC" $
eCC% &
.CC& '
CodigoCC' -
)CC- .
.CC. /
ForNpgsqlHasCommentCC/ B
(CCB C
$strCCC [
)CC[ \
;CC\ ]
entityEE 
.EE 
PropertyEE 
(EE  
eEE  !
=>EE" $
eEE% &
.EE& '
FeccreEE' -
)EE- .
.FF 
HasDefaultValueSqlFF '
(FF' (
$strFF( /
)FF/ 0
.GG 
ForNpgsqlHasCommentGG (
(GG( )
$strGG) I
)GGI J
;GGJ K
entityII 
.II 
PropertyII 
(II  
eII  !
=>II" $
eII% &
.II& '
FecmodII' -
)II- .
.II. /
ForNpgsqlHasCommentII/ B
(IIB C
$str	IIC �
)
II� �
;
II� �
entityKK 
.KK 
PropertyKK 
(KK  
eKK  !
=>KK" $
eKK% &
.KK& '
LatitudKK' .
)KK. /
.KK/ 0
ForNpgsqlHasCommentKK0 C
(KKC D
$strKKD z
)KKz {
;KK{ |
entityMM 
.MM 
PropertyMM 
(MM  
eMM  !
=>MM" $
eMM% &
.MM& '
LongitudMM' /
)MM/ 0
.MM0 1
ForNpgsqlHasCommentMM1 D
(MMD E
$strMME |
)MM| }
;MM} ~
entityOO 
.OO 
PropertyOO 
(OO  
eOO  !
=>OO" $
eOO% &
.OO& '
NombreOO' -
)OO- .
.OO. /
ForNpgsqlHasCommentOO/ B
(OOB C
$strOOC \
)OO\ ]
;OO] ^
entityQQ 
.QQ 
PropertyQQ 
(QQ  
eQQ  !
=>QQ" $
eQQ% &
.QQ& '
UsucreQQ' -
)QQ- .
.RR 
HasDefaultValueSqlRR '
(RR' (
$strRR( <
)RR< =
.SS 
ForNpgsqlHasCommentSS (
(SS( )
$strSS) ^
)SS^ _
;SS_ `
entityUU 
.UU 
PropertyUU 
(UU  
eUU  !
=>UU" $
eUU% &
.UU& '
UsumodUU' -
)UU- .
.UU. /
ForNpgsqlHasCommentUU/ B
(UUB C
$str	UUC �
)
UU� �
;
UU� �
}VV 
)VV
;VV 
modelBuilderXX 
.XX 
EntityXX 
<XX  

CatNivelesXX  *
>XX* +
(XX+ ,
entityXX, 2
=>XX3 5
{YY 
entityZZ 
.ZZ 
ForNpgsqlHasCommentZZ *
(ZZ* +
$strZZ+ W
)ZZW X
;ZZX Y
entity\\ 
.\\ 
Property\\ 
(\\  
e\\  !
=>\\" $
e\\% &
.\\& '
Idcnv\\' ,
)\\, -
.]] 
HasDefaultValueSql]] '
(]]' (
$str]]( Y
)]]Y Z
.^^ 
ForNpgsqlHasComment^^ (
(^^( )
$str^^) k
)^^k l
;^^l m
entity`` 
.`` 
Property`` 
(``  
e``  !
=>``" $
e``% &
.``& '
	Apiestado``' 0
)``0 1
.aa 
HasDefaultValueSqlaa '
(aa' (
$straa( H
)aaH I
.bb 
ForNpgsqlHasCommentbb (
(bb( )
$strbb) T
)bbT U
;bbU V
entitydd 
.dd 
Propertydd 
(dd  
edd  !
=>dd" $
edd% &
.dd& '
Apitransacciondd' 5
)dd5 6
.ee 
HasDefaultValueSqlee '
(ee' (
$stree( D
)eeD E
.ff 
ForNpgsqlHasCommentff (
(ff( )
$strff) V
)ffV W
;ffW X
entityhh 
.hh 
Propertyhh 
(hh  
ehh  !
=>hh" $
ehh% &
.hh& '
Descripcionhh' 2
)hh2 3
.hh3 4
ForNpgsqlHasCommenthh4 G
(hhG H
$strhhH e
)hhe f
;hhf g
entityjj 
.jj 
Propertyjj 
(jj  
ejj  !
=>jj" $
ejj% &
.jj& '
Feccrejj' -
)jj- .
.kk 
HasDefaultValueSqlkk '
(kk' (
$strkk( /
)kk/ 0
.ll 
ForNpgsqlHasCommentll (
(ll( )
$strll) I
)llI J
;llJ K
entitynn 
.nn 
Propertynn 
(nn  
enn  !
=>nn" $
enn% &
.nn& '
Fecmodnn' -
)nn- .
.nn. /
ForNpgsqlHasCommentnn/ B
(nnB C
$str	nnC �
)
nn� �
;
nn� �
entitypp 
.pp 
Propertypp 
(pp  
epp  !
=>pp" $
epp% &
.pp& '
Nivelpp' ,
)pp, -
.pp- .
ForNpgsqlHasCommentpp. A
(ppA B
$strppB Y
)ppY Z
;ppZ [
entityrr 
.rr 
Propertyrr 
(rr  
err  !
=>rr" $
err% &
.rr& '
Usucrerr' -
)rr- .
.ss 
HasDefaultValueSqlss '
(ss' (
$strss( <
)ss< =
.tt 
ForNpgsqlHasCommenttt (
(tt( )
$strtt) ^
)tt^ _
;tt_ `
entityvv 
.vv 
Propertyvv 
(vv  
evv  !
=>vv" $
evv% &
.vv& '
Usumodvv' -
)vv- .
.vv. /
ForNpgsqlHasCommentvv/ B
(vvB C
$str	vvC �
)
vv� �
;
vv� �
}ww 
)ww
;ww 
modelBuilderyy 
.yy 
Entityyy 
<yy  
CatTiposPreguntayy  0
>yy0 1
(yy1 2
entityyy2 8
=>yy9 ;
{zz 
entity{{ 
.{{ 
ForNpgsqlHasComment{{ *
({{* +
$str{{+ W
){{W X
;{{X Y
entity}} 
.}} 
Property}} 
(}}  
e}}  !
=>}}" $
e}}% &
.}}& '
Idctp}}' ,
)}}, -
.~~ 
HasDefaultValueSql~~ '
(~~' (
$str~~( Y
)~~Y Z
. 
ForNpgsqlHasComment (
(( )
$str) k
)k l
;l m
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Apiestado
��' 0
)
��0 1
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( H
)
��H I
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) T
)
��T U
;
��U V
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Apitransaccion
��' 5
)
��5 6
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( D
)
��D E
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) V
)
��V W
;
��W X
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Descripcion
��' 2
)
��2 3
.
��3 4!
ForNpgsqlHasComment
��4 G
(
��G H
$str
��H p
)
��p q
;
��q r
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
ExportarCodigo
��' 5
)
��5 6
.
��6 7 
HasDefaultValueSql
��7 I
(
��I J
$str
��J M
)
��M N
;
��N O
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Feccre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( /
)
��/ 0
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) I
)
��I J
;
��J K
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Fecmod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
RespuestaValor
��' 5
)
��5 6
.
��6 7!
ForNpgsqlHasComment
��7 J
(
��J K
$str��K �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
TipoPregunta
��' 3
)
��3 4
.
��4 5!
ForNpgsqlHasComment
��5 H
(
��H I
$str
��I g
)
��g h
;
��h i
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usucre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( <
)
��< =
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) ^
)
��^ _
;
��_ `
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usumod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
}
�� 
)
��
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
<
��  
EncEncuestas
��  ,
>
��, -
(
��- .
entity
��. 4
=>
��5 7
{
�� 
entity
�� 
.
�� !
ForNpgsqlHasComment
�� *
(
��* +
$str
��+ Z
)
��Z [
;
��[ \
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idenc
��' ,
)
��, -
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( Y
)
��Y Z
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) e
)
��e f
;
��f g
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Apiestado
��' 0
)
��0 1
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( H
)
��H I
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) T
)
��T U
;
��U V
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Apitransaccion
��' 5
)
��5 6
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( D
)
��D E
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) V
)
��V W
;
��W X
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
CodigoRespuesta
��' 6
)
��6 7
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( 2
)
��2 3
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) p
)
��p q
;
��q r
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Feccre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( /
)
��/ 0
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) I
)
��I J
;
��J K
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Fecmod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Fila
��' +
)
��+ ,
.
��, - 
HasDefaultValueSql
��- ?
(
��? @
$str
��@ C
)
��C D
;
��D E
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
IdLast
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( .
)
��. /
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) X
)
��X Y
;
��Y Z
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idein
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B x
)
��x y
;
��y z
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
IdencTab
��' /
)
��/ 0
.
��0 1!
ForNpgsqlHasComment
��1 D
(
��D E
$str��E �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idepr
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B v
)
��v w
;
��w x
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idere
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B w
)
��w x
;
��x y
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idomv
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B x
)
��x y
;
��y z
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Latitud
��' .
)
��. /
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( +
)
��+ ,
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) _
)
��_ `
;
��` a
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Longitud
��' /
)
��/ 0
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( +
)
��+ ,
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) `
)
��` a
;
��a b
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Observacion
��' 2
)
��2 3
.
��3 4!
ForNpgsqlHasComment
��4 G
(
��G H
$str��H �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Respuesta
��' 0
)
��0 1
.
��1 2!
ForNpgsqlHasComment
��2 E
(
��E F
$str
��F m
)
��m n
;
��n o
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usucre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( <
)
��< =
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) ^
)
��^ _
;
��_ `
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usumod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdeinNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
EncEncuestas
��% 1
)
��1 2
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idein
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdeprNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
EncEncuestas
��% 1
)
��1 2
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idepr
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdomvNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
EncEncuestas
��% 1
)
��1 2
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idomv
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
}
�� 
)
��
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
<
��  
	EncFlujos
��  )
>
��) *
(
��* +
entity
��+ 1
=>
��2 4
{
�� 
entity
�� 
.
�� !
ForNpgsqlHasComment
�� *
(
��* +
$str��+ �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idefl
��' ,
)
��, -
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( Y
)
��Y Z
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) e
)
��e f
;
��f g
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Apiestado
��' 0
)
��0 1
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( H
)
��H I
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) T
)
��T U
;
��U V
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Apitransaccion
��' 5
)
��5 6
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( D
)
��D E
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) V
)
��V W
;
��W X
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Feccre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( /
)
��/ 0
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) I
)
��I J
;
��J K
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Fecmod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idepr
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B e
)
��e f
;
��f g
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
IdeprDestino
��' 3
)
��3 4
.
��4 5!
ForNpgsqlHasComment
��5 H
(
��H I
$str��I �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idopy
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B {
)
��{ |
;
��| }
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Orden
��' ,
)
��, -
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( +
)
��+ ,
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) d
)
��d e
;
��e f
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Regla
��' ,
)
��, -
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( 2
)
��2 3
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) m
)
��m n
;
��n o
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Rpn
��' *
)
��* +
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( 2
)
��2 3
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str��) �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usucre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( <
)
��< =
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) ^
)
��^ _
;
��_ `
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usumod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdeprNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
	EncFlujos
��% .
)
��. /
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idepr
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdopyNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
	EncFlujos
��% .
)
��. /
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idopy
��* /
)
��/ 0
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
}
�� 
)
��
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
<
��  
EncInformantes
��  .
>
��. /
(
��/ 0
entity
��0 6
=>
��7 9
{
�� 
entity
�� 
.
�� !
ForNpgsqlHasComment
�� *
(
��* +
$str
��+ S
)
��S T
;
��T U
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idein
��' ,
)
��, -
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( Y
)
��Y Z
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) e
)
��e f
;
��f g
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Apiestado
��' 0
)
��0 1
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( H
)
��H I
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) T
)
��T U
;
��U V
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Apitransaccion
��' 5
)
��5 6
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( D
)
��D E
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) V
)
��V W
;
��W X
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Codigo
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str
��C Z
)
��Z [
;
��[ \
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Descripcion
��' 2
)
��2 3
.
��3 4!
ForNpgsqlHasComment
��4 G
(
��G H
$str
��H d
)
��d e
;
��e f
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Feccre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( /
)
��/ 0
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) I
)
��I J
;
��J K
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Fecmod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idcnv
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B s
)
��s t
;
��t u
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '

IdeinPadre
��' 1
)
��1 2
.
��2 3!
ForNpgsqlHasComment
��3 F
(
��F G
$str��G �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
IdeinTab
��' /
)
��/ 0
.
��0 1!
ForNpgsqlHasComment
��1 D
(
��D E
$str��E �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '

��' 4
)
��4 5
.
��5 6!
ForNpgsqlHasComment
��6 I
(
��I J
$str��J �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idomv
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B x
)
��x y
;
��y z
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idoup
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str��B �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Latitud
��' .
)
��. /
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( +
)
��+ ,
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) _
)
��_ `
;
��` a
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Longitud
��' /
)
��/ 0
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( +
)
��+ ,
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) `
)
��` a
;
��a b
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usucre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( <
)
��< =
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) ^
)
��^ _
;
��_ `
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usumod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdcnvNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
EncInformantes
��% 3
)
��3 4
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idcnv
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdomvNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
EncInformantes
��% 3
)
��3 4
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idomv
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
}
�� 
)
��
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
<
��  
EncPreguntas
��  ,
>
��, -
(
��- .
entity
��. 4
=>
��5 7
{
�� 
entity
�� 
.
�� 
HasIndex
�� 
(
��  
e
��  !
=>
��" $
new
��% (
{
��) *
e
��+ ,
.
��, -
Idopy
��- 2
,
��2 3
e
��4 5
.
��5 6
Codigo
��6 <
}
��= >
)
��> ?
.
�� 
HasName
�� 
(
�� 
$str
�� ,
)
��, -
.
�� 
IsUnique
�� 
(
�� 
)
�� 
;
��  
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idepr
��' ,
)
��, -
.
��- . 
HasDefaultValueSql
��. @
(
��@ A
$str
��A r
)
��r s
;
��s t
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Apiestado
��' 0
)
��0 1
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( H
)
��H I
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) T
)
��T U
;
��U V
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Apitransaccion
��' 5
)
��5 6
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( D
)
��D E
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) V
)
��V W
;
��W X
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Ayuda
��' ,
)
��, -
.
��- . 
HasDefaultValueSql
��. @
(
��@ A
$str
��A M
)
��M N
;
��N O
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Bucle
��' ,
)
��, -
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( +
)
��+ ,
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) b
)
��b c
;
��c d
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Catalogo
��' /
)
��/ 0
.
��0 1 
HasDefaultValueSql
��1 C
(
��C D
$str
��D ]
)
��] ^
;
��^ _
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
CodigoEspecial
��' 5
)
��5 6
.
��6 7 
HasDefaultValueSql
��7 I
(
��I J
$str
��J M
)
��M N
;
��N O
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
CodigoEspecifique
��' 8
)
��8 9
.
��9 : 
HasDefaultValueSql
��: L
(
��L M
$str
��M P
)
��P Q
;
��Q R
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Feccre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( /
)
��/ 0
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) I
)
��I J
;
��J K
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Fecmod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Formula
��' .
)
��. /
.
��/ 0 
HasDefaultValueSql
��0 B
(
��B C
$str
��C M
)
��M N
;
��N O
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Instruccion
��' 2
)
��2 3
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( 2
)
��2 3
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) \
)
��\ ]
;
��] ^
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Maximo
��' -
)
��- .
.
��. / 
HasDefaultValueSql
��/ A
(
��A B
$str
��B E
)
��E F
;
��F G
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Mensaje
��' .
)
��. /
.
��/ 0 
HasDefaultValueSql
��0 B
(
��B C
$str
��C M
)
��M N
;
��N O
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Minimo
��' -
)
��- .
.
��. / 
HasDefaultValueSql
��/ A
(
��A B
$str
��B E
)
��E F
;
��F G
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
MostrarVentana
��' 5
)
��5 6
.
��6 7 
HasDefaultValueSql
��7 I
(
��I J
$str
��J M
)
��M N
;
��N O
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Regla
��' ,
)
��, -
.
��- . 
HasDefaultValueSql
��. @
(
��@ A
$str
��A K
)
��K L
;
��L M
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Revision
��' /
)
��/ 0
.
��0 1 
HasDefaultValueSql
��1 C
(
��C D
$str
��D N
)
��N O
;
��O P
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Rpn
��' *
)
��* +
.
��+ , 
HasDefaultValueSql
��, >
(
��> ?
$str
��? I
)
��I J
;
��J K
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '

RpnFormula
��' 1
)
��1 2
.
��2 3 
HasDefaultValueSql
��3 E
(
��E F
$str
��F P
)
��P Q
;
��Q R
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usucre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( <
)
��< =
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) ^
)
��^ _
;
��_ `
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usumod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Variable
��' /
)
��/ 0
.
��0 1 
HasDefaultValueSql
��1 C
(
��C D
$str
��D N
)
��N O
;
��O P
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '

��' 4
)
��4 5
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( ?
)
��? @
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str��) �
)��� �
;��� �
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdcnvNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
EncPreguntas
��% 1
)
��1 2
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idcnv
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdctpNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
EncPreguntas
��% 1
)
��1 2
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idctp
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdeseNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
EncPreguntas
��% 1
)
��1 2
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idese
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdopyNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
EncPreguntas
��% 1
)
��1 2
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idopy
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
}
�� 
)
��
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
<
��  

��  -
>
��- .
(
��. /
entity
��/ 5
=>
��6 8
{
�� 
entity
�� 
.
�� !
ForNpgsqlHasComment
�� *
(
��* +
$str
��+ r
)
��r s
;
��s t
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idere
��' ,
)
��, -
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( Y
)
��Y Z
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) e
)
��e f
;
��f g
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Apiestado
��' 0
)
��0 1
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( H
)
��H I
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) T
)
��T U
;
��U V
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Apitransaccion
��' 5
)
��5 6
.
��6 7 
HasDefaultValueSql
��7 I
(
��I J
$str
��J f
)
��f g
;
��g h
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Codigo
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str
��C [
)
��[ \
;
��\ ]
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Feccre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( /
)
��/ 0
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) I
)
��I J
;
��J K
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Fecmod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idepr
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str��B �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Respuesta
��' 0
)
��0 1
.
��1 2!
ForNpgsqlHasComment
��2 E
(
��E F
$str
��F ]
)
��] ^
;
��^ _
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usucre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( <
)
��< =
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) ^
)
��^ _
;
��_ `
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usumod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdeprNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %

��% 2
)
��2 3
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idepr
��* /
)
��/ 0
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
}
�� 
)
��
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
<
��  
EncSecciones
��  ,
>
��, -
(
��- .
entity
��. 4
=>
��5 7
{
�� 
entity
�� 
.
�� !
ForNpgsqlHasComment
�� *
(
��* +
$str
��+ g
)
��g h
;
��h i
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idese
��' ,
)
��, -
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( Y
)
��Y Z
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) c
)
��c d
;
��d e
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Abierta
��' .
)
��. /
.
��/ 0 
HasDefaultValueSql
��0 B
(
��B C
$str
��C F
)
��F G
;
��G H
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Apiestado
��' 0
)
��0 1
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( H
)
��H I
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) l
)
��l m
;
��m n
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Apitransaccion
��' 5
)
��5 6
.
��6 7 
HasDefaultValueSql
��7 I
(
��I J
$str
��J f
)
��f g
;
��g h
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Codigo
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str
��C V
)
��V W
;
��W X
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Feccre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( /
)
��/ 0
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) c
)
��c d
;
��d e
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Fecmod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idcnv
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B x
)
��x y
;
��y z
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idopy
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B {
)
��{ |
;
��| }
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Seccion
��' .
)
��. /
.
��/ 0!
ForNpgsqlHasComment
��0 C
(
��C D
$str
��D _
)
��_ `
;
��` a
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usucre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( <
)
��< =
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) b
)
��b c
;
��c d
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usumod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str
��C }
)
��} ~
;
��~ 
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdcnvNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
EncSecciones
��% 1
)
��1 2
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idcnv
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdopyNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
EncSecciones
��% 1
)
��1 2
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idopy
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
}
�� 
)
��
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
<
��  
OpeBrigadas
��  +
>
��+ ,
(
��, -
entity
��- 3
=>
��4 6
{
�� 
entity
�� 
.
�� !
ForNpgsqlHasComment
�� *
(
��* +
$str
��+ b
)
��b c
;
��c d
entity
�� 
.
�� 
HasIndex
�� 
(
��  
e
��  !
=>
��" $
new
��% (
{
��) *
e
��+ ,
.
��, -
Idopy
��- 2
,
��2 3
e
��4 5
.
��5 6
Codigo
��6 <
}
��= >
)
��> ?
.
�� 
HasName
�� 
(
�� 
$str
�� ,
)
��, -
.
�� 
IsUnique
�� 
(
�� 
)
�� 
;
��  
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idobr
��' ,
)
��, -
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( Y
)
��Y Z
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) k
)
��k l
;
��l m
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Apiestado
��' 0
)
��0 1
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( H
)
��H I
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) T
)
��T U
;
��U V
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Apitransaccion
��' 5
)
��5 6
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( D
)
��D E
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) V
)
��V W
;
��W X
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Codigo
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str
��C g
)
��g h
;
��h i
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Feccre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( /
)
��/ 0
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) I
)
��I J
;
��J K
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Fecmod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idcde
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str��B �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idopy
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str��B �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usucre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( <
)
��< =
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) ^
)
��^ _
;
��_ `
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usumod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdcdeNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
OpeBrigadas
��% 0
)
��0 1
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idcde
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdopyNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
OpeBrigadas
��% 0
)
��0 1
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idopy
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
}
�� 
)
��
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
<
��  
OpeMovimientos
��  .
>
��. /
(
��/ 0
entity
��0 6
=>
��7 9
{
�� 
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idomv
��' ,
)
��, -
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( Y
)
��Y Z
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) k
)
��k l
;
��l m
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Apiestado
��' 0
)
��0 1
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( H
)
��H I
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) T
)
��T U
;
��U V
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Apitransaccion
��' 5
)
��5 6
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( D
)
��D E
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) V
)
��V W
;
��W X
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Feccre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( /
)
��/ 0
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) I
)
��I J
;
��J K
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Fecmod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idoup
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B q
)
��q r
;
��r s
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idsus
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B x
)
��x y
;
��y z
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usucre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( <
)
��< =
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) ^
)
��^ _
;
��_ `
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usumod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdoupNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
OpeMovimientos
��% 3
)
��3 4
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idoup
��* /
)
��/ 0
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdsusNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
OpeMovimientos
��% 3
)
��3 4
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idsus
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
}
�� 
)
��
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
<
��  
OpeProyectos
��  ,
>
��, -
(
��- .
entity
��. 4
=>
��5 7
{
�� 
entity
�� 
.
�� !
ForNpgsqlHasComment
�� *
(
��* +
$str
��+ R
)
��R S
;
��S T
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idopy
��' ,
)
��, -
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( Y
)
��Y Z
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) W
)
��W X
;
��X Y
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Apiestado
��' 0
)
��0 1
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( H
)
��H I
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) p
)
��p q
;
��q r
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Apitransaccion
��' 5
)
��5 6
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( D
)
��D E
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) V
)
��V W
;
��W X
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Codigo
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Descripcion
��' 2
)
��2 3
.
��3 4!
ForNpgsqlHasComment
��4 G
(
��G H
$str
��H b
)
��b c
;
��c d
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Feccre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( /
)
��/ 0
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) I
)
��I J
;
��J K
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Fecfin
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str
��C j
)
��j k
;
��k l
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Fecinicio
��' 0
)
��0 1
.
��1 2!
ForNpgsqlHasComment
��2 E
(
��E F
$str
��F k
)
��k l
;
��l m
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Fecmod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Nombre
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str
��C X
)
��X Y
;
��Y Z
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usucre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( <
)
��< =
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) ^
)
��^ _
;
��_ `
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usumod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
}
�� 
)
��
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
<
��  
OpeUpms
��  '
>
��' (
(
��( )
entity
��) /
=>
��0 2
{
�� 
entity
�� 
.
�� !
ForNpgsqlHasComment
�� *
(
��* +
$str
��+ W
)
��W X
;
��X Y
entity
�� 
.
�� 
HasIndex
�� 
(
��  
e
��  !
=>
��" $
new
��% (
{
��) *
e
��+ ,
.
��, -
Idopy
��- 2
,
��2 3
e
��4 5
.
��5 6
Idcde
��6 ;
,
��; <
e
��= >
.
��> ?
Codigo
��? E
}
��F G
)
��G H
.
�� 
HasName
�� 
(
�� 
$str
�� 4
)
��4 5
.
�� 
IsUnique
�� 
(
�� 
)
�� 
;
��  
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idoup
��' ,
)
��, -
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( Y
)
��Y Z
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) k
)
��k l
;
��l m
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Apiestado
��' 0
)
��0 1
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( H
)
��H I
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) T
)
��T U
;
��U V
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Apitransaccion
��' 5
)
��5 6
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( D
)
��D E
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) V
)
��V W
;
��W X
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Codigo
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str
��C m
)
��m n
;
��n o
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Feccre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( /
)
��/ 0
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) I
)
��I J
;
��J K
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Fecinicio
��' 0
)
��0 1
.
��1 2!
ForNpgsqlHasComment
��2 E
(
��E F
$str
��F k
)
��k l
;
��l m
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Fecmod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idcde
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B z
)
��z {
;
��{ |
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idopy
��' ,
)
��, -
.
��- .!
ForNpgsqlHasComment
��. A
(
��A B
$str
��B v
)
��v w
;
��w x
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Latitud
��' .
)
��. /
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( +
)
��+ ,
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) _
)
��_ `
;
��` a
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Longitud
��' /
)
��/ 0
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( +
)
��+ ,
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) `
)
��` a
;
��a b
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Nombre
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str
��C m
)
��m n
;
��n o
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usucre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( <
)
��< =
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) ^
)
��^ _
;
��_ `
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Usumod
��' -
)
��- .
.
��. /!
ForNpgsqlHasComment
��/ B
(
��B C
$str��C �
)��� �
;��� �
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdcdeNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
OpeUpms
��% ,
)
��, -
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idcde
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
entity
�� 
.
�� 
HasOne
�� 
(
�� 
d
�� 
=>
��  "
d
��# $
.
��$ %
IdopyNavigation
��% 4
)
��4 5
.
�� 
WithMany
�� 
(
�� 
p
�� 
=>
��  "
p
��# $
.
��$ %
OpeUpms
��% ,
)
��, -
.
�� 

�� "
(
��" #
d
��# $
=>
��% '
d
��( )
.
��) *
Idopy
��* /
)
��/ 0
.
�� 
OnDelete
�� 
(
�� 
DeleteBehavior
�� ,
.
��, -

��- :
)
��: ;
.
�� 
HasConstraintName
�� &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
}
�� 
)
��
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
<
��  
SegAplicaciones
��  /
>
��/ 0
(
��0 1
entity
��1 7
=>
��8 :
{
�� 
entity
�� 
.
�� !
ForNpgsqlHasComment
�� *
(
��* +
$str
��+ @
)
��@ A
;
��A B
entity
�� 
.
�� 
HasIndex
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Sigla
��' ,
)
��, -
.
�� 
HasName
�� 
(
�� 
$str
�� +
)
��+ ,
.
�� 
IsUnique
�� 
(
�� 
)
�� 
;
��  
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Idsap
��' ,
)
��, -
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( J
)
��J K
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) M
)
��M N
;
��N O
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
	Apiestado
��' 0
)
��0 1
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( H
)
��H I
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) E
)
��E F
;
��F G
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Apitransaccion
��' 5
)
��5 6
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( D
)
��D E
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) V
)
��V W
;
��W X
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Descripcion
��' 2
)
��2 3
.
��3 4!
ForNpgsqlHasComment
��4 G
(
��G H
$str
��H c
)
��c d
;
��d e
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Feccre
��' -
)
��- .
.
��  
HasDefaultValueSql
�� '
(
��' (
$str
��( /
)
��/ 0
.
�� !
ForNpgsqlHasComment
�� (
(
��( )
$str
��) Q
)
��Q R
;
��R S
entity
�� 
.
�� 
Property
�� 
(
��  
e
��  !
=>
��" $