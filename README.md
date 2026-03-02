# Metasploiter

Run Metasploit Framework in Docker. This is meant to be a quick setup to run your scans.

## Quick start

```bash
docker compose up -d
docker compose attach msf
# then: ./msfconsole
```

Or a one-off interactive session:

```bash
docker compose run --rm msf
```

## Reaching your hosts

- **Host network** – The container shares the host’s network, so it can connect to any IP on your machine or LAN (127.0.0.1, 192.168.x.x, 10.x.x.x, etc.).
- **Host’s `/etc/hosts`** – Mounted read-only so the container resolves the same hostnames as your laptop (DDEV, internal DNS, custom entries). No extra config.

Use those hostnames or IPs as targets in msfconsole.

## Requirements

- Docker and Docker Compose
- Port 5433 free on the host (PostgreSQL for msf)

## License

GPL-3.0-or-later — see [LICENSE](LICENSE).
