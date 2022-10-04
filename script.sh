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

echo "Criando usuários com permissões ADM: "
echo "Carlos..."
useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt carlos123) -G GRP_ADM
echo "Maria..."
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt maria123) -G GRP_ADM
echo "João..."
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt joao123) -G GRP_ADM


echo "Criando usuários com permissões VEN: "
echo "Debora..."
useradd debora -m -s /bin/bash -p $(openssl passwd -crypt debora123) -G GRP_VEN
echo "Sebastiana..."
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt sebastiana123) -G GRP_VEN
echo "Roberto..."
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt roberto123) -G GRP_VEN



echo "Criando usuários com permissões SEC: "
echo "Josefina..."
useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt josefina123) -G GRP_SEC
echo "Amanda..."
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt amanda123) -G GRP_SEC
echo "Rogerio..."
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt rogerio123) -G GRP_SEC


echo "Especificando permissões dos diretórios..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Atualizando sistema..."
apt update
apt upgrade -y

echo "Instalando servidor Apache..."
apt install unzip apache2 -y
rm /var/www/html/*
cd /var/www/html
wget https://github.com/robsonraphael/Magic-Card/blob/main/index.html

echo "Instalando servidor MySQL..."
apt install mysql-8.0 -y

echo "FIM...."