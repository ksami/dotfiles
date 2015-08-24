#!/bin/sh

# List of files/dirs to symlink
SYMLINK_LIST="
.vim
.vimrc
.gitconfig
.bashrc
.zshrc
"


# Check for git
if ! command -v git; then
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
if cat /etc/shells | grep "zsh"; then
    PATH_TO_ZSH=$(which zsh)
    if [ $SHELL != $PATH_TO_ZSH ]; then
        echo "Changing shell to zsh"
        sudo chsh -s $PATH_TO_ZSH
    else
        echo "Already using zsh!"
    fi
else
    echo "zsh not found, please install zsh then change shell"
fi



# Install Vundle
if command -v vim; then
    echo "Installing Vundle"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
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
  echo "\033[0;33mYou already have Oh My Zsh installed.\033[0m You'll need to remove $ZSH if you want to install"
  exit
fi

echo "\033[0;34mCloning Oh My Zsh...\033[0m"
hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH || {
  echo "git not installed"
  exit
}

TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    echo "\033[0;34mTime to change your default shell to zsh!\033[0m"
    chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi
unset TEST_CURRENT_SHELL

echo "\033[0;32m"'         __                                     __   '"\033[0m"
echo "\033[0;32m"'  ____  / /_     ____ ___  __  __   ____  _____/ /_  '"\033[0m"
echo "\033[0;32m"' / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \ '"\033[0m"
echo "\033[0;32m"'/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / / '"\033[0m"
echo "\033[0;32m"'\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/  '"\033[0m"
echo "\033[0;32m"'                        /____/                       ....is now installed!'"\033[0m"
echo "\n\n \033[0;32mPlease look over the ~/.zshrc file to select plugins, themes, and options.\033[0m"
echo "\n\n \033[0;32mp.s. Follow us at http://twitter.com/ohmyzsh.\033[0m"
echo "\n\n \033[0;32mp.p.s. Get stickers and t-shirts at http://shop.planetargon.com.\033[0m"
env zsh
. ~/.zshrc


echo "Done"