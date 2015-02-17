call sqlcmd -U prk -P prk -S tcp:%1,1433 -d prk-o -i 01_cleanDatabase.sql
cd ..\..
cd Prkp.SolutionItems
call UploadHoudersCsv.bat %1
cd ..
cd Prkp.AutomatedTests\testdata
call sqlcmd -U prk -P prk -S tcp:%1,1433 -d prk-o -i 02_insert_houders.sql
call sqlcmd -U prk -P prk -S tcp:%1,1433 -d prk-o -i 03_insert_personen_familienaam.sql
call sqlcmd -U prk -P prk -S tcp:%1,1433 -d prk-o -i 04_insert_personen_volledige_naam.sql
call sqlcmd -U prk -P prk -S tcp:%1,1433 -d prk-o -i 05_insert_personen_communicatiewijze_geboortedatum.sql
call sqlcmd -U prk -P prk -S tcp:%1,1433 -d prk-o -i 06_insert_vogs.sql
call sqlcmd -U prk -P prk -S tcp:%1,1433 -d prk-o -i 07_insert_koppelingen.sql