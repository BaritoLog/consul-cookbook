set -x
set -e
sudo ./packer/packer build ./packer.json
sudo lxc image list
