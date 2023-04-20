#!/bin/bash
docker run --name fedora_vm -itd pycontribs/fedora
docker run --name centos7 -itd centos:7
docker run --name ubuntu -itd ubuntu

cd /home/ubuntu/mnt-homeworks/08-ansible-01-base/playbook && ansible-playbook site.yml -i inventory/prod.yml --vault-password-file=pass

docker stop fedora_vm centos7 ubuntu
docker rm $(docker ps --filter status=exited -q)