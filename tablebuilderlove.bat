SET c2a=%~dp0tools\c2a.py
SET FE4c2a=%~dp0tools\FE4c2a.py

cd %~dp0Love_Tables
for %%t in (*.csv) do (
		call python "%c2a%" "%%t" "%%~nt.csv.asm"
)
pause

