#!/bin/bash

clang++ -std=c++20 -o main launcher.cpp -Wl,-S -O3 -pedantic -pthread -Wall -Wextra -Wpedantic

./main

rm main