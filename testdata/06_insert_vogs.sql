------------------------------------------------------------------------------------------------------------------
-- TS165003: Eén persoon met VOG om tweede VOG aan toe te voegen
------------------------------------------------------------------------------------------------------------------
insert into vogs (id, nummer, registratiedatum, persoon_id) values
 (newid(), '16500001', current_timestamp, (select id from personen where familienaam='Vogtoevoegen'))
------------------------------------------------------------------------------------------------------------------
-- TS165004: Eén persoon met VOG om ongeldige VOGs aan toe te voegen vanaf inlogpagina
------------------------------------------------------------------------------------------------------------------
,(newid(), '16500002', current_timestamp, (select id from personen where familienaam='Vognietgeldig'))
------------------------------------------------------------------------------------------------------------------
-- TS166005: Eén persoon met post als default, geen keuze gemaakt (code 0)
------------------------------------------------------------------------------------------------------------------
,(newid(), '16600001', current_timestamp, (select id from personen where familienaam='Defaultkeuzeopslaan'))
------------------------------------------------------------------------------------------------------------------
-- TS166006: Eén persoon met post als default, geen keuze gemaakt (code 0)
------------------------------------------------------------------------------------------------------------------
,(newid(), '16600002', current_timestamp, (select id from personen where familienaam='Defaultkeuzebevestigen'))
------------------------------------------------------------------------------------------------------------------
-- TS170002: Eén persoon met meerdere houders gekoppeld
------------------------------------------------------------------------------------------------------------------
,(newid(), '17000001', current_timestamp, (select id from personen where familienaam='Houders'))
------------------------------------------------------------------------------------------------------------------
-- TS171001: Twee personen voor uitschrijving, één gekoppeld aan een houder
------------------------------------------------------------------------------------------------------------------
,(newid(), '17100001', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Schrijven'))
,(newid(), '17100002', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Gekoppeld'))
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TS179002 / TS179005 / 196002: 4 personen worden met een VOG aangemaakt en gekoppeld aan nieuwe houder 'Sorteer Koppelingen B.V.', deze data wordt ook gebruikt om te navigeren met breadcrumbs
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
,(newid(), '30000001', current_timestamp, (select id from personen where familienaam='Eef Koppeleen'))
,(newid(), '30000002', current_timestamp, (select id from personen where familienaam='Tom Koppeltwee'))
,(newid(), '30000003', current_timestamp, (select id from personen where familienaam='Dave Koppeldrie'))
,(newid(), '30000004', current_timestamp, (select id from personen where familienaam='Vince Koppelvier'))
------------------------------------------------------------------------------------------------------------------
-- TS179004 / 196004: 27 personen met VOG gekoppeld aan 1 houder
------------------------------------------------------------------------------------------------------------------
,(newid(), '17900001', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon1'))
,(newid(), '17900002', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon2'))
,(newid(), '17900003', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon3'))
,(newid(), '17900004', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon4'))
,(newid(), '17900005', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon5'))
,(newid(), '17900006', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon6'))
,(newid(), '17900007', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon7'))
,(newid(), '17900008', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon8'))
,(newid(), '17900009', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon9'))
,(newid(), '17900010', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon10'))
,(newid(), '17900011', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon11'))
,(newid(), '17900012', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon12'))
,(newid(), '17900013', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon13'))
,(newid(), '17900014', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon14'))
,(newid(), '17900015', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon15'))
,(newid(), '17900016', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon16'))
,(newid(), '17900017', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon17'))
,(newid(), '17900018', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon18'))
,(newid(), '17900019', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon19'))
,(newid(), '17900020', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon20'))
,(newid(), '17900021', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon21'))
,(newid(), '17900022', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon22'))
,(newid(), '17900023', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon23'))
,(newid(), '17900024', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon24'))
,(newid(), '17900025', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon25'))
,(newid(), '17900026', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon26'))
,(newid(), '17900027', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon27'))
------------------------------------------------------------------------------------------------------------------
-- TS179006 / 196005: 30 personen met VOG gekoppeld aan 1 houder voor filterdoeleinden
------------------------------------------------------------------------------------------------------------------
,(newid(), '48656219', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ikjhijaajfcg'))
,(newid(), '82584306', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Eeckbkekdckj'))
,(newid(), '90175199', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Bffjhchgfhgh'))
,(newid(), '15277961', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Jhhfgicchbkj'))
,(newid(), '10297543', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Djaafehgbcae'))
,(newid(), '65908978', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Iihejb-jjccc'))
,(newid(), '71540357', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Geaebeckgibk'))
,(newid(), '47565103', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Bifgkeegihdg'))
,(newid(), '39467115', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Aiehkebgieib'))
,(newid(), '45170619', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ddacdkkaebif'))
,(newid(), '90062927', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Hfcbjhieeigg'))
,(newid(), '80715326', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Fcddajbejhdg'))
,(newid(), '65334935', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Eficgfjibchb'))
,(newid(), '66868070', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Gkichfdkadid'))
,(newid(), '10501898', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Bg-fehaiaebc'))
,(newid(), '70277658', '2014-12-09 09:03:40.000', (select id from personen where familienaam='BdhÍafdjfkej'))
,(newid(), '31623061', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Kiiõicchjjea'))
,(newid(), '28344592', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Bjkàgdjigbfk'))
,(newid(), '61469454', '2014-12-09 09:03:40.000', (select id from personen where familienaam='GakÜagchbbjh'))
,(newid(), '93426912', '2014-12-09 09:03:40.000', (select id from personen where familienaam='IfaÃbkgdeeck'))
,(newid(), '62834077', '2014-12-09 09:03:40.000', (select id from personen where familienaam='FaeÃchjiajbd'))
,(newid(), '34268955', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Hdiàfejkbgej'))
,(newid(), '94703022', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Gkf÷ejfegdeg'))
,(newid(), '42104081', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ddg÷iikjbacb'))
,(newid(), '76842384', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Eijìidbjacce'))
,(newid(), '42141102', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Bfhøhgdkddgc'))
,(newid(), '45383549', '2014-12-09 09:03:40.000', (select id from personen where familienaam='GejÑighekhjb'))
,(newid(), '61499354', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Bibøedkkbegf'))
,(newid(), '64241696', '2014-12-09 09:03:40.000', (select id from personen where familienaam='IfkÅaikidjji'))
,(newid(), '89849092', '2014-12-09 09:03:40.000', (select id from personen where familienaam='JiiÚijeagkie'))
------------------------------------------------------------------------------------------------------------------
-- TS179007 / 196006: 110 personen met VOG gekoppeld aan 1 houder voor filterdoeleinden over meerdere pagina's
------------------------------------------------------------------------------------------------------------------
,(newid(), '50677516', CURRENT_TIMESTAMP, (select id from personen where familienaam='EAaaEdhaf'))
,(newid(), '25481661', CURRENT_TIMESTAMP, (select id from personen where familienaam='BAaaHcgkb'))
,(newid(), '54402285', CURRENT_TIMESTAMP, (select id from personen where familienaam='IAaaCckhi'))
,(newid(), '57677308', CURRENT_TIMESTAMP, (select id from personen where familienaam='KAaaEckdd'))
,(newid(), '27129405', CURRENT_TIMESTAMP, (select id from personen where familienaam='DAaaHeiea'))
,(newid(), '90356045', CURRENT_TIMESTAMP, (select id from personen where familienaam='DAaaAiadj'))
,(newid(), '34321732', CURRENT_TIMESTAMP, (select id from personen where familienaam='GAaaIdgja'))
,(newid(), '65183668', CURRENT_TIMESTAMP, (select id from personen where familienaam='CAaaEgbbh'))
,(newid(), '46766107', CURRENT_TIMESTAMP, (select id from personen where familienaam='KAaaDjkff'))
,(newid(), '41581278', CURRENT_TIMESTAMP, (select id from personen where familienaam='CAaaEfdkc'))
,(newid(), '27794217', CURRENT_TIMESTAMP, (select id from personen where familienaam='BAaaEacfj'))
,(newid(), '38579571', CURRENT_TIMESTAMP, (select id from personen where familienaam='CAaaAaica'))
,(newid(), '56681782', CURRENT_TIMESTAMP, (select id from personen where familienaam='JAaaIijig'))
,(newid(), '17835272', CURRENT_TIMESTAMP, (select id from personen where familienaam='KAaaBbkdg'))
,(newid(), '24004804', CURRENT_TIMESTAMP, (select id from personen where familienaam='IAaaDehge'))
,(newid(), '43527022', CURRENT_TIMESTAMP, (select id from personen where familienaam='DAaaAgefg'))
,(newid(), '10107812', CURRENT_TIMESTAMP, (select id from personen where familienaam='GAaaBedfb'))
,(newid(), '52208344', CURRENT_TIMESTAMP, (select id from personen where familienaam='JAaaAihha'))
,(newid(), '32958420', CURRENT_TIMESTAMP, (select id from personen where familienaam='EAaaDjkib'))
,(newid(), '83573422', CURRENT_TIMESTAMP, (select id from personen where familienaam='BAaaBegic'))
,(newid(), '27897874', CURRENT_TIMESTAMP, (select id from personen where familienaam='KAaaFhhkg'))
,(newid(), '50943063', CURRENT_TIMESTAMP, (select id from personen where familienaam='AAaaAijkb'))
,(newid(), '85425405', CURRENT_TIMESTAMP, (select id from personen where familienaam='DAaaDbeie'))
,(newid(), '13905072', CURRENT_TIMESTAMP, (select id from personen where familienaam='DAaaDcekg'))
,(newid(), '61560197', CURRENT_TIMESTAMP, (select id from personen where familienaam='DAaaFjbkj'))
,(newid(), '36324054', CURRENT_TIMESTAMP, (select id from personen where familienaam='BAaaCkcii'))
,(newid(), '20756862', CURRENT_TIMESTAMP, (select id from personen where familienaam='EAaaIeaii'))
,(newid(), '12162128', CURRENT_TIMESTAMP, (select id from personen where familienaam='HAaaEgick'))
,(newid(), '55347418', CURRENT_TIMESTAMP, (select id from personen where familienaam='BAaaGeaig'))
,(newid(), '52107322', CURRENT_TIMESTAMP, (select id from personen where familienaam='GAaaAaaji'))
,(newid(), '39214344', CURRENT_TIMESTAMP, (select id from personen where familienaam='CAaaFbfad'))
,(newid(), '47143192', CURRENT_TIMESTAMP, (select id from personen where familienaam='GAaaJkcjh'))
,(newid(), '77085513', CURRENT_TIMESTAMP, (select id from personen where familienaam='AAaaJdgji'))
,(newid(), '93702330', CURRENT_TIMESTAMP, (select id from personen where familienaam='AAaaDkkga'))
,(newid(), '68548542', CURRENT_TIMESTAMP, (select id from personen where familienaam='HAaaGjibh'))
,(newid(), '45956190', CURRENT_TIMESTAMP, (select id from personen where familienaam='HAaaHdbbh'))
,(newid(), '55666167', CURRENT_TIMESTAMP, (select id from personen where familienaam='BAaaIbedj'))
,(newid(), '27715222', CURRENT_TIMESTAMP, (select id from personen where familienaam='DAaaDddia'))
,(newid(), '82638670', CURRENT_TIMESTAMP, (select id from personen where familienaam='KAaaCggbf'))
,(newid(), '15991108', CURRENT_TIMESTAMP, (select id from personen where familienaam='GAaaIhggb'))
,(newid(), '94166174', CURRENT_TIMESTAMP, (select id from personen where familienaam='BAaaIcdeg'))
,(newid(), '73655969', CURRENT_TIMESTAMP, (select id from personen where familienaam='EAaaFhdai'))
,(newid(), '69741189', CURRENT_TIMESTAMP, (select id from personen where familienaam='FAaaBkafg'))
,(newid(), '35828191', CURRENT_TIMESTAMP, (select id from personen where familienaam='IAaaBicfd'))
,(newid(), '10982050', CURRENT_TIMESTAMP, (select id from personen where familienaam='HAaaJidfc'))
,(newid(), '30239405', CURRENT_TIMESTAMP, (select id from personen where familienaam='JAaaAffdk'))
,(newid(), '84435568', CURRENT_TIMESTAMP, (select id from personen where familienaam='CAaaEfdgi'))
,(newid(), '22912395', CURRENT_TIMESTAMP, (select id from personen where familienaam='GAaaFkbca'))
,(newid(), '57907776', CURRENT_TIMESTAMP, (select id from personen where familienaam='GAaaBhckj'))
,(newid(), '11541990', CURRENT_TIMESTAMP, (select id from personen where familienaam='DAaaGdkbi'))
,(newid(), '41303308', CURRENT_TIMESTAMP, (select id from personen where familienaam='DAaaHkiei'))
,(newid(), '43322886', CURRENT_TIMESTAMP, (select id from personen where familienaam='JAaaGbegc'))
,(newid(), '33202209', CURRENT_TIMESTAMP, (select id from personen where familienaam='FBbbIcjeb'))
,(newid(), '42474785', CURRENT_TIMESTAMP, (select id from personen where familienaam='ABbbJdecd'))
,(newid(), '87239721', CURRENT_TIMESTAMP, (select id from personen where familienaam='CBbbEjgej'))
,(newid(), '45398368', CURRENT_TIMESTAMP, (select id from personen where familienaam='IBbbHddcd'))
,(newid(), '73224874', CURRENT_TIMESTAMP, (select id from personen where familienaam='ABbbIaeec'))
,(newid(), '45065392', CURRENT_TIMESTAMP, (select id from personen where familienaam='JBbbJgieh'))
,(newid(), '23684480', CURRENT_TIMESTAMP, (select id from personen where familienaam='EBbbFhbfa'))
,(newid(), '46885433', CURRENT_TIMESTAMP, (select id from personen where familienaam='FBbbAkikb'))
,(newid(), '82414040', CURRENT_TIMESTAMP, (select id from personen where familienaam='DBbbJheca'))
,(newid(), '85785944', CURRENT_TIMESTAMP, (select id from personen where familienaam='GBbbKdcdb'))
,(newid(), '64140933', CURRENT_TIMESTAMP, (select id from personen where familienaam='ABbbFekcc'))
,(newid(), '12306261', CURRENT_TIMESTAMP, (select id from personen where familienaam='ABbbHgcfa'))
,(newid(), '62420616', CURRENT_TIMESTAMP, (select id from personen where familienaam='BBbbEcfef'))
,(newid(), '92611441', CURRENT_TIMESTAMP, (select id from personen where familienaam='BBbbFhdhi'))
,(newid(), '72251651', CURRENT_TIMESTAMP, (select id from personen where familienaam='ABbbIbgbc'))
,(newid(), '77039362', CURRENT_TIMESTAMP, (select id from personen where familienaam='JBbbKebaa'))
,(newid(), '79679014', CURRENT_TIMESTAMP, (select id from personen where familienaam='DBbbEhjje'))
,(newid(), '92399075', CURRENT_TIMESTAMP, (select id from personen where familienaam='CBbbFdikf'))
,(newid(), '92083029', CURRENT_TIMESTAMP, (select id from personen where familienaam='ABbbGjeic'))
,(newid(), '73633339', CURRENT_TIMESTAMP, (select id from personen where familienaam='DBbbGikhg'))
,(newid(), '75308684', CURRENT_TIMESTAMP, (select id from personen where familienaam='DBbbKdijk'))
,(newid(), '63348495', CURRENT_TIMESTAMP, (select id from personen where familienaam='CBbbCjdfg'))
,(newid(), '46319647', CURRENT_TIMESTAMP, (select id from personen where familienaam='IBbbBkckh'))
,(newid(), '80525309', CURRENT_TIMESTAMP, (select id from personen where familienaam='FBbbKddjd'))
,(newid(), '54993535', CURRENT_TIMESTAMP, (select id from personen where familienaam='CBbbKghgc'))
,(newid(), '93312199', CURRENT_TIMESTAMP, (select id from personen where familienaam='DBbbJhheg'))
,(newid(), '54420590', CURRENT_TIMESTAMP, (select id from personen where familienaam='ABbbFiibj'))
,(newid(), '64847122', CURRENT_TIMESTAMP, (select id from personen where familienaam='GBbbBkjdc'))
,(newid(), '10934792', CURRENT_TIMESTAMP, (select id from personen where familienaam='ECccIjjjg'))
,(newid(), '75927757', CURRENT_TIMESTAMP, (select id from personen where familienaam='HCccBkifh'))
,(newid(), '47556587', CURRENT_TIMESTAMP, (select id from personen where familienaam='KCccCiahd'))
,(newid(), '94551232', CURRENT_TIMESTAMP, (select id from personen where familienaam='GCccJabkd'))
,(newid(), '40374467', CURRENT_TIMESTAMP, (select id from personen where familienaam='HCccJbcje'))
,(newid(), '88645669', CURRENT_TIMESTAMP, (select id from personen where familienaam='JCccEbabb'))
,(newid(), '79471991', CURRENT_TIMESTAMP, (select id from personen where familienaam='KCccDbggk'))
,(newid(), '32178405', CURRENT_TIMESTAMP, (select id from personen where familienaam='DCccIaggb'))
,(newid(), '82203355', CURRENT_TIMESTAMP, (select id from personen where familienaam='CCccEcbbi'))
,(newid(), '36435198', CURRENT_TIMESTAMP, (select id from personen where familienaam='FCccAaaeb'))
,(newid(), '61734212', CURRENT_TIMESTAMP, (select id from personen where familienaam='ICccKbihf'))
,(newid(), '48025867', CURRENT_TIMESTAMP, (select id from personen where familienaam='ECccBdeaj'))
,(newid(), '65453906', CURRENT_TIMESTAMP, (select id from personen where familienaam='BCccIebei'))
,(newid(), '91880827', CURRENT_TIMESTAMP, (select id from personen where familienaam='ICccEdhke'))
,(newid(), '11917074', CURRENT_TIMESTAMP, (select id from personen where familienaam='DCccCdeea'))
,(newid(), '61283349', CURRENT_TIMESTAMP, (select id from personen where familienaam='ACccFefkf'))
,(newid(), '78365207', CURRENT_TIMESTAMP, (select id from personen where familienaam='JCccKfgja'))
,(newid(), '69501792', CURRENT_TIMESTAMP, (select id from personen where familienaam='ACccCajke'))
,(newid(), '86514462', CURRENT_TIMESTAMP, (select id from personen where familienaam='JCccHhikf'))
,(newid(), '17118359', CURRENT_TIMESTAMP, (select id from personen where familienaam='FCccFhfjk'))
,(newid(), '50306998', CURRENT_TIMESTAMP, (select id from personen where familienaam='ECccCgbdj'))
,(newid(), '75678489', CURRENT_TIMESTAMP, (select id from personen where familienaam='ACccFgfjc'))
,(newid(), '12250337', CURRENT_TIMESTAMP, (select id from personen where familienaam='DCccGajcc'))
,(newid(), '42617092', CURRENT_TIMESTAMP, (select id from personen where familienaam='ECccJbihk'))
,(newid(), '98512340', CURRENT_TIMESTAMP, (select id from personen where familienaam='GCccGjbai'))
,(newid(), '37777133', CURRENT_TIMESTAMP, (select id from personen where familienaam='DCccFkcek'))
,(newid(), '76792536', CURRENT_TIMESTAMP, (select id from personen where familienaam='BCccCahce'))
,(newid(), '40092033', CURRENT_TIMESTAMP, (select id from personen where familienaam='CCccKbgfb'))
,(newid(), '41114322', CURRENT_TIMESTAMP, (select id from personen where familienaam='HCccIhagg'))
,(newid(), '83047166', CURRENT_TIMESTAMP, (select id from personen where familienaam='CCccIakcd'))
------------------------------------------------------------------------------------------------------------------
-- TS179008: 25+ personen met VOG gekoppeld aan 1 houder voor onthouden sorteer/pagineer voorkeuren
------------------------------------------------------------------------------------------------------------------
,(newid(), '10428795', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Atestvoorkeur'))
,(newid(), '51475355', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Btestvoorkeur'))
,(newid(), '27122310', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ctestvoorkeur'))
,(newid(), '21867127', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Dtestvoorkeur'))
,(newid(), '67584644', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Etestvoorkeur'))
,(newid(), '85262505', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ftestvoorkeur'))
,(newid(), '59774315', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Gtestvoorkeur'))
,(newid(), '47520582', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Htestvoorkeur'))
,(newid(), '90341192', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Itestvoorkeur'))
,(newid(), '49566009', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Jtestvoorkeur'))
,(newid(), '80104033', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ktestvoorkeur'))
,(newid(), '47354451', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ltestvoorkeur'))
,(newid(), '47040251', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Mtestvoorkeur'))
,(newid(), '98402450', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ntestvoorkeur'))
,(newid(), '72044826', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Otestvoorkeur'))
,(newid(), '50516985', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ptestvoorkeur'))
,(newid(), '95438835', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Qtestvoorkeur'))
,(newid(), '83888416', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Rtestvoorkeur'))
,(newid(), '38014642', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Stestvoorkeur'))
,(newid(), '79080142', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ttestvoorkeur'))
,(newid(), '77144183', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Utestvoorkeur'))
,(newid(), '32807770', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Vtestvoorkeur'))
,(newid(), '90252796', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Wtestvoorkeur'))
,(newid(), '16122545', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Xtestvoorkeur'))
,(newid(), '72112507', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ytestvoorkeur'))
,(newid(), '60370747', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ztestvoorkeur'))
,(newid(), '92373965', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Aatestvoorkeur'))
,(newid(), '40343129', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Cctestvoorkeur'))
,(newid(), '18323070', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ddtestvoorkeur'))
,(newid(), '44721837', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Zztestvoorkeur'))
------------------------------------------------------------------------------------------------------------------
-- TS181001: Houder gekoppeld met 3 personen, één met 1 VOG, één met 3
------------------------------------------------------------------------------------------------------------------
,(newid(), '20000001', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Koppel Persoon1'))
,(newid(), '20000002', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Persoon Koppel2'))
,(newid(), '20000003', '2014-12-08 09:03:40.000', (select id from personen where familienaam='Persoon Koppel2'))
,(newid(), '20000004', '2014-12-07 09:03:40.000', (select id from personen where familienaam='Persoon Koppel2'))
,(newid(), '20000005', current_timestamp, (select id from personen where familienaam='Houder Persoon3'))
------------------------------------------------------------------------------------------------------------------
-- TS182001: 2 personen en 1 houder om aan elkaar te koppelen
------------------------------------------------------------------------------------------------------------------
,(newid(), '18200001', current_timestamp, (select id from personen where familienaam='Koppeltesteen'))
,(newid(), '18200002', current_timestamp, (select id from personen where familienaam='Koppeltesttwee'))
------------------------------------------------------------------------------------------------------------------
-- TS182002: persoon en 1 houder om aan elkaar te koppelen en ongedaan te maken
------------------------------------------------------------------------------------------------------------------
,(newid(), '18200003', current_timestamp, (select id from personen where familienaam='Koppeltestdrie'))
------------------------------------------------------------------------------------------------------------------
-- TS182003: persoon en 1 houder om aan elkaar te koppelen voor backend validatie
------------------------------------------------------------------------------------------------------------------
,(newid(), '18200004', current_timestamp, (select id from personen where familienaam='Koppeltestvier'))
------------------------------------------------------------------------------------------------------------------
-- TS182005: 2 houders koppelen 1 persoon
------------------------------------------------------------------------------------------------------------------
,(newid(), '18200005', current_timestamp, (select id from personen where familienaam='Koppeltestvijf'))
------------------------------------------------------------------------------------------------------------------
-- TS182xxx: Diverse personen om te koppelen aan een houder
------------------------------------------------------------------------------------------------------------------
,(newid(), '10000001', current_timestamp, (select id from personen where familienaam='Np Aaa'))
,(newid(), '10000002', current_timestamp, (select id from personen where familienaam='Np Bbb'))
,(newid(), '10000003', current_timestamp, (select id from personen where familienaam='Np Ccc'))
,(newid(), '10000004', current_timestamp, (select id from personen where familienaam='Np Ddd'))
,(newid(), '10000005', current_timestamp, (select id from personen where familienaam='Np Eee'))
,(newid(), '10000006', current_timestamp, (select id from personen where familienaam='Np Fff'))
,(newid(), '10000007', current_timestamp, (select id from personen where familienaam='Np Ggg'))
,(newid(), '10000008', current_timestamp, (select id from personen where familienaam='Np Hhh'))
,(newid(), '10000009', current_timestamp, (select id from personen where familienaam='Np Iii'))
,(newid(), '10000010', current_timestamp, (select id from personen where familienaam='Np Jjj'))
------------------------------------------------------------------------------------------------------------------
-- TS183001 2 koppelingen om één voor één te verwijderen
------------------------------------------------------------------------------------------------------------------
,(newid(), '18300001', current_timestamp, (select id from personen where familienaam='Een Teverwijderen'))
,(newid(), '18300002', current_timestamp, (select id from personen where familienaam='Twee Weghalen'))
------------------------------------------------------------------------------------------------------------------
-- TS183002: 12 personen met VOG gekoppeld aan 1 houder verwijder/filter doeleinden
------------------------------------------------------------------------------------------------------------------
,(newid(), '92514864', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ajgkiifdjkgf'))
,(newid(), '43331060', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Bkikdfdbcghh'))
,(newid(), '52285862', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Jkicgfjaihgc'))
,(newid(), '56781159', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Iiidgjkhkfee'))
,(newid(), '48639092', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Kiggijeiakjk'))
,(newid(), '83101008', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Gffhfegdckaa'))
,(newid(), '14530908', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Gfhbkkffghai'))
,(newid(), '75349769', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Dejadaefebjg'))
,(newid(), '23613942', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Gjbifbdhgeif'))
,(newid(), '43707664', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Afaakghheiid'))
,(newid(), '94331222', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Aigfigbajedj'))
,(newid(), '81887940', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Bgdbbejjidee'))
------------------------------------------------------------------------------------------------------------------
-- TS183003: 26 personen met VOG gekoppeld aan 1 houder verwijder/filter doeleinden
------------------------------------------------------------------------------------------------------------------
,(newid(), '15695859', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ihgebbkekfbj'))
,(newid(), '81098105', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Adkgbgkbhbcd'))
,(newid(), '19576978', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Jgafkkbakaif'))
,(newid(), '15897668', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Jgcgdffffagc'))
,(newid(), '27557103', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Fgcjfajibijg'))
,(newid(), '37877731', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Gbebfaeikkdc'))
,(newid(), '51118059', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ghedfceiffjb'))
,(newid(), '35351261', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ddgadegcdfdb'))
,(newid(), '93030535', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Jjeejcacchaj'))
,(newid(), '28600879', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Edkccabajbbe'))
,(newid(), '12526337', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Icdjhakabfff'))
,(newid(), '21640583', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Gkfeaeaagajk'))
,(newid(), '61973787', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Kbaahhgdaiib'))
,(newid(), '89147928', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Dgkhbddejaci'))
,(newid(), '43800225', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ejfbdfbjhcbk'))
,(newid(), '92742039', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Fjgkijhkfije'))
,(newid(), '52316784', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Cbefgjgghfii'))
,(newid(), '47000937', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Kbfbciffcckj'))
,(newid(), '24318165', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Jejfkgfhkdfc'))
,(newid(), '75685392', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Biekbgekhkig'))
,(newid(), '81847767', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Hjjkbidgfhdc'))
,(newid(), '42754869', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Fheajiadeefa'))
,(newid(), '12684253', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Dekbbgfdhhhi'))
,(newid(), '73699999', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ghhjjfcbgckf'))
,(newid(), '39525821', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ahdaegkecdkd'))
,(newid(), '44115614', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ihibaebfadif'))
------------------------------------------------------------------------------------------------------------------
-- TS194001: Eén persoon met VOG om te zoeken vanuit beheerapp
------------------------------------------------------------------------------------------------------------------
,(newid(), '19400001', current_timestamp, (select id from personen where familienaam='Gevonden'))
------------------------------------------------------------------------------------------------------------------
-- TS194002: Eén persoon met 3 VOGs zonder houders
------------------------------------------------------------------------------------------------------------------
,(newid(), '19400002', current_timestamp, (select id from personen where familienaam='Houder met VOGS'))
,(newid(), '19400003', current_timestamp, (select id from personen where familienaam='Houder met VOGS'))
,(newid(), '19400004', current_timestamp, (select id from personen where familienaam='Houder met VOGS'))
------------------------------------------------------------------------------------------------------------------
-- TS194003: Eén persoon met 1 VOG en meerdere houders
------------------------------------------------------------------------------------------------------------------
,(newid(), '19400005', current_timestamp, (select id from personen where familienaam='Houders en VOGS'))
------------------------------------------------------------------------------------------------------------------
-- TS202001: 2 houders om te ontkoppelen vanuit beheerapp
------------------------------------------------------------------------------------------------------------------
,(newid(), '18590949', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Ontkoppelmijeen'))
------------------------------------------------------------------------------------------------------------------
-- TS203001: 1 persoon zonder koppeling voor uitschrijven via beheerapp
------------------------------------------------------------------------------------------------------------------
,(newid(), '95571589', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Uitschrijvenlukt'))
------------------------------------------------------------------------------------------------------------------
-- TS203002: 1 houder met koppeling voor uitschrijven via beheerapp
------------------------------------------------------------------------------------------------------------------
,(newid(), '93402534', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Uitschrijvenluktniet'))
------------------------------------------------------------------------------------------------------------------
-- TS182010: 1 houder met koppeling voor BRP niet beschikbaar
------------------------------------------------------------------------------------------------------------------
,(newid(), '93402534', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Doethetniet'))



