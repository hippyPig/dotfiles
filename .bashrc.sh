# .bashrc

[[ $- != *i* ]] && return

if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

if [ -f ~/.bash/bash_colors.sh ]; then
  source ~/.bash/bash_colors.sh
fi

if [ -f ~/.bash/bash_sam.sh ]; then
  source ~/.bash/bash_sam.sh
fi

if [ -f ~/.bash/bash_alias.sh ]; then
  source ~/.bash/bash_alias.sh
fi

if [ -f ~/.bash_local ]; then
  source ~/.bash_local
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='OSX'
fi

if [[ $platform == "OSX" ]]; then
  PS1="\[$intcyn\]hooloovoo\[$intwht\]:\[$intgrn\]\W\[$intblu\]\$\[$txtrst\] "
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
#alias tmux="tmux -2"

#export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig
#PERL_MB_OPT="--install_base \"/Users/scphall/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/Users/scphall/perl5"; export PERL_MM_OPT;
#[ $SHLVL -eq 1 ] && eval "$(perl -I$HOME/foo/lib/perl5 -Mlocal::lib=$HOME/foo)"
#[ $SHLVL -eq 1 ] && eval "$(perl -I$HOME/foo/lib/perl5 -Mlocal::lib=/usr/local/spread0r)"


source /opt/homebrew/bin/virtualenvwrapper.sh
