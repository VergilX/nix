#!/bin/sh

# Elevate permissions
if [ "$EUID" -ne 0 ]; then
    exec sudo -s "$0" "$@"
fi

read -p "This will update existing configuration (y/n): " ch

if [[ $ch == 'y' ]]; then
    cp /etc/nixos/hardware-configuration.nix ./myconfigs
    cp /etc/nixos/configuration.nix ./myconfigs
    cp -rd /etc/nixos/abhinand/ ./myconfigs
    echo "Configs updated! :]"
elif [[ $ch == 'n' ]]; then
    echo "Why bother you donkey!"
else
    echo "Are you blind broda?"
fi
