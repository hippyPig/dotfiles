#!/bin/bash

_makeauto() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  case ${COMP_CWORD} in
    1)
      COMPREPLY=( $(compgen -W \
        "clean open" \
        -- "$cur") ) ;;
    *)
      COMPREPLY=() ;;
  esac
}

_makeipythonauto() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  case ${COMP_CWORD} in
    1)
      COMPREPLY=( $(compgen -W \
        "notebook" \
        -- "$cur") ) ;;
    *)
      COMPREPLY=() ;;
  esac
}

complete -o default -f -F _makeauto make
complete -o default -f -F _makeipythonauto ipython


