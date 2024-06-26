#!/bin/bash

# Configurações de alerta e email
EMAIL_DST="emaildestino@seuemail.com.br"
EMAIL_ORI="emailorigem@seumeial.com.br"
SMTP="smtp.seudominio.com.br"
USR="smtp@seudominio.com.br"
SENHA="suasenha"
TLS="tls=yes"

# Função para enviar email
enviar_email() {
    local subject="$1"
    local message="$2"
    sendEmail -f "$EMAIL_ORI" -t "$EMAIL_DST" -u "$subject" -m "$message" -s "$SMTP:587" -xu "$USR" -xp "$SENHA" -o "$TLS"
}

# Verifica espaço em disco
ESPACO=$(df -h | awk '{print $5}' | grep -v Use | sort -nr | awk -F % '{print $1}' | head -n1)
ESPACO_INODE=$(df -hi | awk '{print $5}' | grep -v IUse | sort -nr | awk -F % '{print $1}' | head -n1)

# Mensagens de alerta
ALERTA_RISCO="O disco está prestes a ficar sem espaço. Por favor, verificar.\n\n$(df -h)\n\n$(uname -a)"
ALERTA_CHEIO="O disco encheu. Verificar com urgência.\n\n$(df -h)\n\n$(uname -a)"
ALERTA_RISCO_INODE="O disco está prestes a ficar sem espaço (INODE). Por favor, verificar.\n\n$(df -hi)\n\n$(uname -a)"
ALERTA_CHEIO_INODE="O disco encheu (INODE). Verificar com urgência.\n\n$(df -hi)\n\n$(uname -a)"

# Envio de emails baseado no espaço em disco
case $ESPACO in
    9[1-9]|100)
        if [ "$ESPACO" -eq 100 ]; then
            enviar_email "DISCO LOTADO" "$ALERTA_CHEIO"
        else
            enviar_email "AVISO DE DISCO" "$ALERTA_RISCO"
        fi
        ;;
esac

# Envio de emails baseado no espaço INODE
case $ESPACO_INODE in
    9[1-9]|100)
        if [ "$ESPACO_INODE" -eq 100 ]; then
            enviar_email "DISCO LOTADO (INODE)" "$ALERTA_CHEIO_INODE"
        else
            enviar_email "AVISO DE DISCO (INODE)" "$ALERTA_RISCO_INODE"
        fi
        ;;
esac

