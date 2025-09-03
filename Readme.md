# 🏍️ Sistema Experto de Diagnóstico de Motos - Backend

Este repositorio contiene el backend del **Sistema Experto de Diagnóstico de Motos**, implementado con **Java Spring Boot** y **PostgreSQL**.  
Se encarga de gestionar la lógica del sistema experto, incluyendo el almacenamiento de fallas, causas y soluciones, además de exponer una API REST para el frontend.

---

## 🚀 Tecnologías utilizadas
- [Java 17+](https://openjdk.org/) - Lenguaje principal
- [Spring Boot](https://spring.io/projects/spring-boot) - Framework backend
- [Spring Data JPA](https://spring.io/projects/spring-data-jpa) - Persistencia
- [PostgreSQL](https://www.postgresql.org/) - Base de datos relacional
- [Maven](https://maven.apache.org/) - Gestión de dependencias

---

## ⚙️ Instalación y ejecución

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/tu-usuario/sistema-experto-motos-backend.git
   cd sistema-experto-motos-backend

## Configurar la base de datos en src/main/resources/application.properties

spring.datasource.url=jdbc:postgresql://localhost:5432/sistema_experto
spring.datasource.username=postgres
spring.datasource.password=tu_password
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

## Compilar y ejecutar:
mvn spring-boot:run
El backend quedará disponible en: http://localhost:8080/

## Estructura principal del proyecto
src/

 └── main/
     
     ├── java/com/tuusuario/sistemaexperto/
     
     │   ├── controller/   # Controladores REST
     
     │   ├── model/        # Entidades (Falla, Causa, Solución)
     
     │   ├── repository/   # Repositorios JPA
     
     │   └── service/      # Lógica de negocio (motor de inferencia)
     
     └── resources/
     
         ├── application.properties # Configuración
     
         BD/
     
         ├── db.sql # Contiene la base de datos
     
         ├── deep.sql # Contiene datos iniciales de prueba ( opcional )
        
## ✨ Autor

### Proyecto desarrollado por:
### Anderson Rene Gomez Aza
### Ingeniero en sistemas
### Github: https://github.com/AndersonGomezAza
### LinkedIn: https://www.linkedin.com/in/anderson-aza