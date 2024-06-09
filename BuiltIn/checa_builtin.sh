#!/usr/bin/env bash

# Mensagem de erro...
msg="É preciso informar um comando válido!"

# Teste de quantidade de argumentos...
[[ $# -ne 1 ]] && echo $msg && exit 1

# Aqui nós executamos o comando "help"...
help $1 &> /dev/null

# E aqui nós testamos a saída com o comando "test"...
[[ $? -eq 0 ]] && echo "$1 é interno!" || echo "$1 não é interno!"

exit 0
