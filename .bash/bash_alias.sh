
# useful shortcuts
alias ll="ls -ltr"
alias lh="ls -ltrh"
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
alias spython="ipython --profile=sam"
alias noteboot="ipython notebook --matplotlib=inline"
alias fucking="sudo"

# my scripts
alias ssetup="source setup.sh"

alias m="make"
alias M="make clean && make -j"

mandr () {
  # make and run!
  make
  if [[ $? -ne 0 ]] ; then
    echo -e $intred"MAKE FAILED"$txtrst
  else
    echo -e $intpur"MAKE SUCCESSFUL"$txtrst
    RUN=$(history | grep "\W bin/" | tail -n1 | awk '{ print $2 }')
    echo -e $intylw"RUN " $RUN$txtrst
    $RUN
  fi
}

alias svn=$HOME/.svn-color/svn-color.py
alias therapy='cat /dev/urandom | hexdump -C | grep "ca fe"'
