#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/configs                      # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="bashrc bash_aliases bash_prompt.sh git-completion.bash git-prompt.sh tmux.conf gitconfig pylintrc profile"    # list of files/folders to symlink in homedir

bindir=/usr/local/bin
bins="gg.rb" # list of files/folders to symlink in /usr/local/bin

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# repeat for bins
echo "Moving any existing bins from $bindir to $bindir/old"
mkdir -p $bindir/old
for file in $bins; do
   echo "Creating symlink to $file in $bindir"
   y=${file%%.*}
   mv $bindir/$y $bindir/old/$y
   ln -s $dir/$file $bindir/$y
done

