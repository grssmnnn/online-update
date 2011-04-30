@ECHO OFF
SETLOCAL
SET BASEDIR=%~dp0

REM TODO:Python�̗L�����`�F�b�N����B

REM ���𒲍�����B
IF EXIST "%BASEDIR%"vim-online-update.py GOTO FOUND_CURR
IF EXIST "%BASEDIR%"online-update\vim-online-update.py GOTO FOUND_BOTTOM
ECHO �X�V�p�X�N���v�g��������܂���B
GOTO END_FAILURE
:FOUND_CURR
SET SCRIPT=%BASEDIR%vim-online-update.py
SET TARGET_DIR=%BASEDIR%var\vim73
GOTO START_UPDATE
:FOUND_BOTTOM
SET SCRIPT=%BASEDIR%online-update\vim-online-update.py
SET TARGET_DIR=%BASEDIR%
SET PYTHONPATH=%BASEDIR%online-update
GOTO START_UPDATE

:START_UPDATE
ECHO Vim�̕������ł��B���΂炭���҂����������B
CD "%BASEDIR%"
IF EXIST %TARGET_DIR%var\online-update\recipe.txt DEL /F /Q %TARGET_DIR%var\online-update\recipe.txt
python "%SCRIPT%" %TARGET_DIR%
REM TODO:�G���[����
GOTO END_SUCCESS

:END_FAILURE
ECHO Vim�̕����Ɏ��s���܂����B
GOTO END
:END_SUCCESS
ECHO Vim�̕������������܂����B
GOTO END
:END
ECHO ��10�b��ɂ��̃E�B���h�E�͎����I�ɕ��܂��B
PING localhost -n 10 > nul
