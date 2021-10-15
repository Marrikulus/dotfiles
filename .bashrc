#  ___    ___
# |   \  /   |
# | |\ \/ /| |
# | | \  / | |
# | |  \/  | |
# |_|      |_|
#
# Marrikulus's bash config

export TERM="xterm-256color"
export VISUAL="nvim"
export EDITOR="$VISUAL"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

alias vim='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias cit='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'

if [ $(lsb_release -is) == "ArcoLinux" ]; then
    stty -ixon
fi

export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


shopt -s histappend
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -l'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -r /home/ingimar/.byobu/prompt ]; then
    . /home/ingimar/.byobu/prompt   #byobu-prompt#
fi
if [ $(lsb_release -is) != "Ubuntu" ]
then
    if [ "$SSH_AGENT_PID" != "" ] && ps -p $SSH_AGENT_PID > /dev/null
    then
        ssh-add -L > /dev/null
        if [ $? -eq 1 ]
        then
            ssh-add
        fi
    else
        eval $(ssh-agent -s)
        ssh-add
    fi
fi

# PATHS
if [ -d ~/.bin ]; then
    export PATH="$PATH:~/.bin"
fi

if [ -d ~/bin ]; then
    export PATH="$PATH:~/bin"
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d ~/.yarn/bin ]; then
    export PATH=$PATH:~/.yarn/bin
fi

if [ -d ~/node_modules/.bin ]; then
    export PATH=$PATH:~/node_modules/.bin
fi

## XDG base spec fixes
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export LESSHISTFILE=-

alias kk="du -xsch .[!.]* * |sort -h"
alias project_name="head /dev/urandom | tr -dc a-z | head -c2 | xargs look | shuf |head -n1"
alias df='df -x"squashfs"'


cp_exe_from_pkg(){
    for i in $(dpkg -L $1 |xargs file | grep ^/usr/bin |grep executable|col1|rev|cut -c 2- |rev);do  cp $i .; done
}


ex(){
    case $1 in
        (*.zip) unzip $1 ;;
        (*.tar.gz) tar -xvzf $1 ;;
        (*.tar.bz) tar -xvjf $1 ;;
        (*.tar.bz2) tar -xvjf $1 ;;
        (*.tar.xz) tar -xvf $1 ;;
        (*) echo "dont understand extension" ;;
    esac
}

body(){
    IFS= read -r header
    printf '%s\n' "$header"
    "$@"
}

source <(kubectl completion bash)

