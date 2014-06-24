mkdir -p $HOME/local/src
cd $HOME/local/src
wget https://deploygate.com/client/dgate.tar.gz
mkdir -p $HOME/local/opt/dgate
cd $HOME/local/opt/dgate
tar xzf $HOME/local/src/dgate.tar.gz
echo 'PATH=$HOME/local/opt/dgate:$PATH' >> $HOME/.zshenv
