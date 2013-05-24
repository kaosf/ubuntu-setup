# ref.
#   http://qiita.com/items/10d9c15d20390dfde310#comment-7851627e2c5536c8465b
#   http://stedolan.github.io/jq/download/

git clone https://github.com/stedolan/jq.git
cd jq
autoconf
./configure --prefix=$HOME/local
make
make install

# `flex` package is needed before make
sudo aptitude install flex
