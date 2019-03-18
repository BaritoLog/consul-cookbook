set -x
set -e
./packer/packer build ./packer.json
lxc image list
