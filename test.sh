#!/bin/bash

#Lynis script testerino

mkdir -p ./files && cd .. && tar czf ./lynis/files/lynis-remote.tar.gz --exclude=files/lynis-remote.tar.gz ./lynis && cd lynis

scp -q ./files/lynis-remote.tar.gz root@192.168.75.129:~/tmp-lynis-remote.tgz 

ssh root@192.168.75.129 "mkdir -p ~/tmp-lynis && cd ~/tmp-lynis && tar xzf ../tmp-lynis-remote.tgz && rm ../tmp-lynis-remote.tgz && cd lynis && ./lynis audit system --quick"

ssh root@192.168.75.129 "rm -rf ~/tmp-lynis"

 scp -q root@192.168.75.129:/var/log/lynis.log ./files/192.168.75.129-lynis.log
  scp -q root@192.168.75.129:/var/log/lynis-report.dat ./files/192.168.75.129-lynis-report.dat
  ssh root@192.168.75.129 "rm /var/log/lynis.log /var/log/lynis-report.dat"

 
