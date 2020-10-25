Rem cd /d %~dp0

 REM ログファイルの名前
SET LOGNAME=L_COPY_F
 REM 保存場所
SET DstName=D:\HDD\
 REM Xcopyのオプション
SET OPTION=/S /MIR /NP /TEE /R:1 /W:1 /XJ
 REM 除外ファイル名
SET ExcludeFile=/XF *$~* *~$* *~WRL* *.tmp *.temp IMG00001.DAT *.bkf *.qic *.iso *.img *.mp3 *.wmv *.wma outlook.pst Thumbs.db pspbrwse.jbf pagefile.sys win386.swp catalog.wci *.ci *.0 *.1 *.2 *.3 *.4 *.5 *.6 *.7 *.8 *.9 *.000 *.001 *.002 *.003 *.004 *.005 *.006 *.007 *.008 *.009 *.log *@done *@work *@backup hiberfil.sys swapfile.sys *.mum *.cat *.dll CentOS-7-x86_64-DVD-1810.iso *.vmem
 REM 除外フォルダ名
SET ExcludeDir=/XD "Application Data" "System Volume Information" $RECYCLE.BIN $Windows.~BT Temp MSOCache PerfLogs Logs System32 Intel McAfee Panther PLA Tasks ReportArchive WinSxS "Package Cache" Packages ProgramData Cookies Windows.old

REM バックアップドライブ名（以下5行はドライブ毎に使いまわせる）
SET DrvName=F
cd %DrvName%:\
md %DstName%%DrvName%
robocopy %DrvName%: "%DstName%%DrvName%" %OPTION% %ExcludeDir% %ExcludeFile% /log:"%DstName%%LOGNAME%_%DrvName%.log"
ATTRIB %DstName%%DrvName% -H -S

SET DrvName=
SET SrcName=
SET DstName=
SET DirName=
SET SrcFile=
SET ExcludeFile=
SET ExcludeDir=
SET OPTION=
SET LOGNAME=
