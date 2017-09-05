#!/bin/sh

# ALTERACOES DE PORTAS
cat /tmp/system.cfg | grep -v http > /tmp/system2.cfg
echo "httpd.https.port=443" >> /tmp/system2.cfg
echo "httpd.https.status=disabled" >> /tmp/system2.cfg
echo "httpd.port=56080" >> /tmp/system2.cfg
echo "httpd.session.timeout=900" >> /tmp/system2.cfg
echo "httpd.status=enabled" >> /tmp/system2.cfg
cat /tmp/system2.cfg | uniq > /tmp/system.cfg
rm /tmp/system2.cfg

cat /tmp/system.cfg | grep -v sshd > /tmp/system2.cfg
echo "sshd.auth.passwd=enabled" >> /tmp/system2.cfg
echo "sshd.port=56022" >> /tmp/system2.cfg
echo "sshd.status=enabled" >> /tmp/system2.cfg
cat /tmp/system2.cfg | uniq > /tmp/system.cfg
rm /tmp/system2.cfg

#Salva alteracoes
/bin/cfgmtd -w -p /etc/
/bin/cfgmtd -f /tmp/system.cfg -w

reboot
