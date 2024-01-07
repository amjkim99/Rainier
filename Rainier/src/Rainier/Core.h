#pragma once

#ifdef RN_PLATFORM_WINDOWS
	#ifdef RN_BUILD_DLL
		#define RAINIER_API __declspec(dllexport)
	#else
		#define RAINIER_API __declspec(dllimport)
	#endif
#else
	#error Rainier only supports Windows!
#endif