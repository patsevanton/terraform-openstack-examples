#!/bin/bash

terraform_version='0.12.24'

terraform_archive=terraform_${terraform_version}_linux_amd64.zip
if [ ! -f "$terraform_archive" ]; then
    curl https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip -o "$terraform_archive"
fi

if [ ! -f terraform ]; then
    unzip "$terraform_archive"
fi

./terraform init
./terraform apply -auto-approve
ansible-playbook disable_selinux.yml
