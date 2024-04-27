#include "launcher.h"

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

#if defined(_WIN32) || defined(_WIN64)
#include <direct.h>
#include <io.h>
#define F_OK 0
#define access _access
#define getcwd _getcwd
#else
#include <unistd.h>
#endif

#ifndef LAUNCHER_NO_OPTIONS_CHECKING
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>

void assert(bool opt, const char* message)
{
	if(opt) return;

	fprintf(stderr, "\033[31m[ERROR]:\033[0m %s", message);

	exit(EXIT_FAILURE);
}

void free_assert(bool opt, char* message)
{
	if(opt) return;

	fprintf(stderr, "\033[31m[ERROR]:\033[0m %s", message);

	free(message);

	exit(EXIT_FAILURE);
}

char* msprintf(const char* format,...)
{
	va_list args;
	va_start(args, format);

	const size_t errLength = vsnprintf(NULL, 0, format, args);
	char* message = malloc(errLength + 1);

	assert(message != NULL, "malloc() failed for message\n");

	vsprintf(message, format, args);

	va_end(args);

	return message;
}

char* mgetCurrentDirectory(void)
{
	char* cwd = NULL;
	size_t size = 1024;

	do
	{
		cwd = realloc(cwd, size);

		if(cwd == NULL)
		{
			perror("realloc() error");

			if(size != 1024) free(cwd);

			exit(EXIT_FAILURE);
		}

		if (getcwd(cwd, size) == NULL)
		{
			perror("getcwd() error");
			free(cwd);

			exit(EXIT_FAILURE);
		}

		size *= 2;

	} while(cwd == NULL);

	return cwd;
}

#endif

#define SIZE(array) (sizeof(array) / sizeof(array[0]))

char* mMakePreferred(const char* path)
{
	const size_t size = strlen(path);

	char* result = malloc(size);

	assert(result != NULL, "malloc() failed for result\n");

	memcpy(result, path, size);

	for(char* p = result; p != result + size; ++p)
	{
		switch(*p)
		{
			case '/':  //Fallthrough
			case '\\':
			{
#if defined(_WIN32) || defined(_WIN64)
				*p = '\\';
#else
				*p = '/';
#endif
			}
			default: break;
		}
	}

	return result;
}

