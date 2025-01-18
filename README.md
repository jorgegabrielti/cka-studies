# Certified Kubernetes Administrator (CKA) - Studies

Este projeto tem como objetivo criar um ambiente de estudo prático para a certificação **Certified Kubernetes Administrator (CKA)**. Ele utiliza Vagrant e VirtualBox para configurar máquinas virtuais com um ambiente Linux pronto para iniciar os estudos, permitindo que os alunos pratiquem os comandos e conceitos necessários para o exame. O projeto fornece uma infraestrutura virtualizada e configurada, eliminando a complexidade de instalar e configurar um Sistema Operacional do zero. 

Por ser um ambiente fácil de provisionar e destruir, os estudantes podem se concentar em praticar o quanto quiserem. Após finalizar a prática, é possivel apenas executar o comando `vagrant destroy` e `vagrant up` para destruir e construir o ambiente novamente.

## Requisitos

Antes de começar, você precisará ter as seguintes ferramentas instaladas em seu sistema:

*   **VirtualBox:** Uma plataforma de virtualização de código aberto. Você pode baixá-la no site oficial: [https://www.virtualbox.org/](https://www.virtualbox.org/)

*   **Vagrant:** Uma ferramenta para construir e gerenciar ambientes de desenvolvimento virtuais. Você pode baixá-lo no site oficial: [https://www.vagrantup.com/](https://www.vagrantup.com/)

## Como Começar

Siga os passos abaixo para configurar o ambiente de desenvolvimento localmente:

1.  **Clone este repositório:**
    ```bash
    git clone https://github.com/jorgegabrielti/cka-studies.git
    ```

2.  **Navegue até a pasta do projeto:**
    ```bash
    cd cka-studies/Vagrant
    ```

3.  **Inicie a máquina virtual com o Vagrant:**
    ```bash
    vagrant up
    ```
    Este comando irá baixar e configurar a máquina virtual definida no `Vagrantfile`. Isso pode levar algum tempo na primeira execução.

4.  **Acesse a máquina virtual:**
    ```bash
    vagrant status
    vagrant ssh master01
    ```
    Use este comando para acessar a linha de comando dentro da máquina virtual. Agora é apenas começar os estudos :).

<!--
## Próximos Passos

*   [Adicione aqui um link para a documentação completa do seu projeto, se tiver]
*   [Adicione um link para um guia de contribuição, se quiser que outros colaborem]
*   [Adicione instruções específicas sobre como rodar testes, buildar a aplicação, etc.]
-->

## Estrutura do Projeto

**Diretórios e arquivos do projeto:**

*   `cka-studies/`
    *   `Study/`
        * `aulas/`
        * `Tutorial`
    *  `Vagrant`
        *   `conf/`
            * `box_configs.yaml`
            * `default_configs.yaml`
        *   `img/`
        *   `provision/`
            * `provision.sh`
        *   `.gitignore`
        *   `README.md`
        *   `Vagrantfile`

**Tabela 1: Estrutura do Projeto**

| Item         | Descrição                                                                                                                                                                                                                                                                  |
|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `cka-studies` | Diretório raiz do projeto.                                                                                                                                                                                                                                                |
| `conf/`      | Configurações gerais e específicas para construção de Vagrant boxes. Contém os arquivos:                                                                                                                                                                                  |
|     `box_config.yaml`    |     Essa configuração define uma máquina virtual para desenvolvimento ou teste. Ela especifica a imagem base, recursos computacionais como CPU e memória, uma pasta compartilhada com o sistema host, o mapeamento de portas e um script para provisionar após a inicialização da máquina. |
|     `default_configs.yaml` |     Define configurações gerais do `Vagrantfile`.                                                                                                                                                                      |
| `img/`       | Imagens ilustrativas.                                                                                                                                                                                                                                                       |
| `provision/` | Contém scripts de inicialização para prover alguma tarefa após a inicialização da máquina virtual.                                                                                                                                                                                  |
|     `provision.sh`    |     Script de inicialização.                                                                                                                                                                                                      |
| `LICENSE`    | Arquivo de licença do repositório.                                                                                                                                                                                                                                           |
| `Vagrantfile` | Este `Vagrantfile` configura um ambiente de desenvolvimento ou teste com múltiplas máquinas virtuais, utilizando informações dos arquivos YAML `conf/defaults_configs.yaml` e `conf/box_configs.yaml`. Ele define as bases para cada máquina, como o sistema operacional, nome, recursos computacionais, pastas compartilhadas, configurações de rede (mapeamento de portas) e scripts de provisionamento. Ele itera através de uma lista de configurações para cada máquina, aplicando as definições correspondentes.   |
<!--
## Contribuição

[Adicione uma seção sobre como as pessoas podem contribuir com o seu projeto. Exemplo: "Sinta-se à vontade para criar issues, fazer fork e enviar pull requests."]
-->
## Licença

Este projeto está licenciado sob a [GPL-3.0 license] - veja o arquivo [LICENSE](LICENSE) para detalhes.

Copyright (c) [2025] [Jorge Gabriel]