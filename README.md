# dnsexit
DNSExit dynamic IP client for Docker with API support

```
version: '3'

services:

  dnsexit:
    image: dnsexit
    container_name: dnsexit
    volumes:
      - /etc/localtime:/etc/localtime:ro
    environment:
      - APIKEY=apikey
      - LOGIN=mylogin
      - PASSWORD=mypassword
      - HOST=host.domain.com,otherhost.domain.com
      - INTERVAL=600
    restart: always

```
