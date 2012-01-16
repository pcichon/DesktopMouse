#include <string>
#include<windows.h>
#include<winuser.h>

#include "DesktopMouse.h"

using namespace System;
using namespace System::Drawing;
using namespace System::Drawing::Imaging;
using namespace System::IO;
using namespace System::Runtime::InteropServices;

extern "C"
{

	FREObject getMouseXY(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
	{
		POINT cursorPos;
        GetCursorPos(&cursorPos);

		FREObject value = argv[0];

		int x = (int) cursorPos.x;
		int y = (int) cursorPos.y;

		FREObject fX,fY;

		FRENewObjectFromInt32(x,&fX);
		FRENewObjectFromInt32(y,&fY);

		FRESetObjectProperty(value,(const uint8_t*)"x",fX,NULL);		
		FRESetObjectProperty(value,(const uint8_t*)"y",fY,NULL);	

		return NULL;
	}

	void contextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctions, const FRENamedFunction** functions)
	{
		*numFunctions = 1;

		FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * (*numFunctions));

		func[0].name = (const uint8_t*) "getMouseXY";
		func[0].functionData = NULL;
		func[0].function = &getMouseXY;

		*functions = func;
	}

	void contextFinalizer(FREContext ctx)
	{
		return;
	}

	void initializer(void** extData, FREContextInitializer* ctxInitializer, FREContextFinalizer* ctxFinalizer)
	{
		*ctxInitializer = &contextInitializer;
		*ctxFinalizer = &contextFinalizer;
	}

	void finalizer(void* extData)
	{
		return;
	}
}
