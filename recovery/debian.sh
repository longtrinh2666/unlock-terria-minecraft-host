#!/bin/bash
clear
REC_BIN="/home/container/recovery/usr/bin"
export PATH="$PATH:$REC_BIN"

proot -S /home/container/ \
      -w /home/container/root \
      -b /dev -b /proc -b /sys \
      /bin/bash --rcfile <(echo "
        export HOME=/home/container/root;
        export PS1='\[\e[1;33m\]debian@lemehost\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ ';
        export PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin';
        cd ~;
      ")

# Thay đoạn chạy proot bằng vòng lặp này
while true; do
    proot -S /home/container/ -w /home/container/root -b /dev -b /proc -b /sys /bin/bash --rcfile <(echo "export HOME=/home/container/root; export PS1='\[\e[1;33m\]debian@lemehost\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '; cd ~")
    sleep 1
done