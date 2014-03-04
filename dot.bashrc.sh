# .bashrc

[[ $- != *i* ]] && return


if [ -f ~/.bash/bash_colors.sh ]; then
  source ~/.bash/bash_colors.sh
fi

if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

if [ -f ~/.bash/bash_lhcb.sh ]; then
  source ~/.bash/bash_lhcb.sh
fi

if [ -f ~/.bash/bash_sam.sh ]; then
  source ~/.bash/bash_sam.sh
fi

if [ -f ~/.bash/bash_icl.sh ]; then
  source ~/.bash/bash_icl.sh
fi

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='OSX'
fi

if [[ $platform == "OSX" ]]; then
  PS1="\[$intgrn\]earth\[$intwht\]:\[$intgrn\]\W\[$intblu\]\$\[$txtrst\] "
else
  if [[ `hostname -d` == "hep.ph.ic.ac.uk" ]]; then
    alias lhcb=". ~lhcb/grouplogin/lhcb_login.sh"
    PS1="\[$intblu\]\h\[$txtwht\]:\[$txtgrn\]\W\[$txtblu\]\$\[$txtrst\] "
  elif [[ `hostname` == "pclbic01" ]]; then
    clear
    cat $HOME/scripts/todo.txt
    stty sane
    #PS1="\[$bldred\]\h\[$bldwht\]:\[$intcyn\]\W\[$bldred\]\$\[$txtrst\] "
    PS1="\[$bldpur\]\h\[$bldwht\]:\[$intylw\]\W\[$bldpur\]\$\[$txtrst\] "
    alias lhcb="LbLogin -c x86_64-slc5-gcc46-opt"
  elif [[ `hostname -d` == "cern.ch" ]]; then
    clear
    cat $HOME/scripts/todo.txt
    stty sane
    PS1="\[$bldcyn\]\h\[$bldwht\]:\[$intpur\]\W\[$bldcyn\]\$\[$txtrst\] "
    alias lhcb="LbLogin -c x86_64-slc5-gcc46-opt"
    alias lhcb_43="LbLogin -c x86_64-slc5-gcc43-opt"
  elif [[ `hostname` == "pclbscifi01" ]]; then
    PS1="\[$bldred\]\h:\W\$\[$txtrst\] "
  else
    PS1="\[$bldgrn\]\h\[$bldwht\]:\[$intylw\]\W\[$bldgrn\]\$\[$txtrst\] "
  fi
fi

if [ -f /usr/local/root/bin/thisroot.sh ]; then
  source /usr/local/root/bin/thisroot.sh
fi

# Important ones
if [[ $platform == 'linux' ]]; then
  alias ls='ls --color=auto'
elif [[ $platform == 'OSX' ]]; then
  alias ls='ls -G'
fi

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias root="root -l"
alias grep="grep --color=auto"
alias tmux="tmux -2"
