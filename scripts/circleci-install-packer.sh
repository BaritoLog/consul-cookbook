set -x
set -e
if [ ! -e packer/packer ]; then
  apt update
  apt install wget unzip -yqq
  wget https://releases.hashicorp.com/packer/1.3.5/packer_1.3.5_linux_amd64.zip
  unzip packer_1.3.5_linux_amd64.zip -d packer
fi