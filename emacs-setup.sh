#! /bin/sh

cd $HOME/local/src
wget ftp://ftp.ring.gr.jp/pub/GNU/emacs/emacs-24.3.tar.gz
tar xzf emacs-24.3.tar.gz
cd emacs-24.3
./configure --prefix=$HOME/local --without-x
make
make install
