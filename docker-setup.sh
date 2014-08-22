# ref. http://askubuntu.com/a/473720
# Install version 1.2.0
wget -qO- https://get.docker.io/gpg | sudo apt-key add -
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo aptitude update
sudo aptitude install lxc-docker
