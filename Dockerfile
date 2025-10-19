# 🧱 Step 1 — Use official lightweight NGINX base image
FROM nginx:alpine

# 🧹 Step 2 — Remove the default NGINX html files
RUN rm -rf /usr/share/nginx/html/*

# 📦 Step 3 — Copy Flutter web build output into NGINX public folder
COPY build/web /usr/share/nginx/html

# 🌐 Step 4 — Expose port 80 so the container listens to web traffic
EXPOSE 80

# 🚀 Step 5 — Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
