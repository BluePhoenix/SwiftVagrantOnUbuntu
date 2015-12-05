# Swift Vagrant On Ubuntu #

This is an attempt to create a Vagrant box set up to run Swift Open Source.

*...This is still a work in progress*

This will create a VM and install Swift on the system. The relevant executables
will be installed in /usr/bin

Remember you can check the Swift version with:

```bash
vagrant up
vagrant ssh
swift --version
```

## Target box ##
[ubunty/trusty64](https://atlas.hashicorp.com/ubuntu/boxes/trusty64)

# Requirements #
This just requires:
- Vagrant; and
- VirtualBox (though you can use alternate VM software too)

# Usage #
The setup should be pretty standard. So if you are familiar with Vagrant, this
should all work the same way.

Clone the repository as usual, and run:

```bash
vagrant up
```

### To access the VM ###

```bash
vagrant ssh
```

### To stop the VM ###

```bash
vagrant halt
```

### To recreate the environment ###

```bash
vagrant destroy
vagrant up
```
