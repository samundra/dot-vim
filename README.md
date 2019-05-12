## VIM Configuration

This repository contains my vim configurations.

#### Tested versions 
- VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Dec 18 2015 21:31:31)
- VIM - Vi IMproved 8.0 (2016 Sep 12, compiled Aug 17 2018 17:24:51)

![VIM
Configuration](https://cloud.githubusercontent.com/assets/760855/22799834/ca4429de-ef39-11e6-8866-c5968a0dc5c4.png)

### ChangeLogs

- update vim-devicons plugin
- add vim-jsx plugin for react development

### Ubuntu Instruction

You might have to upgrade your VIM for some plugins to work
properly. Instruction for ubuntu is shown below:

```shell
$ sudo add-apt-repository ppa:pkg-vim/vim-daily
$ sudo apt-get update && sudo apt-get upgrade
```

### How things are organized in this repository?

- [Pathogen] is used to manage the plugins. Please, follow pathogen
  documentation to install it.
- After [Pathogen] is installed proceed with installation process below.
- Install [Patched Nerd Fonts]. Follow the instructions provided in the
  repository. I have used the [MesloLGS Nerd Font](https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/S/complete/Meslo%20LG%20S%20Regular%20Nerd%20Font%20Complete.otf)
- All vim plugins are organized as git submodules.

#### Plugins included as submodules

- [Spacegray.vim](https://github.com/ajh17/Spacegray.vim.git)
- [auto-pairs](https://github.com/jiangmiao/auto-pairs.git)
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim.git)
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter.git)
- [nerdtree](https://github.com/scrooloose/nerdtree.git)
- [papercolor-theme](https://github.com/NLKNguyen/papercolor-theme.git)
- [tabular](https://github.com/godlygeek/tabular.git)
- [unite.vim](https://github.com/Shougo/unite.vim.git)
- [vim-airline](https://github.com/vim-airline/vim-airline.git)
- [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes.git)
- [vim-devicons](https://github.com/ryanoasis/vim-devicons)
- [vim-fugitive](https://github.com/tpope/vim-fugitive.git)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter.git)
- [vim-jsx](https://github.com/mxw/vim-jsx.git)
- [vim-sensible](https://github.com/tpope/vim-sensible.git)
- [vim-surround](https://github.com/tpope/vim-surround.git)

### Get Started

- Clone this [Repository] recursively in the home folder

> Why Recursively?

    *Note:* _All the plugins are git submodules and thus we have to clone 
    the repository recursively._

```shell
$ git clone git@github.com:samundra/dot-vim.git --recursive
```

Rename `dot-vim` folder to **.vim** folder. If you already have `.vim` 
folder then you might need to adjust accordingly.

```shell
    ### Rename old vim
    $ mv ~/.vim ~/.vim-old
    
    ### Move new vim
    $ mv .vim ~/.vim

    ### Pull plugins
    $ cd ~/.vim && git submodule init && git submodule update 
```
- Create symlink to the `.vimrc` file
- replace `{user}` with your username in below command.

```shell
    ### Create symlink to .vimrc -> .vim/vimrc file
    $ ln -s ~/.vim/vimrc ~/.vimrc
```

### Verify the installation
- Those all are the steps required, now run `vim` from the terminal and
  verify that everything is working as expected.

### How do I update plugins (Manually)

Use git submodule command to update the respective repository.

```bash
$ cd ~/.vim/
$ git submodule init && git submodule update
```

OR

```bash
$ git submodule foreach git fetch --all
$ git submodule foreach git reset --hard origin/master
```

#### Keyboard Shortcuts

`<Leader>` key to ` \ `. So all the shortcut should start with `\` key.

```
<Leader> \
```

##### Key Bindings

|Keyboard Shortcut|Description|
|-----------------|-----------|
|`<Leader>n`|Toggle NerdTree|
|`<Leader>jj`|Escape Key|
|`<Leader>t`|Move to next tab|
|`<ctrl>p`|Initialize the ctrl-p|

#### Optional

- Include pathogen in .vimrc config file.
> This has already been included in .vimrc with on this repository. It
> has been included here as reference purpose only.

- Install pathogen using instructions provided on [Pathogen]
- Add `execute pathogen#infect()` in .vimrc file

### Troubleshoot Instructions

1. Icons are not shown instead square ? marks are shown

**Answer**: Icons are being shown by vim-devicons plugins. To work properly,
it needs Patched Nerd Fonts with all the glyphs. Usually, it's the
problem with the font in use.

#### For Mac User and iTerm

- Download the [Patched Nerd Fonts] and then set it as your terminal
  font. Close and re-start the iTerm. If it doesn't solve your problem
  then please refer to [Vim-Devicons Wiki](https://github.com/ryanoasis/vim-devicons/wiki/FAQ-&-Troubleshooting#why-isnt-it-working-how-come-i-dont-see-any-icons). 
  Since it can happen for multiple reasons, pin-pointing the actual problem can be tedious. First make sure that you have the correct font then try to use the right syntax for setting the `guifont` in `.vimrc` file.
  
  I will keep updating the keyboard shortcuts when I have some more time. Please feel free to fork it. When you've made some updates, please send PRs.

[Repository]:https://github.com/samundra/vim.git
[Pathogen]:https://github.com/tpope/vim-pathogen#installation
[Patched Nerd Fonts]:https://github.com/ryanoasis/nerd-fonts
