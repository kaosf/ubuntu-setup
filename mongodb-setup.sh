# ref. http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee -a /etc/apt/sources.list.d/10gen.list
# ref. http://d.hatena.ne.jp/yutakikuchi/20111013/1318436872

# sudo vim /etc/apt/sources.list.d/10gen.list
# + deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen

sudo aptitude update
sudo aptitude install mongodb-10gen

# ref. http://te2u.hatenablog.jp/entry/2013/02/06/222342
echo "smallfiles = true" | sudo tee -a /etc/mongodb.conf
sudo service mongodb restart
