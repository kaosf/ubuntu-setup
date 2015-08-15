# http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0.9-wily/
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0.9-wily/linux-headers-4.0.9-040009-generic_4.0.9-040009.201507212131_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0.9-wily/linux-headers-4.0.9-040009_4.0.9-040009.201507212131_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0.9-wily/linux-image-4.0.9-040009-generic_4.0.9-040009.201507212131_amd64.deb

sudo dpkg -i *.deb

# How to remove
dpkg -l | grep "linux\-[a-z]*\-"
#sudo apt-get remove KERNEL_PACKAGES_TO_REMOVE
#sudo aptitude purge KERNEL_PACKAGES_TO_REMOVE
#sudo aptitude purge linux-headers-4.0.4-040004 linux-headers-4.0.4-040004-generic linux-image-4.0.4-040004-generic
#sudo aptitude purge linux-headers-4.0.7-040007 linux-headers-4.0.7-040007-generic linux-image-4.0.7-040007-generic

# ref.
#   https://wiki.ubuntu.com/Kernel/MainlineBuilds?action=show&redirect=KernelMainlineBuilds
