" Enable filetype
filetype off
filetype plugin on
filetype indent on
syntax on

set nocompatible
set modelines=0

" Set Common platforms
set encoding=utf-8
set scrolloff=3
set showmode
"set visualbell
"set cursorline

set ttyfast
set ruler
set undofile
"set gdefault
" Perl/Python Regex compatible vi regex
nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %
" Show matching brackets

set showmatch

"Write the old file out when switching between the files.
set autowrite

" Display current cursor position in lower right corner
set ruler

"Want a different map leader than \
let mapleader=","

"Decrease the lag after typing the leader and command key
set timeoutlen=700

"Switch between buffers without saving
set hidden

"Set the color scheme. Change this to your preference.
"Here's 100 to choose from 
colorscheme torte

"Set font type and size. Depends on the resolution
"set guifont=Menlo:h14

"Tab stuff
set tabstop=4
set shiftwidth=3
set softtabstop=3
set expandtab

"Show commabd in bottom right portion of the screen
set showcmd

"Show line numbers
set number

"Prefer relative line numbering?
"set relativenumber"

"indet stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=5

"Better line wrapping 
set nolist
set wrap
set linebreak
set textwidth=79
set formatoptions=qrnl

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

"case insensitive search
set ignorecase
set smartcase

"Hide MacVim toolbar by default
set go-=T

"Hard-wrap paragraph of text
nnoremap <leader>q gqip

"Enable code folding
set foldenable

"Hide mouse while typing
set mousehide

"Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-2>v<C-w>l

"Split windows below the current window.
set splitbelow


"session settings
"set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds

"Shortcut for editing vimrc file in a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>

" Automatically change current directory to that of the file in
autocmd BufEnter * cd %:p:h

"Map code completion to ,+tab
imap <leader> <tab> <C-x> <C-o>
" More useful command-line completion
set wildmenu

" Map escape key to jj -- much fastemor
imap jj <esc>
let g:NERDTreeDirArrowExpandable = "▸"
let g:NERDTreeDirArrowExpandable = "▾"

" Source the vimrc file after saving it. This way we don't have to reload it
if has("autocmd")
   augroup myvimrchooks
      au!
      autocmd bufwritepost .vimrc source ~/.vimrc
   augroup END
endif

" Enable vim-pathogen
execute pathogen#infect()

" NERDTREE PLUGIN SETTINGS
" Shortcut for NERDTreeToggle
"nmap <leader>nt :NERDTreeToggle <CR>
map <C-n> :NERDTreeToggle<CR>

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

"autopen NERDTree and focus curso in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Get to home dir easier
" <header>hm is easier to type :cd ~
nmap <leader>hm :cd ~/ <CR>

" Get rid of search highlighting once done
nnoremap <silent> <esc> :noh<CR><esc>
"set list
" Remap j & k for friendly movement    
nnoremap j gj
nnoremap k gk

" Save on lost focus
au FocusLost * :wa
" Reselect text
nnoremap <leader>v V`]
set visualbell t_vb= "turn off error beef/flash
set novisualbell "turn off visual bell

" Close NerdTree when it's the only window open
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()
