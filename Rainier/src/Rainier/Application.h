#pragma once

#include "Core.h"

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

