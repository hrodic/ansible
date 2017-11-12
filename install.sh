#!/usr/bin/env bash

# roles
ansible-galaxy install geerlingguy.docker -p roles

# install docker and docker-compose in local machine
ansible-playbook development.yml -i hosts.ini

if [ ! -f /usr/local/bin/docker-machine ]; then
    # docker machine
    curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
    docker-machine version

    # bash completion
    for i in docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash;
        do sudo wget https://raw.githubusercontent.com/docker/machine/v0.13.0/contrib/completion/bash/${i} -P /etc/bash_completion.d;
    done;
fi;