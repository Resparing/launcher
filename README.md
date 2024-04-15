# Launcher
#### A one file implementation of a simple launcher
<br>

### Summary
The launcher will set some environment variables and launch your application, making it so that your libraries will spawn with these environment variables already set.
These environment variables can also change at runtime, right before the fist `#ifndef LAUNCHER_NO_OPTIONS_CHECKING` if you want to.

## NOTE: THIS SHOULD NOT BE USED TO STORE SECRET ENVIRONMENT VARIABLES, IT IS EASY TO FIND THEM WITH A HEX EDITOR


### Requirements
- Clang or gcc with at least c++20

### Compile command

- For MacOS/Linux
`c++ -o main launcher.cpp -std=c++20`
`./make.sh`
<br>

- For Windows
`c++ -o main.exe launcher.cpp -std=c++20`
`.\make.bat`
<br>

### How to use
- Open up the `launcher.cpp` file, inside there will be the following at the very top of the page
```cpp
static const char* EXECUTABLE_PATH = "my_app";

static const char* ENVIRONMENT_VARIABLES[]
{
	"MY_VARIABLE", 			/* = */		"MY_VALUE",				/* Override? */		"true",
	"MY_OTHER_VARIABLE", 		/* = */		"MY_OTHER_VALUE",			/* Override? */		"false",
};

// #define LAUNCHER_NO_OPTIONS_CHECKING 1
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