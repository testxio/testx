------------------------------------------------------------------------------------------------------------------
-- Filterdata: 27 personen met VOG gekoppeld aan 1 houder
------------------------------------------------------------------------------------------------------------------
insert into houders values(newid(), '19900101', 'KOV ICTU')
------------------------------------------------------------------------------------------------------------------
-- Houder met meerdere gekoppelde personen met gelijke zoekwaarde (filterresultaat -> alles)
------------------------------------------------------------------------------------------------------------------
,(newid(), '19900201', 'B.V. CSKF2')
------------------------------------------------------------------------------------------------------------------
-- Houder met voorloopnullen
------------------------------------------------------------------------------------------------------------------
,(newid(), '7435', 'KindVoorKind 7435')

------------------------------------------------------------------------------------------------------------------
-- Filterdata: 27 personen met VOG gekoppeld aan 1 houder
------------------------------------------------------------------------------------------------------------------
insert into personen (id, registratiedatum, bsn, status, voornamen, familienaam, tussenvoegsel,partnerfamilienaam, partnertussenvoegsel, indicatienaamgebruik) values
 (newid(), CURRENT_TIMESTAMP, '352198412', 100, 'Johan', 'Andersen', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '916950700', 100, 'Piet', 'Boom', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '790425385', 100, 'Klaas', 'Derks', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '995276249', 100, 'Tom', 'Jansen', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '644238665', 100, 'Victor', 'Janssen', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '283043696', 100, 'Eduardo', 'Mulder', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '648491729', 100, 'Almero', 'Bos', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '899602629', 100, 'Niels', 'Vos', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '355223387', 100, 'Michael', 'Peters', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '169072150', 100, 'Frank', 'Peeters', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '000040046', 100, 'Paul', 'Hendriks', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '140235759', 100, 'Peter', 'Dekker', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '779058380', 100, 'Pieter-Jan', 'Brouwer', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '552259615', 100, 'Sjaak', 'Bauer', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '726179450', 100, 'Janneke', 'Dijkstra', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '553966273', 100, 'Maaike', 'Smit', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '260939468', 100, 'Truus', 'Kök', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '622624945', 100, 'Henny', 'Verméülen', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '860282806', 100, 'Joop', 'Maas', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '628238137', 100, 'Albert', 'Verhoeven', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '552671976', 100, 'Johan', 'Koster', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '916642343', 100, 'Tom', 'Prins', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '618990173', 100, 'Vincent', 'Blom', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '175428918', 100, 'Vladimir', 'Kuiper', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '696840637', 100, 'Annie', 'Kuijpers', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '112999475', 100, 'Bor', 'Veenstra', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '432388461', 100, 'Tiny', 'Kramer', null, null, null, 0)
------------------------------------------------------------------------------------------------------------------
-- Houder met meerdere gekoppelde personen met gelijke zoekwaarde (filterresultaat -> alles)
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '205696636', 100, 'Piet', 'Klaassen', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '512756004', 100, 'Arie', 'Haan', null, null, null, 0)
,(newid(), CURRENT_TIMESTAMP, '706988176', 100, 'Truus', 'Baars', null, null, null, 0)
------------------------------------------------------------------------------------------------------------------
-- Persoon zonder koppelingen om te kunnen  uitschrijven
------------------------------------------------------------------------------------------------------------------
,(newid(), CURRENT_TIMESTAMP, '235805877', 100, 'Mieke', 'Goossens', null, null, null, 0)

