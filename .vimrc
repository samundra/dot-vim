"Manage plugins via vim-plug
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-surround'
  "Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim',
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'tpope/vim-commentary'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript']}
  Plug 'eslint/eslint'
  Plug 'dense-analysis/ale'
  Plug 'maximbaz/lightline-ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
  Plug 'samundra/ayu-vim'
  Plug 'SirVer/ultisnips'
  Plug 'jremmen/vim-ripgrep'
  Plug 'jparise/vim-graphql'
call plug#end()

" LightLine status bar Customizations
let g:lightline = {
   \ 'colorscheme': 'one',
   \ 'active': {
   \   'left': [
   \     ['mode','paste'],
   \     ['gitbranch'],
   \     ['readonly','filename','modified'],
   \    ],
   \   'right': [
   \     ['lineinfo'],
   \     ['percent'],
   \     ['filetype'],
   \     ['cocstatus'],
   \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
   \    ],
   \ },
   \ 'component_function': {
   \   'gitbranch':'FugitiveHead',
   \   'filename': 'LightlineFilename',
   \   'filetype': 'MyFiletype',
   \   'cocstatus': 'coc#status',
   \   'fileformat': 'MyFileformat',
   \ },
   \'component_expand':{
  \      'linter_checking': 'lightline#ale#checking',
  \      'linter_infos': 'lightline#ale#infos',
  \      'linter_warnings': 'lightline#ale#warnings',
  \      'linter_errors': 'lightline#ale#errors',
  \      'linter_ok': 'lightline#ale#ok',
  \  },
  \'component_type' : {
  \     'linter_checking': 'right',
  \     'linter_infos': 'right',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'right',
  \ },
  \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

" Enable it to have vim-devicons
" This also needs Powerline patched fonts as terminal font
" Add it to lightline, currently it's not added there
function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" All set in VIM
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

" Splitting windows
set splitbelow splitright
set nocompatible
set nolist
set wrap
set linebreak
set textwidth=72
set formatoptions=qrnl
set showtabline=2
set tabstop=2
set guioptions-=e
set modelines=0
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
set expandtab	"expand tabs to spaces
set softtabstop=2
set shiftwidth=2
set ttyfast
set number
set backspace=indent,eol,start
set cmdheight=3
set updatetime=300
set shortmess+=c
set signcolumn=yes
scriptencoding utf-8
set encoding=UTF-8
set scrolloff=5 " Show few lines around the cursor
filetype on
filetype plugin on
filetype indent on
set noerrorbells
" setlocal spell spelllang=en_us " Do not enable, it will override colorscheme
set path+=**
set wildignore+=**/node_modules/**

" Enable mouse use in all modes
set mouse=a
set ttymouse=xterm

" ---
" GLOBAL VARIABLE DECLARATIONS
" ---
" let g:netrw_banner=0 " disable banner
" let g:netrw_liststyle=3 "show tree view
" let g:netrw_browse_split = 0 " Open file in new split
" let g:netrw_winsize = 25 " Set width of the NetRW Filebrowser

" Use rm -r to delete non-empty directory
" let g:netrw_localrmdir='rm -rf' " with VIM7.4 it no longer works
" let g:netrw_rmdir_cmd='ssh HOSTNAME rmdir -r'
let g:netrw_rmf_cmd='rm -rf'

" Enable true colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Mode Settings change mouse cursor based on vim mode
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Cursor Settings:
" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar"

" FZF Color Customizations
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'window': '-tabnew' }

" Define Neoformat for prettier
" autocmd BufWritePre,TextChanged,InsertLeave *.tsx,*.ts PrettierAsync
" autocmd FileType javascript setlocal formatprg=prettier\ --single-quote\ --trailing-comma\ es5

" ALE specific configurations
" Run ALE on Asynchronous Linting Engine
" let g:ale_fixers = {
"       \ 'javascript': ['prettier'],
"       \ 'typescript': ['eslint'],
"       \ 'typescriptreact': ['eslint'],
"       \}
let b:ale_fixers = ['eslint','remove_trailing_lines','trim_whitespace']

" let g:ale_linters = {
"       \ 'javascript': ['eslint'],
"       \ 'typescriptreact': ['eslint'],
"       \ 'typescript': ['eslint'],
"       \}
let g:ale_sign_column_always=1
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit=1
let g:ale_sign_error='❌'
let g:ale_sign_warning='⚠️'
let g:ale_fix_on_save = 1

" Disable ALE linter while typing
let g:ale_lint_delay=700
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
"let g:ale_lint_on_enter = 1

" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1

"   \ 'coc-tsserver',
"   \ 'coc-eslint',
"   \ 'coc-json',
"   \]

" ---
" LIGHTLINE CUSTOM FUNCTIONS
" ---
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

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
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Format with :Format  command
command! -nargs=0 Format :call CocAction('format')

" au VimEnter * NoMatchParen

" au! CursorHold *.[ch] nested call PreviewWord()

func PreviewWord()
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
endfun

" ---
" Keyboard Mappings
" ---
" Easy access and reload for editing vim source files
nmap <silent> <leader>ev :tabedit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <silent> <leader>e :Explore .<CR>
" Coc specifics
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

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

" Ctags import
nnoremap <Leader>if <Plug>(JsFileImport)

" Configure keybinding for error navigations
" nmap <silent> <leader>aj :ALENext<cr>
" nmap <silent> <leader>ak :ALEPrevious<cr>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

inoremap <silent><expr> <CAPS>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<CAPS-p>" : "\<C-h>"

" Save Remap
nnoremap <leader>w :w<CR>
nnoremap ,, :noh<CR>
"nnoremap <silent> <c-p> :FZF<CR>

" Open fzf on popup view
"let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.8 } }
" let g:typescript_indent_disable = 1
imap jj <esc>

packadd! matchit

" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage"
let ayucolor="mirage"
set background=dark
colorscheme ayu
nnoremap z= <C-w>=

let g:typescript_indent_disable = 1

" Disable arrow keys
" Remove newbie crutches in Command Mode
" cnoremap <Down> <Nop>
" cnoremap <Left> <Nop>
" cnoremap <Right> <Nop>
" cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>
" inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" nnoremap <F5> m'A<C-R>="@media only screen and (min-width: 1024px) {
" \  /** your css here **/
" \ }"<CR><Esc>``

nnoremap <F5> m'A<C-R>=MediaQuery()<CR><Esc>``
function! MediaQuery()
  return "@media only screen and (min-width: 1024px) {" . "\n" . "/** your css **/" . "\n" . "}"
endfunction

nnoremap <F6> m'A<C-R>=Fontfamily()<CR><Esc>``
function! Fontfamily()
  return "font-family: ${(props: { theme: ScgTheme }): string => props.theme.fontFamily.medium};"
endfunction

let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set hidden

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
endif

nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

" Treat all numbers as decimal
set nrformats=

"Enable relative numbering
set relativenumber

" Copy file in the same directory
nnoremap <silent> <Leader>y :clear<bar>silent exec "!cp '%:p' '%:p:h/%:t:r-copy.%:e'"<bar>redraw<bar>echo "Copied "

" Disable checks for executable ale configuration
" https://github.com/dense-analysis/ale/issues/1176
let g:ale_cache_executable_check_failures = 1

" Autoimport files from external module
let g:ale_completion_tsserver_autoimport =1
