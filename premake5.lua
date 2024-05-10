workspace "Rainier"
    architecture "x64"
    startproject "Sandbox"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "Rainier/vendor/GLFW/include"
IncludeDir["Glad"] = "Rainier/vendor/Glad/include"
IncludeDir["ImGui"] = "Rainier/vendor/imgui"
IncludeDir["glm"] = "Rainier/vendor/glm"

include "Rainier/vendor/GLFW"
include "Rainier/vendor/Glad"
include "Rainier/vendor/imgui"

project "Rainier"
    location "Rainier"
    kind "SharedLib"
    language "C++"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "rnpch.h"
    pchsource "Rainier/src/rnpch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
        "%{prj.name}/vendor/glm/glm/**.hpp",
        "%{prj.name}/vendor/glm/glm/**.inl"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}",
        "%{IncludeDir.glm}"
    }

    links
    {
        "GLFW",
        "Glad",
        "ImGui",
        "opengl32.lib"
    }

    filter "system:windows"
        cppdialect "C++20"
        staticruntime "off"
        systemversion "latest"

        defines
        {
            "RN_PLATFORM_WINDOWS",
            "RN_BUILD_DLL",
            "GLFW_INCLUDE_NONE"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
        }

    filter "configurations:Debug"
        defines "RN_DEBUG"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "RN_RELEASE"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        defines "RN_DIST"
        runtime "Release"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Rainier/vendor/spdlog/include",
        "Rainier/src",
        "Rainier/vendor",
        "%{IncludeDir.glm}"
    }

    links
    {
        "Rainier"
    }

    filter "system:windows"
        cppdialect "C++20"
        systemversion "latest"

        defines
        {
            "RN_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "RN_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "RN_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "RN_DIST"
        optimize "On"