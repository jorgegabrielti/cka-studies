#!/bin/bash 
#
# ##########################################################################
# +----------------------------------------------------------------------+ #
# |                 Cluster Kubernetes - Kubeadm                         | #
# +----------------------------------------------------------------------+ #
# |                                                                      | #
# | Name          : userDataMaster.sh                                    | #
# | Function      : Cluster Kubernetes install and                       | #
# |                      configuration with Kubeadm.                     | #
# | Version       : 1.0                                                  | #
# | Author        : Jorge Gabriel (Site Releability Engeneer)            | #
# +----------------------------------------------------------------------+ #
# ##########################################################################
#
# Description:
#
# Algortimo do script :
#  Instalação do Cluster com Kubeadm.
# --------------------------------------------------------------------------
# 1. Atualização do sistema operacional.
sudo apt-get update

# 2. Instalação de pacotes necessários.
sudo apt-get install -y apt-transport-https ca-certificates curl pgp

# 3. Adicionando a chave GPG do repositório do Kubernetes.
sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# 4. Adicionando o repositório do Kubernetes.
sudo echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# 5. Atualizando a lista de pacotes.
sudo apt-get update

# 6. Instalação do Kubernetes.
sudo apt list -a kubectl
sudo apt list -a kubelet
sudo apt list -a kubeadm

sudo apt install -y kubelet kubeadm kubectl

# 7. Bloqueando a versão dos pacotes.
sudo apt-mark hold kubelet kubeadm kubectl

# 8. Configuração dos módulos necessários para o Kubernetes.
sudo cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

# 9. Carregando os módulos.
sudo modprobe overlay
sudo modprobe br_netfilter

# 10. Configuração do Kernel.
sudo cat <<EOF | sudo tee /etc/sysctl.d/kubernetes.conf
net.ipv4.ip_forward = 1
net.ipv4.conf.all.forwarding = 1
net.ipv6.conf.all.forwarding = 1
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.conf.all.rp_filter = 0
net.ipv6.conf.all.rp_filter = 0
EOF

# 11. Aplicando as configurações do Kernel.
sudo sysctl --system

# 12. Start do kubelet.
sudo systemctl enable --now kubelet

# 13. Instalação do containerd.
sudo apt install -y containerd

# 14. Configuração do containerd.
sudo mkdir -p /etc/containerd

# 15. Gerando o arquivo de configuração do containerd.
sudo containerd config default | sudo tee /etc/containerd/config.toml

# 16. Habilitando o suporte ao systemd.
sudo sed -i 's/SystemdCgroup.*/SystemdCgroup = true/g' /etc/containerd/config.toml

# 17. Start do containerd.
sudo systemctl enable --now containerd

# 18. Inicialização do Cluster Kubernetes.
sudo kubeadm init 

# 19. Configuração do ambiente do usuário.
grep -i "ubuntu" /etc/passwd && export HOME="/home/ubuntu" USER="ubuntu" 
mkdir -p $HOME/.kube
sudo cp -f /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $USER:$USER $HOME/.kube/config

### CNI - Container Network Interface
# https://docs.cilium.io/en/latest/installation/k8s-install-kubeadm/#create-the-cluster

export CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/main/stable.txt)
export CLI_ARCH=amd64
if [ "$(uname -m)" = "aarch64" ]; then CLI_ARCH=arm64; fi
curl -L --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
sha256sum --check cilium-linux-${CLI_ARCH}.tar.gz.sha256sum
sudo tar xzvfC cilium-linux-${CLI_ARCH}.tar.gz /usr/local/bin
rm cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
cilium install && sudo reboot