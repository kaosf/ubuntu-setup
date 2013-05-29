# ref.
#   http://qiita.com/items/55d0c5c11a0571af3b8e
#   http://blog.glidenote.com/blog/2013/02/28/the-silver-searcher-better-than-ack/

sudo aptitude install automake libpcre3-dev liblzma-dev

cd $HOME/local/src
git clone https://github.com/ggreer/the_silver_searcher
cd the_silver_searcher

./build.sh --prefix=$HOME/local
make install
