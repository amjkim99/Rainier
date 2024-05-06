#include <Rainier.h>

class Sandbox : public Rainier::Application
{
public:
	Sandbox()
	{
		PushOverlay(new Rainier::ImGuiLayer());
	}

	~Sandbox()
	{

	}
};

Rainier::Application* Rainier::CreateApplication()
{
	return new Sandbox();
}