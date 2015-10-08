# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  config.vm.network 'forwarded_port', guest: 8080, host: 8080
  config.vm.network 'forwarded_port', guest: 80,host: 81
  config.ssh.forward_agent = true
  config.vm.provider 'virtualbox' do |v|
    v.memory = 2048
  end
  config.vm.provision :shell, path: 'Provisionfile'
end
