set -x
set -e
apt purge lxd* -y
snap install lxd --channel=3.0/stable
