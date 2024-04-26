char* EXECUTABLE_PATH = "my_app";

char* ENVIRONMENT_VARIABLES[] =
{
	"MY_VARIABLE", 				/* = */		"MY_VALUE",					/* Override? */		"true",
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