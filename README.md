# coturn
COTURN docker container. This is a STUN/TURN server. https://github.com/coturn/coturn

# Usage

* Create a docker-compose.yml file

```yml
version: "3"

services:

  coturn:
    build: .
    image: flaviostutz/coturn
    network_mode: host
```

* Run ```docker-compose up -d```

* STUN will accept requests port 3478

# ENVs

* PUBLIC_IP - public IP configuration to be used by TURN. If not specified, the public IP will be queried by ```curl http://icanhazip.com```
* TURN_SECRET - turn server secret. defaults to 'oursecret'

# Considerations

It is advisable to use "network_mode:host" because TURN server will allocate random ports for clients. Currently publishing a wide range of ports in Docker causes too much overhead. With network_mode host it is not the case.