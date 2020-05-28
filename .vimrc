filetype off

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'tpope/vim-commentary'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript']}
  Plug 'eslint/eslint'
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'SirVer/ultisnips'
  Plug 'jremmen/vim-ripgrep'
  Plug 'jparise/vim-graphql'
	Plug 'romainl/Apprentice'
call plug#end()

augroup MyColors
    autocmd!
augroup END

filetype plugin indent on
syntax on

set nomore
set rtp+=/usr/local/bin/fzf
set backup
set backupdir=~/.vim/tmp//,.
set writebackup
set directory=~/.vim/tmp//,.
set undodir=~/.vim/tmp//,.
set laststatus=2
set encoding=utf8
set t_Co=256
set noshowmode
set splitbelow splitright
set nolist
set wrap
set linebreak
set textwidth=78
set formatoptions=qrnl
set showtabline=2
set tabstop=2
set guioptions-=e
set autoindent
set smartindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set linespace=5
set ruler
set showmatch
set sts=2
set softtabstop=2
set shiftwidth=2
set ttyfast
set number
set backspace=indent,eol,start
set cmdheight=3
set updatetime=700
set shortmess+=c
set signcolumn=yes
scriptencoding utf-8
set encoding=UTF-8
set scrolloff=5
set noerrorbells
set path-=/usr/include
set path+=src/**
set wildignore+=*/node_modules/*,*build/*
set wildmenu
set timeout
set timeoutlen=600

" Enable mouse use in all modes
set mouse=a
set ttymouse=xterm

" Enable true colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Change cursor based on Vim mode :help ModeMsg
" SI - Insert, SR - Replace, EI - Normal or Anything else
" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar"
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

" FZF Color Customizations
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

" let g:fzf_layout = { 'window': '-tabnew' }

let b:ale_fixers = ['eslint', 'remove_trailing_lines', 'trim_whitespace']

let g:ale_sign_column_always=1
let g:ale_linters_explicit=1
let g:ale_sign_error='❌'
let g:ale_sign_warning='⚠️'
let g:ale_fix_on_save = 1
let g:ale_lint_delay=700
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_set_quickfix = 1

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" ---
" Do Contextual Actions based on filetypes, format etc.
" ---
" Execute Go file
au FileType go map <leader>r :!go run %<CR>

" Update For Typescript
" autocmd BufNewFile,BufRead *.ts,*.tsx,*.jsx set filetype=typescriptreact.tsx

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd FileType json syntax match Comment +\/\/.\+$+
" Do not keep netrw buffers around once they are hidden
autocmd FileType netrw setl bufhidden=delete

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Format with :Format  command
command! -nargs=0 Format :call CocAction('format')

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

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add matching braces
inoremap { {}<ESC>ha

" Hit F8 to run fixers
nmap <F8> <Plug>(ale_fix)
nmap <F9> :Rg <cword><CR>

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
nnoremap <leader>bl :ls<cr>
nnoremap <leader>c :bd<cr>
nnoremap <leader>\ :bn<cr>
nnoremap <leader>t :tabn<CR> " Next Tab

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

inoremap <silent><expr> <CAPS>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<CAPS-p>" : "\<C-h>"

" Save Remap
nnoremap <leader>w :w<CR>
nnoremap ,, :nohl<CR>

packadd! matchit

colorscheme apprentice

nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set hidden

nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

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
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null|tr -d '\n'")
" endfunction

" function! StatuslineGit() abort
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0?' '.l:branchname.' ': ''
" endfunction

set laststatus=2
set statusline=%#PmenuSel#%F\ %#SignColumn#%m
set statusline+=%=
set statusline+=%#Question#%y
set statusline+=%=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=%#CursorColumn#\[%{&fileformat}]\ %p%%\ %4l:%3c
set statusline+=\  "   "

" End StatusLine Settings
set re=0

let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_config_files = ['.prettierrc', '.prettierrc.js']
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_auto_focus = 1
let g:prettier#quickfix_enabled = 1

"autocmd TextChanged,InsertLeave *.js,*.jsx,*.ts,*.tsx PrettierAsync
inoremap <special> jj <ESC>

" Overwrite Theme highlights with custom highlights
function! MyHighlights() abort
    highlight LineNr guibg=NONE
endfunction

autocmd ColorScheme * call MyHighlights()
