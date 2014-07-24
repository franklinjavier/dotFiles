#!/bin/bash

# Sync database
pacman -Syy
yaourt -Syua

# Install all apps
pacman -S git gvim ruby dmenu nodejs i3 dmenu
yaourt -S google-chrome chromium chromium-pepper-flash svn feh scrot lxappearance zsh --noconfirm

# Oh my zsh
curl -L http://install.ohmyz.sh | sh
rm ~/.zshrc
ln -s ~/r00t/dotFiles/oh-my-zsh/zshrc ~/.zshrc
rm ~/.oh-my-zsh/themes/agnoster.zsh-theme 
ln -s ~/r00t/dotFiles/oh-my-zsh/agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
ln -s ~/r00t/dotFiles/fonts/* /usr/share/fonts/
fc-cache -fv
# inserir zsh no final do ~/.bashrc

# Cloning all repos
mkdir ~/r00t
git clone https://github.com/franklinjavier/dotFiles.git ~/r00t/dotFiles
ln -s ~/r00t/dotFiles/.vim ~/.vim
ln -s ~/r00t/dotFiles/i3/config ~/.i3/config
rm ~/.config/xfce4/terminal/terminalrc
ln -s ~/r00t/dotFiles/terminalrc ~/.config/xfce4/terminal/terminalrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
