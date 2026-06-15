#!/usr/bin/env bash
set -euo pipefail

# Ansible Managed: /etc/letsencrypt/dynv6-hook.sh

SSH_KEY="/home/daniel/.ssh/ssh_ed25519_raspberryserver"
SSH_CMD="ssh -i $SSH_KEY -o StrictHostKeyChecking=accept-new api@dynv6.com"

if [ "$1" = "auth" ]; then
    echo "Setze TXT-Record für $CERTBOT_VALIDATION..."
    $SSH_CMD "hosts shilunski.de records set _acme-challenge txt data $CERTBOT_VALIDATION"
    
    echo "Warte 15 Sekunden auf DNS-Propagierung..."
    sleep 15
    
elif [ "$1" = "cleanup" ]; then
    echo "Lösche TXT-Record..."
    $SSH_CMD "hosts shilunski.de records del _acme-challenge txt"
fi

