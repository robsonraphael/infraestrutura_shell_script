#!/bin/bash

echo "Criando diretórios..."
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupo de usuários..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Especificando permissões dos diretórios..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Quantos usuários deseja criar ?"
read indice

for (i = 1, i <= indice, i++) do 
    echo "Nome do usuário: "
    read usuario
    
    echo "Senha do usuário: "
    read password

    grupos = ('GRP_ADM', 'GRP_VEN', 'GRP_SEC')
    echo "Grupo disponiveis: $grupos"
    echo "Grupo do usuário: "
    read user_grp
    useradd $usuario -m -s /bin/bash -p $(openssl passwd -crypt $password) -G $user_grp
done

echo "FIM...."