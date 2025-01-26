### Aula 9: Backup do etcd

**Objetivo:** Organizar e apresentar os comandos discutidos na aula anterior em blocos de código para fácil utilização e estudo.

#### 1. Comando Básico para Backup do etcd

Este é um exemplo do comando base para criar um snapshot do etcd:

```bash
etcdctl snapshot save snapshot.db --endpoints='https://[endereço do etcd]:2379'
```
**Observação:** Lembre-se de substituir `[endereço do etcd]` pelo endereço correto do seu ambiente.

#### 2. Comando Detalhado para Backup do etcd (Com Metadados)

Um exemplo de comando com as opções para especificar certificados e chaves:

```bash
ETCDCTL_API=3 etcdctl --endpoints='https://[endereço do etcd]:2379' \
  --cacert=<certificado do etcd> \
  --cert=<certificado do cliente do etcd> \
  --key=<chave do cliente do etcd> \
  snapshot save backup.db
```
**Observação:** Substitua os valores entre `<>` pelos seus paths.

#### 3. Verificação do Snapshot

Comando para verificar a integridade de um snapshot:

```bash
etcdctl snapshot status snapshot.db
```

#### 4. Instalando ou Atualizando `etcdctl`

Exemplos de comandos para instalar ou atualizar o utilitário `etcdctl`:

```bash
sudo apt-get update && sudo apt-get install etcd-client -y
```

ou

```bash
# Para sistemas baseados em yum (CentOS, RHEL, etc.)
sudo yum update && sudo yum install etcd-client -y
```

#### 5. Exemplo de Uso do `etcdctl útil`

Para usar o comando na versão mais recente:

```bash
ETCDCTL_API=3 etcdctl --endpoints='https://[endereço do etcd]:2379' snapshot status snapshot.db
```

#### 6. Exemplo de Restauração do etcd

Um exemplo de comando de restore, que pode variar dependendo do seu ambiente:

```bash
ETCDCTL_API=3 etcdctl --data-dir=/var/lib/etcd --endpoints='https://[endereço do etcd]:2379' snapshot restore snapshot.db
```

#### 7. Reiniciando o Kubelet

Para forçar o `kubelet` a recarregar as configurações após um restore, use:

```bash
systemctl restart kubelet
```
E para recarregar os containers:
```bash
 systemctl restart containerd
```

#### 8. Comandos Adicionais para Debugging
Verificar o status dos pods:
```bash
kubectl get po
```
E verificar a criação dos configmaps:
```bash
kubectl get cm
```

#### 9. Observações Importantes

*   **`etcdctl`:** É crucial instalar e usar o `etcdctl` correto para a versão do seu etcd.
*   **Paths:** Sempre ajuste os caminhos dos certificados, chaves, e do local do backup.
*   **Autocompletar:** Use a tecla `TAB` para autocompletar e evitar erros de digitação.
*  **Versão:** No `etcdctl` a API 3, é a mais atualizada, use: `ETCDCTL_API=3`.
*   **Variáveis de Ambiente:** Para usar os comandos do etcd você pode declarar as variáveis `ETCDCTL_API=3` ou `ETCDCTL_ENDPOINT='https://[endereço do etcd]:2379'`
