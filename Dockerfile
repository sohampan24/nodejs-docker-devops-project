# Stage 1 - Build
FROM node:22 AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Stage 2 - Runtime
FROM node:22-slim

WORKDIR /app

COPY --from=builder /app .

# Install curl for health checks
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 5006

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
CMD curl -f http://localhost:5006/ || exit 1

CMD ["npm", "start"]
