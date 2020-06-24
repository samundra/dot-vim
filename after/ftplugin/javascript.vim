let b:ale_linter_aliases = ['javascript']
let b:ale_linters = ['eslint']
let b:ale_fixers = ['eslint', 'remove_trailing_lines', 'trim_whitespace']
let b:ale_list_window_size = 10

augroup myjavascript
	autocmd!
	autocmd FileType javascript setl formatexpr=CocAction('formatSelected')
augroup END

if exists("loaded_matchit")
    let b:match_ignorecase=0
    let b:match_words =
     \  '<:>,' .
     \  '<\@<=!--:-->,'.
     \  '<\@<=?\k\+:?>,'.
     \  '<\@<=\([^ \t>/]\+\)\%(\s\+[^>]*\%([^/]>\|$\)\|>\|$\):<\@<=/\1>,'.
     \  '<\@<=\%([^ \t>/]\+\)\%(\s\+[^/>]*\|$\):/>'
endif

