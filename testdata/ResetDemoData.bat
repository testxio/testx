call sqlcmd -U prk -P prk -S tcp:%1,1433 -d prk-o -i 01_cleanDatabase.sql
cd ..\..
cd Prkp.SolutionItems
call UploadHoudersCsv.bat %1
cd ..
cd Prkp.AutomatedTests\testdata
call sqlcmd -U prk -P prk -S tcp:%1,1433 -d prk-o -i demo.sql