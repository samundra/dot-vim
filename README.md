### VIM Configuration

This repository contains all my vim configurations

### Requirements
- [Pathogen] is used to manage the plugins. Follow pathogen
  documentation to install it.
- After [Pathogen] is installed proceed with installation process below.
- Install [Patched Fonts]. Follow the instructions provided in the
  repository. I have used the *Meslo LG S DZ for Powerline*
- All vim plugins are are organized as git submodules.

### VIM Plugin Mangement
All plugins are managed through [Pathogen].

### Plugins included as submodules
- ctrlp.vim
- nerdtree
- papercolor-theme
- Spacegray.vim
- tabular
- unite.vim
- vim-airline
- vim-airline-themes
- vim-devicons
- vim-fugitive
- vim-sensible
- vim-surround

### Installation
1. Clone this [Repository] recursively in the home folder

```shell
   $ git clone [Repository] --recursive
```
_Always use the `git submodule init` and `git submodule update` to
 update the local repository._

2. Rename the `vim` folder to **.vim** folder, if you already have .vim
   folder then you might need to adjust accordingly.

```shell
   $ mv ~/.vim ~/.vim-old
   $ mv vim .vim
   $ mv vim ~/.vim
```

### Include pathogen in .vimrc config file
- Install pathogen use [Pathogen]
- Add `execute pathogen#infect()`

*Note:* _All the plugins are git submodules and thus we have to clone 
the repository recursively._

[Repository]:https://github.com/samundra/vim.git
[Pathogen]:https://github.com/tpope/vim-pathogen#installation
[Patched Fonts]:https://github.com/ryanoasis/nerd-fonts
