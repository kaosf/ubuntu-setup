# ref. https://docs.docker.com/engine/installation/linux/ubuntulinux/
sudo apt-get -y install apt-transport-https ca-certificates
sudo apt-key adv \
  --keyserver hkp://ha.pool.sks-keyservers.net:80 \
  --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get -y install docker-engine

sudo systemctl start docker.service

## Giving non-root access
sudo gpasswd -a `whoami` docker
# logout and login
# ref.
#   http://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo
#   http://docs.docker.com/installation/ubuntulinux/#giving-non-root-access
#   http://qiita.com/itiut@github/items/85a473059fceab7f7159

## Make NOT to ignore the firewall
# ref.
#   http://qiita.com/yakumo/items/07f0472c34299524e662
#   http://askubuntu.com/questions/652556/uncomplicated-firewall-ufw-is-not-blocking-anything-when-using-docker
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "iptables": false
}
EOF
sudo systemctl restart docker.service
