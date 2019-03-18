set -x
set -e
sudo apt update
sudo apt install ca-certificates -yqq
sudo apt install lxd lxd-client lxd-tools -yqq
sudo service lxd start
sudo lxc storage create default dir source=/var/lib/lxd/storage-pools/default
