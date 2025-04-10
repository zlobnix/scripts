#!/bin/bash
sudo cp ./sshd_config_off /etc/ssh/sshd_config && sudo systemctl restart ssh.service
