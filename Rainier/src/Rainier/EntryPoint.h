#pragma once

#ifdef RN_PLATFORM_WINDOWS

extern Rainier::Application* Rainier::CreateApplication();

int main(int argc, char**argv)
{
	auto app = Rainier::CreateApplication();
	app->Run();
	delete app;
}

#endif