sudo apt-get -y install automake libncurses5-dev libncursesw5-dev
sudo apt-get -y remove tig
mkdir -p $HOME/local/src
cd $HOME/local/src
rm -rf tig
git clone https://github.com/jonas/tig
cd tig
git checkout tig-2.2.1
./autogen.sh
./configure --prefix=$HOME/local
make
make install
git checkout master

# ref. for dependent packages:
#   https://github.com/jonas/tig/issues/39#issuecomment-4992269
