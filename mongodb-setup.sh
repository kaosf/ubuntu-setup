# ref. http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
# ref. http://d.hatena.ne.jp/yutakikuchi/20111013/1318436872

sudo apt-get -y update
sudo apt-get -y install mongodb-org

# ref. http://te2u.hatenablog.jp/entry/2013/02/06/222342
echo "smallfiles = true" | sudo tee -a /etc/mongodb.conf
sudo service mongod restart

# Disable autostart
# ref. http://askubuntu.com/questions/468241/how-can-i-ensure-a-service-is-disabled-on-boot
echo manual | sudo tee /etc/init/mongod.override
