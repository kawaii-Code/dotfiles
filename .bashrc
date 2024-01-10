[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoredups

stty -ixon

# ---

c() {
	cd $1 && exa -lah
}
alias cd=c
alias vm="vim -S ~/.vim/distractionfree.vim"
alias view='vim -S ~/.vim/readonly.vim'
alias la='exa -lah'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pd='pushd'
alias dp='popd'

# ---

DEV=~/dev
EDU=~/dev/notes
INB=~/inb
RES=~/res

gd() {
	dir=$(find $DEV -maxdepth 2 -type d -print | fzf) || return $?
	pushd $dir
}

ge() {
	dir=$(find $EDU -type d -print | fzf) || return $?
	pushd $dir
}

gr() {
	dir=$(find $RES -type d -print | fzf) || return $?
	pushd $dir
}

toinb() {
    mv -i -t $INB $@
}

# ---

_quote() {
    READLINE_LINE="${READLINE_LINE@Q}"
}
bind -x '"\C-x\C-q":_quote'
bind '"\C-x\C-g":"gw\n"'
