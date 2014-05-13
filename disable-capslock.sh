# Disable CapsLock key and replace to Ctrl key
# ref. http://nice20blog.blogspot.jp/2014/04/ubuntu-1404-trusty-tahr-capslock-ctrl.html
sudo cp /etc/default/keyboard /etc/default/keyboard.orig.`date +%Y%m%d%H%M%S`
sed 's/XKBOPTIONS=""/XKBOPTIONS="ctrl:nocaps"/' /etc/default/keyboard | \
sudo tee /etc/default/keyboard
sudo reboot
