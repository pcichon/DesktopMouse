echo SDK_PATH before running
pause


"SDK_PATH\adt.bat" -package -storetype pkcs12 -keystore test.p12 -storepass test -target ane DesktopMouse.ane extension.xml -swc DesktopMouse.swc -platform Windows-x86 library.swf DesktopMouse.dll