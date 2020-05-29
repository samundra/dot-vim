## VIM Configuration

Configuration is suited to Frontend Development using ReactJS, Typescript,
Prettier, eslint and Nodejs. I have used with MacOS only, it will likely break
with other OS.

**Disclaimer**: This configuration is extremely customized to suit my
workflow. So, when you clone it and decide to try it please note it will
require tons of debugging, painful troubleshooting to get Coc, typescript,
javascript, prettier, eslint, nodejs, yarn up and running, unless you know
what you doing. In that case, please reach out to me via issues and I will try
to help you as much as I can but it can take time.

### Plugins
- [Coc] is used for autocomplete, intellisense
- [ALE] provides linting using Typescript LSP server
- Syntax highlight support for:
- Typescript, Javascript, jsx, tsx, styled components, Graphql

### Tested with

VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Apr 13 2020 07:46:23)
macOS version

### Ubuntu Installation

You might have to upgrade your VIM for some plugins to work properly.
Instruction for ubuntu is shown below:

```shell
$ sudo add-apt-repository ppa:pkg-vim/vim-daily
$ sudo apt-get update && sudo apt-get upgrade
```

### How things are organized in this repository?

- [vim-plug] is used to manage the plugins. Please, follow its documentation
	for installation guidance.

### Wanna give it a try and see how it works?

- Clone this repository.

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
```

- Create symlink to the `.vimrc` file
- replace `{user}` with your username in below command.

```shell
### Create symlink to .vimrc -> .vim/vimrc file
$ ln -s ~/.vim/vimrc ~/.vimrc
```

### Open VI and then install plugins
While opening VI you will get some error for the first time. You can
ignore it. Once plugins are installed, those errors will go away.

Open VIM then use `:PlugInstall` to install Plugins

### Verify installation

- Those all are the steps required, now run `vim` from the terminal and
  verify that everything is working as expected.

#### Keyboard Shortcuts

`<Leader>` key to ` \ `
So where it says `<Leader>` remember to press `\` key

> :help Leader
To get information on how <Leader> key works

#### Key Mapping configured to suit my workflow

```
jj : Escape from insert mode
,, : Remove Search highlight
<Leader>w : Save buffer to file
<Leader>\ : Go next buffer
<Leader>t : Go next tab
```

### Troubleshoot Instructions

If something is not working as expected then please create issue on this
repository.

[vim-plug]: https://github.com/junegunn/vim-plug
[LightLine]: https://github.com/itchyny/lightline.vim
[Coc]: https://github.com/neoclide/coc.nvim
[ALE]: https://github.com/dense-analysis/ale
