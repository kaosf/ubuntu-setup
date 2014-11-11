#! /bin/sh

cd $HOME/local/src
wget ftp://ftp.ring.gr.jp/pub/GNU/emacs/emacs-24.4.tar.gz
tar xzf emacs-24.4.tar.gz
cd emacs-24.4
./configure --prefix=$HOME/local --without-x
make
make install
