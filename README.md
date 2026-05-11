# 🐕 Tienda Perritos Backend

API REST backend para una tienda en línea de alimentos para perros. Construida con **Node.js**, **Express** y **MySQL**, completamente containerizada con **Docker**.

---

## 📋 Descripción del Proyecto

**Tienda Perritos** es una aplicación backend que gestiona un catálogo de productos de alimentos para perros. Proporciona endpoints REST para crear, leer, actualizar y eliminar productos, con precios y stock en tiempo real.

### Características Principales
- ✅ API REST completa (CRUD)
- ✅ Gestión de inventario (stock)
- ✅ Base de datos MySQL persistente
- ✅ Containerización con Docker
- ✅ Orquestación con Docker Compose
- ✅ Manejo de errores robusto
- ✅ Seguridad con CORS habilitado
- ✅ Pool de conexiones optimizado

---

## 🏗️ Arquitectura

```
┌─────────────────────────────────────────┐
│      Cliente (Frontend)                 │
└──────────────────┬──────────────────────┘
                   │ HTTP/REST
                   ▼
┌──────────────────────────────────────────┐
│      Backend (Node.js + Express)        │
│  Puerto: 3001                            │
└───────────────────┬──────────────────────┘
                    │ MySQL Driver
                    ▼
┌──────────────────────────────────────────┐
│      Base de Datos (MySQL 8)            │
│  Puerto: 3306                            │
│  Database: tienda_perritos               │
└──────────────────────────────────────────┘
```

---

## 📦 Stack Tecnológico

| Componente | Versión | Descripción |
|-----------|---------|------------|
| **Node.js** | 20-alpine | Runtime JavaScript |
| **Express** | ^4.19.0 | Framework web |
| **MySQL** | 8 | Base de datos relacional |
| **mysql2** | ^3.9.0 | Driver MySQL |
| **CORS** | ^2.8.5 | Middleware para CORS |

---

## 🚀 Instalación y Uso

### Requisitos
- Docker
- Docker Compose

### Opción 1: Con Docker Compose (Recomendado)

```bash
# Clona el repositorio
git clone <repo-url>
cd tienda-perritos-backend

# Inicia los servicios
docker-compose up --build

# Verificar que todo está corriendo
curl http://localhost:3001/api/health
```

### Opción 2: Ejecución Local (Sin Docker)

```bash
# Instalar dependencias
npm install

# Configurar variables de entorno
export DB_HOST=localhost
export DB_USER=root
export DB_PASSWORD=tu_contraseña
export DB_NAME=tienda_perritos
export DB_PORT=3306

# Iniciar servidor
npm start
```

---

## 🔌 Endpoints de la API

### 1. Obtener todos los productos
```http
GET /api/productos
```

**Respuesta (200 OK):**
```json
[
  {
    "id": 1,
    "nombre": "Alimento Cachorro Premium",
    "descripcion": "Sabor pollo, razas pequeñas",
    "precio": 19990,
    "stock": 15
  },
  {
    "id": 2,
    "nombre": "Alimento Adulto Light",
    "descripcion": "Control de peso, razas medianas",
    "precio": 17990,
    "stock": 8
  }
]
```

---

### 2. Obtener un producto específico
```http
GET /api/productos/:id
```

**Ejemplo:**
```http
GET /api/productos/1
```

**Respuesta (200 OK):**
```json
{
  "id": 1,
  "nombre": "Alimento Cachorro Premium",
  "descripcion": "Sabor pollo, razas pequeñas",
  "precio": 19990,
  "stock": 15
}
```

**Error (404 Not Found):**
```json
{
  "message": "Producto no encontrado."
}
```

---

### 3. Crear un nuevo producto
```http
POST /api/productos
Content-Type: application/json
```

**Body:**
```json
{
  "nombre": "Alimento Senior",
  "descripcion": "Para perros mayores",
  "precio": 21990,
  "stock": 10
}
```

**Respuesta (201 Created):**
```json
{
  "id": 4,
  "nombre": "Alimento Senior",
  "descripcion": "Para perros mayores",
  "precio": 21990,
  "stock": 10
}
```

**Error (400 Bad Request):**
```json
{
  "message": "Nombre, precio y stock son obligatorios."
}
```

---

### 4. Actualizar un producto
```http
PUT /api/productos/:id
Content-Type: application/json
```

**Ejemplo:**
```http
PUT /api/productos/1
```

**Body:**
```json
{
  "nombre": "Alimento Cachorro Premium Plus",
  "descripcion": "Sabor pollo, razas pequeñas - Mejorado",
  "precio": 22990,
  "stock": 20
}
```

