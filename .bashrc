[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoredups

# I don't know what that is...
stty -ixon

# A wrapper around notify-send that also plays a sound
notify() {
    ICON=$(shuf "$HOME/res/previews.txt" | head -n1)
    SOUND="$HOME/res/35-Audio/35-02-Funny-Sounds/kiss.mp3"
    TIME=10000

    ARGS=()
    while [[ $# -gt 0 ]]; do
    case $1 in
    -i)
        ICON=$2
        shift
        shift
        ;;
    -s)
        SOUND=$2
        shift
        shift
        ;;
    -t)
        TIME=$2
        shift
        shift
        ;;
    *)
        ARGS+=("$1")
        shift
        ;;
    esac
    done
    set -- "${ARGS[@]}"

    notify-send -i "$ICON" -u low -t $TIME "$*"
    mpv "$SOUND" > /dev/null 2>&1
}

# A timer that shows on i3 status bar. The heavy
# lifting is done by a custom script.
timer() {
    echo $* | nc -NU "/tmp/timer.sock"

    #if [ $# -lt 2 ]; then
    #    echo "timer: please specify a message"
    #    return -1
    #fi

    #local N=$1;
    #shift

    #printf "$(date "+%Y-%m-%d %H:%M")\t$N $*\n" >> ~/org/timerlog.txt

    #("$HOME/app/pipetimer" $N $* && notify -t 30000 -s "$HOME/res/32-Music/_/save-heaven.flac" "Time's up: $*" &)

    #echo "timer set for $N"
}

track() {
    echo "track" $* | nc -NU "/tmp/timer.sock"
}

c() {
    cd $1 && exa -lah
}
alias cd=c
alias vm="vim -c 'call modes#distractionfree()'"
alias view="vim -c 'call modes#readonly()'"
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

# Quote the current command line with <C-x><C-q>
_quote() {
    READLINE_LINE="${READLINE_LINE@Q}"
}
bind -x '"\C-x\C-q":_quote'
bind '"\C-x\C-g":"gw\n"'
