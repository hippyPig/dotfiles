""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Haskell specific stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call Tabglobal(4)

map <c-l> :call FillLine('-')<cr>
imap <c-l> <esc>:call FillLine('-')<cr>

map <F12> :call FillLine('-')<cr>
