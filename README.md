# Module EJB: atelier4-ejb

Ce module `atelier4-ejb` fait partie d'une application Java Enterprise Edition (JEE) plus large. Il est responsable de la logique métier et de la persistance des données pour la gestion des étudiants, des modules et des notes.

## Fonctionnalités du Module EJB

*   **Gestion des Entités:** Définit les entités JPA pour `Etudiant`, `Module` et `Suivie`.
*   **Services Métier (EJBs):** Fournit les interfaces et implémentations des services pour les opérations CRUD (Create, Read, Update, Delete) et d'autres logiques métier liées aux étudiants, modules et notes.
*   **Persistance:** Gère l'interaction avec la base de données via JPA/Hibernate.

## Technologies Clés

*   **Java:** Version 17+
*   **Jakarta EE:** Version 9.1+
*   **EJB (Enterprise JavaBeans):** Session Beans (Stateless) pour les services métier.
*   **JPA (Jakarta Persistence API) / Hibernate:** Pour la couche de persistance.
*   **Maven:** Pour la gestion de projet et la construction du module.
*   **Lombok:** Pour réduire le code boilerplate des entités.

## Structure du Module

*   `src/main/java/ma/fstt/entities`: Contient les classes d'entité JPA (`Etudiant`, `Module`, `Suivie`).
*   `src/main/java/ma/fstt/services`: Contient les interfaces `Remote` des services EJB.
*   `src/main/java/ma/fstt/serviceImpl`: Contient les implémentations des services EJB.
*   `src/main/resources/META-INF/persistence.xml`: Fichier de configuration de la persistance JPA.

## Construction du Module

Pour construire ce module EJB et générer le fichier `atelier4-ejb.jar`, naviguez vers le répertoire du module et exécutez la commande Maven:

```bash
cd C:\Users\DELL\IdeaProjects\atelier4-ejb
mvn clean install
```

Ce `.jar` sera ensuite inclus dans le `atelier4-webb.war` pour le déploiement final.

## Modifications Clés Apportées (par l'agent)

Les modifications suivantes ont été effectuées dans ce module pour résoudre les problèmes de déploiement et de persistance:

*   **`pom.xml`**:
    *   Le `packaging` a été changé de `ejb` à `jar` pour assurer une construction correcte du module EJB.
*   **`src/main/resources/META-INF/persistence.xml`**:
    *   Le fichier a été mis à jour pour inclure explicitement les classes d'entité (`Etudiant`, `Module`, `Suivie`) via des balises `<class>`, garantissant ainsi que Hibernate les reconnaisse et résolvant l'erreur `UnknownEntityException`.
