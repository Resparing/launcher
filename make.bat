@echo off

g++ -std=c++20 -o main.exe launcher.cpp -Wl,-S -g0 -O3 -pedantic -pthread -Wall -Wextra -Wpedantic

main.exe

del main.exe

pause