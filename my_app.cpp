#include <cstdlib>
#include <iostream>

extern char **environ;

int main(void)
{
	for (char** env = environ; *env != nullptr; ++env)
	{
		std::cout << *env << std::endl;
	}

	return EXIT_SUCCESS;
}