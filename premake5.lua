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

include "Rainier/vendor/GLFW"

project "Rainier"
    location "Rainier"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "rnpch.h"
    pchsource "Rainier/src/rnpch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}"
    }

    links
    {
        "GLFW",
        "opengl32.lib"
    }

    filter "system:windows"
        cppdialect "C++20"
        staticruntime "off"
        systemversion "latest"

        defines
        {
            "RN_PLATFORM_WINDOWS",
            "RN_BUILD_DLL"
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
        "Rainier/src"
    }

    links
    {
        "Rainier"
    }

    filter "system:windows"
        cppdialect "C++20"
        staticruntime "On"
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