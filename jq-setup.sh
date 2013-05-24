git clone https://github.com/stedolan/jq.git
cd jq
autoconf
./configure --prefix=$HOME/local
make
make install

# `flex` package is needed before make
sudo aptitude install flex
