# ref.
#   http://qiita.com/items/55d0c5c11a0571af3b8e
#   http://blog.glidenote.com/blog/2013/02/28/the-silver-searcher-better-than-ack/

sudo aptitude install libpcre3-dev liblzma-dev

cd $HOME/local/src
git clone https://github.com/ggreer/the_silver_searcher
cd the_silver_searcher

cp build.sh build.sh.bk
sed -i -e "s/configure/configure --prefix=\$HOME\/local/g" build.sh
./build.sh
make install
mv build.sh.bk build.sh
