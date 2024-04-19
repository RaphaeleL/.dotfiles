# --- PROMPT --- 
export PS1='\u@\h:\[\e[01;36m\]\w\[\e[0m\]\$ '
# export PS1='\[\e[01;32m\]\u@\h:\[\e[01;34m\]\w\[\e[0m\]\$ '
# export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
# export PS1='\h:\W \u\$ '
# export PS1='[\u@\h \[\e[01;36m\]\w\[\e[0m\]]\$ '

# --- PROFILE --- 
export CLICOLOR=1
export BASH_SILENCE_DEPRECATION_WARNING=1
export BASH_SESSIONS_DISABLE=1
export LESSHISTFILE=-
export EDITOR='nvim'

# --- PATH --- 
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/bin:$PATH";


# --- Alias' --- 
# Basics 
alias lg="lazygit"
alias vim="nvim"
alias vi="NVIM_APPNAME=macnvim nvim"
alias v="/usr/bin/vim"

# Tmux
alias tn="tmux display-message -p '#S'"
alias tl="tmux list-sessions"
alias ta="tmux attach -t"
alias td="tmux detach"
alias tk="tmux kill-session -a -t"
tms() {
    local dir
    # find ${1:-.}
    dir=$(find ~/Projects ~/.config ~/Documents ~/Desktop ~/Downloads-type d 2> /dev/null | fzf +m)
    session_name=$(basename $dir)
    tmux has-session -t=$session_name 2> /dev/null

    if [[ $? -ne 0 ]]; then
        TMUX='' tmux new-session -d -s "$session_name" -c $dir
    fi

    if [[ -z "$TMUX" ]]; then
        tmux attach -t "$session_name"
    else
        tmux switch-client -t "$session_name"
    fi
}

# Permissions 
alias perms="stat -f '%N %A' *"

# Spezial Commands simplified 
alias remove="shred -n 512 --remove "
alias sizes="du -sh * | gsort -hr"
alias uuid="sysctl -n kernel.random.uuid"

# List Directory - geohot
alias ls='ls -Ghp'

# i3 Window Manager
alias hpoff="xrandr --output eDP --off"
alias hpon="xrandr --output eDP --off"


