#!/usr/bin/bash

./arithc $1 -o main.s && gcc -no-pie main.s
