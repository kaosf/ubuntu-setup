# Refer here: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu

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
