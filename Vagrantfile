Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.provision "shell", path: "install-apache.sh"
    config.vm.network "forwarded_port", guest: 80, host: 8000
    config.vm.synced_folder "html/", "/var/www/html"
    config.vm.provider :virtualbox do |vb|
      vb.customize [ 'modifyvm', :id, '--name', 'apache-server' ]
      vb.customize [ 'modifyvm', :id, '--cpus', 1 ]
      vb.customize [ 'modifyvm', :id, '--memory', 512 ]
    end 
  end
