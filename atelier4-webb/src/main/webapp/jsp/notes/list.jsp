<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Notes</title>
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
        <h1 class="display-4">📊 Liste des Notes</h1>
        <a href="${pageContext.request.contextPath}/notes?action=new" class="btn btn-success mb-3">
            ➕ Ajouter une note
        </a>
    </header>

    <c:if test="${not empty notes}">
        <div class="table-responsive rounded shadow-sm mb-4">
            <table class="table table-hover table-striped align-middle">
                <thead class="table-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Étudiant</th>
                    <th scope="col">Module</th>
                    <th scope="col">Note</th>
                    <th scope="col">Date d'examen</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="note" items="${notes}">
                    <tr>
                        <td>${note.idSuivie}</td>
                        <td>${note.etudiant.nom} ${note.etudiant.prenom}</td>
                        <td>${note.module.nomModule}</td>
                        <td>
                                    <span class="note-badge ${note.note >= 10 ? 'note-success' : 'note-danger'}">
                                        ${note.note}/20
                                    </span>
                        </td>
                        <td>${note.dateExamen}</td>
                        <td class="actions">
                            <a href="${pageContext.request.contextPath}/notes?action=edit&id=${note.idSuivie}"
                               class="btn btn-warning btn-sm me-1">✏️</a>
                            <a href="${pageContext.request.contextPath}/notes?action=delete&id=${note.idSuivie}"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette note ?')">🗑️</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <c:if test="${empty notes}">
        <div class="empty-state alert alert-info text-center" role="alert">
            <p class="mb-3">📝 Aucune note enregistrée pour le moment.</p>
            <a href="${pageContext.request.contextPath}/notes?action=new" class="btn btn-primary">
                Ajouter la première note
            </a>
        </div>
    </c:if>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
