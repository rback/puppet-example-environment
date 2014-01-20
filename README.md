puppet-example-environment
==========================

    brew tap homebrew/binary
    brew install packer
    https://www.virtualbox.org/wiki/Downloads
    http://www.vagrantup.com/downloads.html
    
    cd packer
    packer validate ubuntu_12.04_lts_vbox.json
    packer build ubuntu_12.04_lts_vbox.json
    
    vagrant box add ubuntu-12.04-x64 ubuntu-12.04-x86_virtualbox.box
    cd ..
    vagrant up

