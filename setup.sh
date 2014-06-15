sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install aptitude zsh vim git curl build-essential automake
sudo aptitude safe-upgrade
chsh -s /usr/bin/zsh
touch $HOME/.zshenv && chmod 600 $HOME/.zshenv
# for local install
mkdir -p $HOME/local/src
mkdir -p $HOME/local/bin
echo 'export PATH=$HOME/local/bin:$PATH' >> $HOME/.zshenv
# samba
sudo aptitude install cifs-utils