**Respuesta (200 OK):**
```json
{
  "id": 1,
  "nombre": "Alimento Cachorro Premium Plus",
  "descripcion": "Sabor pollo, razas pequeñas - Mejorado",
  "precio": 22990,
  "stock": 20
}
```

---

### 5. Eliminar un producto
```http
DELETE /api/productos/:id
```

**Ejemplo:**
```http
DELETE /api/productos/1
```

**Respuesta (200 OK):**
```json
{
  "message": "Producto eliminado correctamente."
}
```

---

### 6. Verificar estado del servidor
```http
GET /api/health
```

**Respuesta (200 OK):**
```json
{
  "status": "ok",
  "message": "Backend de tienda de perritos en ejecución."
}
```

---

## 📁 Estructura del Proyecto

```
tienda-perritos-backend/
├── server.js                    # Aplicación principal Express
├── package.json                 # Dependencias y scripts
├── package-lock.json            # Lock de versiones
├── Dockerfile                   # Configuración Docker del backend
├── docker-compose.yml           # Orquestación de servicios
├── db/
│   ├── Dockerfile               # Configuración Docker de MySQL
│   └── init.sql                 # Script inicial de base de datos
├── .git/                        # Control de versiones
├── .github/                     # Configuración de GitHub
└── README.md                    # Este archivo
```

---

## 🗄️ Modelo de Base de Datos

### Tabla: `productos`

| Columna | Tipo | Restricción | Descripción |
|---------|------|------------|------------|
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único |
| `nombre` | VARCHAR(100) | NOT NULL | Nombre del producto |
| `descripcion` | VARCHAR(255) | NULL | Descripción opcional |
| `precio` | DECIMAL(10,2) | NOT NULL | Precio del producto |
| `stock` | INT | NOT NULL | Cantidad disponible |

### Datos Iniciales
La base de datos se inicializa automáticamente con 3 productos de ejemplo:
1. Alimento Cachorro Premium - $19.990
2. Alimento Adulto Light - $17.990
3. Snacks Dentales - $5.990

---

## 🐳 Docker

### Variables de Entorno

#### Backend
```env
DB_HOST=db              # Host de la base de datos (nombre del servicio)
DB_USER=root            # Usuario de MySQL
DB_PASSWORD=admin123    # Contraseña
DB_NAME=tienda_perritos # Nombre de la base de datos
DB_PORT=3306            # Puerto de MySQL
PORT=3001               # Puerto de Express (por defecto)
```

#### Base de Datos
```env
MYSQL_ROOT_PASSWORD=admin123    # Contraseña del root
MYSQL_DATABASE=tienda_perritos  # Base de datos inicial
```

### Dockerfile Backend
- Usa imagen `node:20-alpine` (ligera y segura)
- Ejecuta con usuario `node` (sin privilegios de root)
- Instala solo dependencias de producción
- Expone puerto 3001

### Dockerfile Base de Datos
- Usa imagen `mysql:8`
- Copia script `init.sql` para inicializar automáticamente

### Volúmenes
- `dbdata`: Volumen persistente para almacenar datos de MySQL

---

## 🔧 Configuración y Personalización

### Cambiar Puerto del Backend
En [docker-compose.yml](docker-compose.yml), modifica:
```yaml
services:
  backend:
    ports:
      - "3001:3001"  # Cambiar el primer número
```

### Cambiar Credenciales de Base de Datos
En [docker-compose.yml](docker-compose.yml):
```yaml
environment:
  - DB_PASSWORD=tu_contraseña_nueva
  - MYSQL_ROOT_PASSWORD=tu_contraseña_nueva
```

### Agregar Nuevos Productos Iniciales
En [db/init.sql](db/init.sql):
```sql
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Nombre', 'Descripción', precio, stock);
```

---

## 🚀 Comandos Útiles

```bash
# Iniciar servicios
docker-compose up

# Iniciar en segundo plano
docker-compose up -d

# Detener servicios
docker-compose down

# Reconstruir imágenes
docker-compose up --build

# Ver logs del backend
docker-compose logs backend

# Ver logs de la base de datos
docker-compose logs db

# Acceder a MySQL desde el contenedor
docker-compose exec db mysql -u root -padmin123 tienda_perritos

# Reiniciar un servicio específico
docker-compose restart backend
```

---

## 📝 Pruebas de API

