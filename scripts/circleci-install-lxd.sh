set -x
set -e
apt update
apt purge lxd* -yqq
apt install snapd -yqq
systemctl enable snapd.service
systemctl start snapd.service
sleep 5
snap install lxd --channel=3.0/stable
