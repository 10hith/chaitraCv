#!/bin/bash

# Quick start: Serve HTML and run Cloudflare tunnel

# Start HTTP server on port 8000
echo "Starting HTTP server on port 8000..."
python3 -m http.server 8000 --directory /home/user/chaitraCv &
HTTP_SERVER_PID=$!

echo "HTTP Server PID: $HTTP_SERVER_PID"
echo "HTML being served at: http://localhost:8000"
echo ""
echo "Starting Cloudflare tunnel..."

# Run the tunnel (credentials should already be configured)
cloudflared tunnel run chaitracv-tunnel --config /home/user/chaitraCv/.cloudflared/config.yml

# Cleanup
trap "kill $HTTP_SERVER_PID" EXIT
