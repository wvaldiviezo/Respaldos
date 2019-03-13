------------------------------------------------------------------------------------------------
-------- Solicitud 144494 
-------- W. Valdiviezo    2018/12/11
-------- Script original: direcciones_sol_144494.sql
------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
--- Consulta e Inserción de los cheques en una tabla temporal sol_136476
--- protestados en el rango de fechas solicitado
-------------------------------------------------------------------------------------------------------

use cob_tempotra
go

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'sol_144494' AND type = 'U')
DROP TABLE sol_144494
GO

create table sol_144494 (en_ced_ruc char(18) null, di_descripcion char(100) null, di_principal char(100) null, di_numero char(10) null, di_transversal char(100) null, di_fecha_modificacion char(15) null, di_direccion int null)
 insert into sol_144494

select en_ced_ruc, di_descripcion, di_principal, di_numero, di_transversal, di_fecha_modificacion, di_direccion
from cobis..cl_ente a, cobis..cl_direccion b
where b.di_tipo = 'D'
and a.en_ente = b.di_ente
and a.en_ced_ruc  in (
'891752814001',
'891749147001',
'860013300001',
'891730365001',
'891733348001',
'891711956001',
'891756887001',
'891736819001',
'891738382001',
'891746032001',
'891754248001',
'891754949001',
'891703775001',
'891747268001',
'1091744852001',
'1091709747001',
'1091739735001',
'1091730088001',
'1091757148001',
'1091754092001',
'1091712969001',
'1091726471001',
'491504684001',
'1091725769001',
'1091736787001',
'1792099331001',
'891731566001',
'860044450001',
'860000160001',
'860004900001',
'891736681001',
'891746016001',
'1091760300001',
'1091754688001',
'1091717626001',
'1091718533001',
'1091730665001',
'1090104655001',
'1091736558001',
'1091757660001',
'1091760459001',
'1091735020001',
'1091735497001',
'1091758136001',
'1091735519001',
'1060003600001',
'1091736264001',
'1060025920001',
'1091743414001',
'1091742299001',
'1091748742001',
'1091704702001',
'1091758098001',
'1091761110001',
'1091757687001',
'1792606101001',
'1091750682001',
'1091755757001',
'1091762974001',
'1792639735001',
'1792712378001',
'2191739127001',
'2191708116001',
'2160058560001',
'2191741776001',
'1792612667001',
'2160071070001',
'2191711400001',
'2191700301001',
'2191706253001',
'2191738996001',
'2191736551001',
'1792742013001',
'2191723956001',
'2191725940001',
'2191726076001',
'2191727889001',
'2191728621001',
'2191722720001',
'2191723441001',
'2160059880001',
'2191728761001',
'2191722550001',
'2191732246001',
'2191738589001',
'2191738759001',
'891733070001',
'860004660001',
'2191742594001',
'2191742314001',
'2191703726001',
'1792077338001',
'2191737841001',
'1091754068001',
'891730101001',
'1091756648001',
'1091755242001',
'1091757539001',
'1091733737001',
'1091706934001',
'1091708767001',
'1091752553001',
'1091700634001',
'1091737686001',
'1060038150001',
'1091721135001',
'1091717650001',
'1091739204001',
'490009124001',
'1091700715001',
'1091708384001',
'1091742833001',
'1091755412001',
'1091755447001',
'491515368001',
'2191742918001',
'2191735830001',
'2191738767001',
'2191743663001',
'891758480001',
'891747462001',
'491517417001',
'1091729349001',
'491517824001',
'491509864001',
'1060031730001',
'1091738801001',
'491521066001',
'491513721001',
'491513187001',
'460035270001',
'491505850001',
'460036160001',
'1792446023001',
'891749643001',
'891757824001',
'891756933001',
'891735030001',
'1091737406001',
'891711468001',
'1791946308001',
'1792671043001',
'1060037340001',
'891719671001',
'1792076307001',
'891758596001',
'891727852001',
'2191741520001',
'2191715155001',
'1792099951001',
'2191742691001',
'2191701413001',
'2191717921001',
'2191726416001',
'2191715929001',
'2191717271001',
'2191710900001',
'2191713462001',
'2191722879001',
'2191720973001',
'2191728893001',
'2191731592001',
'2191742756001',
'2191734656001',
'2191741679001',
'2160071580001',
'491521228001',
'491521252001',
'491521236001',
'491521007001',
'491520922001',
'491516313001',
'491521627001',
'491517190001',
'491519339001',
'491521279001',
'491510781001',
'491521171001',
'491511346001',
'491520884001',
'2190003712001',
'491511648001',
'491520957001',
'2191724855001',
'491505273001',
'491512962001',
'491520213001',
'491521147001',
'460035350001',
'1792503183001',
'491515694001',
'491520787001',
'491516666001',
'491520825001',
'491521120001',
'491516925001',
'491521201001',
'491520779001',
'491521139001',
'491521155001',
'491521392001',
'491521163001',
'491521287001',
'491521465001',
'491520531001',
'491521767001',
'491521791001',
'491517956001',
'491518111001',
'1560508650001',
'1792237602001',
'1591707759001',
'1591708097001',
'1791285700001',
'1792553911001',
'1591717029001',
'1792725828001',
'1768086400001',
'1791715829001',
'1791995961001',
'1792743265001',
'1792673097001',
'1790532917001',
'1792376998001',
'1792448514001',
'1792521009001',
'1091722565001',
'1792064619001',
'1791328019001',
'1792494028001',
'1792272084001',
'1792541182001',
'1792601428001',
'2290321894001',
'1591706620001',
'1591707260001',
'1591709123001',
'1591702684001',
'1792375274001',
'1590019409001',
'1591709115001',
'1560513810001',
'1591710636001',
'1591702633001',
'1560513730001',
'1591712426001',
'1591713031001',
'1768177390001',
'2290330567001',
'2290330435001',
'1792261619001',
'1792208394001',
'1792690773001',
'2290320863001',
'1791975456001',
'2260013280001',
'2260013600001',
'2290323943001',
'2290312356001',
'2290332551001',
'2290317404001',
'2290313913001',
'2260007470001',
'2290326942001',
'2290313271001',
'2290311406001',
'1792188857001',
'2290330826001',
'2190002953001',
'2260016110001',
'2191704536001',
'2290318591001',
'2290332616001',
'2290322920001',
'2290328007001',
'2260016380001',
'2290321924001',
'2290317269001',
'2290324508001',
'2290320804001',
'2290325288001',
'2290332160001',
'1792673372001',
'1792646715001',
'1792532264001',
'1792264340001',
'1768086080001',
'591739034001',
'1792537673001',
'1768159060001',
'1792562988001',
'1792725542001',
'1792753457001',
'1792720486001',
'1792666465001',
'1792708443001',
'2191745585001',
'1792681367001',
'1792643589001',
'1792654262001',
'991149309001',
'1791714679001',
'1792201160001',
'1791741390001',
'1791430395001',
'1792213770001',
'1768152130001',
'1792665973001',
'1790386120001',
'1792063051001',
'1391849389001',
'1768177200001',
'1792657431001',
'1768150190001',
'1792741831001',
'1792743133001',
'1792750245001',
'1768120790001',
'1792305950001',
'1792288630001',
'1091742345001',
'1091746146001',
'1792711533001',
'1791892488001',
'1790484017001',
'1768157520001',
'1790656799001',
'1768135980001',
'1791768442001',
'1792703263001',
'1792348927001',
'1792747058001',
'1792724627001',
'1792736625001',
'1768099060001',
'991500359001',
'992251905001',
'992180684001',
'991502882001',
'992115084001',
'1391706537001',
'1792118697001',
'1792121647001',
'1768149690001',
'1768130160001',
'1792329906001',
'1790032337001',
'1792374316001',
'1792758629001',
'1792722136001',
'1792427142001',
'1792291151001',
'1768163410001',
'1792224306001',
'1768155310001',
'1792754348001',
'1792444152001',
'1792447623001',
'1768188830001',
'1792466938001',
'1792470498001',
'1792438179001',
'1792478871001',
'1791874420001',
'1768169960001',
'1768171270001',
'1792497272001',
'1792732212001',
'1791879791001',
'1792734479001',
'1768179410001',
'1791957806001',
'1791246241001',
'1768038430001',
'1768101810001',
'1768038780001',
'1768038860001',
'1768038940001',
'1792567874001',
'1792142636001',
'1391847297001',
'1768183520001',
'1792720788001',
'1792706637001',
'1792642825001',
'1792727138001',
'1792594634001',
'1792651271001',
'1792764831001',
'1792700345001',
'1792730015001',
'1792662036001',
'1791905911001',
'1768177630001',
'1792698839001',
'1792535212001',
'1792758831001',
'1792724562001',
'1792706777001',
'1792774721001',
'1768185810001',
'1768188670001',
'1792547563001',
'1792716047001',
'1391828993001',
'1792678498001',
'1792288924001',
'1792490049001',
'2390017246001',
'1792121132001',
'1792549655001',
'1792495970001',
'1792513480001',
'1792714788001',
'1792662796001',
'1792341353001',
'1792246091001',
'1791410114001',
'1792445809001',
'1791825187001',
'1792170826001',
'1792504597001',
'1792535433001',
'660828570001',
'691730573001',
'660841160001',
'691739902001',
'691745252001',
'691749304001',
'1891769160001',
'1891729592001',
'1891736882001',
'1865000590001',
'1891748937001',
'1891721613001',
'1891761607001',
'1865019420001',
'1865032010001',
'1891778097001',
'1891778135001',
'1891777775001',
'1891751849001',
'1865039530001',
'1865039450001',
'1865040460001',
'1865040030001',
'1891713629001',
'1891768830001',
'1891760465001',
'1891771335001',
'691758192001',
'1891763715001',
'1891748910001',
'1891727417001',
'1891766021001',
'1891764045001',
'1891751458001',
'1891767036001',
'1891724035001',
'1891733883001',
'1490006342001',
'691729281001',
'691731456001',
'691741486001',
'691723275001',
'391010420001',
'992749598001',
'660841080001',
'591723340001',
'560038780001',
'1691714345001',
'1691702525001',
'1690015907001',
'1691707748001',
'1660007930001',
'1691713810001',
'1691710080001',
'1691714779001',
'1660017220001',
'1660011290001',
'1691716755001',
'1691712377001',
'1691707063001',
'1691717883001',
'1691716666001',
'1691719029001',
'891748663001',
'1660011450001',
'1691718960001',
'691709469001',
'691733289001',
'660840000001',
'591723499001',
'591723960001',
'560019050001',
'591738887001',
'591736612001',
'591730266001',
'591710605001',
'590061336001',
'591723251001',
'591706675001',
'591730398001',
'591725017001',
'591725467001',
'591716085001',
'591738860001',
'560038350001',
'560038430001',
'591726595001',
'1791895312001',
'591717278001',
'591729500001',
'591725866001',
'591735152001',
'591728830001',
'591731270001',
'591738100001',
'591738283001',
'591736485001',
'591737678001',
'691724069001',
'1891733158001',
'660835860001',
'690074397001',
'1891717616001',
'1890141532001',
'1891732321001',
'691709086001',
'691728579001',
'660826440001',
'691739090001',
'691742679001',
'691737012001',
'591714538001',
'1891732577001',
'591715569001',
'1792577713001',
'1391784414001',
'1360046970001',
'1391789556001',
'1391731361001',
'1391797435001',
'1391731434001',
'1391813880001',
'1391700296001',
'1391822790001',
'1391784724001',
'1391767412001',
'1391788444001',
'1391769415001',
'1391777523001',
'1391800649001',
'1391799683001',
'1391803389001',
'1391804326001',
'1391775954001',
'1391829531001',
'1391808992001',
'1391842481001',
'1391834497001',
'1391837488001',
'1391719175001',
'1391730551001',
'1391809042001',
'1391816510001',
'1391720750001',
'1391700229001',
'1391789947001',
'1391721307001',
'2390021669001',
'1391844166001',
'1391843860001',
'1391830602001',
'1390145981001',
'1391778678001',
'1391848404001',
'1391765622001',
'1391767161001',
'1391790678001',
'1391795947001',
'1391828845001',
'1391839812001',
'1792319994001',
'1391778481001',
'1391715854001',
'1391804113001',
'1792275903001',
'1391833857001',
'1391843879001',
'1360069080001',
'1360087060001',
'1391854404001',
'992760656001',
'1391709595001',
'1391831374001',
'1768160740001',
'1391730993001',
'1391788320001',
'1360087300001',
'1391837194001',
'1391837267001',
'1291743125001',
'1391848862001',
'1391774192001',
'1391800541001',
'1391841329001',
'1391835256001',
'1391773854001',
'1391843100001',
'1391730942001',
'992581352001',
'1391840039001',
'1391768176001',
'1391829582001',
'1391837402001',
'1391790082001',
'1391714033001',
'1360069670001',
'1391843895001',
'1391805853001',
'1391701586001',
'1360070920001',
'1391766513001',
'1391776675001',
'1360077850001',
'1391837887001',
'1391774109001',
'1391801424001',
'1391709803001',
'1391774761001',
'1391801629001',
'1391725434001',
'1391826575001',
'1391834659001',
'1391850158001',
'1391826214001',
'1391830246001',
'1391853157001',
'1391803281001',
'1360076020001',
'1391784120001',
'1391841574001',
'1391855613001',
'1391822073001',
'1391768206001',
'1391834489001',
'1391832125001',
'1360022520001',
'1391787464001',
'1391773927001',
'1391804946001',
'2390022886001',
'2390004519001',
'2390010160001',
'2390015537001',
'992274999001',
'991095950001',
'992276428001',
'991331379001',
'1291739640001',
'1291760259001',
'1291754712001',
'992581700001',
'1291744369001',
'992563494001',
'1291738822001',
'1291746442001',
'1291761387001',
'992567775001',
'1291752213001',
'1291757363001',
'1291755859001',
'992467053001',
'992783605001',
'1291745233001',
'992780207001',
'968600800001',
'2490018509001',
'968593680001',
'992571071001',
'992687932001',
'992341351001',
'992872373001',
'992773154001',
'992994495001',
'291515541001',
'291516262001',
'1891727212001',
'291502202001',
'291513166001',
'291507557001',
'291509304001',
'291514154001',
'291514804001',
'291516955001',
'992676892001',
'1291738962001',
'1291730503001',
'1291747333001',
'968600050001',
'291517331001',
'260024270001',
'1791308522001',
'291510876001',
'291511767001',
'291516629001',
'291506712001',
'291511546001',
'291511317001',
'291506178001',
'260023110001',
'291512801001',
'1891709591001',
'291515304001',
'291512496001',
'291507735001',
'291514782001',
'291517013001',
'968585070001',
'968582640001',
'992339330001',
'1792256550001',
'992395060001',
'991375937001',
'992600705001',
'992293497001',
'992737808001',
'992301473001',
'990933138001',
'992777141001',
'992769025001',
'992715022001',
'992720387001',
'1291751705001',
'992928158001',
'992640103001',
'992757671001',
'992906286001',
'992940255001',
'1291736080001',
'992945532001',
'992928417001',
'992836938001',
'992781432001',
'2091757993001',
'2091710172001',
'2091760145001',
'992366443001',
'2094000052001',
'992832010001',
'2060018280001',
'2091760242001',
'2060016310001',
'992396180001',
'1792385865001',
'992314354001',
'2091759570001',
'2091759627001',
'2091759635001',
'2060017200001',
'2091761338001',
'1291759943001',
'2091759163001',
'2091757691001',
'2091760927001',
'1291758432001',
'1291757762001',
'1260043620001',
'1291756014001',
'1291755697001',
'1291759366001',
'992935251001',
'1291734444001',
'291512798001',
'291511511001',
'291511023001',
'260022810001',
'992562714001',
'2490017278001',
'992931086001',
'2490007132001',
'991029001001',
'992241152001',
'2490017383001',
'968580510001',
'992933453001',
'2490018010001',
'992574852001',
'1291761832001',
'1260002000001',
'1291761840001',
'1291740789001',
'1291761875001',
'1291741114001',
'992425229001',
'391013225001',
'390028148001',
'390011075001',
'1792500613001',
'391011354001',
'391018596001',
'391012180001',
'391014493001',
'190362507001',
'190362515001',
'160027390001',
'190003809001',
'190311422001',
'1792038553001',
'190420256001',
'190434184001',
'190339505001',
'190322874001',
'190431290001',
'1768100760001',
'160037430001',
'160027550001',
'190435377001',
'190370038001',
'190167453001',
'160053200001',
'190428729001',
'160007280001',
'190392600001',
'190389413001',
'1490815690001',
'1791426975001',
'190410129001',
'1768177710001',
'190418928001',
'190427935001',
'190431568001',
'190066797001',
'190390160001',
'190365395001',
'160031900001',
'160032470001',
'160038160001',
'360015930001',
'190371794001',
'160053550001',
'190388190001',
'190324214001',
'190399451001',
'190436853001',
'1990918860001',
'391001324001',
'1490810974001',
'1490813450001',
'1191749517001',
'1490005443001',
'1490811210001',
'1490813906001',
'190343332001',
'1490812756001',
'190408590001',
'1460028540001',
'1490815534001',
'1490006717001',
'1460021530001',
'190304167001',
'190419401001',
'190305104001',
'190417727001',
'1490811016001',
'1490020116001',
'1490800669001',
'1490811679001',
'391018375001',
'1490817367001',
'1490816689001',
'1191769607001',
'1191769542001',
'1190083299001',
'1191769550001',
'791756715001',
'791761573001',
'1191756289001',
'1191723569001',
'1191742946001',
'1191739031001',
'1191705390001',
'1191734390001',
'190417417001',
'1191757048001',
'1191735427001',
'1191758303001',
'1191759741001',
'1291744881001',
'1291714451001',
'1191704068001',
'1990909683001',
'1990911173001',
'1792343577001',
'1191728765001',
'1190000709001',
'1190082152001',
'1191738213001',
'1190049406001',
'1191762637001',
'1191738272001',
'1191721124001',
'1191764028001',
'1191755479001',
'1191757595001',
'1191739856001',
'1191762971001',
'1191759938001',
'1191706826001',
'1191715566001',
'1191765970001',
'1191717445001',
'791795524001',
'190417654001',
'760001580001',
'990082294001',
'791752302001',
'791784786001',
'791781825001',
'790084209001',
'791716195001',
'791766877001',
'791781272001',
'791785901001',
'791791642001',
'190416372001',
'791781728001',
'791741300001',
'791771544001',
'1990901755001',
'1960146320001',
'1990911319001',
'1990903537001',
'1960146910001',
'1191753158001',
'1191754294001',
'1191763196001',
'1990906994001',
'1191764109001',
'1191723984001',
'1990016476001',
'1191728897001',
'190417549001',
'1160058080001',
'1160058750001',
'1990918216001',
'790051580001',
'791732395001',
'791746507001',
'791768055001',
'791727448001',
'791774608001',
'1191735761001',
'1191717895001',
'1990915241001',
'190416186001',
'1960147720001',
'1990913087001',
'1990914024001',
'1191761223001',
'1191758974001',
'1191761975001',
'1191760421001',
'1160050340001',
'1191759296001',
'1191744175001',
'1191721817001',
'1160058320001',
'1191752275001',
'1191748677001',
'790067339001',
'760050440001',
'1792533449001',
'1960138730001',
'1960144460001',
'1191746097001')
go





IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'sol_144494_t' AND type = 'U')
DROP TABLE sol_144494_t
GO

create table sol_144494_t (di_direccion int null, en_ced_ruc char (18), di_descripcion char (100) null, di_principal char(100) null, di_numero char(10) null, di_transversal char(100) null)
insert into sol_144494_t 
select MAX(di_direccion), en_ced_ruc, di_descripcion, di_principal, di_numero, di_transversal
from sol_144494


select en_ced_ruc, di_descripcion, di_principal, di_numero, di_transversal from sol_144494_t
