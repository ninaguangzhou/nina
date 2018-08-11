echo off
 

 
rem 生成当前日期
FOR /F "TOKENS=1,2 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET yyyy=%%A
FOR /F "TOKENS=1,2 DELIMS=/ eol=/" %%A IN ('DATE/T') DO SET mm=%%B
FOR /F "TOKENS=2,3 DELIMS=/ " %%A IN ('DATE/T') DO SET dd=%%B
set date=%yyyy%%mm%%dd%
set tmp_time=%time:~-11,2%%time:~-8,2%%time:~-5,2%
set time=%tmp_time: =%
set d=%date%%time%
echo 当前日期: %d%

rem 创建文件夹
mkdir "report_%d%"

 
rem 获取用户输入的值
#set threadCount=
#set /p threadCount= 请输入线程数:
#set inSeconds=
#set /p inSeconds= 请输入启动周期(秒):
#set cycle=
#set /p cycle= 请输入循环次数:
#echo 线程数: %threadCount%, 启动周期(秒): %inSeconds%, 循环次数: %cycle%
 
rem 换行
echo.
 
rem 执行脚本
#call Jmeter.bat -JthreadCount=%threadCount% -JinSeconds=%inSeconds% -Jcycle=%cycle% -n -t 非GUI积分系统.jmx -l Jtl文件/积分系统_%d%.jtl -j Jtl文件/积分系统_%d%.log
call Jmetercmd.bat _%d%

pause 
