[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

export CDPATH=.:$HOME:..
export PATH="$HOME/app:$HOME/opt/ruby/bin:$HOME/bin:$HOME/.local/bin:$PATH:/sbin:$HOME/bin/hare/bin"

export EDITOR=vim
export VISUAL=$EDITOR

export LESS='-iMRSj.5'
