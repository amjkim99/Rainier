#pragma once

#ifdef RN_PLATFORM_WINDOWS

extern Rainier::Application* Rainier::CreateApplication();

int main(int argc, char**argv)
{
	Rainier::Log::Init();
	RN_CORE_WARN("Initialized Log!");

	auto app = Rainier::CreateApplication();
	app->Run();
	delete app;
}

#endif