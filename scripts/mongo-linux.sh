MONGO_PATH="/home/$(whoami)/mongodb"


echo 'Creating structure...'
mkdir -p $MONGO_PATH
cd $MONGO_PATH

sudo mkdir -p /data/db
sudo chmod 0755 /data/db
sudo chown $USER /data/db

echo 'Downloading...'
curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.0.6.tgz

echo 'Unziping...'
tar -zxvf mongodb-linux-x86_64-3.0.6.tgz

echo 'Configuring...'
mv mongodb-linux-x86_64-3.0.6/* .
rm -rf mongodb-linux-x86_64-3.0.6
echo 'export PATH=/home/$(whoami)/mongodb/bin:$PATH' >> ~/.zshrc

echo 'Done!\n\n'

mongo
