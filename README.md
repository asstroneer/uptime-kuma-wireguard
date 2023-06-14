# Uptime Kuma WireGuard

Uptime Kuma WireGuard – it is docker image for [uptime-kuma](https://github.com/louislam/uptime-kuma) and
with [WireGuard]() client inside one docker image.

## Using

For usage, you need prepare WireGuard client config file like file below:

```
[Interface]
PrivateKey = <my-private-key>
Address = 172.160.0.2/32

[Peer]
PublicKey = <server-public-key>
AllowedIPs = 172.160.0.0/12
Endpoint = my-vpn.com:51820
PersistentKeepalive = 15
```

Create this file and provide to docker container as volume.

### Docker

Run docker image using config file:

```bash
docker run --privileged -d --name uptime -v ./data:/app/data -v ./wg0.conf:/etc/wireguard/wg0.conf  maxxx00m/uptime-kuma-wireguard
```

### Docker-compose

Create docker compose file for this service like below:

```yaml
version: '3.8'
services:
  uptime:
    image: maxxx00m/uptime-kuma-wireguard:latest
    container_name: uptime
    ports:
      - 3001:3001
    restart: unless-stopped
    volumes:
      - ./wg0.conf:/etc/wireguard/wg0.conf
      - uptime-kuma:/app/data
    privileged: true

volumes:
  uptime-kuma:
```

And run it:

```bash
docker compose up -d
```

### Kubernetes

todo
