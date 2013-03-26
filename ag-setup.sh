# ref.
#   http://qiita.com/items/55d0c5c11a0571af3b8e
#   http://blog.glidenote.com/blog/2013/02/28/the-silver-searcher-better-than-ack/

cd $HOME/local/src
wget "https://github.com/ggreer/the_silver_searcher/archive/master.zip" --no-check-certificate
mv master.zip the_silver_searcher-master.zip
unzip the_silver_searcher-master.zip
cd the_silver_searcher-master
sed -i -e "s/configure/configure --prefix=\$HOME\/local/g" build.sh
./build.sh
make install
