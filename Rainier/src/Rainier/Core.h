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

#ifdef RN_ENABLE_ASSERTS
	#define RN_ASSERT(x, ...) { if(!(x)) { RN_ERROR("Assertion failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define RN_CORE_ASSERT(x, ...) { if(!(x)) { RN_ERROR("Assertion failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define RN_ASSERT(x, ...)
	#define RN_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)
