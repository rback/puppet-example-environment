#!/bin/bash -e

# Install puppet
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb && dpkg -i puppetlabs-release-precise.deb && rm puppetlabs-release-precise.deb
apt-get update
apt-get install -y puppet

cd /home/vagrant
mount -o loop VBoxGuestAdditions.iso /mnt
yes | sh /mnt/VBoxLinuxAdditions.run
umount /mnt

# Passwordless sudo for Vagrant
echo %vagrant ALL=NOPASSWD:ALL > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

# Vagrant needs key-based login to control the VM
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
