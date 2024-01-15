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

project "Rainier"
    location "Rainier"
    kind "SharedLib"
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
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include"
    }

    filter "system:windows"
        cppdialect "C++20"
        staticruntime "On"
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
        symbols "On"

    filter "configurations:Release"
        defines "RN_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "RN_DIST"
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