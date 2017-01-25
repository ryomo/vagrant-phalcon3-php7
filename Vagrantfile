# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.33.12"
  config.vm.synced_folder 'html', '/var/www/html', create: true, type: 'virtualbox'
    # owner: 'apache',
    # group: 'apache'
  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 1536
    vb.cpus = 2
  end
  config.vm.provision :shell, :path => 'conf/provision.sh'
end
