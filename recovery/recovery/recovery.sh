#!/bin/bash
clear
echo -e "\e[1;32m[+] Starting recovery environment...\e[0m"
/bin/bash --rcfile <(echo "export PS1=\"\[\e[1;34m\]recovery-mod\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\\$ \" ; export PATH=\"\$PATH:/home/container/usr/bin\"; cd recovery") -i