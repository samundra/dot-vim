augroup dotvim
  autocmd!
augroup END

filetype off

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'jremmen/vim-ripgrep'
  Plug 'samundra/ayu-vim'
  "Plug 'amadeus/vim-mjml'
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

filetype plugin on
syntax on
scriptencoding utf-8

"set autoindent
set nocompatible
set autoread expandtab backup writebackup showmode wrap linebreak splitbelow splitright
      \ autoindent smartindent hlsearch incsearch ignorecase smartcase ruler showmatch ttyfast
      \ number wildmenu timeout cursorline lazyredraw list noerrorbells
set backupdir=~/.vim/tmp//,.
set directory=~/.vim/tmp//,.
set undodir=~/.vim/tmp//,.
set laststatus=2
" enable indentation
set breakindent
" ident by an additional 2 characters on wrapped lines, when line >= 40 characters, put 'showbreak' at start of line
set breakindentopt=shift:2,min:40,sbr
set showbreak=»»»
set encoding=utf8
"set t_Co=256
set textwidth=78
set formatoptions=qrnl
set showtabline=2
set tabstop=2
set guioptions-=e
set linespace=5
set sts=2
set softtabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set cmdheight=3
" "idleness" is 2sec
set updatetime=2000
set shortmess+=c
set signcolumn=yes
set encoding=UTF-8
set scrolloff=5
set path-=/usr/include
set path+=src/**,src/Pages/**,src/Components/**,src/Store/**
set timeoutlen=700
set wildignore+=*/node_modules/*,*build/*
set wildignorecase
set wildmode=list:longest,full
" Do not search for tags for autocomplete
set complete-=t
set completeopt=menuone,longest,popup
set fillchars=vert:\ ,fold:\  listchars=tab:⎸\ ,nbsp:⎕
"set listchars=tab:>-,trail:~,extends:>,precedes:<
set listchars+=tab:>-,trail:-
" Use Vertical split for VIM diff
set diffopt+=vertical
set clipboard=unnamed

set mouse=a
set ttymouse=xterm

" Replace *src with ./src/**/*.tsx in command mode
" `:find text *src` will become `:find text ./src/**/*.tsx`
cmap *src ./src/**/*.tsx
cmap *page ./src/Pages/**/*.tsx
cmap *comp ./src/Components/**/*.tsx

noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" Enable true colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Change cursor based on Vim mode :help ModeMsg
" SI - Insert, SR - Replace, EI - Normal or Anything else
" 1 -> blinking block,        2 -> solid block
" 3 -> blinking underscore,   4 -> solid underscore
" 5 -> blinking vertical foo, 6 -> solid vertical foo"
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

let g:ale_sign_column_always=1
let g:ale_linters_explicit=1
let g:ale_fix_on_save = 1
let g:ale_lint_delay=1200
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" if exists('*complete_info')
"   inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use <Tab> to select next item in popup menu
inoremap <expr> <Tab> pumvisible() ? "<C-n>" : "<Tab>"

" Use <CR> to choose item from popup menu
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function PreviewWord() abort
  if &previewwindow			" don't do this in the preview window
    return
  endif
  let w = expand("<cword>")		" get the word under cursor
  if w =~ '\a'			" if the word contains a letter

    " Delete any existing highlight before showing another tag
    silent! wincmd P			" jump to preview window
    if &previewwindow			" if we really get there...
      match none			" delete existing highlight
      wincmd p			" back to old window
    endif

    " Try displaying a matching tag for the word under the cursor
    try
       exe "ptag " . w
    catch
      return
    endtry

    silent! wincmd P			" jump to preview window
    if &previewwindow		" if we really get there...
	 if has("folding")
	   silent! .foldopen		" don't want a closed fold
	 endif
	 call search("$", "b")		" to end of previous line
	 let w = substitute(w, '\\', '\\\\', "")
	 call search('\<\V' . w . '\>')	" position cursor on match
	 " Add a match highlight to the word at this position
      hi previewWord term=bold ctermbg=green guibg=green
	 exe 'match previewWord "\%' . line(".") . 'l\%' . col(".") . 'c\k*"'
      wincmd p			" back to old window
    endif
  endif
endfunction

