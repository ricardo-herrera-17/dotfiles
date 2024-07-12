#!/bin/zsh

alias nv='nvim'
alias py='python3'
alias c='clear'
alias lg='lazygit'
alias ld='lazydocker'
alias q='exit'

alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'

# ls
alias ld='eza -lD'                                          # lists only directories (no files) 
alias lf='eza -lF --color=always | grep -v /'               # lists only files (no directories, no hidden files)
alias lF='eza -alF --color=always --sort=size | grep -v /'  # lists only files sorted by size
alias lh='eza -dl .* --group-directories-first'             # lists only hidden files (no directories)
alias ll='eza -al --group-directories-first'                # lists everything with directories first
alias lt='eza -al --sort=modified'                          # lists everything sorted by time updated
alias lT='eza --tree'

alias zConf='cd ~/.config && nvim'
alias zSource='source ~/.config/zsh/.zshrc'
