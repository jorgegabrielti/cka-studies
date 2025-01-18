sudo apt update

echo 'vagrant ALL=(root) NOPASSWD: ALL' | visudo -cf -
echo 'vagrant ALL=(root) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/vagrant
sudo -l
sudo apt upgrade -y
sudo reboot

sudo apt install -y build-essential dkms linux-headers-$(uname -r) curl wget git vim bash-completion nano tree

# Insert VboxAdditions
Devices -> Insert Guest Additions CD image

sudo mount /dev/cdrom /mnt
sudo /mnt/VBoxLinuxAdditions.run 

sudo vim /etc/inputrc 

```
set bell-style none
```

sudo vim /etc/ssh/sshd_config
```
PermiteRootLogin no
```

sudo apt autoremove -y
sudo apt clean
sudo rm -rf /var/lib/apt/lists/*
sudo dd if=/dev/zero of=/empty bs=1M
sudo rm -f /empty
sudo find /var/log -type f -exec truncate -s 0 {} \;
curl -L https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -o ~/.ssh/authorized_keys
history -c 
history -w
sudo poweroff

# Build a Vagrant box
VBoxManage list vms
vagrant package --base ubuntu_server-22.04 --output ubuntu_server-22.04.box
vagrant box add ubuntu_server-22.04 ubuntu_server-22.04.box
sha1sum ubuntu_server-22.04.box
```
3a09733645c9c66230ba2d063b06e75f5f5764ae *ubuntu_server-22.04.box
```

vagrant plugin install vagrant-disksize
vagrant up