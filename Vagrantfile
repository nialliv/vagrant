# -*- mode: ruby -*-
# vi: set ft=ruby :

$server_mach = 1

Vagrant.configure("2") do |config|
  config.vm.box = "centos/8"
  
  config.vm.synced_folder "/home/kit/pract/Vagrant/MyVmMachines/sync_folder/", "/home/vagrant/sync_folder/", 
    create: true, 
    type: "nfs"
  
  config.vm.define "admin" do |adm|
    adm.vm.provision "shell", path: "pre_start_boot_admin.sh"
    
    adm.vm.network "private_network", ip: "192.168.1.45", mode: "bridge"
    adm.vm.hostname = "admin"

    adm.vm.provider "virtualbox" do |vb|
      vb.name = "admin"
      vb.memory = "2048"
      vb.cpus = "2"
    end
  end

  (1..$server_mach).each do |i|
    config.vm.define "serv0#{i}" do |serv|
      serv.vm.provision "shell", path: "pre_start_boot_servers.sh"

      serv.vm.network "private_network", ip: "192.168.1.#{10+i}", mode: "bridge"
      serv.vm.hostname = "serv0#{i}"

      serv.vm.provider "virtualbox" do |vb|
        vb.name = "serv0#{i}"
        vb.memory = "1024"
        vb.cpus = "2"
      end

    end
  end




end
