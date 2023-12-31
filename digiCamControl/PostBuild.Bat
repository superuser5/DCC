REM %1 = Solution Directory
REM %2 = $(ConfigurationName) Debug/Release

rem Copy additional Files
xcopy %1CameraControl.Application %1CameraControl\Bin\%2\ /Y /E /R /I /D
xcopy %1CameraControl.Application\*.* %1CameraControl\Bin\%2\ /Y

rem Copy additional Files
if not exist %1CameraControl\Bin\%2\Plugins MD %1CameraControl\Bin\%2\Plugins
rem copy %1CameraControl.Plugins\Bin\%2\CameraControl.Plugins.* %1CameraControl\Bin\%2\Plugins\ /Y

rem Copy any certificates
xcopy %1CameraControl\Net\cert\*.pfx %1CameraControl\Bin\%2\Net\cert /Y /E /R /I

rem Copy the certificate Installer
if not exist %1CameraControl\Bin\%2\Tools MD %1CameraControl\Bin\%2\Tools
xcopy %1CertificateInstaller\Bin\%2\CertificateInstaller.exe %1CameraControl\Bin\%2\Tools\ /R /Y

rem Copy the Image Software Configurator - put at the main level due to dependencies
xcopy %1ImageSoftwareConfig\Bin\%2\ImageSoftwareConfig.exe %1CameraControl\Bin\%2\ /R /Y

REM Moved to MtpTester to avoid build order issues
REM copy %1MtpTester\Bin\%2\MtpTester.exe %1CameraControl\Bin\%2\ /Y
REM echo %ERRORLEVEL% >> c:/temp/tmp.txt
REM Moved to DccObsPlugin to avoid build order issues
REM copy %1DccObsPlugin\Bin\%2\DccObsPlugin.dll %1CameraControl\Bin\%2\ObsPlugin\CLRHostPlugin\ /Y
REM echo %ERRORLEVEL% >> c:/temp/tmp.txt
