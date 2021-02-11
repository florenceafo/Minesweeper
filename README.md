# Minesweeper

A desktop application written in Haskell, using the electron and [threepenny-gui] (https://wiki.haskell.org/Threepenny-gui) libraries. 

```
stack build
stack exec -- my-project-exe

./node_modules/.bin/electron-packager . --ignore=app --ignore=src --overwrite

./Minesweeper-linux-x64/Minesweeper 

stack test
```