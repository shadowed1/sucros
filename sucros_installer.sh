#!/bin/bash
# Sucros Installer
# shadowed1
# Must be run as sudo logged in as chronos in VT-2

mkdir -p /usr/local/bin
curl -L https://raw.githubusercontent.com/shadowed1/sucros/main/sucros.sh -o /usr/local/bin/sucros
curl -L https://raw.githubusercontent.com/shadowed1/sucros/main/sucros-daemon.sh -o /usr/local/bin/sucros-daemon
curl -L https://raw.githubusercontent.com/shadowed1/sucros/main/sucros.conf -o /etc/init/sucros.conf
chmod +x /usr/local/bin/sucros
chmod +x /usr/local/bin/sucros-daemon
rm -f /usr/local/sucros_installer
