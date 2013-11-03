
call Tabglobal(2)

let mapleader = "'"

map <F12> :call FillLine('%')<cr>
imap <F12> <esc>:call FillLine('%')<cr>

" LaTeXy stuff
map <F2> :w<CR>:!make<CR>
map <F3> :w<CR>:!evince main.pdf<CR>
map <F4> :w<CR>:!pdflatex %:p<CR>
map <F5> :w<CR>:!bibtex %:p<CR>
imap <leader>be <Esc>yyplcwend<Esc>O<C-T>
imap <leader>% I%<CR>%--------------------------------<Esc>kA
imap <leader>fr \begin{frame}[c]\frametitle{}<CR>\end{frame}<Esc>k$i
imap <leader>it \begin{itemize}<Esc>yyplcwend<Esc>O\item
imap <leader>gr \includegraphics[width=0.5\textwidth]{}<Esc>i
imap <leader>ce \begin{center}<Esc>yyplcwend<Esc>O
imap <leader>ta \begin{table}<Esc>yyplcwend<Esc>O\centering<CR><leader>bu
imap <leader>bu \begin{tabular}{}<Esc>yyplcwend<Esc>$xxo\caption{Caption}<Esc>o\label{tab:table}<Esc>kkO<C-T>
imap <leader>fi \begin{figure}<Esc>yyplcwend<Esc>O<C-T>'ce<C-T>\caption{\small }<CR>\label{fig:}<Esc>kO'gr
imap <leader>/ <Esc>I%
imap <leader>se \section{}<Esc>o\label{sec:}<Esc>k0f}i
imap <leader>ss \subsection{}<Esc>o\label{sec:}<Esc>k0f}i
imap <leader>eq \begin{equation}<esc>yypfbcwend<esc>O<C-T>
imap <leader>al \begin{align}<esc>yypfbcwend<esc>O<C-T>
imap <leader>co \begin{columns}[c]<esc>yypfbcwend<esc>f[DO<C-T>\begin{column}{0.5\textwidth}<esc>yypfbcwend<esc>2f{DO<C-T>


