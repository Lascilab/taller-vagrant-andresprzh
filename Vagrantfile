Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.provision "shell", path: "install-apache.sh"
    config.vm.provider :virtualbox do |vb|
      vb.customize [ 'modifyvm', :id, '--name', 'punto-01' ]
    end 
  end