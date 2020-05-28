" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd FileType json syntax match Comment +\/\/.\+$+
" Do not keep netrw buffers around once they are hidden
autocmd FileType netrw setl bufhidden=delete
