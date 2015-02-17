------------------------------------------------------------------------------------------------------------------
-- TS165003: Eén persoon met VOG om tweede VOG aan toe te voegen
------------------------------------------------------------------------------------------------------------------
insert into personen (id, registratiedatum, bsn, status, voornamen, familienaam, tussenvoegsel,partnerfamilienaam, partnertussenvoegsel, indicatienaamgebruik) values
 (newid(), CURRENT_TIMESTAMP, '064400669', 100, 'Tweede', 'Vogtoevoegen', null, null, null, 0)
------------------------------------------------------------------------------------------------------------------
-- TS165004: Eén persoon met VOG om ongeldige VOGs aan toe te voegen vanaf inlogpagina
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '567003759', 100, 'Extra', 'Vognietgeldig', null, null, null, 0)
------------------------------------------------------------------------------------------------------------------
-- TS170002: Eén persoon met meerdere houders gekoppeld
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '218720798', 100, 'Meerdere', 'Houders', 'van de', null, null, 0)
 ------------------------------------------------------------------------------------------------------------------
-- TS171001: Twee personen voor uitschrijving, één gekoppeld aan een houder
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '158026548', 100, 'Uit', 'Schrijven', 'te', null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '300853919', 100, 'Nog', 'Gekoppeld', null, null, null, 0)
------------------------------------------------------------------------------------------------------------------
-- TS179008: 25+ personen met VOG gekoppeld aan 1 houder voor onthouden sorteer/pagineer voorkeuren
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '886872935', 100, 'Aaron', 'Atestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '976715715', 100, 'Abbas', 'Btestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '347532111', 100, 'Abdel', 'Ctestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '876317128', 100, 'Abdul', 'Dtestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '807240564', 100, 'Abram', 'Etestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '988787015', 100, 'Adams', 'Ftestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '245692204', 100, 'Adaya', 'Gtestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '229470877', 100, 'Adiel', 'Htestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '682277137', 100, 'Adnan', 'Itestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '738646659', 100, 'Adolf', 'Jtestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '455365313', 100, 'Adrie', 'Ktestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '327061856', 100, 'Aedan', 'Ltestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '160700590', 100, 'Aeron', 'Mtestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '973982263', 100, 'Ahmad', 'Ntestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '171269639', 100, 'Ahmed', 'Otestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '920209075', 100, 'Ahmet', 'Ptestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '863464944', 100, 'Aidan', 'Qtestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '324408249', 100, 'Aiden', 'Rtestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '366749067', 100, 'Aimé ', 'Stestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '797607869', 100, 'Airen', 'Ttestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '723355125', 100, 'Aissa', 'Utestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '709124235', 100, 'Akira', 'Vtestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '172358802', 100, 'Akram', 'Wtestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '646518756', 100, 'Alain', 'Xtestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '405557309', 100, 'Alano', 'Ytestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '978342896', 100, 'Albin', 'Ztestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '844668400', 100, 'Alden', 'Aatestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '181952439', 100, 'Alfie', 'Cctestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '136755409', 100, 'Allal', 'Ddtestvoorkeur', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '547900193', 100, 'Allan', 'Zztestvoorkeur', null, null, null, 0)
 ------------------------------------------------------------------------------------------------------------------
-- TS182001: 2 personen en 1 houder om aan elkaar te koppelen
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '178747713', 100, 'Eerste', 'Koppeltesteen', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '364363472', 100, 'Tweede', 'Koppeltesttwee', null, null, null, 0)
 ------------------------------------------------------------------------------------------------------------------
-- TS182002: persoon en 1 houder om aan elkaar te koppelen en ongedaan te maken
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '060020106', 100, 'Derde', 'Koppeltestdrie', null, null, null, 0)
 ------------------------------------------------------------------------------------------------------------------
-- TS182003: persoon en 1 houder om aan elkaar te koppelen voor backend validatie
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '199283011', 100, 'Vierde', 'Koppeltestvier', null, null, null, 0)
------------------------------------------------------------------------------------------------------------------
-- TS182005: 2 houders koppelen 1 persoon
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '080535483', 100, 'Vijfde', 'Koppeltestvijf', null, null, null, 0)
------------------------------------------------------------------------------------------------------------------
-- TS194001: Eén persoon met VOG om te zoeken vanuit beheerapp
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '021117755', 100, 'Heeft', 'Gevonden', 'het', null, null, 0)
------------------------------------------------------------------------------------------------------------------
-- TS194002: Eén persoon met VOGs zonder houders voor controle op details persoon
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '947443307', 100, 'Zonder', 'Houder met VOGS', null, null, null, 0)
------------------------------------------------------------------------------------------------------------------
-- TS194003: Eén persoon met VOGs en gekoppelde houders voor controle op details persoon
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '708730528', 100, 'Met', 'Houders en VOGS', null, null, null, 0)
------------------------------------------------------------------------------------------------------------------
-- TS202001: 2 houders om te ontkoppelen vanuit beheerapp
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '471715815', 100, 'Paul', 'Ontkoppelmijeen', null, null, null, 0)
------------------------------------------------------------------------------------------------------------------
-- TS203001: 1 persoon zonder koppeling voor uitschrijven via beheerapp
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '608582281', 100, 'Timo', 'Uitschrijvenlukt', null, null, null, 0)
------------------------------------------------------------------------------------------------------------------
-- TS203002: 1 houder met koppeling voor uitschrijven via beheerapp
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '133352092', 100, 'Johan', 'Uitschrijvenluktniet', null, null, null, 0)