## VIM Configuration

### DISCLAIMER

This repository contains my vim configurations. This configurations
is most suitable for frontend development using Typescript, ReactJS,
Javascript, Nodejs. This configuration is as per my workflow and may not
suit your workflow. So, please feel free to tweak it as you feel
necessary.

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

I have tested this configurations on MacOS only and may need tweaking
for other systems. If you decide to move foward with this configuration
and get need help please feel free to ping me.

### Ubuntu Installation

You might have to upgrade your VIM for some plugins to work properly. Instruction for ubuntu is shown below:

```shell
$ sudo add-apt-repository ppa:pkg-vim/vim-daily
$ sudo apt-get update && sudo apt-get upgrade
```

### How things are organized in this repository?

- [vim-plug] is used to manage the plugins. Please, follow its documentation for installation guidance.

### Get Started

- Clone this repository

```shell
$ git clone git@github.com:samundra/dot-vim.git
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

### Plugin Installation
While opening VI you will get some error for the first time. Ignore it.
Once plugins are installed, those errors will go away.

Open VIM `vi` then use `:PlugInstall` to install Plugins

### Verify the installation
- Those all are the steps required, now run `vim` from the terminal and
  verify that everything is working as expected.

### How do I update plugins (Manually)
Make changes to [vim-plug] list and then execute vim command

```shell
:PlugClean
```

#### Keyboard Shortcuts
`<Leader>` key set to to ` \ `. So all the shortcut should start with `\` key.
Don't know what <Leader> key is try `:help leader`

```shell
<Leader>\ :  Move to next buffer
jj : Escape from insert mode
<Leader>w : Save buffer to file
,, : Remove search highlight
```

Code Formatting
---
```shell
<Leader>f : code format using coc plugin
```

Tab Navigation
---
```shell
<Leader>\ : Goto next buffer
\t : Goto next tab
```

### Troubleshoot Instructions

I created this vimrc for my own use. So, I do not expect this to work
for you out of the box. If it works, that's great, if it doesn't we can
always tweak it. However, I would be willing to share my
knowledge on VIM if you get stucked somewhere.

Have feedback for this repository then please create an issue and then
we can discuss about it.


[vim-plug]: https://github.com/junegunn/vim-plug
[LightLine]: https://github.com/itchyny/lightline.vim
[Coc]: https://github.com/neoclide/coc.nvim
[ALE]: https://github.com/dense-analysis/ale
