@ECHO OFF
CHCP 1251>nul
CD "%~dp0"
IF EXIST Upd (
  ECHO ����������.
  IF EXIST Upd.cmd DEL /F /Q Upd.cmd
  IF EXIST Upd.cmd (
    ECHO ������: �� ������� ������� ���� Upd.cmd 
    PAUSE
    EXIT
  )
  REN Upd Upd.cmd
  IF EXIST Upd (
    ECHO ������: �� ������� ��������� Upd 
    PAUSE
    EXIT
  )
  CALL Upd.cmd
  DEL /F /Q Upd.cmd
  IF EXIST Upd.cmd ECHO �� ������� ������� ���� Upd.cmd
)

IF EXIST files\UniExtract.au3 (
  ECHO ����������� UniExtract.exe
  ..\!!!Tools\bin\Aut2exe.exe /in files\UniExtract.au3 /out UniExtractsetup\UniExtract.exe /icon files\UniExtract.ico /nopack
)

IF EXIST UniExtractsetup\UniExtract.exe (
  IF EXIST ..\!!!Tools\makeSFX7z.cmd (
    CALL ..\!!!Tools\makeSFX7z "%~dp0"
  ) ELSE (
    ECHO ����������� ����� ..\!!!Tools (http://forum.oszone.net/thread-295084.html^)
  )
) ELSE (
  ECHO ����������� ���� UniExtract.exe
)

PAUSE
EXIT