
call Tabglobal(2)

augroup vimrc
    au BufReadPre * setlocal foldmethod=syntax
    au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
augroup END


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
imap <leader>ma int main<Space>(int argc, char *argv[])<space>{<CR>}<Esc>Oreturn 0;<Esc>O
imap <leader>sw switch()<Space>{<CR>case :<CR>default:<CR>}<Esc>kO<C-T>break;<Esc>2khi
imap <leader>co std::cout<Space><<<Space>"<Space><<<Space>std::endl;<Esc>F"i"
imap <leader>as assert();<esc>F(a
map <leader>/ I//<Esc>j
imap <leader>/ <Esc>I//
map <S-Insert> <MiddleMouse>
vmap ? I//<Esc>

" REALLY LAZY
imap <leader>ve std::vector<><esc>F<a
imap <leader>st std::string


" ROOT and RooFit syntax highlighting
" /usr/share/vim/vim70/syntax for examples
syn keyword rootType   Int_t Double_t Float_t ULong64_t Bool_t Short_t
syn keyword rootType   TTree TFile TChain TBranch TLeaf
syn keyword rootType   TH1 TH1F TH1D TH1I
syn keyword rootType   TH2 TH2F TH2D TH2I
syn keyword rootType   TH3 TH3F TH3D TH3I
syn keyword rootType   TLorentzVector TGenPhaseSpace
syn keyword rootType   TCanvas TLine TBox TLegend TLatex TString TGraph TAxis
syn keyword rootType   TRandom3 TMath TVector3 TCut TObject
syn keyword rootType   TF1 TPaveText
syn keyword rootType   TTreeFormula TStyle TVirtualPad TPad
syn keyword rootType   TKey TIter
syn keyword rootType   TXMLEngine XMLDocPointer_t XMLNodePointer_t

syn keyword rooType    RooAbsPdf RooSimPdf RooRealVar RooFormulaVar
syn keyword rooType    RooGaussian RooExponential RooDataSet
syn keyword rooType    RooKeysPdf RooPlot RooSimultaneous RooWorkspace
syn keyword rooType    RooCategory RooArgList RooArgSet SPlot
syn keyword rooType    RooMinuit RooNLLVar RooAddPdf RooChebychev
syn keyword rooType    RooAbsReal RooExpAndGauss RooCBShape RooVoigtian
syn keyword rooType    RooArgusBG

syn keyword strType    string stringstream vector map

syn keyword rooConst   kTRUE kFALSE
syn keyword rooConst   kRed kOrange kYellow kSpring kGreen kTeal kCyan kAzure
syn keyword rooConst   kBlue kViolet kMagenta kPink
syn keyword rooConst   kBlack kWhite kGray

syn keyword samType    Elm DendrologyElm Easel Easel1D Easel2D EaselRoot
syn keyword samType    EaselRoo Monkey Gibbon Barrel Knives Kcuts Kgt Kin
syn keyword samType    Klt Kout Kis Kanga


hi def link rootType   Type
hi def link rooType    Type
hi def link strType    Type
hi def link rooConst   Constant

iabbr cstr c_str()
iabbr MM <<
