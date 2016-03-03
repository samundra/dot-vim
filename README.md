# VIM Configuration

This repository contains all my vim configurations

## Installation
1. Clone this [Repository] recursively in the home folder


```bash
   $ git clone [Repository] --recursive
```

2. Rename the vim folder to **.vim** folder
```bash
   $ mv ~/.vim ~/.vim-old
   $ mv vim .vim
   $ mv vim ~/.vim
```
3. Install pathogen use [Pathogen documentation]    
4. Add `execute pathogen#infect()`
5. That's all.

All the plugins are git submodules and thus we have to clone the repository
recursively. 

- Using `pathogen` for plugins management.

[Repository]:https://github.com/samundra/vim.git
[Pathogen documentation]:https://github.com/tpope/vim-pathogen#installation
