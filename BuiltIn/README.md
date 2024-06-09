# Variáveis Especiais do Shell

Este documento descreve algumas variáveis especiais do shell, suas descrições e exemplos de uso.

| Variável | Descrição                                                                                         |
|----------|---------------------------------------------------------------------------------------------------|
| $?       | Armazena o status de saída do último comando executado.                                            |
| $$       | Armazena o PID da sessão corrente do shell.                                                        |
| $0       | Armazena o nome do arquivo do programa ou do script sendo executado.                               |
| $n       | (a partir de 1) Armazena os valores (parâmetros) passados para o script, onde "n" é um número inteiro, positivo, correspondente à posição dos parâmetros na linha de comando (daí "posicionais"). |
| $#       | Armazena o número de parâmetros passados para o script.                                            |

## Exemplos de Uso

### $?
```bash
#!/bin/bash
ls
echo "O status de saída do comando ls é $?"

