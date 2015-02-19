
call Tabglobal(2)

let mapleader = "'"
colorscheme badwolf

set textwidth=99
set filetype=tex

map <c-l> :call FillLine('%')<cr>
imap <c-l> <esc>:call FillLine('%')<cr>

" LaTeXy stuff
imap <leader>be <Esc>yyplcwend<Esc>k
imap <leader>it \begin{itemize}<Esc>yyplcwend<Esc>
imap <leader>cl \caption{\small<cr>}<cr>\label{}
imap <leader>gr \includegraphics[width=0.48\textwidth]{}<Esc>i
imap <leader>ce \begin{center}<Esc>yyplcwend<Esc>
imap <leader>bu \begin{tabular}{}<Esc>yyplcwend<Esc>$xx
imap <leader>se \section{}<Esc>o\label{sec:}<Esc>k0f}i
imap <leader>ss \subsection{}<Esc>o\label{sec:}<Esc>k0f}i
imap <leader>eq \begin{equation}<esc>yypfbcwend<Esc>
imap <leader>al \begin{align}<esc>yypfbcwend<Esc>

map j gj
map k gk

let firstline = getline(1)
if firstline =~ '^%&\s*\a\+'
  let format = tolower(matchstr(firstline, '\a\+'))
  if format == 'beamer'
    "source $HOME/.vim/beamermaps.vim
    imap <leader>fr \begin{frame}[c]\frametitle{}<CR>\end{frame}<Esc>k$
    imap <leader>ta \begin{table}<Esc>yyplcwend<Esc>O<leader>ceO<leader>buk
    imap <leader>co \begin{columns}[c]<esc>yypfbcwend<esc>f[DO\begin{column}{0.48\textwidth}<esc>yypfbcwend<esc>2f{Dky2yP
    imap <leader>fi \begin{figure}<Esc>yyplcwend<Esc>O<leader>ce<Esc>O<leader>gr
  endif
else
  imap <leader>fi \begin{figure}<Esc>yyplcwend<Esc>O<leader>ceO<leader>cl<Esc>kkO<leader>gr
  imap <leader>ta \begin{table}<Esc>yyplcwend<Esc>O<leader>cl<esc>o<leader>ceO<leader>buk
endif


