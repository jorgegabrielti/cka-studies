#### 4. Preparando o Worker Node para Manutenção 🚧

*   **`kubectl drain`:**
    *   Utilizamos o `kubectl drain` para preparar um nó para manutenção, movendo os pods agendados para outro nó disponível.
        ```bash
        kubectl drain <seu-node> --ignore-daemonsets
        ```
        *   Substitua `<seu-node>` pelo nome do seu nó worker.
        *   A flag `--ignore-daemonsets` garante que o daemonsets (que são usados por CNI) não sejam removidos.
*  **Forçando a Manutenção:**
    *  Caso não seja possível remover todos os pods, o `force` é utilizado.
        ```bash
        kubectl drain <seu-node> --ignore-daemonsets --force
        ```
    *  O processo de `drain` retira todos os pods, para que o nó possa ser atualizado com segurança.

#### 5. Executando o Upgrade: Worker Node ⚙️

*   **Utlização do repositório:**
    ```bash
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    ```

    ```bash
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
    ```
    
    ```bash
    sudo apt update
    ```

*   **Conecte-se ao Nó Worker:** Acesse o nó via SSH.
* **Desmarque os pacotes:**
      *  Desabilite o `hold` nos pacotes `kubelet`, `kubeadm` e `kubectl`.
      ```bash
      sudo apt-mark unhold kubelet kubeadm kubectl
      ```

*   **Instale o Kubeadm:**
      ```bash
      sudo apt install kubeadm
      ```

*   **Upgrade do node:**
    ```bash
    sudo kubeadm upgrade node
    ```

*   **Instale os Binários:**
    *  Instale os pacotes `kubelet` e `kubectl` na versão correta
    ```bash
    sudo apt install  kubelet kubectl
    ```
*   **Marque os pacotes novamente**
      ```bash
      sudo apt-mark hold kubelet kubeadm kubectl
      ```

*   **Comando `kubeadm upgrade node`:**
    *   Aplica o upgrade do kubelet:
        ```bash
        sudo kubeadm upgrade node
        ```

*   **Reinicie o Kubelet:**
    *   Reinicie o kubelet para carregar a nova versão.
        ```bash
        sudo systemctl restart kubelet
        ```
*  **Verifique o status do nó:**
      ```bash
       kubectl get no
      ```

#### 6. Retirando o Nó da Manutenção ⛑️

*   **`kubectl uncordon`:**
    *   Após o upgrade, use o comando `uncordon` para permitir que novos pods sejam agendados neste nó:

        ```bash
        kubectl uncordon <seu-node>
        ```

        *   Substitua `<seu-node>` pelo nome do seu nó worker.

#### 7. Verificando a Versão do Cluster 🧐

*   **Verificação:**
    * Use o comando `kubectl get no` para verificar a versão.
    *   Você deve ver que o nó agora está usando a versão 1.32.1.
* **Verificando versão dos pods**
   *  `kubectl get po -A`

### Conclusão

Parabéns! Você fez o upgrade do cluster Kubernetes seguindo as boas práticas. Lembre-se, este é um processo fundamental para a CKA e para o dia a dia na administração do Kubernetes.

É importante revisar o processo e se familiarizar com os comandos. Prepare-se, pois este é um dos tópicos mais importantes da prova. Mantenham-se engajados e em caso de dúvidas, perguntem! Até a próxima aula! 👋