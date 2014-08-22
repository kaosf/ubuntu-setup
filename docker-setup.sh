# ref. http://askubuntu.com/a/473720
# Install version 0.11.1
sudo add-apt-repository ppa:docker-maint/testing
sudo aptitude update
sudo aptitude install docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
