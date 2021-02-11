#!/bin/sh
stack build
stack exec -- my-project-exe 8023
./node_modules/.bin/electron-packager . --ignore=app --ignore=src --overwrite
./Minesweeper-linux-x64/Minesweeper 