# 🐾 Tienda Perritos - Backend API

Repositorio para la gestión de servicio de Backend, desarrollado para la Evaluación Parcial N°2 de Introducción a Herramientas DevOps.

## 📋 Descripción del Proyecto
Este microservicio se encarga de la lógica de negocio y la conexión con la base de datos de la Tienda de Perritos. Está diseñado bajo una arquitectura de microservicios contenerizados y automatizados mediante prácticas DevOps.

## 🛠️ Stack Tecnológico
* **Lenguaje/Framework:** NestJS / Node.js
* **Base de Datos:** MySQL 8
* **Contenedores:** Docker & Docker Compose
* **CI/CD:** GitHub Actions
* **Cloud:** Amazon Web Services (EC2, ECR, VPC)

## 📦 Contenerización (IE1 e IE2)
Se ha implementado una estrategia de contenedorización profesional que asegura la eficiencia y seguridad del despliegue:

*   **Dockerfile Multi-Stage:** Se utiliza un diseño de etapas múltiples para separar la compilación del entorno de ejecución, reduciendo el peso de la imagen final.
*   **Seguridad:** El proceso corre bajo un usuario no-root (`node`) para mitigar riesgos de seguridad dentro del contenedor.
*   **Orquestación:** El archivo `docker-compose.yml` gestiona la relación entre la API y la base de datos, configurando redes internas para la comunicación privada de servicio.

## 💾 Persistencia de Datos (IE3)
Para cumplir con los requerimientos de Innovatech Chile, se han configurado **Named Volumes** en Docker:
*   **Volumen:** `dbdata` mapeado a `/var/lib/mysql`.
*   **Justificación:** Se utiliza un volumen nombrado para garantizar la persistencia de los datos críticos de la tienda ante reinicios, fallos o actualizaciones de los contenedores, asegurando la continuidad operativa.

## 🔄 Pipeline CI/CD (IE4 e IE7)
El flujo de Integración y Despliegue Continuo se activa automáticamente mediante **GitHub Actions** al realizar un push a la rama `deploy`:
1.  **Build & Push:** Construcción de la imagen y publicación en **Amazon ECR**.
2.  **Deploy:** Conexión vía SSH a la instancia privada (mediante Bastion Host) para actualizar el stack con la nueva versión de la imagen.
3.  **Secrets:** Uso de GitHub Secrets para la gestión segura de credenciales de AWS y llaves de acceso.

---

## 🚀 Cómo ejecutar el proyecto
### Requisitos previos
*   Docker y Docker Compose instalados.
*   Credenciales de AWS configuradas (para despliegue).

### Ejecución Local
1. Clonar el repositorio.
2. Ejecutar el stack:
   ```bash
   docker compose up -d