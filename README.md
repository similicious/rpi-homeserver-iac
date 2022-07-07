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

## Apps

#### Restore
Get snapshot id to restore, use env file from ~/docker-services/resticker
```
docker run --env-file .env mazzolino/restic snapshots
```
Execute restore
```
docker run -v recipes_recipes_mediafiles:/restore --env-file .env mazzolino/restic restore <snapshot_id> --target /restore --include /backup/recipes_mediafiles 
```
### Paperless

#### Restore
Get snapshot id to restore, use env file from ~/docker-services/resticker
```
docker run --env-file .env mazzolino/restic snapshots
```
Execute restore
```
docker run -v paperless-ngx_paperless-ngx-app_media:/restore --env-file .env mazzolino/restic restore <snapshot_id> --target /restore
```

## Useful stuff
Run midnight commander in docker
```
docker run -it --name=mc -v paperless-ngx_paperless-ngx-app_media:/restore blackvoidclub/midnight-commander
```