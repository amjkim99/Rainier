#include <Rainier.h>

class Sandbox : public Rainier::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

Rainier::Application* Rainier::CreateApplication()
{
	return new Sandbox();
}