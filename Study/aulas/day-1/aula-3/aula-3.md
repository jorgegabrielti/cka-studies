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

Para desabilitar a swap no `/etc/fstab` no Ubuntu 22.04, você precisa comentar ou remover as linhas que referenciam a partição ou arquivo de swap. Aqui estão os passos e comandos que você pode usar:

**1. Abra o Arquivo `/etc/fstab` com Privilégios de Root:**

   Você precisará de privilégios de administrador para editar este arquivo. Use o `sudo` com seu editor de texto preferido. Por exemplo, para usar o `nano`:
   ```bash
   sudo nano /etc/fstab
   ```
   Ou se preferir o `vim`:
   ```bash
   sudo vim /etc/fstab
   ```

**2. Identifique a Linha de Swap:**

   Procure por uma linha que tenha a palavra "swap" nela. Geralmente, ela se parece com algo assim:
   ```
   /dev/sda2        none            swap    sw              0       0
   ```
   Ou, se estiver usando um arquivo de swap:
   ```
   /swapfile        none            swap    sw              0       0
   ```
   `sda2` (ou algo similar) é o caminho da partição de swap, e `/swapfile` é o caminho de um arquivo swap.

**3. Comente ou Remova a Linha:**

   *   **Para comentar a linha:** Adicione um `#` no início da linha. Isso fará com que ela seja ignorada pelo sistema.
        ```
        # /dev/sda2        none            swap    sw              0       0
        ```
    ou
       ```
        # /swapfile        none            swap    sw              0       0
        ```
   *   **Para remover a linha:** Simplesmente delete a linha inteira.

**4. Salve e Feche o Arquivo:**

    *   No `nano`: Pressione `Ctrl+X`, depois `Y` (para confirmar a alteração) e `Enter`.
    *   No `vim`: Pressione `Esc`, depois digite `:wq` e pressione `Enter`.

**5. Verifique:**

   Após editar o `/etc/fstab`, execute:

   ```bash
   sudo swapon -s
   ```
    Este comando deve exibir que nenhuma swap está habilitada no momento. Para ter certeza que a swap não será habilitada durante os próximos reboots, você pode reiniciar o sistema:
    ```bash
    sudo reboot
    ```

**Observações Importantes:**

*   **Swapoff:** É importante que você execute `sudo swapoff -a` **antes** de editar o `/etc/fstab`. Isso desabilitará a swap ativa no momento e evitará problemas.
*   **Root:** Lembre-se que você precisa de privilégios de root para editar este arquivo.
*   **Reboot:** Depois de fazer as alterações, é sempre bom reiniciar o sistema para garantir que tudo funcione corretamente.

**Importante:**

Se você não tem certeza sobre qual linha comentar, faça um backup do arquivo `/etc/fstab` antes de modificá-lo:

```bash
sudo cp /etc/fstab /etc/fstab.backup
```

Se algo der errado, você poderá restaurar o arquivo original com:

```bash
sudo cp /etc/fstab.backup /etc/fstab
```

Seguindo esses passos, você desabilitará a swap no `/etc/fstab` no Ubuntu 22.04.

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

### Referência:

- https://v1-31.docs.kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/