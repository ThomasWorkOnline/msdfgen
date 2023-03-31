project "msdfgen"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "Off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"msdfgen.h",
		"resource.h",
		"core/*.h",
		"core/*.hpp",
		"core/*.cpp"
	}

	includedirs
	{
	}

	links
	{
	}

	defines
	{
		"MSDFGEN_PUBLIC=" -- static link
	}

	flags
	{
		"FatalCompileWarnings",
		"ShadowedVariables"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
		}

		libdirs
		{
		}

	filter "system:macosx"
		files
		{
		}

		includedirs
		{
		}

	filter "system:linux"
		files
		{
		}

		links
		{
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

		links
		{
		}

		libdirs
		{
		}

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
		symbols	"On"

		links
		{
		}

		libdirs
		{
		}

	filter "configurations:Dist"
		runtime "Release"
		optimize "Full"
		symbols "Off"

		links
		{
		}

		libdirs
		{
		}

	filter { "configurations:Release", "system:windows" }
		flags
		{
			"LinkTimeOptimization"
		}

	filter { "configurations:Dist", "system:windows" }
		flags
		{
			"LinkTimeOptimization"
		}