int main(int argc, const char* argv[])
{
#ifndef LAUNCHER_NO_OPTIONS_CHECKING
		printf("\033[1;34m[DEBUG]:\033[0m Running `preInit()` function\n");
#endif

	preInit(argc, argv);

#ifndef LAUNCHER_NO_OPTIONS_CHECKING
	//Check if variable types weren't modified
	assert
	(
		sizeof(**ENVIRONMENT_VARIABLES) == sizeof(char),
		"Edited type of environment variables, supposed to be `const char*`\n"
	);
	assert
	(
		sizeof(*EXECUTABLE_PATH) == sizeof(char),
		"Edited type of executable path, supposed to be `const char*`\n"
	);

	//Check if there are 3 options
	assert(SIZE(ENVIRONMENT_VARIABLES) % 3 == 0, "Incorrect format of options specified\n");

	//Check if every third option is either true or false
	for(size_t i = 2; i < SIZE(ENVIRONMENT_VARIABLES); i += 3)
	{
		char* error = msprintf("Invalid Option at index: %d. Can either be true or false, currently: \"%s\"\n", i, ENVIRONMENT_VARIABLES[i]);

		free_assert(strcmp(ENVIRONMENT_VARIABLES[i], "true") == 0 || strcmp(ENVIRONMENT_VARIABLES[i], "false") == 0, error);

		free(error);
	}

	char* cwd = mgetCurrentDirectory();
	char* error = msprintf("Path \"%s\" invalid. The current working directory is \"%s\"\n", EXECUTABLE_PATH, cwd);

	free(cwd);

	//Check if file path is valid
	free_assert
	(
		access(EXECUTABLE_PATH, F_OK) == 0,
		error
	);

	free(error);

#endif

	//Iterate over set variables
	for(size_t i = 0; i < SIZE(ENVIRONMENT_VARIABLES); i += 3)
	{
		if(getenv(ENVIRONMENT_VARIABLES[i]) != NULL && strcmp(ENVIRONMENT_VARIABLES[i + 2], "false") == 0)
		{
#ifndef LAUNCHER_NO_OPTIONS_CHECKING
			printf
			(
				"\033[33m[ALERT]:\033[0m Environment variable: \"%s\" is already set to: \"%s\". Set `override flag to \"true\" to avoid this, or leave as-is\n",
				ENVIRONMENT_VARIABLES[i], getenv(ENVIRONMENT_VARIABLES[i])
			);
#endif
			continue;
		}

#if defined(_WIN32) || defined(_WIN64)  //Set environment variable for windows
#ifndef LAUNCHER_NO_OPTIONS_CHECKING
		error = msprintf("Failed to set enviornment variable: \"%s\"\n", ENVIRONMENT_VARIABLES[i]);

		free_assert
		(
			_putenv_s(ENVIRONMENT_VARIABLES[i], ENVIRONMENT_VARIABLES[i + 1]) == 0,
			error
		);

		free(error);
#else
	// 	if(_putenv_s(ENVIRONMENT_VARIABLES[i], ENVIRONMENT_VARIABLES[i + 1]) != 0) return EXIT_FAILURE;
#endif
#else  //Set environment variable for POSIX
	#ifndef LAUNCHER_NO_OPTIONS_CHECKING

		error = msprintf("Failed to set enviornment variable: \"%s\"\n", ENVIRONMENT_VARIABLES[i]);

		free_assert
		(
			setenv(ENVIRONMENT_VARIABLES[i], ENVIRONMENT_VARIABLES[i + 1], 1) == 0,
			error
		);

		free(error);
	#else
		if(setenv(ENVIRONMENT_VARIABLES[i], ENVIRONMENT_VARIABLES[i + 1], 1) == 0) return EXIT_FAILURE;
	#endif
#endif

#ifndef LAUNCHER_NO_OPTIONS_CHECKING
		printf("\033[1;34m[DEBUG]:\033[0m Setting environment variable: \"%s\" to \"%s\"\n", ENVIRONMENT_VARIABLES[i], ENVIRONMENT_VARIABLES[i + 1]);
#endif
	}

#ifndef LAUNCHER_NO_OPTIONS_CHECKING
		printf("\033[1;34m[DEBUG]:\033[0m Launching Application at: \"%s\"\n", EXECUTABLE_PATH);
#endif

	char* mPreferredExecutablePath = mMakePreferred(EXECUTABLE_PATH);

	char* mExecutableCommand = malloc(strlen("./\"") + strlen(EXECUTABLE_PATH) + strlen("\""));
	assert(mExecutableCommand != NULL, "malloc() failed for mExecutableCommand\n");

	sprintf(mExecutableCommand, "./\"%s\"", mPreferredExecutablePath);

	char* winExecutableCommand = malloc(strlen("powershell -Command \"& {.\\\"") + strlen(mExecutableCommand) + strlen("\"}\""));
	assert(winExecutableCommand != NULL, "malloc() failed for winExecutableCommand\n");

	sprintf(winExecutableCommand, "powershell -Command \"& {.\\\"%s\"}\"", mExecutableCommand);

#if defined(_WIN32) || defined(_WIN64)  //Run application for windows
	const int result = system(winExecutableCommand);

	free(winExecutableCommand);
	free(mPreferredExecutablePath);
	free(mExecutableCommand);
#else  //Run application for UNIX
	const int result = system(mExecutableCommand);

	free(mPreferredExecutablePath);
	free(mExecutableCommand);
#endif

#ifndef LAUNCHER_NO_OPTIONS_CHECKING
		printf("\033[1;34m[DEBUG]:\033[0m Running `postInit()` function\n");
#endif

	postInit(argc, argv);

	return result;
}