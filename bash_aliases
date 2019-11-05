#!/bin/bash

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias cd..='cd ..'
alias gac='git add *.java; git commit'

alias gradlew-hc='./gradlew cleanIdea cleanIdeaWorkspace idea'
alias gb='./gradlew build'
alias gw='./gradlew'
alias gwforward='./gradlew cJ cTJ checkstyleMain checkstyleTest'
alias checkstyle='./gradlew checkstyleMain checkstyleTest'
alias gwtest='./gradlew cJ cTJ check test'
alias pgdev='./gradlew format && git add --all && git commit --amend --no-edit && git push origin HEAD:refs/for/develop'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
