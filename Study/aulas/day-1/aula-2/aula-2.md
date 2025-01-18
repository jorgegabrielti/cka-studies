Com certeza! Aqui está a transcrição do áudio em formato de aula tutorial, com tópicos, documentação de referência e alguns ícones para deixar mais atrativo:

## 🚀 Criando e Configurando Nosso Cluster Kubernetes na AWS

### Introdução

Olá pessoal! Sejam muito bem-vindos à segunda parte da nossa primeira aula sobre as certificações Kubernetes. Na primeira parte, mergulhamos no currículo da prova CKA, e agora vamos colocar a mão na massa! Nosso objetivo de hoje é criar e configurar nosso cluster Kubernetes na AWS.

Nesta etapa, precisaremos de duas máquinas virtuais, e vamos utilizar a AWS para isso. Lembrem-se que, embora o provisionamento de máquinas não seja o foco da prova, essa prática é essencial para o nosso aprendizado e familiarização com o ambiente.

Vamos iniciar a nossa jornada de criação de um cluster Kubernetes robusto!

### Desenvolvimento

#### 1. Preparando o Ambiente na AWS ☁️

*   **Login na AWS:**
    *   Acesse sua conta AWS.
*   **Criação das Instâncias EC2:**
    *   Vamos criar duas instâncias EC2. Uma para o *control plane* e outra para o *node*.
    *   Acesse o painel EC2 e clique em "Launch Instance".
*   **Configuração da Instância:**
    *   **Nome:** Dê um nome para a sua instância (ex: CKA-control-plane e CKA-node).
    *   **Imagem:** Escolha a imagem do Ubuntu (versão 22.04).
    *   **Tipo de Instância:** Selecione o tipo t2.medium (2 vCPUs e 4 GB de RAM).
    *   **Key Pair:** Crie um novo key pair (ex: CKA_key) ou use um já existente.
    *   **Network Settings:**
        *   Crie um novo Security Group (ex: CKA-SG).
        *   Adicione uma regra inbound para permitir o acesso SSH.
        *   Para facilitar, permita o acesso para todo o tráfego entre os membros do security group, mas lembre-se que em produção esta não é uma prática recomendada
    *   **Storage:** Aumente o disco para 30 GB (para acomodar imagens e outras necessidades).
    *   **Número de Instâncias:** Selecione duas instâncias.
*   **Launch Instance:** Inicie a criação das instâncias.
*   **Aguarde a inicialização:** Aguarde até que as instâncias estejam no estado "Running".

#### 2. Acessando as Instâncias via SSH 💻

*   **Identifique o IP Público:**
    *   Acesse o painel EC2 e copie o IP público de cada instância.
*   **Terminal:**
    *   Abra o terminal do seu computador.
*   **Conexão via SSH:**
    *   Utilize o comando `ssh -i <caminho-para-sua-chave> ubuntu@<IP-público>` para acessar as instâncias.
    *   Ex: `ssh -i CKA_key.pem ubuntu@<IP-público-do-control-plane>`
    *   Ex: `ssh -i CKA_key.pem ubuntu@<IP-público-do-node>`
*   **Permissões da Chave:**
    *   Se necessário, utilize o comando `chmod 400 <sua-chave>.pem` para garantir as permissões corretas.
*   **Verificação da Conexão:**
    *   Verifique se você conseguiu acessar as instâncias com sucesso.

#### 3. Ajustando o Security Group 🛡️

*   **Permitir Comunicação Interna:**
    *   Acesse o painel EC2 e selecione o seu security group (ex: CKA-SG).
    *   Edite as regras inbound para permitir que as máquinas se comuniquem.
    *   Adicione uma regra para “All Traffic” com o “source” sendo seu próprio security group.
    *   Lembre-se que para produção isso não é ideal.

#### 4. Nomenclatura e Organização 🏷️

*   **Identificação:**
    *   Para manter a organização e facilitar a identificação, nomeie suas instâncias:
        *   `CKA Control Plane`: Para a máquina que será o nó mestre.
        *   `CKA Node`: Para a máquina que será o nó trabalhador.

### Conclusão

Excelente! Com a criação das máquinas virtuais na AWS e o acesso via SSH, estamos prontos para dar os próximos passos. Agora, podemos seguir com a instalação e configuração dos componentes do Kubernetes e do nosso cluster.

A nossa meta é criar um ambiente Kubernetes funcional que nos prepare para a prova CKA e, claro, para o mundo real!

Na próxima aula, vamos instalar o Kubernetes nos nós criados e começar a configurar o cluster. Mantenham-se engajados e qualquer dúvida, perguntem! Até lá! 👋

### Referência:

- https://v1-31.docs.kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/