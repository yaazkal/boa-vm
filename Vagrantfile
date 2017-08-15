# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  $pub_key = ""

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # https://atlas.hashicorp.com/debian/boxes/jessie64
  config.vm.box = "debian/jessie64"
  config.vm.guest = :debian
  config.vm.hostname = "aegir.local"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false
  config.vbguest.auto_update = false

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.56.200"

  # plugin https://github.com/cogitatio/vagrant-hostsupdater
  config.hostsupdater.aliases = [
    # aegir installer will create these entries on host machine
    'aegir.local',
    'sub.aegir.local',
    'o1.sub.aegir.local',
    #'chive.aegir.local',
    # You can also indicate any sites that may be installed via aegir. Eg.
    #'dev.example.com',
  ]

  config.vm.provider "virtualbox" do |vb|
    vb.name = "aegir.local"
    vb.memory = "2048"
    vb.cpus = 2
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--ioapic', 'on']
  end

  config.vm.provision "shell" do |shell|
    shell.path = "provision_script.sh"
    shell.args = ["/root/.ssh/authorized_keys", $pub_key]
  end 

end
