# Purely static site — no build step, so the image is just the assets plus an
# unprivileged nginx. Mirrors the serving shape of the other tenant apps
# (nginx-unprivileged on 8080, read-only root filesystem in the Deployment).
FROM nginxinc/nginx-unprivileged:1-alpine
COPY public /usr/share/nginx/html
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -t 1 --spider http://localhost:8080/ || exit 1
