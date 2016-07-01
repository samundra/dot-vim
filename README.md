#### VIM Configuration

This repository contains all my vim configurations. 
> Tested version - **VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Dec 18 2015 21:31:31)**

#### You can use ppa to install vim from 

```shell
$ sudo add-apt-repository ppa:pkg-vim/vim-daily
$ sudo apt-get update && sudo apt-get upgrade
```

#### Requirements
- [Pathogen] is used to manage the plugins. Follow pathogen
  documentation to install it.
- After [Pathogen] is installed proceed with installation process below.
- Install [Patched Fonts]. Follow the instructions provided in the
  repository. I have used the *Meslo LG S DZ for Powerline*
- All vim plugins are organized as git submodules.

#### VIM Plugin Management
All plugins are managed through [Pathogen].

#### Plugins included as submodules
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

#### Installation
- Clone this [Repository] recursively in the home folder

```shell
   $ git clone [Repository] --recursive
```
*Note:* _All the plugins are git submodules and thus we have to clone 
the repository recursively._

> you can also use the `git submodule init` and `git submodule update` to
> update the local repository.

- Rename the `vim` folder to **.vim** folder, if you already have `.vim`
  folder then you might need to adjust accordingly.

```shell
    # Rename old vim
    $ mv ~/.vim ~/.vim-old
    $ mv vim .vim
    $ mv vim ~/.vim
    # Pull plugins
    $ cd .vim && git submodule init && git submodule update 
```
- Create symlink to the `.vimrc` file
```shell
    $ ln -s /home/{user}/.vim/vimrc /home/{user}/.vimrc
```

#### Include pathogen in .vimrc config file (optional)
> This has already been included in .vimrc with on this repository. It
> has been included here as reference purpose only.

- Install pathogen use [Pathogen]
- Add `execute pathogen#infect()`

[Repository]:https://github.com/samundra/vim.git
[Pathogen]:https://github.com/tpope/vim-pathogen#installation
[Patched Fonts]:https://github.com/ryanoasis/nerd-fonts

