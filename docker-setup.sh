# Refer here: https://docs.docker.com/install/linux/docker-ce/ubuntu/
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
# Installation END

# Ubuntu 18.04 on ConoHa
sudo apt-get update
sudo dpkg --configure -a
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce
# Installation END

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

###
# docker-machine
curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-machine && \
sudo chmod +x /usr/local/bin/docker-machine
# ref. http://docs.docker.jp/machine/install-machine.html
