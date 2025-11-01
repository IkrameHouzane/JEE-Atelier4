<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Étudiants - Accueil</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- Custom CSS (after Bootstrap to override if needed) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">🏫 Gestion des Étudiants</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/etudiants">Étudiants</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/modules">Modules</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/notes">Notes</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <header class="text-center mb-4">
        <h1 class="display-4">Bienvenue au Système de Gestion des Étudiants</h1>
        <p class="lead">Application distribuée JEE avec EJB</p>
    </header>

    <main class="main-content">
        <div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
            <div class="col">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <div class="card-icon mb-3 fs-1">👨‍🎓</div>
                        <h3 class="card-title">Gestion des Étudiants</h3>
                        <p class="card-text">Ajouter, modifier et supprimer des étudiants</p>
                        <a href="${pageContext.request.contextPath}/etudiants" class="btn btn-primary mt-3">
                            Gérer les étudiants
                        </a>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <div class="card-icon mb-3 fs-1">📚</div>
                        <h3 class="card-title">Gestion des Modules</h3>
                        <p class="card-text">Gérer les modules et matières</p>
                        <a href="${pageContext.request.contextPath}/modules" class="btn btn-primary mt-3">
                            Gérer les modules
                        </a>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <div class="card-icon mb-3 fs-1">📊</div>
                        <h3 class="card-title">Gestion des Notes</h3>
                        <p class="card-text">Attribuer et consulter les notes</p>
                        <a href="${pageContext.request.contextPath}/notes" class="btn btn-primary mt-3">
                            Gérer les notes
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="footer mt-auto py-3 bg-light text-center">
        <div class="container">
            <p class="text-muted">&copy; 2025 - Application Distribuée JEE - Atelier 4</p>
        </div>
    </footer>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>