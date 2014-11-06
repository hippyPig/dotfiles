
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
alias vim='vim -w ~/.vimlog "$@"'
alias vin="vim"
alias vi="vim"
alias vmi="vim"
alias im="vim"
alias pyhton="python"

# my scripts
alias remake="make -B"
alias pdg="firefox http://pdglive.lbl.gov/listings1.brl?quickin=Y"
alias ssetup="source setup.sh"

alias m="make"
alias M="make clean && make -j"

#make() {
  #pathpat="(/[^/]*)+:[0-9]+"
  #ccred=$(echo -e "\033[0;31m")
  #ccyellow=$(echo -e "\033[0;33m")
  #ccend=$(echo -e "\033[0m")
  #/usr/bin/make "$@" 2>&1 | sed -E -e "/[Ee]rror[: ]/ s%$pathpat%$ccred&$ccend%g" -e "/[Ww]arning[: ]/ s%$pathpat%$ccyellow&$ccend%g"
  #return ${PIPESTATUS[0]}
#}

#alias wol="$HOME/.wol/python/wol.py "
export PATH=$PATH:$HOME/.wol/python
source $HOME/.wol/wol-autocomplete.sh
source $HOME/.bash/make-autocomplete.sh
export WOLDIR="$HOME/Documents/Wol"
export thesis=$HOME/Documents/thesis/tex
export paper=$HOME/Documents/LHCb-PAPER-2014-030/latest/latex
export ana=$HOME/Documents/ana/latest/latex

if [ -f $HOME/.git-completion.bash ]; then
  source $HOME/.git-completion.bash
fi
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
export PYTHONPATH=$PYTHONPATH:/usr/local/python
alias svn=$HOME/.svn-color/svn-color.py
alias therapy='cat /dev/urandom | hexdump -C | grep "ca fe"'

export PATH=$PATH:/usr/local/scripts/