" ---
" Keyboard Mappings
" ---
" Easy access and reload for editing vim source files
nmap <silent> <leader>ev :tabedit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Coc specifics
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add matching braces
inoremap { {}<ESC>ha

" Hit F8 to run fixers
nnoremap <F8> <Plug>(ale_fix)
"nnoremap <F9> :Rg <cword><CR>
nmap <F6> :/\v\s$<CR>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Working with buffers
nnoremap <silent> <leader>bl :ls<cr>
nnoremap <silent> <leader>c :bd<cr>
nnoremap <silent> <leader>\ :bn<cr>
nnoremap <silent> <leader>t :tabn<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

inoremap <silent><expr> <CAPS>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<CAPS-p>" : "\<C-h>"

" Save Remap
nnoremap <leader>w :w<CR>
nnoremap <silent> ,, :nohl<CR>


nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" let g:UltiSnipsExpandTrigger="<c-k>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set hidden

" Treat all numbers as decimal
set nrformats=

"Enable relative numbering
set relativenumber

" Disable checks for executable ale configuration
" https://github.com/dense-analysis/ale/issues/1176
let g:ale_cache_executable_check_failures = 1

" Autoimport files from external module
let g:ale_completion_tsserver_autoimport =1

" StatusLine Settings
" function! GitBranch() abort
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null<Bar>tr -d '\n'")
" endfunction

" function! StatuslineGit() abort
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0?' '.l:branchname.' ': ''
" endfunction

" Experiment for ALE Liner errors for statusline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    if (l:counts.total + 0) ==# 0
      return 'OK'
    endif
    return l:counts.total
endfunction

function! GetGitCurrentStatus() abort
    let l:status = system('cd '.expand('%:p:h').' && git status --porcelain')
    if (empty(l:status))
      return '✔'
    endif
    return '✹'
endfunction

function! GetGitBranch() abort
    let l:branch = system('cd '.expand('%:p:h').' && git rev-parse --abbrev-ref HEAD 2>/dev/null|tr -d "\n"')
    let l:git_branch = !strlen(l:branch) || !isdirectory(expand('%:p:h')) ? '' : l:branch . ' '
    if (empty(l:git_branch))
      return ''
    endif
    return printf(" %s ", git_branch)
    
endfunction

" Set custom statusline
set laststatus=2
set statusline=
set statusline+=%#StatusLineTermNC#%3{GetGitBranch()}%*
set statusline+=%#CursorLine#%f%*\ %#Identifier#%m%*
set statusline+=%#Question#%{GetGitCurrentStatus()}%*
set statusline+=%=
set statusline+=%#Question#%y%*
set statusline+=%=\ %{&fileencoding?&fileencoding:&encoding}%*
set statusline+=%#CursorColumn#\[%{&fileformat}]\ %p%%\ %4l:%3c%*
"set statusline+=%#Todo#\ [E]\ %3{LinterStatus()}
set statusline+=%#Question#%5{LinterStatus()==#'OK'?'[OK]':''}%*
set statusline+=%#Todo#%5{LinterStatus()>0?'[E]'.LinterStatus():''}%*
set statusline+=\  "   "

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" End StatusLine Settings
set re=0

" let g:prettier#autoformat_config_present = 1
" let g:prettier#autoformat_config_files = ['.prettierrc', '.prettierrc.js']
" let g:prettier#exec_cmd_async = 1
" let g:prettier#quickfix_auto_focus = 1
" let g:prettier#quickfix_enabled = 1
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.ts,*.tsx PrettierAsync

inoremap <special> jj <ESC>

map <F4> [I:let nr = input("Which one: ")<foo>exe "normal " . nr ."[\t"<CR>

function! MyHighlights() abort
  highlight Search guibg=peru guifg=wheat
  highlight QuickFixLine guibg=peru guifg=wheat
  highlight CursorLine cterm=NONE guibg=#3d3d3d guifg=wheat
  highlight CursorLineNr cterm=NONE guibg=#3d3d3d guifg=wheat
  highlight TabLine cterm=NONE guibg=#4a4a4a guifg=white
  highlight TabLineFill cterm=reverse guibg=white guifg=#4a4a4a
  highlight TabLineSel cterm=bold guibg=wheat guifg=black
  highlight Error cterm=bold
  highlight Todo cterm=bold
endfunction

set background=dark
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

augroup customHighLights
    autocmd!
    autocmd Colorscheme * call MyHighlights()
augroup END

" Use smart case in vim-ripgrep
let g:rg_command = 'rg --vimgrep -S'
let g:rg_root_types=['.git', 'node_modules', 'vendor']

" The Silver Searcher
" Use ag over grep
set grepprg=rg\ --vimgrep

" Copied from https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
function! Grep(...) abort
    return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

augroup myquickfix
    autocmd!
    autocmd QuickFixCmdPost cgetexpr cwindow
    autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

" Automatically open quickfix when we have :grep, :lgrep
" Now we don't have to press enter to return to editor
" @see https://noahfrederick.com/log/vim-streamlining-grep
augroup init_quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l* lwindow
augroup END

" Manually parse error format for typescript reactjs based projects
" set errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#

" @see https://stackoverflow.com/a/11925400/688924
" Automatically close HTML like tags Hit <p><Tab>
inoremap ><Tab> ><Esc>F<lyt>o</<C-r>"><Esc>kJxi
packadd! matchit

" Work with Splits
nnoremap <silent> <Leader>1 :exe "vertical resize 30"<CR>
nnoremap <silent> 9 :vertical res +2<CR>
nnoremap <silent> 8 :vertical res -2<CR>

