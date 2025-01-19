## 🚀 Inicializando o Cluster Kubernetes e Configurando a CNI Cilium: Um Guia Detalhado (Apenas Comandos)

### Introdução

Olá pessoal! Sejam bem-vindos a mais uma aula! Hoje, vamos dar um passo crucial na nossa jornada: vamos inicializar o cluster Kubernetes e configurar a Container Network Interface (CNI) Cilium. Usaremos o `kubeadm` para iniciar o cluster e garantir a comunicação entre os nós.

### Desenvolvimento

#### 1. Preparando o Terreno: Revisão Rápida
#### 2. Inicializando o Cluster com `kubeadm init`

```bash
sudo kubeadm init
```

#### 3.
```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```


