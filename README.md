# consul-cookbook

Chef cookbook for provisioning consul cluster.

## Building Image

This repo produces LXC image using Packer, see [this](http://packer.io/intro/getting-started/install.html) on how to start using Packer.

The `packer.json` located in this repo uses LXD builder and Chef Solo provisioner. References:

- https://www.packer.io/docs/builders/lxd.html
- http://packer.io/intro/getting-started/provision.html
- https://www.packer.io/docs/provisioners/chef-solo.html

Afterward we can execute these 2 commands toward `packer.json` to build the image.

```
packer validate packer.json
packer build packer.json
```
