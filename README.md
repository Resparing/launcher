# Launcher
#### A one file implementation of a simple launcher
<br>

### Summary
The launcher will set some environment variables and launch your application, making it so that your libraries will spawn with these environment variables already set.
These environment variables can also change at runtime, using the `preInit()` to setup the environment variables and `postInit()` to clean then up.

## NOTE: THIS SHOULD NOT BE USED TO STORE SECRET ENVIRONMENT VARIABLES, IT IS EASY TO FIND THEM WITH A HEX EDITOR


### Requirements
- clang or gcc with at least c++17 and c99

### Compile command

- For MacOS/Linux
- For the C++ file `c++ -o launcher launcher.cpp -std=c++17`
- For the C file `cc -o launcher launcher.c -std=c99`
<br>

- For Windows
- For the C++ file `c++ -o launcher.exe launcher.cpp -std=c++17`
- For the C file `cc -o launcher.exe launcher.cpp -std=c99`
<br>

### How to use
- Open up the `lanuncher.h`, inside there will be the following at the very top of the page. They will be the exact same inside the c file and the cpp file.
```cpp
static const char* EXECUTABLE_PATH = "my_app";

static const char* ENVIRONMENT_VARIABLES[]
{
	"MY_VARIABLE", 			/* = */		"MY_VALUE",				/* Override? */		"true",
	"MY_OTHER_VARIABLE", 		/* = */		"MY_OTHER_VALUE",			/* Override? */		"false",
};

// #define LAUNCHER_NO_OPTIONS_CHECKING 1

void preInit(int argc, const char* argv[])
{
	//Change environment variables any way you want here, edit `ENVIRONMENT_VARIABLES` to `char**` if needed
}

void postInit(int argc, const char* argv[])
{
	//Free pointers if needed
}
```

- There are a few things to note
`LAUNCHER_NO_OPTIONS_CHECKING` is a macro to disable debugging, by default it is off. It will print statuses, show errors and validate your inputs for the `EXECUTABLE_PATH` and `ENVIRONMENT_VARIABLES` variables.

`EXECUTABLE_PATH` is the path to your executable, it can use `/` or `\` for folders and will automatically switch to the correct one depending on your platforms.

`ENVIRONMENT_VARIABLES` are the environment variables themselves. When you first open the file, you will see two default environment variables set
```cpp
static const char* ENVIRONMENT_VARIABLES[]
{
	"MY_VARIABLE", 			/* = */		"MY_VALUE",				/* Override? */		"true",
	"MY_OTHER_VARIABLE", 		/* = */		"MY_OTHER_VALUE",			/* Override? */		"false",
};
```
The environment variables are in groups of three, looking at a single line, we can see this
```cpp
"MY_VARIABLE", 				/* = */		"MY_VALUE",					/* Override? */		"true",
```
`MY_VARIABLE` is the name of the environment variable. `MY_VALUE` is the value of the environment variable. `true` is a either `"true"` or `"false"`. If set to true, the environment variable will be set no matter what. If false, the environment variable will be set **ONLY** if the environment variable wasn't set before.

These lines can be as long as the computer allows.

We then have these two functions:
```cpp
void preInit(int argc, const char* argv[])
{
	//Change environment variables any way you want here, edit `ENVIRONMENT_VARIABLES` to `char**` if needed
}

void postInit(int argc, const char* argv[])
{
	//Free pointers if needed
}
```

These have an `argc` and `argv` parameters, these can be used to edit the environment variables based on how the library was called. You can also use something like `std::filesystem::current_path()`. or an equivalent in C. 

The `preInit()` function is called first thing inside the `main()` function. This can then be used to edit the executable path or the environment variables themselves if needed. You could also, but is highly unrecommended due to the easy reverse-engineering process, try having the environment variables encrypted and then decrypt them in the `preInit()` function for some rudimentary obfuscation.

The `postInit()` function is called right after the `system()` command to launch the application. You can use the function to free any memory you dynamically allocated in C or add a debug message.