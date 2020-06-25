" Open item from quickfix in split window
" This is only availale in the quickfix window, owing to the filetype
" restriction on the autocmd (see below).
"set statusline=%t%{exists('w:quickfix_title')?#StatusLine#w:quickfix_title:''}\%=%-15(%l,%c%V%)\%P
"set statusline+=%t%#PmenuSel#Sample
"set statusline=%t%#Title#%{exists('w:quickfix_title')?w:quickfix_title:''}
setlocal stl=
setlocal stl+=\ 
"setlocal statusline+=%#QuickFixLine#%-10t%#Question#%34{exists('w:quickfix_title')?'\ '.w:quickfix_title:''}
setlocal stl+=%t%{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P

function! <SID>OpenQuickfix(new_split_cmd)
  " 1. the current line is the result idx as we are in the quickfix
  let l:qf_idx = line('.')
  " 2. jump to the previous window
  wincmd p
  " 3. switch to a new split (the new_split_cmd will be 'vnew' or 'split')
  execute a:new_split_cmd
  " 4. open the 'current' item of the quickfix list in the newly created buffer
  "    (the current means, the one focused before switching to the new buffer)
  execute l:qf_idx . 'cc'
endfunction

autocmd FileType qf nnoremap <buffer> <C-v> :call <SID>OpenQuickfix("vnew")<CR>
autocmd FileType qf nnoremap <buffer> <C-x> :call <SID>OpenQuickfix("split")<CR>

nnoremap <silent> <buffer> o <CR><C-w>p
