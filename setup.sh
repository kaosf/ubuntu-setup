sudo apt-get -y -q update
sudo apt-get -y -q upgrade
# Force to fix locale configurations to "en_US.UTF-8"
sudo locale-gen en_US en_US.UTF-8
sudo dpkg-reconfigure locales
echo 'LC_ALL=en_US.UTF-8' | sudo tee -a /etc/environment
echo 'LANG=en_US.UTF-8'   | sudo tee -a /etc/environment
sudo reboot
# Some packages needed at least
sudo apt-get -y install software-properties-common
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get -y update
sudo apt-get -y install aptitude zsh vim git curl build-essential automake
chsh -s /usr/bin/zsh
touch $HOME/.zshenv && chmod 600 $HOME/.zshenv
# for local install
mkdir -p $HOME/local/src
mkdir -p $HOME/local/bin
echo 'export PATH=$HOME/local/bin:$PATH' >> $HOME/.zshenv
# samba
sudo aptitude install cifs-utils
