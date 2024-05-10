#pragma once

#include "Rainier/Layer.h"

#include "Rainier/Events/ApplicationEvent.h"
#include "Rainier/Events/KeyEvent.h"
#include "Rainier/Events/MouseEvent.h"
 

namespace Rainier {

	class RAINIER_API ImGuiLayer : public Layer
	{
	public:
		ImGuiLayer();
		~ImGuiLayer();

		virtual void OnAttach() override;
		virtual void OnDetach() override;
		virtual void OnImGuiRender() override;

		void Begin();
		void End();
	private:
		float m_Time = 0.0f;
	};


}
