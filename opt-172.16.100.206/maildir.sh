#!/bin/bash
for NOME in $(getent passwd | awk -F: '$3 >= 1000 {print }' | egrep -v "nobody|vagrant|suporte")
do
	echo $NOME criando o diretório
	maildirmake /home/${NOME}/Maildir
	maildirmake /home/${NOME}/Maildir/.Enviados
	maildirmake /home/${NOME}/Maildir/.Rascunhos
	maildirmake /home/${NOME}/Maildir/.Lixeira
	maildirmake /home/${NOME}/Maildir/.SPAM
	echo $NOME alterando o dono
	chown ${NOME}: /home/${NOME} -R

done
