#!/bin/bash

# Lista de pacotes a serem instalados
packages=(
    "package1"
    "package2"
    "package3"
    # Adicione mais pacotes conforme necessário
)

# Verificar se o comando apt-get está disponível (apenas para sistemas baseados em Debian/Ubuntu)
command -v apt-get >/dev/null 2>&1 || { echo >&2 "Este script suporta apenas sistemas baseados em Debian/Ubuntu."; exit 1; }

# Atualizar os repositórios de pacotes
sudo apt-get update

# Loop para verificar e instalar pacotes
for pkg in "${packages[@]}"; do
    # Verificar se o pacote já está instalado
    if dpkg -s "$pkg" >/dev/null 2>&1; then
        echo "$pkg já está instalado."
    else
        # Instalar o pacote
        sudo apt-get install -y "$pkg"
        # Verificar se a instalação foi bem-sucedida
        if [ $? -eq 0 ]; then
            echo "Pacote $pkg instalado com sucesso."
        else
            echo "Erro ao instalar pacote $pkg."
        fi
    fi
done

