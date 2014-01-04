puppet-example-environment
==========================

    brew tap homebrew/binary
    brew install packer
    https://www.virtualbox.org/wiki/Downloads
    http://www.vagrantup.com/downloads.html
    
    cd packer
    packer validate ubuntu_12.04_lts_vbox.json
    packer build ubuntu_12.04_lts_vbox.json
    
    vagrant box add ubuntu_12.04_x64 packer/packer_virtualbox_virtualbox.box
    vagrant up
