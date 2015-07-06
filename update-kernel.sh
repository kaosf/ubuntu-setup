# http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0.7-wily/
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0.7-wily/linux-headers-4.0.7-040007-generic_4.0.7-040007.201507031036_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0.7-wily/linux-headers-4.0.7-040007_4.0.7-040007.201507031036_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0.7-wily/linux-image-4.0.7-040007-generic_4.0.7-040007.201507031036_amd64.deb

sudo dpkg -i *.deb

# How to remove
dpkg -l | grep "linux\-[a-z]*\-"
#sudo apt-get remove KERNEL_PACKAGES_TO_REMOVE
#sudo aptitude purge KERNEL_PACKAGES_TO_REMOVE
#sudo aptitude purge linux-headers-4.0.0-040000 linux-headers-4.0.0-040000-generic linux-image-4.0.0-040000-generic
#sudo aptitude purge linux-headers-4.0.2-040002 linux-headers-4.0.2-040002-generic linux-image-4.0.2-040002-generic
#sudo aptitude purge linux-headers-4.0.4-040004 linux-headers-4.0.4-040004-generic linux-image-4.0.4-040004-generic
#sudo aptitude purge linux-headers-4.0.7-040007 linux-headers-4.0.7-040007-generic linux-image-4.0.7-040007-generic

# ref.
#   https://wiki.ubuntu.com/Kernel/MainlineBuilds?action=show&redirect=KernelMainlineBuilds
