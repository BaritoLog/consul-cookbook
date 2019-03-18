set -x
set -e
apt update
apt install lxd lxd-client lxd-tools -yqq
service lxd start
lxd init --preseed ./scripts/lxd-preseed.yml
