#!/bin/bash

# Sync database
pacman -Syy
yaourt -Syua

# Install all apps
yaourt -S git gvim ruby dmenu nodejs i3 dmenu google-chrome chromium chromium-pepper-flash svn feh scrot lxappearance zsh openssh cmus ack-grep silversearcher-ag  --noconfirm

# Git configs
git config --global user.email "franklinjalves@gmail.com"
git config --global user.name "Franklin Javier"
git config --global http.sslVerify false
git config credential.helper 'cache --timeout=999999'
git config --global push.default simple


mkdir ~/b0x
mkdir ~/.i3
git clone https://github.com/franklinjavier/dotFiles.git ~/b0x/dotFiles
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/b0x/dotFiles/.vim ~/.vim
ln -s ~/b0x/dotFiles/i3/config ~/.i3/config
rm ~/.config/xfce4/terminal/terminalrc
ln -s ~/b0x/dotFiles/terminalrc ~/.config/xfce4/terminal/terminalrc

# Oh my zsh
curl -L http://install.ohmyz.sh | sh
rm ~/.zshrc
ln -s ~/b0x/dotFiles/oh-my-zsh/zshrc ~/.zshrc
rm ~/.oh-my-zsh/themes/agnoster.zsh-theme
ln -s ~/b0x/dotFiles/oh-my-zsh/agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
ln -s ~/b0x/dotFiles/fonts/* /usr/share/fonts/
fc-cache -fv

# inserir zsh no final do ~/.bashrc