### Con curl
```bash
# Obtener todos los productos
curl http://localhost:3001/api/productos

# Obtener un producto específico
curl http://localhost:3001/api/productos/1

# Crear un producto
curl -X POST http://localhost:3001/api/productos \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Nuevo Producto","precio":9990,"stock":5}'

# Actualizar un producto
curl -X PUT http://localhost:3001/api/productos/1 \
  -H "Content-Type: application/json" \
  -d '{"nombre":"Actualizado","descripcion":"Nueva desc","precio":25000,"stock":30}'

# Eliminar un producto
curl -X DELETE http://localhost:3001/api/productos/1

# Verificar estado
curl http://localhost:3001/api/health
```

### Con Postman
1. Importa los endpoints
2. Configura el host: `http://localhost:3001`
3. Establece headers: `Content-Type: application/json`
4. Prueba cada endpoint

### Con Thunder Client o REST Client
Usa los ejemplos de curl anteriores en la extensión de VS Code.

---

## 🔐 Seguridad

### Implementaciones
- ✅ CORS habilitado para aceptar requests desde cualquier origen
- ✅ SQL Injection previene con prepared statements (`?` placeholders)
- ✅ Validación de entrada en todos los endpoints
- ✅ Usuario sin privilegios en contenedor (`node` user)
- ✅ Pool de conexiones para evitar exhaustión de recursos
- ✅ Manejo de errores sin exponer detalles internos

### Recomendaciones para Producción
- Cambiar credenciales por defecto
- Usar variables de entorno desde `.env` (no en el código)
- Implementar autenticación/autorización
- Usar HTTPS en lugar de HTTP
- Configurar CORS restrictivamente (especificar orígenes)
- Validación más estricta de entrada
- Implementar rate limiting
- Usar secretos de Docker/Kubernetes

---

## 🐛 Troubleshooting

### "Cannot connect to database"
```bash
# Verificar que los servicios están corriendo
docker-compose ps

# Verificar logs de la base de datos
docker-compose logs db

# Reiniciar ambos servicios
docker-compose down
docker-compose up --build
```

### "Port 3001 already in use"
```bash
# Cambiar puerto en docker-compose.yml
ports:
  - "3002:3001"  # Usar 3002 en lugar de 3001
```

### "502 Bad Gateway" desde el frontend
- Verificar que CORS está habilitado
- Confirmar que el backend está en ejecución
- Revisar la URL base correcta del API

---

## 📚 Estructura del Código

### [server.js](server.js)
- Configuración de Express y middleware
- Inicialización del pool de conexiones MySQL
- Definición de 6 endpoints REST
- Manejo global de errores

### Middleware Utilizado
- `cors()`: Permite solicitudes desde cualquier origen
- `express.json()`: Parsea bodies JSON

### Patrones Utilizados
- Async/Await para operaciones asincrónicas
- Pool de conexiones para MySQL (optimizado)
- Prepared Statements para prevenir SQL Injection
- Try/Catch para manejo de errores

---

## 📈 Performance

### Optimizaciones Implementadas
- Pool de conexiones (10 conexiones máximo)
- Queries preparadas (no concatenación de strings)
- Selección solo de columnas necesarias
- Índice PRIMARY KEY en tabla `productos`
- Imagen Docker Alpine (ligera)

### Límites Actuales
- Máximo 10 conexiones simultáneas a BD
- 0 conexiones en cola (no espera)
- Sin paginación en listado de productos

### Mejoras Futuras
- Implementar paginación
- Agregar índices adicionales
- Implementar caché (Redis)
- Monitoreo y métricas
- Compresión GZIP

---

## 👨‍💻 Desarrollo

### Scripts NPM
```bash
npm start      # Inicia el servidor
npm test       # (No configurado, agregar)
npm run build  # (No configurado, agregar)
```

### Agregar Nuevos Endpoints
1. Crear función async en [server.js](server.js)
2. Usar `app.get()`, `app.post()`, `app.put()`, `app.delete()`
3. Validar input
4. Ejecutar query al pool
5. Manejar errores con `handleError()`

---

## 📄 Licencia

Este proyecto es parte del curso de DevOps en DUOC UC.

---

## 📞 Contacto y Soporte

Para reportar issues o sugerencias, contacta al equipo de desarrollo.

---

## 🔗 Enlaces Útiles

- [Documentación Express.js](https://expressjs.com/)
- [Documentación MySQL2](https://github.com/sidorares/node-mysql2)
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Reference](https://docs.docker.com/compose/compose-file/)

---

**Última actualización:** Mayo 2026  
**Estado:** ✅ Funcional
