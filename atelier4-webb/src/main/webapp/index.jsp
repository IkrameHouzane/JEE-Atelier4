<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Étudiants - Accueil</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>🏫 Système de Gestion des Étudiants</h1>
        <p>Application distribuée JEE avec EJB</p>
    </header>

    <main class="main-content">
        <div class="dashboard-cards">
            <div class="card">
                <div class="card-icon">👨‍🎓</div>
                <h3>Gestion des Étudiants</h3>
                <p>Ajouter, modifier et supprimer des étudiants</p>
                <a href="${pageContext.request.contextPath}/etudiants" class="btn btn-primary">
                    Gérer les étudiants
                </a>
            </div>

            <div class="card">
                <div class="card-icon">📚</div>
                <h3>Gestion des Modules</h3>
                <p>Gérer les modules et matières</p>
                <a href="${pageContext.request.contextPath}/modules" class="btn btn-primary">
                    Gérer les modules
                </a>
            </div>

            <div class="card">
                <div class="card-icon">📊</div>
                <h3>Gestion des Notes</h3>
                <p>Attribuer et consulter les notes</p>
                <a href="${pageContext.request.contextPath}/notes" class="btn btn-primary">
                    Gérer les notes
                </a>
            </div>
        </div>

        <div class="stats-section">
            <div class="stat-card">
                <h4>Architecture</h4>
                <ul>
                    <li>✅ Frontend: Servlets + JSP</li>
                    <li>✅ Backend: EJB 3 + JPA</li>
                    <li>✅ Base de données: MySQL</li>
                    <li>✅ Serveur: WildFly</li>
                </ul>
            </div>
        </div>
    </main>

    <footer class="footer">
        <p>&copy; 2024 - Application Distribuée JEE - Atelier 4</p>
    </footer>
</div>
</body>
</html>