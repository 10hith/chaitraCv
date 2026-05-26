#!/bin/bash

# Install cloudflared if not present
if ! command -v cloudflared &> /dev/null; then
    echo "Installing cloudflared..."
    curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
    dpkg -i cloudflared.deb
    rm cloudflared.deb
fi

# Start a simple HTTP server to serve the HTML
echo "Starting HTTP server on port 8000..."
python3 -m http.server 8000 --directory /home/user/chaitraCv &
HTTP_SERVER_PID=$!

# Give the server time to start
sleep 2

# Create cloudflare tunnel and authenticate
echo "Setting up Cloudflare tunnel..."
echo "Note: You'll need to authenticate with your Cloudflare account"
cloudflared tunnel create chaitracv-tunnel

# Run the tunnel
echo "Starting Cloudflare tunnel..."
cloudflared tunnel run chaitracv-tunnel --config /home/user/chaitraCv/.cloudflared/config.yml

# Cleanup on exit
trap "kill $HTTP_SERVER_PID" EXIT
