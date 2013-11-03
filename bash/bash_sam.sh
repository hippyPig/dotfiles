
# useful shortcuts
alias ll="pwd && ls -ltr"
alias lh="pwd && ls -ltrh"
alias la="ls -a"
alias lsl="ls -l"
alias ..="cd .."
alias ...="cd ../.."

# spelling errors
alias sl="ls "
alias kd="cd"
alias vin="vim"
alias vi="vim"
alias vmi="vim"
alias im="vim"
alias pyhton="python"

# my scripts
alias r=". $HOME/scripts/root.sh "
alias groot="$HOME/scripts/grt.sh"
alias remake="make -B"
alias pdg="firefox http://pdglive.lbl.gov/listings1.brl?quickin=Y"
alias jabberwocky="echo 'Twas brilling and the slithy toves'"
alias particles="$HOME/scripts/particles.sh"
alias decays="$HOME/scripts/decays.py"
alias tmvagui="$HOME/scripts/tmvagui.sh"
alias bdt="python /afs/cern.ch/work/s/shall/public/bdt/bdtrun.py"
alias bible="evince $HOME/scripts/lhcbdetector.pdf"
alias pyroot="echo 'from ROOT import TTree, TFile, TH1F, TCanvas' && python"
alias draw="$HOME/scripts/draw.py"
alias mkdirana="$HOME/scripts/mkdirana.sh"
alias ssetup="source setup.sh"
alias disk="du -h --max-depth=1"

#make() {
#  pathpat="(/[^/]*)+:[0-9]+"
#  ccred=$(echo -e "\033[0;31m")
#  ccyellow=$(echo -e "\033[0;33m")
#  ccend=$(echo -e "\033[0m")
#  /usr/bin/make "$@" 2>&1 | sed -E -e "/[Ee]rror[: ]/ s%$pathpat%$ccred&$ccend%g" -e "/[Ww]arning[: ]/ s%$pathpat%$ccyellow&$ccend%g"
#  return ${PIPESTATUS[0]}
#}

alias wol="$HOME/scripts/wol/python/wol.py "
export WOLDIR="$HOME/Wol"
complete -o nospace -f default -X '.*' -F _wol wol

if [ $platform == "OSX" ]; then
  source ~/.git-completion.bash
fi
