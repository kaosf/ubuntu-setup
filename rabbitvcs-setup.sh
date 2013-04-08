sudo add-apt-repository ppa:rabbitvcs/ppa
echo "deb http://ppa.launchpad.net/rabbitvcs/ppa/ubuntu precise main" | sudo tee -a /etc/apt/sources.list
sudo aptitude update
sudo aptitude install rabbitvcs-cli rabbitvcs-nautilus3 rabbitvcs-gedit

# ref.
#   http://wiki.rabbitvcs.org/wiki/install/ubuntu
#   http://richardjh.org/blog/install-rabbitvcs-on-ubuntu-12.04/
#   http://nouzui2007.blogspot.jp/2011/09/tortoisesvnubuntu.html
