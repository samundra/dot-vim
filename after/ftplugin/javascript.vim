let b:ale_fixers = ['eslint']

augroup myjavascript
	autocmd!
	autocmd FileType javascript setl formatexpr=CocAction('formatSelected')
augroup END

