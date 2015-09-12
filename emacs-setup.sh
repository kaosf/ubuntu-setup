#! /bin/sh

cd $HOME/local/src
wget ftp://ftp.ring.gr.jp/pub/GNU/emacs/emacs-24.5.tar.gz
tar xzf emacs-24.5.tar.gz
rm -f emacs-24.5.tar.gz
cd emacs-24.5

# With X
sudo apt-get -y install libgif-dev libxpm-dev libxaw7-dev
./configure --prefix=$HOME/local
make
make install

# Without X
./configure --prefix=$HOME/local --without-x
make
make install
