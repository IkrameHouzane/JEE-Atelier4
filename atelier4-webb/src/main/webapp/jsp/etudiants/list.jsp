<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Étudiants</title>
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
        <h1 class="display-4">👨‍🎓 Liste des Étudiants</h1>
        <a href="${pageContext.request.contextPath}/etudiants?action=new" class="btn btn-success mb-3">
            ➕ Ajouter un étudiant
        </a>
    </header>

    <c:if test="${not empty etudiants}">
        <div class="table-responsive rounded shadow-sm mb-4">
            <table class="table table-hover table-striped align-middle">
                <thead class="table-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Prénom</th>
                    <th scope="col">CNE</th>
                    <th scope="col">Adresse</th>
                    <th scope="col">Niveau</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="etudiant" items="${etudiants}">
                    <tr>
                        <td>${etudiant.idEtudiant}</td>
                        <td>${etudiant.nom}</td>
                        <td>${etudiant.prenom}</td>
                        <td>${etudiant.cne}</td>
                        <td>${etudiant.adresse}</td>
                        <td>${etudiant.niveau}</td>
                        <td class="actions">
                            <a href="${pageContext.request.contextPath}/etudiants?action=edit&id=${etudiant.idEtudiant}"
                               class="btn btn-warning btn-sm me-1">✏️</a>
                            <a href="${pageContext.request.contextPath}/etudiants?action=delete&id=${etudiant.idEtudiant}"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet étudiant ?')">🗑️</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <c:if test="${empty etudiants}">
        <div class="empty-state alert alert-info text-center" role="alert">
            <p class="mb-3">📝 Aucun étudiant enregistré pour le moment.</p>
            <a href="${pageContext.request.contextPath}/etudiants?action=new" class="btn btn-primary">
                Ajouter le premier étudiant
            </a>
        </div>
    </c:if>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
