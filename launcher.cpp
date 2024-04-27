#include "launcher.h"

#include <cstdint>
#include <cstdlib>
#include <iterator>
#include <regex>
#include <string>

#ifndef LAUNCHER_NO_OPTIONS_CHECKING
#include <cstring>
#include <iostream>
#include <filesystem>
#include <stdexcept>
#include <string>
#include <string_view>
#endif

int main(int argc, const char* argv[])
{
#ifndef LAUNCHER_NO_OPTIONS_CHECKING
	try
	{
		std::cout << "\033[1;34m[DEBUG]:\033[0m Running `preInit()` function\n";
#endif
		preInit(argc, argv);
#ifndef LAUNCHER_NO_OPTIONS_CHECKING
	}
	catch(const std::exception& error)
	{
		std::cerr << "\033[31m[ERROR]:\033[0m " << error.what() << '\n';

		std::exit(EXIT_FAILURE);
	}

	//Lambda for runtime assert
	auto runtime_assert = [&](bool opt, std::string_view errorMessage)
	{
		if(opt) return;

		std::cerr << "\033[31m[ERROR]:\033[0m " << errorMessage;

		std::exit(EXIT_FAILURE);
	};

	//Check if variable types weren't modified
	static_assert
	(
		sizeof(**ENVIRONMENT_VARIABLES) == sizeof(char),
		"Edited type of environment variables, supposed to be `const char*`"
	);
	static_assert
	(
		sizeof(*EXECUTABLE_PATH) == sizeof(char),
		"Edited type of executable path, supposed to be `const char*`"
	);

	//Check if there are 3 options
	static_assert(std::size(ENVIRONMENT_VARIABLES) % 3 == 0, "Incorrect format of options specified");

	//Check if every third option is either true or false
	for(std::size_t i = 2; i < std::size(ENVIRONMENT_VARIABLES); i += 3)
	{
		runtime_assert
		(
			std::strcmp(ENVIRONMENT_VARIABLES[i], "true") == 0 || std::strcmp(ENVIRONMENT_VARIABLES[i], "false") == 0,
			"Invalid Option at index: " + std::to_string(i)+ ". can either be true or false, currently: \"" + ENVIRONMENT_VARIABLES[i] + "\"\n"
		);
	}

	//Check if file path is valid
	runtime_assert
	(
		std::filesystem::exists(EXECUTABLE_PATH),
		"Path \"" + std::string{EXECUTABLE_PATH} + "\" invalid. The current working directory is \"" + std::string{std::filesystem::current_path()} + "\"\n"
	);

#endif

	//Iterate over set variables
	for(std::size_t i{}; i < std::size(ENVIRONMENT_VARIABLES); i += 3)
	{
		if(std::getenv(ENVIRONMENT_VARIABLES[i]) != nullptr && std::strcmp(ENVIRONMENT_VARIABLES[i + 2], "false") == 0)
		{
#ifndef LAUNCHER_NO_OPTIONS_CHECKING
			std::cout << "\033[33m[ALERT]:\033[0m "
			<< "Environment: \"" << ENVIRONMENT_VARIABLES[i] << "\" is already set to: \""
			<< std::getenv(ENVIRONMENT_VARIABLES[i]) << "\". Set `override` flag to \"true\" to avoid this, or leave as-is\n";
#endif
			continue;
		}

#if defined(_WIN32) || defined(_WIN64)  //Set environment variable for windows
	#ifndef LAUNCHER_NO_OPTIONS_CHECKING
		runtime_assert
		(
			_putenv_s(ENVIRONMENT_VARIABLES[i], ENVIRONMENT_VARIABLES[i + 1]) == 0,
			"Failed to set enviornment variable: \"" + std::string{ENVIRONMENT_VARIABLES[i]} + "\".\n"
		);
	#else
		if(_putenv_s(ENVIRONMENT_VARIABLES[i], ENVIRONMENT_VARIABLES[i + 1]) != 0) return EXIT_FAILURE;
	#endif
#else  //Set environment variable for POSIX
	#ifndef LAUNCHER_NO_OPTIONS_CHECKING
		runtime_assert
		(
			setenv(ENVIRONMENT_VARIABLES[i], ENVIRONMENT_VARIABLES[i + 1], 1) == 0,
			"Failed to set enviornment variable: \"" + std::string{ENVIRONMENT_VARIABLES[i]} + "\".\n"
		);
	#else
		if(setenv(ENVIRONMENT_VARIABLES[i], ENVIRONMENT_VARIABLES[i + 1], 1) == 0) return EXIT_FAILURE;
	#endif
#endif

#ifndef LAUNCHER_NO_OPTIONS_CHECKING
		std::cout << "\033[1;34m[DEBUG]:\033[0m "
		<< "Setting environment variable: \"" << ENVIRONMENT_VARIABLES[i] << "\" to \"" << ENVIRONMENT_VARIABLES[i + 1] << "\"\n";
#endif
	}

	const std::regex REPLACE_REGEX{R"([\\/])"};

#if defined(_WIN32) || defined(_WIN64)  //std::filesystem::make_preferred()
	std::string executableCommand = std::regex_replace(EXECUTABLE_PATH, REPLACE_REGEX, R"(\)");
#else  //std::filesystem::make_preferred()
	std::string executableCommand = std::regex_replace(EXECUTABLE_PATH, REPLACE_REGEX, R"(/)");
#endif

#ifndef LAUNCHER_NO_OPTIONS_CHECKING
		std::cout << "\033[1;34m[DEBUG]:\033[0m Launching Application at: " << executableCommand << "\n";
#endif

#if defined(_WIN32) || defined(_WIN64)  //Run application for windows
	const int result = std::system(("powershell -Command \"& {.\\\"" + executableCommand + "\"}\"").c_str());
#else  //Run application for UNIX
	const int result = std::system(("./\"" + executableCommand + "\"").c_str());
#endif

#ifndef LAUNCHER_NO_OPTIONS_CHECKING
		std::cout << "\033[1;34m[DEBUG]:\033[0m Running `postInit()` function\n";
#endif

	postInit(argc, argv);

	return result;
}