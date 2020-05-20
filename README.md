## VIM Configuration

This repository contains my vim configurations. This configurations
is most suitable for frontend development using Typescript, ReactJS,
Javascript, Nodejs.

![VIM Configuration](https://user-images.githubusercontent.com/760855/82479131-29af1e80-9afc-11ea-9ca9-07ef3326b5a7.gif)

### Features
- [LightLine] is used for statusbar
- [Coc] is used for autocomplete, intellisense
- [ALE] provides linting using Typescript LSP server
- Syntax highlight support for:
  - Typescript, Javascript, jsx, tsx, styled components, Graphql

### Tested Version

VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Apr 13 2020 07:46:23)
macOS version

### Ubuntu Installation

You might have to upgrade your VIM for some plugins to work properly. Instruction for ubuntu is shown below:

```shell
$ sudo add-apt-repository ppa:pkg-vim/vim-daily
$ sudo apt-get update && sudo apt-get upgrade
```

### How things are organized in this repository?

- [vim-plug] is used to manage the plugins. Please, follow its documentation for installation guidance.
- All vim plugins are organized as git submodules.

### Get Started

- Clone this repository recursively.

> Why Recursively?

```shell
*Note:* _All the plugins are git submodules and thus we have to clone
the repository recursively._
```

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

#### Basic Shortcuts
```
<Leader> \
jj : Escape from insert mode
<Leader>w : Save buffer to file
,, : Remove Search highlight
```

More companion Keyboard shorts
- Please note cursor keys are disabled on visual and normal mode.

Code Formatting
---
```shell
<Leader>f : code format using coc plugin
```

Tab Navigation
---
```shell
\\ : Goto next buffer
\t : Goto next tab
```

Window
---
```shell
z= : Make Equal width for open windows
```

### Troubleshoot Instructions

If something is not working as expected then please create issue on this
repository.


[vim-plug]: https://github.com/junegunn/vim-plug
[LightLine]: https://github.com/itchyny/lightline.vim
[Coc]: https://github.com/neoclide/coc.nvim
[ALE]: https://github.com/dense-analysis/ale
