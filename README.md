# Win-Ruby-Dev

Win-Ruby-Dev is a VM provisioned using [Vagrant], [Puppet] and [Chocolatey]. The VM comes with Ruby installed, but can be re-configured for any software development on Windows.

## Pre-requisites
- [Vagrant]
- [VirtualBox], [VMWareFusion] or [Parallels]
- A Windows VM image from [ModernIE]

## Preparation
- Download the VM from [ModernIE] and boot it up
  - I used the IE11/Win7 VM and named it 'IE11 - Win7'
- Install Windows patches on the VM
- Install the latest VirtualBox Guest Additions
- Package the VM using the Vagrant package command:
  ```
  vagrant package --base "IE11 - Win7" --output ie11_win7.box
  ```
- Update the VagrantFile, configuring the following:
  - Path to ie11_win7.box
  - VM provider, if different from [VirtualBox]
  - hostname, and other networking details (as required)
  - shared file paths
- Update the puppet/manifests/init.pp file
  - Add or remove any [Chocolatey] packages as necessary

## Usage
```
vagrant up
```

[Vagrant]:http://vagrantup.com/
[VirtualBox]:http://www.virtualbox.org/
[VMWareFusion]:http://www.vmware.com/products/fusion
[Parallels]:http://www.parallels.com/
[ModernIE]:http://www.modern.ie/
[Chocolatey]:http://chocolatey.org/
[Puppet]:http://puppetlabs.com/
