#!bin/bash

BASE_PATH="/home/$(whoami)"

# Update and install all app
apt update
apt-get install -y php5 apache2 mysql-server php5-mysql gimp vim-gtk compizconfig-settings-manager i3 i3lock i3status dmenu git feh scrot zsh cmus curl subversion fonts-inconsolata
apt update

# Git
git config --global user.email "franklinjalves@gmail.com"
git config --global user.name "Franklin Javier"
git config --global http.sslVerify false
git config credential.helper 'cache --timeout=999999'
git config --global push.default simple

# Apache
chmod 777 /var/www/ -R
a2enmod rewrite
sed -i 's/AllowOverride\ None/AllowOverride\ All/' /etc/apache2/sites-available/000-default.conf
/etc/init.d/apache2 restart

# Vim
mkdir ~/b0x
mkdir ~/.i3
git clone https://github.com/franklinjavier/dotFiles.git ~/b0x/dotFiles
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/b0x/dotFiles/.vim ~/.vim
ln -s ~/b0x/dotFiles/i3/config ~/.i3/config
rm ~/.config/xfce4/terminal/terminalrc
ln -s ~/b0x/dotFiles/terminalrc ~/.config/xfce4/terminal/terminalrc

#" Add alias to the .bashrc"
echo alias devim='gvim --remote $(find . -name *.js*)' >> ~/.bashrc

# themes

sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
sudo apt-get install mediterranean-theme



# Java

sudo apt-get install default-jre

# Davmail

sudo apt-get install davmail

OU http://sourceforge.net/projects/davmail/files/

# Email Geary

sudo add-apt-repository ppa:yorba/ppa
sudo apt-get update && sudo apt-get install geary


davs://upload.intranet/jsuol.com
smb://moises/dcu_interface_arte/infografico
sudo svn checkout https://publicador.svn.intranet/repository/metatemplate/br/com/uol/noticias/



# Pidgin

Connection security: “Use old-style SSL
Connect Port: 443
Connect Server: talk.google.com



# nodejs

git clone https://github.com/joyent/node.git
cd node
git checkout v0.10.26 #Try checking nodejs.org for what the stable version is
./configure && make && sudo make install
sudo apt-get install npm

# yoeman
npm install -g yo



#fish shell

http://fishshell.com/

Switching to fish

If you wish to use fish as your default shell, use the following command:

chsh -s /usr/local/bin/fish
chsh will prompt you for your password, and change your default shell.

To switch your default shell back, you can run:

chsh -s /bin/bash
Substitute /bin/bash     with /bin/tcsh or /bin/zsh as appropriate.



# Mudando de git:// para https://

git config --global url."https://".insteadOf git://

# Erro de SSL

git config --global http.sslVerify false

