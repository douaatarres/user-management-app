# User Management Application

Une application complète de gestion d'utilisateurs développée avec **React**, **Spring Boot** et **MySQL**. Cette application permet aux administrateurs de gérer les utilisateurs via un tableau de bord intuitif.

## 📋 Table des matières

- [Fonctionnalités](#fonctionnalités)
- [Architecture](#architecture)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Structure du projet](#structure-du-projet)
- [API Endpoints](#api-endpoints)
- [Technologies utilisées](#technologies-utilisées)

## ✨ Fonctionnalités

- **Dashboard Admin** : Interface intuitive pour gérer les utilisateurs
- **Ajouter des utilisateurs** : Formulaire pour créer de nouveaux utilisateurs
- **Voir la liste des utilisateurs** : Affichage de tous les utilisateurs en tableau
- **Supprimer des utilisateurs** : Suppression sécurisée avec confirmation
- **Statistiques** : Affichage du nombre total d'utilisateurs
- **Responsive Design** : Interface adaptée à tous les appareils

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    Frontend (React)                      │
│              Dashboard Admin avec UI moderne             │
└──────────────────────┬──────────────────────────────────┘
                       │ HTTP/REST API
                       ↓
┌─────────────────────────────────────────────────────────┐
│                 Backend (Spring Boot)                    │
│         Controllers, Services, Repositories              │
└──────────────────────┬──────────────────────────────────┘
                       │ JDBC
                       ↓
┌─────────────────────────────────────────────────────────┐
│                 Database (MySQL)                         │
│              Tables, Indexes, Constraints                │
└─────────────────────────────────────────────────────────┘
```

## 📦 Prérequis

### Frontend
- Node.js 18+ et npm/pnpm
- React 19
- Tailwind CSS 4

### Backend
- Java 17+
- Maven 3.6+
- Spring Boot 3.2.0

### Base de données
- MySQL 8.0+

## 🚀 Installation

### 1. Cloner le projet

```bash
git clone <repository-url>
cd user-management-app
```

### 2. Configuration de la base de données

#### Option A : Avec Docker Compose (Recommandé)

```bash
docker-compose up -d
```

Cela lancera automatiquement :
- MySQL avec la base de données pré-configurée
- Backend Spring Boot
- Frontend React

#### Option B : Installation manuelle

**Créer la base de données MySQL :**

```bash
mysql -u root -p
CREATE DATABASE user_management_db;
USE user_management_db;
SOURCE database/setup.sql;
```

**Configurer le backend :**

Modifiez `backend/src/main/resources/application.properties` :

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/user_management_db
spring.datasource.username=root
spring.datasource.password=votre_mot_de_passe
```

### 3. Lancer le backend

```bash
cd backend
mvn clean install
mvn spring-boot:run
```

Le backend sera accessible à `http://localhost:8080/api`

### 4. Lancer le frontend

```bash
cd frontend
pnpm install
pnpm dev
```

Le frontend sera accessible à `http://localhost:3000`

## 💻 Utilisation

1. **Ouvrir le dashboard** : Accédez à `http://localhost:3000`
2. **Ajouter un utilisateur** : Cliquez sur le bouton "Ajouter un utilisateur"
3. **Remplir le formulaire** : Entrez le nom d'utilisateur, email et mot de passe
4. **Valider** : Cliquez sur "Créer"
5. **Voir la liste** : Les utilisateurs s'affichent automatiquement dans le tableau
6. **Supprimer** : Cliquez sur l'icône de corbeille pour supprimer un utilisateur

## 📁 Structure du projet

```
user-management-app/
├── frontend/                          # Application React
│   ├── client/
│   │   ├── public/                   # Assets statiques
│   │   ├── src/
│   │   │   ├── components/           # Composants réutilisables
│   │   │   │   ├── AddUserDialog.tsx
│   │   │   │   └── UserTable.tsx
│   │   │   ├── pages/                # Pages de l'application
│   │   │   │   └── Dashboard.tsx
│   │   │   ├── lib/
│   │   │   │   └── api.ts            # Client API
│   │   │   ├── App.tsx               # Composant racine
│   │   │   └── index.css             # Styles globaux
│   │   └── index.html
│   ├── package.json
│   └── vite.config.ts
│
├── backend/                           # Application Spring Boot
│   ├── src/main/java/com/example/usermanagement/
│   │   ├── UserManagementApplication.java
│   │   ├── controller/
│   │   │   └── UserController.java
│   │   ├── model/
│   │   │   └── User.java
│   │   ├── repository/
│   │   │   └── UserRepository.java
│   │   └── service/
│   │       └── UserService.java
│   ├── src/main/resources/
│   │   └── application.properties
│   ├── pom.xml
│   ├── Dockerfile
│   └── README.md
│
├── database/
│   └── setup.sql                     # Script d'initialisation MySQL
│
├── docker-compose.yml                # Configuration Docker
└── README.md                          # Ce fichier
```

## 🔌 API Endpoints

### Utilisateurs

| Méthode | Endpoint | Description |
|---------|----------|-------------|
| GET | `/api/users` | Obtenir tous les utilisateurs |
| POST | `/api/users` | Créer un nouvel utilisateur |
| GET | `/api/users/{id}` | Obtenir un utilisateur par ID |
| PUT | `/api/users/{id}` | Mettre à jour un utilisateur |
| DELETE | `/api/users/{id}` | Supprimer un utilisateur |

### Exemple de requête POST

```bash
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{
    "username": "john_doe",
    "email": "john@example.com",
    "password": "password123"
  }'
```

## 🛠️ Technologies utilisées

### Frontend
- **React 19** : Framework UI
- **TypeScript** : Typage statique
- **Tailwind CSS 4** : Styles utilitaires
- **shadcn/ui** : Composants UI pré-construits
- **Axios** : Client HTTP
- **Sonner** : Notifications toast
- **Lucide React** : Icônes

### Backend
- **Spring Boot 3.2** : Framework web
- **Spring Data JPA** : ORM
- **MySQL Connector** : Driver MySQL
- **Maven** : Gestion des dépendances

### DevOps
- **Docker** : Containerization
- **Docker Compose** : Orchestration multi-conteneurs

## 📝 Notes importantes

### Sécurité
- Les mots de passe sont actuellement stockés en texte brut. En production, utilisez **bcrypt** ou un algorithme de hachage sécurisé.
- Implémentez l'authentification et l'autorisation pour protéger les endpoints.
- Utilisez HTTPS en production.

### Performance
- Ajoutez de la pagination pour les listes d'utilisateurs volumineuses.
- Implémentez un système de cache (Redis).
- Optimisez les requêtes de base de données avec des indexes.

### Améliorations futures
- Authentification et autorisation (JWT, OAuth)
- Édition des utilisateurs existants
- Recherche et filtrage avancés
- Pagination et tri
- Validation côté serveur renforcée
- Tests unitaires et d'intégration
- Logging et monitoring

## 📄 Licence

Ce projet est sous licence MIT.

## 📧 Support

Pour toute question ou problème, veuillez ouvrir une issue sur le repository.

---

**Développé avec ❤️ pour la gestion efficace des utilisateurs**
