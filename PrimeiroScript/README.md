# Etapas de Criação de um Script

## 1. Criar o Arquivo

- **Nome do Arquivo:** Escolha um nome significativo para o seu script, por exemplo, `meu_script`.

- **Extensão:** Scripts em shell geralmente têm extensão `.sh`, por exemplo, `meu_script.sh`.

- **Variável PATH:** O diretório onde o arquivo será armazenado deve estar no PATH do sistema para que o script seja executado de qualquer lugar.

- **Como Criar o Arquivo:** Use um editor de texto para criar o arquivo, como o `nano`, `vim` ou `gedit`. Por exemplo, para criar usando o `nano`, digite `nano meu_script.sh` no terminal e insira o código do script.

## 2. Editar o Arquivo

- **Editores de Texto:** Você pode editar o arquivo usando editores de texto como o `nano`, `vim`, `gedit`, ou IDEs como o VSCode, Sublime Text, etc.

- **Interpretador de Comandos:** No início do script, especifique o interpretador de comandos a ser usado, como `#!/bin/bash` para scripts em Bash.

## 3. Tornar o Arquivo Executável

- **Comando `chmod`:** Use o comando `chmod +x meu_script.sh` para tornar o arquivo executável.

- **Como Saber se é Executável:** Verifique as permissões do arquivo com o comando `ls -l meu_script.sh`. Se a permissão de execução estiver ativada para o seu usuário, o arquivo é executável.
