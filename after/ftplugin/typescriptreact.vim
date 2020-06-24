let b:ale_linter_aliases = ['css', 'javascript']
let b:ale_linters = ['stylelint', 'eslint']
let b:ale_fixers=['eslint', 'remove_trailing_lines', 'trim_whitespace']
let b:ale_warn_about_trailing_whitespace = 1
let b:ale_list_window_size = 10

" inoremap <buffer> <C-s> <esc>yiwi<lt><esc>ea></><esc>hpF>i
" ---

" ---
" Added as per suggested on https://gist.github.com/romainl/2f748f0c0079769e9532924b117f9252
" // Todo: Needs more testings
" augroup TypescriptReact
"     autocmd! * <buffer>
"     autocmd BufWritePost <buffer> silent make <afile> | silent redraw!
" augroup END

" " Linting
" setlocal makeprg=npm\ run\ --silent\ lint:compact

" " Format
" setlocal formatprg=npm\ run\ --silent\ format-current-file\ --\ --stdin-filepath\ %

if exists("loaded_matchit")
    let b:match_ignorecase=0
    let b:match_words =
     \  '<:>,' .
     \  '<\@<=!--:-->,'.
     \  '<\@<=?\k\+:?>,'.
     \  '<\@<=\([^ \t>/]\+\)\%(\s\+[^>]*\%([^/]>\|$\)\|>\|$\):<\@<=/\1>,'.
     \  '<\@<=\%([^ \t>/]\+\)\%(\s\+[^/>]*\|$\):/>'
endif

