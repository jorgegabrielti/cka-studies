# Ingressar workers no Cluster
kubeadm token create --print-join-command

### Upgrade do Control Plane
##  Atualizando a versão
# Doc: https://kubernetes.io/blog/2023/08/15/pkgs-k8s-io-introduction/
# Release notes: https://github.com/kubernetes/kubernetes/tree/master/CHANGELOG

# Verificando a versão atual do Cluster
kubectl get nodes

# Check a versão e o seu repositorio
sudo apt-cache madison kubeadm
pager /etc/apt/sources.list.d/kubernetes.list


# Baixar a Release.key do repositório
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt update
sudo apt-cache madison kubeadm

sudo apt-mark unhold kubeadm && \
sudo apt-get update && sudo apt-get install -y kubeadm='1.32.1-1.1' && \
sudo apt-mark hold kubeadm

kubeadm version

sudo killall -s SIGTERM kube-apiserver && sleep 120
sudo kubeadm upgrade plan
sudo kubeadm upgrade apply v1.32.1

# Atualização do kubelet e kubectl
sudo apt-cache madison kubelet 
sudo apt-cache madison kubectl
sudo apt-mark unhold kubelet kubectl && \
sudo apt-get update && sudo apt-get install kubelet=1.32.1-1.1 kubectl=1.32.1-1.1 && \
sudo apt-mark hold kubelet kubectl

sudo systemctl daemon-reload
sudo systemctl restart kubelet

kubectl get nodes

### Upgrade do Worker node
# https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/upgrading-linux-nodes/

sudo apt-cache madison kubeadm

pager /etc/apt/sources.list.d/kubernetes.list

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt update
sudo apt-cache madison kubeadm
sudo apt-mark unhold kubeadm && sudo apt-get update && sudo apt-get install -y kubeadm='1.32.1-1.1' && sudo apt-mark hold kubeadm
kubeadm version
sudo kubeadm upgrade node

kubectl drain worker01 --ignore-daemonsets

sudo apt-cache madison kubelet kubectl

sudo apt-mark unhold kubelet kubectl && \
sudo apt-get update && \
sudo apt-get install -y kubelet=1.32.1-1.1 kubectl=1.32.1-1.1 && \
sudo apt-mark hold kubelet kubectl

sudo systemctl daemon-reload
sudo systemctl restart kubelet

kubectl uncordon