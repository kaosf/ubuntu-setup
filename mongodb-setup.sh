# ref. http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get -y update
sudo apt-get -y install mongodb-org

# ref. http://te2u.hatenablog.jp/entry/2013/02/06/222342
echo "smallfiles = true" | sudo tee -a /etc/mongodb.conf
sudo service mongod restart

# Disable autostart
# ref. http://askubuntu.com/questions/468241/how-can-i-ensure-a-service-is-disabled-on-boot
echo manual | sudo tee /etc/init/mongod.override
