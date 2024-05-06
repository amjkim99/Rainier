#pragma once

#include "Core.h"
#include "Window.h"
#include "Rainier/LayerStack.h"
#include "Rainier/Events/Event.h"
#include "Rainier/Events/ApplicationEvent.h"

#include "Window.h"

namespace Rainier {

	class RAINIER_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);

		void PushLayer(Layer* layer);
		void PushOverlay(Layer* overlay);

		inline Window& GetWindow() { return *m_Window; }
		inline static Application& Get() { return *s_Instance; }
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
		LayerStack m_LayerStack;
	private:
		static Application* s_Instance;
	};

	Application* CreateApplication();
}

