echo off
 

 
rem ���ɵ�ǰ����
FOR /F "TOKENS=1,2 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET yyyy=%%A
FOR /F "TOKENS=1,2 DELIMS=/ eol=/" %%A IN ('DATE/T') DO SET mm=%%B
FOR /F "TOKENS=2,3 DELIMS=/ " %%A IN ('DATE/T') DO SET dd=%%B
set date=%yyyy%%mm%%dd%
set tmp_time=%time:~-11,2%%time:~-8,2%%time:~-5,2%
set time=%tmp_time: =%
set d=%date%%time%
echo ��ǰ����: %d%

rem �����ļ���
mkdir "report_%d%"

 
rem ��ȡ�û������ֵ
#set threadCount=
#set /p threadCount= �������߳���:
#set inSeconds=
#set /p inSeconds= ��������������(��):
#set cycle=
#set /p cycle= ������ѭ������:
#echo �߳���: %threadCount%, ��������(��): %inSeconds%, ѭ������: %cycle%
 
rem ����
echo.
 
rem ִ�нű�
#call Jmeter.bat -JthreadCount=%threadCount% -JinSeconds=%inSeconds% -Jcycle=%cycle% -n -t ��GUI����ϵͳ.jmx -l Jtl�ļ�/����ϵͳ_%d%.jtl -j Jtl�ļ�/����ϵͳ_%d%.log
call Jmetercmd.bat _%d%

pause 
