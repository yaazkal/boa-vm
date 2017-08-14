#!/bin/bash -eu

if [ -f /etc/vagrant_provisioned_at ]; then
  echo "This VM has been provisioned before. Please check if BOA has been installed."
  exit 0
fi

echo "Provisioning..."
# Fix stdin: is not a tty. See https://github.com/mitchellh/vagrant/issues/1673
sudo sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile
# Initialize the .ssh root path and also creates a private key for root
ssh-keygen -C root@localhost -f "/root/.ssh/id_rsa" -q -N ""
echo "Creating the authorized_keys file..."
touch $1
echo "Inserting your public key..."
echo $2 > $1
chmod 644 $1
echo "You can login with root user now and install BOA."
date > /etc/vagrant_provisioned_at