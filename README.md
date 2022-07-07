# Raspberry-Pi Homeserver
This repository contains the configuration of my RaspberryPi homeserver, automated with Ansible.

## Prerequisites
Install the dependencies:
```
ansible-galaxy install -r requirements.yml
```

## Sleepy
```
ansible-playbook essentials.yml --limit sleepy -e ansible_port=22 -e ansible_user=root --ask-vault-pass
ansible-playbook sleepy.yml --ask-vault-pass
```

## Run 
```
ansible-playbook main.yml --ask-vault-pass
```