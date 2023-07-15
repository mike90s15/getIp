#!/usr/bin/env bash
# by: @Mike90s15 (Mike Edwards)
# 07/14/2023
# version: 0.0.1
printf "\ec\e[1;36m
 Criador: Mike90s15 (Mike Edwards)
 Data: 14/07/2023
 Versão: 0.0.1
 \e[m\n"
 xdg-open https://instagram.com/mike90s15 &>/dev/null && sleep 5
 xdg-open https://t.me/Mike_Edwards &>/dev/null && sleep 5
 printf "\e[1;32m Incializando o programa...\n"
pkg="apt-get"
[[ "${HOME}" == "/data/data/com.termux/files/home" ]] && pkg="pkg"
printf "\e[1;32m Instalando as dependências!"
${pkg} install clang -y &> /dev/null
[[ -z $(command -v clang ) ]] && echo " Erro" && exit 1
gcc main.c -o main
./main
