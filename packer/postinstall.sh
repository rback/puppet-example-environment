#!/bin/bash -e
yum install -y gcc perl
mount -o loop VBoxGuestAdditions.iso /mnt
yes | sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm VBoxGuestAdditions.iso

# Install puppet
rpm -ivh https://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
yum install -y puppet

# Passwordless sudo for Vagrant
echo %vagrant ALL=NOPASSWD:ALL > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Vagrant needs key-based login to control the VM
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
curl -kL 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -o authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

yum remove -y kernel-headers gcc kernel-devel perl
yum clean all