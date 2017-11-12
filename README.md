# ansible

## how to run playbooks
ansible-playbook site.yml -i hosts.ini

## Docker machine

https://docs.docker.com/machine/get-started/#create-a-machine

https://docs.docker.com/machine/install-machine/#how-to-uninstall-docker-machine

## Tools server

It stores a docker registry where we can store our own images

example:

- download nginx and store in our tools server registry
```
docker pull nginx:1
docker tag nginx:1 localhost:5000/nginx:1
docker push localhost:5000/nginx:1
```

- then we can see the upload image using rest api

```
http://192.168.99.100:5000/v2/_catalog
http://192.168.99.100:5000/v2/nginx/tags/list
```

## Manager server, docker swarm

* swarm manager
```
docker-machine ssh rationalgames-swarm-manager docker swarm init --advertise-addr eth1
```

* we can add workers nodes like this

```
docker-machine ssh rationalgames-swarm-worker1 docker swarm join --token SWMTKN-1-5dhyie7viaj4apb3up15b6j1o3dysgy4yloijazcyzqvafqsow-9wrbdf0hcuhnzkba0f9hmfrx9 192.168.99.101:2377
```

*take the token from swarm manager*

- being inside of any swarm node, we can check

docker info

docker node ls

https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/