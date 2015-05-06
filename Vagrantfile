# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.guest = :windows
  config.vm.box = "ie11_win7"
  config.vm.hostname = "win-ruby-dev"
  config.vm.communicator = "winrm"
  config.vm.boot_timeout = 600

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # forward RDP and WINRS ports
  config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: false
  config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true

  config.windows.set_work_network = true
  config.winrm.max_tries = 10
  config.winrm.host = 'localhost'

  # default user-id and password for the modern.ie VMs
  config.winrm.username = 'IEUser'
  config.winrm.password = 'Passw0rd!'

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  ## Ensure that all networks are set to private
  config.windows.set_work_network = true

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # uncomment for a VM runnable from VBox straight away rather than remoting in
  # remoting via RDP is enabled below
  config.vm.provider "virtualbox" do |v|
    v.gui = true
  end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "../../src", "c:\\dev"

  # for provisioning we need:

  # Turn off UAC, change the script execution policy and then reboot
  config.vm.provision :shell, path: 'Reconfigure-Security.ps1'

  # Add Chocolatey and Puppet to the path
  config.vm.provision :shell, inline: '[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\ProgramData\Chocolatey\bin;C:\Program Files\Puppet Labs\Puppet\bin", "Machine") >$null 2>&1'
  config.vm.provision :shell, inline: '[Environment]::SetEnvironmentVariable("ChocolateyInstall", "C:\ProgramData\Chocolatey", "Machine") >$null 2>&1'

  # Reboot to enable security and path changes
  config.vm.provision :shell, inline: "Restart-Computer -Force"

  # install chocolatey
  config.vm.provision :shell, path: "Install-Chocolatey.ps1"

  # install puppet
  config.vm.provision :shell, path: "Install-Puppet.ps1"

  # Install Chocolatey plug-in for Puppet:
  config.vm.provision :shell, inline: "puppet module install chocolatey-chocolatey"

  # Enable remoting in, if you commented "v.gui = true" above
  #config.vm.provision :shell, path: "Enable-RDP.ps1"

  # Provision the Chocolatey modules
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file = "init.pp"
    puppet.options = "--verbose --debug"
  end

  # Final reboot, and the machine will be ready
  config.vm.provision :shell, inline: "Restart-Computer -Force"
end
