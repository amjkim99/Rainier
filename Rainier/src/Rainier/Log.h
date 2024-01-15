#pragma once

#include <memory>

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Rainier {

	class RAINIER_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
	};

}

// Core log macros
#define RN_CORE_TRACE(...)		::Rainier::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define RN_CORE_INFO(...)		::Rainier::Log::GetCoreLogger()->info(__VA_ARGS__)
#define RN_CORE_WARN(...)		::Rainier::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define RN_CORE_ERROR(...)		::Rainier::Log::GetCoreLogger()->error(__VA_ARGS__)
#define RN_CORE_CRITICAL(...)	::Rainier::Log::GetCoreLogger()->critical(__VA_ARGS__)

// Client log macros
#define RN_TRACE(...)		::Rainier::Log::GetClientLogger()->trace(__VA_ARGS__)
#define RN_INFO(...)		::Rainier::Log::GetClientLogger()->info(__VA_ARGS__)
#define RN_WARN(...)		::Rainier::Log::GetClientLogger()->warn(__VA_ARGS__)
#define RN_ERROR(...)		::Rainier::Log::GetClientLogger()->error(__VA_ARGS__)
#define RN_CRITICAL(...)	::Rainier::Log::GetClientLogger()->critical(__VA_ARGS__)