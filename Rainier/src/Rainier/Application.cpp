#include "rnpch.h"
#include "Application.h"

#include "Rainier/Events/ApplicationEvent.h"
#include "Rainier/Log.h"

namespace Rainier {

	Application::Application()
	{
		m_Window = std::unique_ptr<Window>(Window::Create());
	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		while (m_Running)
		{
			m_Window->OnUpdate();
		}
	}
}