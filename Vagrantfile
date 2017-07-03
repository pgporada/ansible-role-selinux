role = File.basename(File.expand_path(File.dirname(__FILE__)))

Vagrant.configure(2) do |vagrant|

    vagrant.vm.define "test" do |test|

        test.vm.provider :virtualbox do |vb|
            vb.memory = 1024
            vb.cpus = 1
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
            vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000 ]

        end

        test.vm.box = "centos/7"
        test.vm.host_name = "#{role}"
        test.vm.network "private_network", ip: "10.0.0.10"

        test.vm.provision :ansible do |ansible|
            ansible.playbook = "tests/vagrant.yml"
            ansible.verbose = "vv"
        end

    end

end
