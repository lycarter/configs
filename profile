# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.cabal/bin" ] ; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

PATH=~/Library/Python/3.6/bin:$PATH

##
# Your previous /Users/lcarter/.profile file was backed up as /Users/lcarter/.profile.macports-saved_2019-10-19_at_07:59:49
##

# MacPorts Installer addition on 2019-10-19_at_07:59:49: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# export JAVA_HOME=$(/usr/libexec/java_home)
# export GRADLE_OPTS="-Djavax.net.ssl.trustStore=$(/usr/libexec/java_home)/lib/security/cacerts -Djavax.net.ssl.trustStorePassword=changeit -Djavax.net.ssl.keyStore=$(/usr/libexec/java_home)/lib/security/cacerts -Djavax.net.ssl.keyStorePassword=changeit"