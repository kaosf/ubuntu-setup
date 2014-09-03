# ref. http://askubuntu.com/a/473720
wget -qO- https://get.docker.io/gpg | sudo apt-key add -
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo aptitude update
sudo aptitude install lxc-docker-1.2.0

## Giving non-root access
sudo groupadd docker
sudo gpasswd -a `whoami` docker
# logout and login
sudo service docker restart
# ref.
#   http://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo
#   http://docs.docker.com/installation/ubuntulinux/#giving-non-root-access
#   http://qiita.com/itiut@github/items/85a473059fceab7f7159