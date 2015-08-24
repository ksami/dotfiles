#!/bin/sh

# Requires:
# Git
# Zsh
# Vim

# List of files/dirs to symlink
SYMLINK_LIST="
.vim
.vimrc
.gitconfig
.bashrc
.zshrc
"


# Check for git
if ! command -v git &>/dev/null; then
    echo "git not found, please install git and try again"
    echo "Exiting..."
    exit 1
fi


# Directory script is in
BASE_DIR=$(cd $(dirname $0);pwd)

for FILE in $SYMLINK_LIST; do
    # Backup existing files
    if [ -e ~/$FILE ]; then
        echo "Backing up ~/$FILE to ~/$FILE.old"
        mv ~/$FILE ~/$FILE.old
    fi

    # Create symlink
    echo "Creating symlink from $BASE_DIR/$FILE to ~/$FILE"
    ln -s $BASE_DIR/$FILE ~/$FILE
done



# Set shell to zsh
if grep -q "zsh" /etc/shells; then
    TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
    if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
        echo "Changing default shell to zsh"
        chsh -s $(grep /zsh$ /etc/shells | tail -1)
    else
        echo "Already using zsh!"
    fi
    unset TEST_CURRENT_SHELL
else
    echo "zsh not found, please install zsh then change shell"
fi



# Install Vundle
if command -v vim &>/dev/null; then
    if [ ! -e "~/.vim/bundle/Vundle.vim" ]; then
        echo "Installing Vundle"
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        vim +PluginInstall +qall
    else
        echo "Vundle already installed"
    fi
else
    echo "Vim not found, please install vim then install Vundle"
fi



# Cause auto termination of script should any command from this point fail
set -e

# Install oh-my-zsh
if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

if [ -d "$ZSH" ]; then
  echo "You already have Oh My Zsh installed. You'll need to remove $ZSH if you want to install"
  exit
fi

echo "Cloning Oh My Zsh..."
hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH || {
  echo "git not installed"
  exit
}

env zsh

# Execute commands from file in current shell
. ~/.zshrc
