set -x
set -e
apt update
apt purge lxd* -yqq
apt install snapd -yqq
snap install lxd --channel=3.0/stable
