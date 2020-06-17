let b:ale_linter_aliases = ['css', 'javascript']
let b:ale_linters = ['stylelint', 'eslint']
let b:ale_fixers=['eslint', 'remove_trailing_lines', 'trim_whitespace']

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

