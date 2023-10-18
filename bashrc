# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
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

source ~/.bash_prompt.sh
# set a fancy prompt (non-color, unless we know we "want" color)
#PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'

## overridden by bash_prompt.sh
# PS1="\[\e[0;34m\]\t\[\e[0;34m\]-\[\e[0;34m\]\u \[\e[0;33m\]\[\e[0;33m\]\w\[\033[m\]\[\e[1;35m\]\$(__git_ps1)\[\e[0;37m\]\$ "
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac

# turn on colors
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export GOPATH=/Volumes/git/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/Users/lcarter/Library/Python/3.8/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:"/Users/lcarter/Library/Application Support/JetBrains/Toolbox/scripts"

# Uncomment for ruby support
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export GPG_TTY=$(tty)

export NODE_EXTRA_CA_CERTS=/Users/lcarter/Downloads/PalantirThirdGenRootCA-selfsign.pem

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/Users/lcarter/.netlify/helper/path.bash.inc' ]; then source '/Users/lcarter/.netlify/helper/path.bash.inc'; fi

# https://github.palantir.build/deployability/kubectl-scripts
if [[ -f $GOPATH/src/github.palantir.build/deployability/kubectl-scripts/bash.sh ]]; then
    source $GOPATH/src/github.palantir.build/deployability/kubectl-scripts/bash.sh
fi
# The next line updates PATH for Netlify's Git Credential Helper.
test -f '/Users/lcarter/Library/Preferences/netlify/helper/path.bash.inc' && source '/Users/lcarter/Library/Preferences/netlify/helper/path.bash.inc'

# https://github.com/android-password-store/Android-Password-Store/issues/173#issuecomment-453686599
# https://github.com/lycarter/pass/commit/6ec5c8149875dbf65b1db8f48ae44d72520c7383
export PASSWORD_STORE_GPG_OPTS='--no-throw-keyids'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
