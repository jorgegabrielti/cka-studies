## 🚀 Preparando para a Certificação Kubernetes: CKA, CKAD e CKS

### Introdução

Olá pessoal! Sejam bem-vindos à nossa primeira aula do novo módulo focado nas certificações Kubernetes: CKA, CKAD e CKS. Hoje, vamos dar o pontapé inicial na nossa jornada, começando com a CKA (Certified Kubernetes Administrator). O nosso objetivo é claro: vamos entender o currículo da prova, para depois partirmos para a parte prática.

Para isso, separei alguns links que usaremos bastante, principalmente a documentação oficial do Kubernetes. E lembrem-se, tudo o que fizermos aqui terá como base a documentação oficial, pois será fundamental que vocês se acostumem com ela para o dia da prova.

Vamos mergulhar no mundo Kubernetes!

### Desenvolvimento

#### 1. Currículo da Prova CKA: Uma Visão Geral 🧐

A prova CKA é dividida em tópicos, cada um com um peso específico na pontuação final. Vamos dar uma olhada em cada um deles:

*   **Cluster Architecture, Installation & Configuration (25%)**
    *   Instalação dos binários do Kubernetes.
    *   Instalação usando `kubeadm`.
    *   Upgrade de um cluster Kubernetes.
    *   Backup e restore do ETCD com RBAC.
    
    **Hoje vamos focar neste tópico!**
    *   Instalação do cluster
    *   Provisionamento do cluster
    *   Instalação de uma CLI
    *   Instalação de uma Container Network Interface (CNI)
    *   Backup e restore do ETCD

*   **Workloads & Scheduling (20%)**
    *   Criar deployments robustos com rolling updates e rollbacks.
    *   Utilização de ConfigMaps e Secrets.
    *   Scale da aplicação.
    *   Aplicações robustas com self-healing e Application Deployments.
    *   Utilização de limites e como afetam o scheduling do pod.
    *   Ferramentas de manifesto: Helm e Kustomize.

*   **Services & Networking (20%)**
    *   Entender a comunicação entre os nós e entre os pods.
    *   Tipos de serviço: Cluster IP, NodePort e Load Balancer.
    *   Funcionamento do Ingress e CoreDNS.
    *   Instalação e escolha de uma CNI.

*   **Storage (10%)**
    *   Storage Classes e Persistent Volumes.
    *   Tipos de volume e acessos.
    *   Reclaim policies.
    *   Configurar volumes em aplicações.

*   **Troubleshooting (25%)**
    *   Troubleshooting em clusters e aplicações.
    *   Monitoramento de aplicações e consulta de logs.
    *   Troubleshooting de componentes do cluster e da rede.
    
    
   
    
#### 2. Links Importantes: Currículo das Provas 🔗

Para consulta detalhada dos currículos, acesse os links abaixo:

*   **Currículo Geral da CNCF:** [https://github.com/cncf/curriculum](https://github.com/cncf/curriculum)
*   **Currículo da CKAD:** [https://github.com/cncf/curriculum/blob/master/CKA_Curriculum_v1.31.pdf](https://github.com/cncf/curriculum/blob/master/CKA_Curriculum_v1.31.pdf)
*   **Currículo da CKA:** [https://github.com/cncf/curriculum/blob/master/CKA_Curriculum_v1.31.pdf](https://github.com/cncf/curriculum/blob/master/CKA_Curriculum_v1.31.pdf)
*   **Currículo da CKA Coming Soon (Em Breve - Q1 2025):** [\[https://github.com/cncf/curriculum/blob/master/CKA_Curriculum Coming Soon Q1 2025.pdf](https://github.com/cncf/curriculum/blob/master/CKA_Curriculum%20Coming%20Soon%20Q1%202025.pdf)

#### 3. As Mudanças na Nova Versão da CKA  🔄

A prova CKA passará por algumas mudanças após fevereiro de 2025, com a inclusão de alguns itens novos:

*   **Dynamic Volume Provisioning**
     *  Usando plugins, como no EKS da AWS,  para o provisionamento automático de discos
*   **API Gateway**
    *   Entender como funciona o novo recurso default do Kubernetes
*   **Criação de Manifestos e Ferramentas de Template**
    *  Haverá maior foco em Helm e Kustomize, ferramentas de templates, antes focadas apenas em CKAD
*   **CNI, CSI e CRI**
    *   Maior atenção a Container Network Interface, Container Storage Interface e Container Runtime Interface.

#### 4. Documentação Oficial: Sua Melhor Amiga 📚

Vamos usar a documentação oficial do Kubernetes para tudo! Ela será sua principal referência durante o treinamento e no dia da prova.

🔗  [Documentação Oficial do Kubernetes](https://kubernetes.io/docs/)

#### 5. CNI, CRI e CSI: Entendendo as Siglas 🤓

*   **CNI (Container Network Interface):** A interface de rede para fazer a instalação dentro do nosso cluster. Hoje vamos usar a Cilium.
*   **CRI (Container Runtime Interface):** A interface para rodar os containers. Vamos usar o Containerd.
*   **CSI (Container Storage Interface):** A interface de storage para gerenciar volumes e discos.

#### 6. Mãos à Obra: Preparando o Ambiente 🛠️

Para começar, vocês vão precisar de pelo menos duas máquinas virtuais, seja na cloud (AWS, GCP, Azure) ou localmente. Isso porque vamos instalar um cluster Kubernetes, e não podemos usar soluções como o Kind.

Hoje, vamos criar as máquinas usando a AWS, pois é uma das formas mais fáceis e rápidas para iniciar. Fiquem tranquilos, a prova não aborda o provisionamento de máquinas, mas vou mostrar aqui como fazer.

### Conclusão

E aí, preparados para essa jornada? 🚀 Hoje começamos com o pé direito, entendendo a estrutura da prova CKA, as mudanças futuras e os principais conceitos que vamos trabalhar. 

Nas próximas aulas, vamos construir o nosso cluster Kubernetes e explorar os principais recursos e ferramentas do Kubernetes. E lembrem-se: **a documentação oficial será sempre nossa melhor amiga**!

Mantenham-se engajados e não hesitem em tirar dúvidas. Até a próxima aula! 👋
