# PocketBase docker image

> Unofficial [PocketBase](https://github.com/pocketbase/pocketbase) docker image for my testing environment. Not Ready for production.

![](https://img.shields.io/github/v/release/kdpuvvadi/pocketbase?color=success&display_name=tag&label=docker&logo=docker)
![](https://img.shields.io/github/v/release/pocketbase/pocketbase?color=success&display_name=tag&label=pocketbase&logo=pocketbase)

# builds

|  arch  |  Support  |
| :----: | :-------: |
| amd64  |   &check; |
| arm64  |   &check; |
| armv7  |   &check; |

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

```docker-compose.yaml
---

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

```docker-compose.yaml
---

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
