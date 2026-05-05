# Usamos una imagen ligera de Node.js
FROM node:20-alpine

# Definimos el directorio de trabajo
WORKDIR /app

# Copiamos solo los archivos de dependencias para optimizar el caché
COPY package*.json ./

# Instalamos solo las dependencias de producción para que la imagen sea liviana
RUN npm install --only=production

# Resto del código (incluyendo server.js)
COPY . .

# SEGURIDAD: Usamos el usuario 'node' que ya viene en la imagen
# Esto cumple con el principio de mínimo privilegio de la pauta.
USER node

# Exponemos el puerto que usa tu servidor Express
EXPOSE 3001

# Comando para iniciar la aplicación según tu package.json
CMD ["node", "server.js"]