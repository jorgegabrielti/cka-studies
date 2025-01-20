## 🚀 Instalando o Cilium CLI para Kubernetes

### Introdução

Olá pessoal! Nesta aula, vamos aprender como instalar o Cilium CLI (Command-Line Interface), que é uma ferramenta essencial para interagir e gerenciar o Cilium, uma popular Container Network Interface (CNI) para Kubernetes.

O Cilium CLI facilita a configuração, monitoramento e troubleshooting do Cilium no seu cluster Kubernetes. Vamos começar!

### Desenvolvimento

#### 1. O Que É o Cilium CLI? 🤔

*   **Cilium:** É uma CNI de alto desempenho que proporciona conectividade de rede, segurança e observabilidade para Kubernetes.
*   **Cilium CLI:** É uma ferramenta de linha de comando que permite interagir diretamente com o Cilium no seu cluster Kubernetes.

#### 2. Preparando o Ambiente ⚙️

*   **Acesso ao Nó:** Certifique-se de que você tem acesso via SSH a um nó do seu cluster Kubernetes.
*   **Privilégios:** Você precisará de privilégios de root (`sudo`) para instalar o Cilium CLI.
*   **Conexão com a Internet:** O nó onde você está instalando precisa ter acesso à internet para baixar o binário do Cilium CLI.

#### 3. Instalando o Cilium CLI: Passo a Passo 🛠️

*   **Obtenha a Versão Mais Recente do Cilium CLI:**

    ```bash
    CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/main/stable.txt)
    ```
    *  Este comando usa o `curl` para obter a versão mais recente do Cilium CLI do arquivo `stable.txt` no GitHub e armazena na variável `CILIUM_CLI_VERSION`.
*   **Detecte a Arquitetura do Seu Sistema:**

    ```bash
     CLI_ARCH=amd64
    if [ "$(uname -m)" = "aarch64" ]; then CLI_ARCH=arm64; fi
    ```
    *   Este comando detecta se a sua arquitetura é `amd64` ou `aarch64` e armazena na variável `CLI_ARCH`.
*   **Baixe o Cilium CLI:**

    ```bash
    curl -L --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
    ```
    *   Este comando usa `curl` para baixar o binário do Cilium CLI e o arquivo checksum SHA256, se houver disponível.
    *   `-L` faz o `curl` seguir redirecionamentos HTTP, caso a URL seja redirecionada para um download direto.
    *   `--fail` faz o `curl` retornar um erro caso a requisição falhe, o que é importante em um script.
    *   `--remote-name-all` salva o arquivo com o nome do binário e o arquivo checksum com o nome do binário.
*   **Verifique o Checksum SHA256:**

    ```bash
    sha256sum --check cilium-linux-${CLI_ARCH}.tar.gz.sha256sum
    ```
    *   Este comando usa o `sha256sum` para verificar se o download do binário foi feito corretamente e sem corrupção.
*   **Descompacte e Instale o Cilium CLI:**

    ```bash
    sudo tar xzvfC cilium-linux-${CLI_ARCH}.tar.gz /usr/local/bin
    ```
    *  Este comando usa o `tar` para descompactar os arquivos e instalar o Cilium CLI no diretório `/usr/local/bin`, que está no seu PATH.
    *   `xzvfC`:
      *  `-x`: indica que é para extrair os arquivos
       *  `-z`: indica que o arquivo está compactado em gzip.
       *  `-v`: modo verbose, mostra detalhes da extração.
       *  `-f`: indica que o proximo argumento é o nome do arquivo a ser extraido.
       *  `-C`: indica o diretório onde os arquivos serão extraidos.
*   **Limpe os Arquivos de Download:**

    ```bash
    rm cilium-linux-${CLI_ARCH}.tar.gz{,.sha256sum}
    ```
    *   Este comando remove os arquivos de download do binário e do checksum.

#### 4. Verificando a Instalação ✅

*   **Verificação:**
     Para verificar se o Cilium CLI foi instalado, digite:
     ```bash
      cilium version
     ```
     *   Isso deve retornar a versão do CLI.

### Conclusão

Parabéns! Você instalou com sucesso o Cilium CLI no seu nó Kubernetes. Agora você pode usar o `cilium` para verificar o status, fazer troubleshooting e gerenciar o seu cluster Kubernetes.

Nas próximas aulas, vamos aprender a usar essa ferramenta para explorar o mundo do Cilium no Kubernetes. Mantenha-se engajado e não hesite em tirar dúvidas! Até a próxima! 👋

**Documentação de Referência**

*   [Documentação Oficial do Cilium](https://docs.cilium.io/en/latest/installation/k8s-install-kubeadm/#create-the-cluster)
