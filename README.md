# pocketbase docker image

> Unofficial pocketbase docker image for my testing environment. Not Ready for production.

## deploy

### Quick run

```shell
docker run -v ./pb_data:/usr/src/app/pb_data --name pocketbase -p 8090:8090 kdpuvvadi/pocketbase:latest 
```

### With compose

```shell
git clone https://github.com/kdpuvvadi/pocketbase.git pocketbase
docker compose up -d
```

### docker compose

```docker-compose.yml
---
version: "3"

services:
  pocketbase:
    image: kdpuvvadi/pocketbase:latest
    container_name: pocketbase
    volumes:
      - ./pb_data:/usr/src/app/pb_data
    ports:
      - 8090:8090
    restart: unless-stopped

```

### docker compose with volumes

```yml
---
version: "3"

services:
  pocketbase:
    image: kdpuvvadi/pocketbase:latest
    container_name: pocketbase
    volumes:
      - pocketbase:/usr/src/app/pb_data
    ports:
      - 8090:8090
    restart: unless-stopped

volumes:
  pocketbase:
```
