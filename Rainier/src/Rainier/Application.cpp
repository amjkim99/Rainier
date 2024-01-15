#include "Application.h"

#include "Rainier/Events/ApplicationEvent.h"
#include "Rainier/Log.h"

namespace Rainier {

	Application::Application() {

	}

	Application::~Application() {

	}

	void Application::Run() {
		WindowResizeEvent e(1280, 720);
		RN_TRACE(e);
		while (true);
	}
}