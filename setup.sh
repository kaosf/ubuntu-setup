sudo apt-get -q update
sudo apt-get -y -q upgrade
# Force to fix locale configurations to "en_US.UTF-8"
sudo locale-gen en_US en_US.UTF-8
sudo dpkg-reconfigure locales
echo 'LC_ALL=en_US.UTF-8' | sudo tee -a /etc/environment
echo 'LANG=en_US.UTF-8'   | sudo tee -a /etc/environment
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
sudo reboot
# Some packages needed at least
sudo apt-get -y install software-properties-common
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get -y install aptitude zsh vim git curl build-essential automake
chsh -s /usr/bin/zsh
wget 'http://downloads.sourceforge.net/project/zsh/zsh/5.0.2/zsh-5.0.2.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fzsh%2Ffiles%2Fzsh%2F5.0.2%2F&ts=1443201854&use_mirror=jaist'
tar xf zsh-5.0.2.tar.bz2
sudo cp zsh-5.0.2/Doc/*.1 /usr/share/man/man1
rm -rf zsh-5.0.2*
touch $HOME/.zshenv && chmod 600 $HOME/.zshenv
# for local install
mkdir -p $HOME/local/src
mkdir -p $HOME/local/bin
echo 'export PATH=$HOME/local/bin:$PATH' >> $HOME/.zshenv
echo 'export PATH=$HOME/local/bin:$PATH' >> $HOME/.profile
# samba
sudo apt-get -y install cifs-utils
# 7-Zip
sudo apt-get -y install p7zip-full
