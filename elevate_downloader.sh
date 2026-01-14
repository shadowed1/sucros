#!/bin/bash
# ChromeOS Elevated Shell
# shadowed1
# Non sudo downloader
curl -L https://raw.githubusercontent.com/shadowed1/elevate/main/elevate_installer.sh -o /home/chronos/elevate_installer
echo
echo "Run the commands listed below in VT-2 to continue the installer:"
echo "ctrl-alt-refresh to open VT-2 (ctrl-alt-back to exit) - log in as chronos"
echo ""
echo "sudo mv /home/chronos/elevate_installer /usr/local/"
echo "sudo chmod +x /usr/local/elevate_installer"
echo "sudo /usr/local/elevate_installer"
echo
