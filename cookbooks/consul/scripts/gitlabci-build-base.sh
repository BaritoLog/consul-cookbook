set -x
set -e
./packer/packer build $TEMPLATE_FILE
lxc image list
