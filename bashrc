# .bashrc

[[ $- != *i* ]] && return

if [[ `hostname -d` == "cern.ch" ]]; then
    User_release_area="/afs/cern.ch/work/s/shall/cmtuser"
fi

if [ -f ~/.bash/bash_colors ]; then
    source ~/.bash/bash_colors
fi

if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

if [ -f ~/.bash/bash_lhcb ]; then
    source ~/.bash/bash_lhcb
fi

if [ -f ~/.bash/bash_sam ]; then
    source ~/.bash/bash_sam
fi



# make prompt fancy.
#   \n puts a return carrage to seperate commands
#      from one-another. I find this more readable
#   colour depending on hostname domain
#
#   [user@host:current directory]$
#
if [[ `hostname -d` == "hep.ph.ic.ac.uk" ]]; then 
        echo "Remember to Setup lhcb"
        alias lhcb=". ~lhcb/grouplogin/lhcb_login.sh"
        PS1="\[$bldblu\]\h:\W\$\[$txtrst\] "
elif [[ `hostname` == "pclbic01" ]]; then
        clear
        cat $HOME/.bash/welcome.txt
        stty sane
        #PS1="\[$bldred\]\h\[$bldwht\]:\[$intcyn\]\W\[$bldred\]\$\[$txtrst\] "
        PS1="\[$bldpur\]\h\[$bldwht\]:\[$intylw\]\W\[$bldpur\]\$\[$txtrst\] "
        alias lhcb="LbLogin -c x86_64-slc5-gcc46-opt"
elif [[ `hostname` == "hactar" ]]; then
        clear
        cat $HOME/.bash/welcome.txt
        stty sane
        PS1="\[$intgrn\]\h\[$intwht\]:\[$intgrn\]\W\[$intblu\]\$\[$txtrst\] "
        source /usr/local/root/bin/thisroot.sh
elif [[ `hostname -d` == "cern.ch" ]]; then
        clear
        cat $HOME/.bash/welcome.txt
        stty sane
        PS1="\[$bldcyn\]\h\[$bldwht\]:\[$intpur\]\W\[$bldcyn\]\$\[$txtrst\] "
        alias lhcb="LbLogin -c x86_64-slc5-gcc46-opt"
        alias lhcb_43="LbLogin -c x86_64-slc5-gcc43-opt"
elif [[ `hostname` == "pclbscifi01" ]]; then
        PS1="\[$bldred\]\h:\W\$\[$txtrst\] "
else
        PS1="\[$bldgrn\]\h\[$bldwht\]:\[$intylw\]\W\[$bldgrn\]\$\[$txtrst\] "
fi

PYTHONPATH=${PYTHONPATH}:~/src/GangaUtils
PYTHONPATH=${PYTHONPATH}:/afs/cern.ch/user/s/shall/scripts
DLHCB="https://svn.cern.ch/reps/lhcbdocs"
DICL="svn+ssh://svn.cern.ch/reps/lhcbimperial/Users"
LXP="shall@lxplus5.cern.ch"
HEAD_INC="/afs/cern.ch/work/s/shall/include"

# Important ones
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias root="root -l"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias tmux="tmux -2"
