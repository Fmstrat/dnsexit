# dnsexit
DNSExit dynamic IP client for Docker

```
version: '2'

services:

  dnsexit:
    image: dnsexit
    container_name: dnsexit
    volumes:
      - /etc/localtime:/etc/localtime:ro
    environment:
      - LOGIN=mylogin
      - PASSWORD=mypassword
      - HOST=host.domain.com
      - INTERVAL=600
    restart: always

```
