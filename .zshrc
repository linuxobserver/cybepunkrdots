#!/bin/zsh
autoload -U colors && colors	# Load colors
setopt autocd		# Automatically cd into typed directory.

export PS1=' > '
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

alias pacup="sudo pacman -Syyu"
alias a="afetch"
alias vim="nvim"
alias ls="exa -la"
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias bashrc="nvim ~/.bashrc && source ~/.bashrc"
alias swayedit="nvim ~/.config/sway/config.d/bindings"

#afetch
#echo " "
bindkey -s '^n'  'nvim ~/Documents/notes/notes.md\n '
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
bindkey '^[[P' delete-char
bindkey -s '^r' 'wf-recorder  --audio --file=$HOME/Videos/screencast-$(date '+%y%m%d-%H%M-%S').mp4 && notify-send "Start Recording..."\n '


# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
