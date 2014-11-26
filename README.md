.dotfiles
=========
###Files
- .vim/colors for vim colorschemes
- .vimrc for vim  
- .zshrc.orig for the zsh shell  
- .zshrc for oh-my-zsh  
  
###Instructions  
Clone repo  
`git clone https://github.com/ksami/dotfiles`  

Symlink desired files to home directory   
`ln -s /path/to/file/ ~/file`  
or just copy the files to home directory if you don't want to keep it linked to this repo  
`cp /path/to/file/ ~`

Rename .zshrc.orig to .zshrc if you are not using oh-my-zsh  
`mv .zshrc.orig .zshrc`  
  
For example, to use the vim config file and colorschemes:
```
cd ~
git clone https://github.com/ksami/dotfiles
ln -s dotfiles/.vimrc ~/.vimrc
ln -s dotfiles/.vim ~/.vim
```
  
#####Todo
- [ ] Screenshots
- [ ] How to get oh-my-zsh
