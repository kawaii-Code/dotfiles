[[ -f ~/.bashrc ]] && . ~/.bashrc

export CDPATH=.:$HOME:..
export PATH=$HOME/app:$PATH

export EDITOR="vim -S $HOME/.vimdistractionfree"
export VISUAL=$EDITOR

export PYTHONSTARTUP="$HOME/.pythonrc.py"
export LESS='-iMRSj.5'
