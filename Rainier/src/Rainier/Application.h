#pragma once

#include "Core.h"
#include "Events/Event.h"

namespace Rainier {

	class RAINIER_API Application
	{
	public:
		Application();

		virtual ~Application();

		void Run();
	};

	Application* CreateApplication();
}

