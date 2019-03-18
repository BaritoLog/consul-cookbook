set -x
set -e
apt update
apt install lxd lxd-client lxd-tools -yqq
lxd init --preseed ./scripts/lxd-preseed.yml
