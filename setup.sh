sudo apt-get -y -q update
sudo apt-get -y -q upgrade
sudo apt-get -y install software-properties-common
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get -y update
sudo apt-get -y install aptitude zsh vim git curl build-essential automake
sudo aptitude -y safe-upgrade
chsh -s /usr/bin/zsh
touch $HOME/.zshenv && chmod 600 $HOME/.zshenv
# for local install
mkdir -p $HOME/local/src
mkdir -p $HOME/local/bin
echo 'export PATH=$HOME/local/bin:$PATH' >> $HOME/.zshenv
# samba
sudo aptitude install cifs-utils
