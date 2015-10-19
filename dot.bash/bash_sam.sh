
if [ -f $HOME/.git-completion.bash ]; then
  source $HOME/.git-completion.bash
fi

#ssh autocompletion
if [ -f ~/.ssh/config ]; then
  complete -f -W "$(grep ^Host ~/.ssh/config | grep -v \* | cut -d' ' -f 2)" ssh
  complete -f -W "$(grep ^Host ~/.ssh/config | grep -v \* | cut -d' ' -f 2)" scp
  complete -f -W "$(grep ^Host ~/.ssh/config | grep -v \* | cut -d' ' -f 2)" sshfs
fi
