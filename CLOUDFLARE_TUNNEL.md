# Cloudflare Tunnel Setup

This project uses Cloudflare Tunnel to securely expose the HTML portfolio online.

## Quick Start

### 1. Initial Setup (One-time)

```bash
chmod +x setup-tunnel.sh
./setup-tunnel.sh
```

This script will:
- Install `cloudflared` (if not already installed)
- Start a Python HTTP server on port 8000
- Create and authenticate the Cloudflare tunnel
- Route traffic from your Cloudflare domain to localhost:8000

### 2. Start the Tunnel

Once configured, simply run:

```bash
chmod +x start-tunnel.sh
./start-tunnel.sh
```

This starts:
- HTTP server on `http://localhost:8000`
- Cloudflare tunnel routing to your configured domain

## Configuration

The tunnel is configured in `.cloudflared/config.yml`:

```yaml
tunnel: chaitracv-tunnel
ingress:
  - hostname: chaitracv.lohith.dev
    service: http://localhost:8000
  - service: http_status:404
```

Update the hostname to match your Cloudflare domain.

## Files

- `setup-tunnel.sh` - Initial setup and authentication
- `start-tunnel.sh` - Quick start for running the tunnel
- `.cloudflared/config.yml` - Tunnel configuration
- `.cloudflared/chaitracv-tunnel.json` - Credentials (created after auth)

## Authentication

When running `setup-tunnel.sh` for the first time, you'll be prompted to:
1. Visit a Cloudflare authentication URL
2. Select your domain
3. Authorize the tunnel

The credentials are saved to `.cloudflared/chaitracv-tunnel.json`.

## Verify It's Working

Once running, check:
- Local: `curl http://localhost:8000`
- Remote: Visit your configured Cloudflare domain
