
call Tabglobal(2)

"augroup vimrc
"    au BufReadPre * setlocal foldmethod=syntax
"    au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
"augroup END


map <F12> i//<esc>:call FillLine('=')<cr>$XF/a<space>

" Compile
map <F2> :w<CR>:!make<CR>
map <F3> :w<CR>:!g++ -o %:t:r %:t `root-config --cflags --libs` -lRooStats -lRooFit -lRooFitCore<CR>

" Convenient Shortcuts
imap <leader>in #include ""<Esc>i
imap <leader>In #include <><Esc>i
imap <leader>de #ifndef<Space><Space><Esc>o#define<Space><Space><Esc>k<C-V>jI
imap <leader>wh while<Space>()<Space>{<CR>}<Esc>k0f(a
imap <leader>fo for<Space>()<Space>{<CR>}<Esc>k0f(a
imap <leader>if if<Space>(){<CR>}<Esc>kwli
imap <leader>ei else ifi<Space>(){<CR>}<Esc>k2wli
imap <leader>el else<Space>{<CR>}<Esc>O<C-T>
imap <leader>ma int main(int argc, char *argv[])<space>{<CR>}<Esc>Oreturn 0;<Esc>O
imap <leader>sw switch()<Space>{<CR>case :<CR>default:<CR>}<Esc>kO<C-T>break;<Esc>2khi
imap <leader>co std::cout<Space><<<Space>"<Space><<<Space>std::endl;<Esc>F"i"
imap <leader>as assert();<esc>F(a
map <S-Insert> <MiddleMouse>

" REALLY LAZY
imap <leader>ve std::vector<><esc>F<a
imap <leader>st std::string


syn keyword cType    string stringstream vector map

iabbr cstr c_str()
iabbr MM <<

"" Highlight Class and Function names
syn match    cCustomParen    "(" contains=cParen contains=cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
"syn match    cCustomScope    "::"
"syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
"
hi def link cCustomFunc  Function


"set tags+=./tags;/
set tags+=~/dotfiles/tags
function! s:highlight()
  let list = taglist('.*')

  "for item in list
  "  let kind = item.kind
  "  "if kind == 'f' || kind == 'c'
  "  if kind == 'f'
  "    let name = item.name
  "    exec 'syntax keyword Function '.name
  "  endif
  "endfor

  for item in list
    let kind = item.kind
    "if kind == 'f' || kind == 'c'
    if kind == 'c'
      let name = item.name
      exec 'syntax keyword cType '.name
    endif
  endfor
endfunction

"call s:highlight()

" For ctags, open in new tab
nnoremap <C-w>] <C-w>]<C-w>T
source ~/.vim/ctypes.vim
