""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python specific stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call Tabglobal(4)

let mapleader = ","

augroup vimrc
    au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

nmap <silent> ,; :call cosco#commaOrSemiColon()<CR>j
inoremap <silent> ,; <ESC>:call cosco#commaOrSemiColon()"<CR>a

map <c-p> :call FillLine('#')<cr>
imap <c-p> <esc>:call FillLine('#')<cr>

map <F12> :call FillLine('#')<cr>
imap <leader>" """"""<Esc>2hi
map <leader>" i""""""<Esc>2hi
imap <leader>nm if<Space>__name__<Space>==<Space>"__main__":<CR>

syn match    pyCustomParen    "(" contains=pyParen
syn match    pyCustomFunc     "\w\+\s*(" contains=pyCustomParen

hi def link pyCustomFunc  Function
