VERSION=1.10.2
OS=linux
ARCH=amd64
wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

echo 'export GOPATH=$HOME/.go' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/.go/bin' >> ~/.bashrc
