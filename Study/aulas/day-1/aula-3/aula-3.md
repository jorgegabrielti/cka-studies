## 🚀 Instalando os Binários do Cluster Kubernetes: Um Guia Passo a Passo

### Introdução

Olá pessoal! Sejam bem-vindos! Hoje vamos focar na instalação dos binários do cluster Kubernetes. Já temos nossa máquina Ubuntu preparada, então vamos direto ao ponto. Nosso objetivo é fazer toda a instalação, e para isso, usaremos a documentação oficial do Kubernetes.

### Desenvolvimento

#### 1. Consultando a Documentação Oficial 📖

*   **Busca:** Vamos começar buscando por `kubeadm` na documentação do Kubernetes.
    *   Documentos de referência:
        *   `Kubernetes Docs Reference Setup Tools Kubeadm`.
        *   `Create a Cluster with Kubeadm` dentro de `Kubernetes Docs Setup Tools Kubeadm Creating Cluster`.
*   **Informações:** Nesta página, encontraremos detalhes sobre como criar o cluster, incluindo como instalar o kubeadm.

#### 2. Instalando o Kubeadm e Ferramentas de Suporte 📦

*   **Objetivo:** Vamos instalar os binários: `kubeadm`, `kubelet` e `kubectl`.
*   **Versão:** Vamos instalar uma versão anterior à 1.31 para, depois, fazer o upgrade.
*   **Processo:**
    *   A documentação detalha todos os passos.
    *   Não precisa decorar, apenas entender o processo.
*   **Terminal:** Vou executar os comandos no terminal e compartilhar com vocês.

#### 3. Executando os Comandos no Terminal 💻

*   **Máquina Limpa:** Começamos com uma máquina Ubuntu limpa.
*   **Comandos:**
    ```bash
    sudo apt update
    ```
    ```bash
    sudo apt install -y apt-transport-https ca-certificates curl gpg
    ```
    *   Adicionar a chave pública do Kubernetes.
    ```
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    ```
    *   Adicionar o repositório do Kubernetes no APT.
    ```bash
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
    ```
    * Atualize o repositório de pacotes
    ```bash
    sudo apt update
    ```
    *   **Listar Pacotes:**
    ```bash
     sudo apt list -a kubectl
    ```
    *   Instalar pacotes do Kubernetes: `kubeadm`, `kubelet` e `kubectl`.
    ```bash
    sudo apt install -y kubelet kubeadm kubectl
    sudo apt-mark hold kubelet kubeadm kubectl
    ```

    Opcional:
    ```bash
    sudo systemctl enable --now kubelet
    ```
    

*   **Versão 1.31:** Vamos instalar os pacotes para a versão 1.31.
*   **APT-Mark:**
     * Usaremos `apt-mark hold` para evitar que as versões sejam atualizadas durante o `apt upgrade`:
        ```bash
        sudo apt-mark hold kubelet kubeadm kubectl
        ```

#### 4. Componentes Essenciais 🧩

*   **Kubelet:**
    *   O agente do Kubernetes presente em todos os nós.
    *   Responsável por criar containers.
    *   Importante para o funcionamento do cluster.
*   **Kubectl:**
    *  Ferramenta CLI para interagir com o cluster Kubernetes.

#### 5. Preparando o Container Runtime Interface (CRI) 🐳

*   **Importante:** Essa parte **não cai na prova**, mas é necessária para o cluster funcionar.
*   **Passos:**
    *  Ajustes de rede.
    *  Habilitar módulos do kernel.
    *  Instalar e configurar o Containerd como CRI.

### Conclusão

E é isso! Instalamos os binários do Kubernetes, e preparamos o CRI. É importante lembrar que a parte da configuração do CRI não cai na prova, mas é crucial para o cluster funcionar.

Nas próximas aulas, vamos dar os próximos passos para deixar nosso cluster pronto para uso. Mantenham-se engajados e não hesitem em perguntar! 👋