UPDATE Personen SET GeboorteJaar = 1970, GeboorteMaand = 08, GeboorteDag = 13
------------------------------------------------------------------------------------------------------------------
-- Filterdata: 27 personen met VOG gekoppeld aan 1 houder
------------------------------------------------------------------------------------------------------------------ 
insert into vogs values
 (newid(), '20000001', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Andersen'))
,(newid(), '20000002', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Boom'))
,(newid(), '20000003', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Derks'))
,(newid(), '20000004', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Jansen'))
,(newid(), '20000005', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Janssen'))
,(newid(), '20000006', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Mulder'))
,(newid(), '20000007', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Bos'))
,(newid(), '20000008', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Vos'))
,(newid(), '20000009', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Peters'))
,(newid(), '20000010', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Peeters'))
,(newid(), '20000011', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Hendriks'))
,(newid(), '20000012', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Dekker'))
,(newid(), '20000013', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Brouwer'))
,(newid(), '20000014', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Bauer'))
,(newid(), '20000015', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Dijkstra'))
,(newid(), '20000016', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Smit'))
,(newid(), '20000017', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Kök'))
,(newid(), '20000018', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Verméülen'))
,(newid(), '20000019', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Maas'))
,(newid(), '20000020', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Verhoeven'))
,(newid(), '20000021', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Koster'))
,(newid(), '20000022', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Prins'))
,(newid(), '20000023', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Blom'))
,(newid(), '20000024', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Kuiper'))
,(newid(), '20000025', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Kuijpers'))
,(newid(), '20000026', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Veenstra'))
,(newid(), '20000027', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Kramer'))
------------------------------------------------------------------------------------------------------------------
-- Houder met meerdere gekoppelde personen met gelijke zoekwaarde (filterresultaat -> alles)
------------------------------------------------------------------------------------------------------------------
,(newid(), '12300025', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Klaassen'))
,(newid(), '12300026', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Haan'))
,(newid(), '12300027', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Baars'))
------------------------------------------------------------------------------------------------------------------
-- Persoon zonder koppelingen om te kunnen  uitschrijven
------------------------------------------------------------------------------------------------------------------
,(newid(), '13300025', '2014-12-09 09:03:40.000', (select id from personen where familienaam='Goossens'))

------------------------------------------------------------------------------------------------------------------
-- Filterdata: 27 personen met VOG gekoppeld aan 1 houder
------------------------------------------------------------------------------------------------------------------
insert into koppelingen values(newid(), '2014-12-09 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Andersen'))
,(newid(), '2014-12-08 08:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Boom'))
,(newid(), '2014-12-07 07:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Derks'))
,(newid(), '2014-12-06 06:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Jansen'))
,(newid(), '2014-12-05 05:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Janssen'))
,(newid(), '2014-12-04 04:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Mulder'))
,(newid(), '2014-12-03 03:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Bos'))
,(newid(), '2014-12-02 02:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Vos'))
,(newid(), '2014-12-01 01:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Peters'))
,(newid(), '2014-11-30 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Peeters'))
,(newid(), '2014-11-29 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Hendriks'))
,(newid(), '2014-12-04 04:40:12.000', (select id from houders where Naam='KindVoorKind 7435'), (select id from personen where familienaam='Hendriks'))
,(newid(), '2014-11-28 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Dekker'))
,(newid(), '2014-11-27 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Brouwer'))
,(newid(), '2014-11-26 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Bauer'))
,(newid(), '2014-11-25 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Dijkstra'))
,(newid(), '2014-11-24 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Smit'))
,(newid(), '2014-11-23 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Kök'))
,(newid(), '2014-11-22 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Verméülen'))
,(newid(), '2014-11-21 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Maas'))
,(newid(), '2014-11-20 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Verhoeven'))
,(newid(), '2014-11-19 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Koster'))
,(newid(), '2014-11-18 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Prins'))
,(newid(), '2014-11-17 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Blom'))
,(newid(), '2014-11-16 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Kuiper'))
,(newid(), '2014-11-15 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Kuijpers'))
,(newid(), '2014-11-14 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Veenstra'))
,(newid(), '2014-11-13 09:40:12.000', (select id from houders where Naam='KOV ICTU'), (select id from personen where familienaam='Kramer'))
------------------------------------------------------------------------------------------------------------------
-- Houder met meerdere gekoppelde personen met gelijke zoekwaarde (filterresultaat -> alles)
------------------------------------------------------------------------------------------------------------------
,(newid(), '2014-11-15 09:40:12.000', (select id from houders where Naam='B.V. CSKF2'), (select id from personen where familienaam='Klaassen'))
,(newid(), '2014-11-14 09:40:12.000', (select id from houders where Naam='B.V. CSKF2'), (select id from personen where familienaam='Haan'))
,(newid(), '2014-11-13 09:40:12.000', (select id from houders where Naam='B.V. CSKF2'), (select id from personen where familienaam='Baars'))