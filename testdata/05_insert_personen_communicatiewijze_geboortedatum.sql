------------------------------------------------------------------------------------------------------------------
-- TS166005: Eén persoon met post als default, geen keuze gemaakt (code 0)
------------------------------------------------------------------------------------------------------------------
insert into personen (id, registratiedatum, bsn, status, voornamen, familienaam, tussenvoegsel,partnerfamilienaam, partnertussenvoegsel, indicatienaamgebruik, geboortedag, geboortemaand, geboortejaar, huidigkanaal) values
 (newid(), CURRENT_TIMESTAMP, '485688918', 100, 'Email', 'Defaultkeuzeopslaan', null, null, null, 0, 23, 6, 1980, 0)
------------------------------------------------------------------------------------------------------------------
-- TS166006: Eén persoon met post als default, geen keuze gemaakt (code 0)
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '103278783', 100, 'Post', 'Defaultkeuzebevestigen', null, null, null, 0, 23, 6, 1980, 0)
------------------------------------------------------------------------------------------------------------------
-- TS182010: Eén persoon om error response van BRP op te roepen (code 0)
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '116274773', 100, 'Brpdoetniet', 'Doethetniet', null, null, null, 0, 23, 6, 1980, 0)
------------------------------------------------------------------------------------------------------------------
-- TS182012: Eén persoon met alleen geboortejaar bekend om error response van BRP op te roepen
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '030245448', 100, 'Brpalleenjaar', 'Geballeenjaar', null, null, null, 0, 0, 0, 1980, 0)
