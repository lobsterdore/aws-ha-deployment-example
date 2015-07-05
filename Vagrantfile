Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  config.vm.synced_folder '.', '/home/hello-app/go/src/github.com/lobsterdore/hello-app', owner: 'hello-app'

  config.vm.network "forwarded_port", guest: 8080, host: 8010

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "."
    puppet.manifest_file = "provision.pp"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 256
    vb.cpus = 1
  end

end
