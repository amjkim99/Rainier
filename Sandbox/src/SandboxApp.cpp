#include <Rainier.h>

#include "imgui/imgui.h"

class ExampleLayer : public Rainier::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	virtual void OnUpdate() override
	{
		if (Rainier::Input::IsKeyPressed(RN_KEY_TAB))
			RN_TRACE("Tab key is pressed (poll)");
	}

	virtual void OnImGuiRender() override
	{

	}

	virtual void OnEvent(Rainier::Event& event) override
	{
		if (event.GetEventType() == Rainier::EventType::KeyPressed)
		{
			Rainier::KeyPressedEvent& e = (Rainier::KeyPressedEvent&)event;
			if (e.GetKeyCode() == RN_KEY_TAB)
				RN_TRACE("Tab key is pressed (event)");

		}
	}
};

class Sandbox : public Rainier::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
	}

	~Sandbox()
	{

	}
};

Rainier::Application* Rainier::CreateApplication()
{
	return new Sandbox();
}