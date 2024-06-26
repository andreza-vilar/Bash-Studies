#!/bin/bash

ESPACO=`df -h | awk '{print $5}' | grep -v Use | sort -nr | awk -F % '{print $1}' | head -n1`
ESPACO_INODE=`df -hi | awk '{print $5}'  | grep -v IUse | sort -nr | awk -F % '{print $1}' | head -n1`
ALERTA_RISCO="O disco esta prestes ficar a sem espaco por favor verificar \n\n `df -h ` \n\n `uname -a`"
ALERTA_CHEIO="O disco encheu verificar com urgencia \n\n `df -h ` \n\n  `uname -a`"
ALERTA_RISCO_INODE="O disco esta prestes a ficar sem espaco por favor verificar \n\n `df -hi ` \n\n `uname -a`"
ALERTA_CHEIO_INODE="O disco encheu verificar com urgencia \n\n `df -hi ` \n\n  `uname -a`"
SUBJECT_1="AVISO DE DISCO" #TITULO DO EMAIL
SUBJECT_2="DISCO LOTADO" #TITULO DO EMAIL
SUBJECT_1_I="AVISO DE DISCO" #TITULO DO EMAIL
SUBJECT_2_I="DISCO LOTADO" # TITULO DO EMAIL
EMAIL_DST="emaildestino@seuemail.com.br" #ALTERAR PARA SEU EMAIL
EMAIL_ORI="emailorigem@seumeial.com.br" #ALTERAR PARA O EMAIL QUE ENVIARA
SMTP="smtp.seudominio.com.br" #ALTERAR PARA O SMTP DO SEU SERVER
USR="smtp@seudominio.com.br"  #ALTERAR PARA O USUARIO DO EMAIL QUE ENVIARA
SENHA="suasenha" #ALTERAR PARA A SENHA DO USUARIO QUE ENVIARA
TLS="tls=yes" #CASO SEU EMAIL NAO TENHA TLS ALTERE PARA no 


# Verifica espaco em disco
case $ESPACO in
        9[1-9]) #Caso o disco esteja entre 91 a 99 ele manda um email avisando
        sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $SUBJECT_1 -m "$ALERTA_RISCO" -s $SMTP:587 -xu $USR -xp $SENHA -o $TLS;;
        100)# Caso encha tb
        sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $SUBJECT_2 -m "$ALERTA_CHEIO" -s $SMTP:587 -xu $USR -xp $SENHA -o $TLS;;
esac

case $ESPACO_INODE in
        9[1-9]) #Caso o disco esteja entre 91 a 99 ele manda um email avisando
        sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $SUBJECT_1_I -m "$ALERTA_RISCO_INODE" -s $SMTP:587 -xu $USR -xp $SENHA -o $TLS;;
        100)# Caso encha tb
        sendEmail -f $EMAIL_ORI -t $EMAIL_DST -u $SUBJECT_2_I  -m "$ALERTA_CHEIO_INODE"-s $SMTP:587 -xu $USR -xp $SENHA -o $TLS;;
esac
