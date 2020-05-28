augroup myjson
	autocmd!
	autocmd FileType json setl formatexpr=CocAction('formatSelected')
	autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

