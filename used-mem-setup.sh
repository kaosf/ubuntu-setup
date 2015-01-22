# ref. https://github.com/yonchu/used-mem
mkdir -p $HOME/local/src
if [ -d $HOME/local/src/used-mem ]
then
  cd $HOME/local/src/used-mem
  git pull
  cd -
else
  git clone git://github.com/yonchu/used-mem.git $HOME/local/src/used-mem
fi
mkdir -p $HOME/local/bin
cp $HOME/local/src/used-mem/used-mem $HOME/local/bin
