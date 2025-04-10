#!/bin/bash
sudo cp ./sshd_config_on /etc/ssh/sshd_config && sudo systemctl restart ssh.service
