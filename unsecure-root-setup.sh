if [ $# -lt 1 ]; then exit 1; fi
NAME=$1
groupadd $NAME
cp -r /etc/skel /home/$NAME
useradd $NAME -g $NAME -s /bin/bash -d /home/$NAME
apt-get -y install sudo
echo "${NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
mkdir /home/${NAME}/.ssh
cp .ssh/authorized_keys /home/${NAME}/.ssh/
chown ${NAME}:${NAME} -R /home/${NAME}
chmod 600 /home/${NAME}/.ssh/authorized_keys
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig
echo 'PermitRootLogin no' > /etc/ssh/sshd_config
cat /etc/ssh/sshd_config.orig >> /etc/ssh/sshd_config
service ssh restart
