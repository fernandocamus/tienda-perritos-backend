# 🐾 Tienda Perritos - Backend API

Repositorio para la gestión del servicio de Backend de la empresa **Innovatech Chile**, desarrollado para la Evaluación Parcial N°2 de *Introducción a Herramientas DevOps* en **Duoc UC**.

## 📋 Descripción del Proyecto
Este microservicio centraliza la lógica de negocio y la persistencia de datos de la Tienda de Perritos. Utiliza una arquitectura de microservicios diseñada para ser desplegada de forma automatizada en infraestructuras de nube (AWS).

## 🛠️ Stack Tecnológico
* **Lenguaje/Framework:** Node.js / Express
* **Base de Datos:** MySQL 8
* **Contenedores:** Docker & Docker Compose
* **CI/CD:** GitHub Actions
* **Cloud:** Amazon Web Services (EC2, ECR, VPC)

## 📦 Contenerización (IE1 e IE2)
Se ha implementado una estrategia de contenerización profesional bajo los siguientes estándares:

*   **Imagen Optimizada (IE1):** Se utiliza una imagen base de **Node Alpine**, lo que garantiza un entorno de ejecución ligero y reduce la superficie de ataque.
*   **Seguridad (IE1):** El proceso del contenedor se ejecuta bajo un **usuario no-root** (`node`), cumpliendo con el principio de mínimo privilegio exigido en la pauta de evaluación.
*   **Orquestación (IE2):** El archivo `docker-compose.yml` automatiza el levantamiento de la API y la base de datos, configurando redes internas para una comunicación segura.

## 💾 Persistencia de Datos (IE3)
Para asegurar la continuidad operativa de Innovatech Chile, se han implementado **Named Volumes**:
*   **Volumen:** `dbdata` mapeado a `/var/lib/mysql`.
*   **Justificación:** Se optó por volúmenes nombrados para garantizar que la información crítica de la tienda no se pierda ante reinicios o actualizaciones del contenedor de base de datos.

## 🔄 Pipeline CI/CD (IE4 e IE7)
El flujo de Integración y Despliegue Continuo se activa automáticamente mediante **GitHub Actions** al realizar un push a la rama `deploy`:
1.  **Build & Push:** Construcción de la imagen Docker y publicación en el registro privado **Amazon ECR**.
2.  **Deploy (CD):** Actualización automática en la instancia EC2 mediante SSH, asegurando que la última versión esté disponible sin intervención manual.
3.  **Seguridad:** Uso riguroso de **GitHub Secrets** para proteger credenciales de AWS y llaves privadas.

---

## 🚀 Cómo ejecutar el proyecto
### Requisitos previos
*   Docker y Docker Compose instalados.
*   Credenciales de AWS configuradas en GitHub Secrets.

### Ejecución Local
1. Clonar el repositorio.
2. Levantar el stack:
   ```bash
   docker compose up -d --build