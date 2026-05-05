# Stage 1: Construcción e instalación de dependencias
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install

# Stage 2: Producción (Imagen final liviana y segura)
FROM node:18-alpine
WORKDIR /app
# Copiar las dependencias instaladas en el stage 1
COPY --from=builder /app/node_modules ./node_modules
# Copiar el resto del código
COPY . .
# Requisito IE1: Usuario no root por seguridad
USER node

EXPOSE 3001
CMD ["node", "server.js"]