""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python specific stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call Tabglobal(4)

augroup vimrc
    au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END


map <F12> :call FillLine('#')<cr>
imap <leader>" """"""<Esc>2hi
map <leader>" i""""""<Esc>2hi
imap <leader>nm if<Space>__name__<Space>==<Space>"__main__":<CR>
vmap ? I#<Esc>
imap <leader>/ <Esc>I#
map <leader>/ I#<Esc>j


