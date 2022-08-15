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
    alias diff='diff --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias cd..='cd ..'
alias gac='git add --all && git commit'
alias gacc='gac && ./tools/pre-push-check.sh && git add --all && git commit --amend --no-edit'
alias newBr='git fetch && git co origin/develop && git co -b'

alias gw='./gradlew'
alias gradlew-hc='gw cleanIdea cleanIdeaWorkspace idea'
alias gb='gw build'
alias checkstyle='gw checkstyleMain checkstyleTest'
alias gwtest='gw cJ cTJ check test'
alias gerrit='git push origin HEAD:refs/for/develop'
alias pgdev-nofmt='git add --all && git commit --amend --no-edit && gerrit'
alias pgdev='gw format && pgdev-nofmt'
alias pgdev-new='gw format && git add --all && git commit'
alias pgdev-check='git add --all && git commit --amend --no-edit && ./tools/pre-push-check.sh && git add --all && git commit --amend --no-edit'
alias compile='gw compileJava compileTestJava compileIntegrationTestJava'

alias gow='./godelw'
alias gofmt='./godelw format && ./godelw verify --skip-test'
alias gotest='./godelw verify'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
