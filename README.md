# boa-vm
A simple way to run BOA inside a VM using Vagrant.

This is still in development and for testing purposes, use at your own risk. This script will work by now using virtualbox. I will release a first version to master when the script can read a config file and makes the process in a more automated way.

## Requirements

* [Virtualbox](https://www.virtualbox.org)
* [Vagrant](https://www.vagrantup.com)
* Internet access

You need to have installed the [Hostupdater Vagrant Plugin](https://github.com/cogitatio/vagrant-hostsupdater) in order to allow vagrant to edit your hosts file so you can easily access aegir.local by its name. Note that this Vagrantfile makes the VM's IP default to 192.168.56.200

## Instructions
Note: As BOA needs to been installed by the root user itself, this Vagrant will provision a VM allowing you to access as root using your ssh public key. Please edit the vagrantfile and asign $pub_key the proper value (your public ssh key).

Then, just run:

`vagrant up`

This will create and provision the VM.

The you need to log in to the VM as root and begin the installation of BOA as this:

`ssh root@aegir.local`

Install BOA:

`root@aegir~# cd;wget -q -U iCab http://files.aegir.cc/BOA.sh.txt;bash BOA.sh.txt`

`root@aegir~# boa in-stable local root@aegir.local mini php-all`

The above lines will install BOA (it takes time) with all supported versions of php, please refer to [Installing BOA system on localhost](https://github.com/omega8cc/boa/blob/a69afd61471b1cefadc80f19b7852c03a48fcf58/docs/INSTALL.txt#L86) to know more/other options

Now you can access your aegir dashboard at http://aegir.local
Please note that the BOA installer will give you a link at the end of the installation, use that link for a one time access and asign a password. Enjoy the awesomenes of BOA!

*NOTE:* The next time you use vagrant up, vagrant will try to ssh with user vagrant and that will show errors, this is because the user vagrant will not exist anymore after boa is installed. Ignore those errors and after the VM is running you can still login to it using `ssh root@aegir.local` This will be fixed soon (but is the way this script work by now).
