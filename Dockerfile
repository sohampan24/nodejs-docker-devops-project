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

EXPOSE 5006

CMD ["npm", "start"]
