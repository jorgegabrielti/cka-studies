## 🔄 Fazendo Upgrade do Cluster Kubernetes: Um Guia Completo CKA

### Introdução

Olá pessoal! Sejam muito bem-vindos a mais uma aula do nosso treinamento para a CKA! Hoje, vamos abordar um tópico crucial: o **upgrade do cluster Kubernetes**. Essa é uma habilidade essencial, e ela costuma cair na prova da CKA, então preste bastante atenção! Vamos entender como fazer um upgrade seguro e eficiente, seguindo as melhores práticas.

### Desenvolvimento

#### 1. A Importância do Upgrade na CKA 🎯

*   **Mandatório na Prova:** Fazer o upgrade do cluster Kubernetes é um item **obrigatório** na prova da CKA.
*   **Documentação Oficial:** Sempre utilize a documentação oficial como guia.
    *  Documentação de referência: [https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/)
*   **Habilidade Essencial:** O processo de upgrade é uma habilidade importante na administração do Kubernetes.
*   **Mão na Roda:** A documentação é sua mão na roda para a prova e para o dia a dia.

#### 2. Preparando o Ambiente para o Upgrade 📝

*   **Versão Atual:** Nosso cluster está na versão 1.31.5 e vamos para a versão 1.32.1.
*   **Visão Geral do Processo:** Vamos seguir o passo a passo, similar ao que fizemos na instalação do cluster.
*   **Voltar na Documentação:** Vamos consultar a documentação oficial para todos os passos.

#### 3. Executando o Upgrade: Control Plane ⚙️
*   **Utlização do repositório:**
    ```bash
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    ```

    ```bash
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
    ```
    
    ```bash
    sudo apt update
    ```

    ```text
    Get:2 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB] 
    Hit:3 http://archive.ubuntu.com/ubuntu jammy InRelease 
    Get:4 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
    Get:1 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.32/deb  InRelease [1186 B]
    Get:5 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
    Get:6 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.32/deb  Packages [3954 B]
    Fetched 389 kB in 5s (73.9 kB/s)
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    5 packages can be upgraded. Run 'apt list --upgradable' to see them.
    ```

*   **APT-Hold:** Vamos precisar liberar nossos pacotes do `apt-hold` para que eles possam ser atualizados.
    ```bash
    sudo apt-mark unhold kubeadm kubelet kubectl
    ```
    Output:
    ```text
    Canceled hold on kubeadm.
    Canceled hold on kubelet.
    Canceled hold on kubectl.
    ```

*   **Instalação da Versão 1.32:**
    *   Instale a versão 1.32.
        ```bash
        sudo apt install kubeadm kubectl kubelet
        ```

        ```bash
        sudo systemctl restart kubelet
        ```
*   **APT-Mark Hold (Novamente):**
    *   Coloque os pacotes como `hold` novamente.
        ```bash
        sudo apt-mark hold kubelet kubeadm kubectl
        ```
*  **Kubeadm Version:**
   *  Verifique a versão do `kubeadm` para ter certeza que o pacote foi atualizado corretamente.
       ```bash
        kubeadm version
       ```

*   **Comando `kubectl upgrade plan`:**
    *   Verifica o que precisa ser atualizado:

        ```bash
        sudo kubeadm upgrade plan
        ```

        Output:
        ```text
        [preflight] Running pre-flight checks.
        [upgrade/config] Reading configuration from the "kubeadm-config" ConfigMap in namespace "kube-system"...
        [upgrade/config] Use 'kubeadm init phase upload-config --config your-config.yaml' to re-upload it.
        [upgrade] Running cluster health checks
        [upgrade] Fetching available versions to upgrade to
        [upgrade/versions] Cluster version: 1.31.5
        [upgrade/versions] kubeadm version: v1.32.1
        [upgrade/versions] Target version: v1.32.1
        [upgrade/versions] Latest version in the v1.31 series: v1.31.5

        Components that must be upgraded manually after you have upgraded the control plane with 'kubeadm upgrade apply':
        COMPONENT   NODE      CURRENT   TARGET

        Upgrade to the latest stable version:

        COMPONENT                 NODE       CURRENT    TARGET
        kube-apiserver            master01   v1.31.5    v1.32.1
        kube-controller-manager   master01   v1.31.5    v1.32.1
        kube-scheduler            master01   v1.31.5    v1.32.1
        kube-proxy                           1.31.5     v1.32.1
        CoreDNS                              v1.11.3    v1.11.3
        etcd                      master01   3.5.15-0   3.5.16-0

        You can now apply the upgrade by executing the following command:

                kubeadm upgrade apply v1.32.1

        _____________________________________________________________________


        The table below shows the current state of component configs as understood by this version of kubeadm.
        Configs that have a "yes" mark in the "MANUAL UPGRADE REQUIRED" column require manual config upgrade or
        resetting to kubeadm defaults before a successful upgrade can be performed. The version to manually
        upgrade to is denoted in the "PREFERRED VERSION" column.

        API GROUP                 CURRENT VERSION   PREFERRED VERSION   MANUAL UPGRADE REQUIRED
        kubeproxy.config.k8s.io   v1alpha1          v1alpha1            no
        kubelet.config.k8s.io     v1beta1           v1beta1             no
        _____________________________________________________________________
        ```

O comando informa qual é a próxima versão que pode ser instalada.

*   **Comando `kubeadm upgrade apply`:**
    *   Aplica o upgrade do Control Plane para a versão recomendada:
        ```bash
        sudo kubeadm upgrade apply v1.32.1
        ```

        Output:
        ```text
        [upgrade] Reading configuration from the "kubeadm-config" ConfigMap in namespace "kube-system"...
        [upgrade] Use 'kubeadm init phase upload-config --config your-config.yaml' to re-upload it.
        [upgrade/preflight] Running preflight checks
        [upgrade] Running cluster health checks
        [upgrade/preflight] You have chosen to upgrade the cluster version to "v1.32.1"
        [upgrade/versions] Cluster version: v1.31.5
        [upgrade/versions] kubeadm version: v1.32.1
        [upgrade] Are you sure you want to proceed? [y/N]:
        ```

*   **Analisando os Logs do Upgrade:**
    *   O processo de upgrade do Control Plane inclui atualização do API Server, Scheduler, Controller Manager e do ETCD.
    *  O `kubeadm` faz o backup das configurações anteriores.
    *   Garante a atualização de certificados e chaves de maneira automatizada.
*   **Verificando o Status:**
    *   Verifique o status do cluster.
        ```bash
        kubectl get nodes
        ```
    * Verificar o kube-apiserver
    ```bash
    kubectl get pods kube-apiserver-master01 -n kube-system -o yaml
    ```
