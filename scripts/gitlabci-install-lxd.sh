set -x
set -e
sudo apt update
sudo apt install lxd lxd-client lxd-tools -yqq
sudo service lxd start
cat ./scripts/lxd-preseed.yml | sudo lxd init --preseed
