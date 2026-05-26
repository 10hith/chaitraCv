# Chaitrácv - Claude Development Guide

## HTML Output Rules

### Self-Contained Files
All HTML files generated in this project must be fully self-contained:
- **CSS** must be inlined within `<style>` tags in the `<head>` — no external `.css` file references
- **JavaScript** must be inlined within `<script>` tags — no external `.js` file references
- **External CDN resources** (e.g. fonts, icon libraries) are allowed via `<link>` or `<script src>` only if they point to a public CDN URL (not a local file)
- No relative or absolute local file path references (e.g. `./style.css`, `/app.js`) — these will break in preview environments

### Previewing HTML Files
Whenever the user asks to view, preview, or open an HTML file, construct and display the htmlpreview URL in the format:
```
https://htmlpreview.github.io/?https://github.com/10hith/chaitraCv/blob/[branch]/[file-path]
```
Example: `https://htmlpreview.github.io/?https://github.com/10hith/chaitraCv/blob/claude/cloudflared-tunnel-html-fOwva/index.html`
