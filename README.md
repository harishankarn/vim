# Personalised Vim

This repository contains the files and steps to a personalised vim configuration.


## Quick install

You can running the **setup file** to quick install vim with some of its basic plugins and its requirements. 
>Note : This setup file works only for **Mac OS** or  **Debian** based systems
 namely:
1. coc.vim [Helps with autocompletion of text]
2. coc-clangd [Helps when coding in C/C++]
3. vim-sensible
4. Node js [Requied by coc-clangd]
5. Theme : Dracula 
>Note : Node.js has been left to be installed manually depending on wether the user wants to or not

## Manual install

You can also install only things your need by referring to the setup files and needed .vimrc configurations

## Important

After installation running the following as a confirmatory check in vim:

 - `:PlugInstall` 
 To install packages in case the shell script did not
 
 - `:PlugStatus`
 To check the status of the installed packages and wether they installed properly
	 

## Shortcuts

1.	Typing `num`  or `numb` in the vim interface (without semicolon) with toggle numbering
2. Setting mouse to work in vim can be edited in .vimrc. `set mouse=` has the following options:
	- `a` (all mode)
	- `n` (normal mode)
	- `v` (visual mode)
	- `i` (insert mode)
	- `c` (command line)
	- `r` (replace mode)
> Note: You can combine different mode `set mouse=nv`
> Note: Most native mode is `v` or comment `set mouse`
