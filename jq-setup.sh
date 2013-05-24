# ref.
#   http://qiita.com/items/10d9c15d20390dfde310#comment-7851627e2c5536c8465b
#   http://stedolan.github.io/jq/download/

git clone https://github.com/stedolan/jq.git
cd jq
autoreconf
./configure --prefix=$HOME/local

# `flex` package and `yacc` command are needed for make
# ref. http://diaryrnsit.blogspot.jp/2012/10/how-to-install-lex-in-ubuntu-12.html
sudo aptitude install flex bison

make
make install
