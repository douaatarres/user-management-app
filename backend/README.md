# User Management Backend - Spring Boot

## Description
Backend API pour la gestion des utilisateurs développé avec Spring Boot et MySQL.

## Prérequis
- Java 17 ou supérieur
- Maven 3.6 ou supérieur
- MySQL 8.0 ou supérieur

## Installation

### 1. Créer la base de données MySQL
```bash
mysql -u root -p
CREATE DATABASE user_management_db;
```

### 2. Configurer la base de données
Modifiez le fichier `src/main/resources/application.properties` avec vos identifiants MySQL :
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/user_management_db
spring.datasource.username=root
spring.datasource.password=votre_mot_de_passe
```

### 3. Compiler et lancer l'application
```bash
mvn clean install
mvn spring-boot:run
```

L'application sera accessible à `http://localhost:8080/api`

## Endpoints API

### Obtenir tous les utilisateurs
```
GET /api/users
```

### Créer un nouvel utilisateur
```
POST /api/users
Content-Type: application/json

{
  "username": "john_doe",
  "email": "john@example.com",
  "password": "password123"
}
```

### Obtenir un utilisateur par ID
```
GET /api/users/{id}
```

### Mettre à jour un utilisateur
```
PUT /api/users/{id}
Content-Type: application/json

{
  "username": "john_updated",
  "email": "john.updated@example.com",
  "password": "newpassword123"
}
```

### Supprimer un utilisateur
```
DELETE /api/users/{id}
```

## Structure du projet
```
backend/
├── src/
│   ├── main/
│   │   ├── java/com/example/usermanagement/
│   │   │   ├── UserManagementApplication.java
│   │   │   ├── controller/
│   │   │   │   └── UserController.java
│   │   │   ├── model/
│   │   │   │   └── User.java
│   │   │   ├── repository/
│   │   │   │   └── UserRepository.java
│   │   │   └── service/
│   │   │       └── UserService.java
│   │   └── resources/
│   │       └── application.properties
│   └── test/
└── pom.xml
```

## Notes
- Le mot de passe est stocké en texte brut pour cet exemple. En production, utilisez bcrypt ou un autre algorithme de hachage.
- CORS est configuré pour permettre l'accès depuis `http://localhost:3000` (frontend React).
