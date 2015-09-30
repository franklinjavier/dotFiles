##
## Install MongoDB on Ubuntu
## by Franklin Javier
## Sep 23 2015
##

INSTALLATION_PATH="/home/$(whoami)/mongodb"
DATA_PATH="/home/$(whoami)/mongodata/"
LATEST=`curl https://github.com/mongodb/mongo/tags | grep -oh ".*.tar.gz" | sed -e "s/<a href=\"/https:\/\/github\.com${replace}/g" | head -n 1`
FILE=$INSTALLATION_PATH/mongo

# Structure
mkdir -p $INSTALLATION_PATH
cd $INSTALLATION_PATH

# Permission
sudo mkdir -p $DATA_PATH
sudo chmod 0755 $DATA_PATH
sudo chown $USER $DATA_PATH

# Download last version
wget $LATEST -O $FILE.tar.gz

# Extract content
tar -zxvf $FILE.tar.gz
mv mongo*/* .
rm -rf $FILE

# Set PATH to the bashrc
echo 'export PATH=/home/$(whoami)/mongodb/bin:$PATH' >> ~/.bashrc

# Done
echo 'Done!\nRestart your terminal and type:\nmongo --version'
