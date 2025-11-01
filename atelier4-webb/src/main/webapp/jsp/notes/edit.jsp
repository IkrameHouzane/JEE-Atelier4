<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier une Note</title>
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
        <h1 class="display-4">✏️ Modifier une Note</h1>
    </header>

    <div class="form-card">
        <form action="${pageContext.request.contextPath}/notes" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${note.idSuivie}">

            <div class="mb-3">
                <label for="etudiant" class="form-label">Étudiant:</label>
                <select id="etudiant" name="etudiantId" class="form-select" required>
                    <c:forEach var="etudiant" items="${etudiants}">
                        <option value="${etudiant.idEtudiant}" ${note.etudiant.idEtudiant == etudiant.idEtudiant ? 'selected' : ''}>
                                ${etudiant.nom} ${etudiant.prenom}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label for="module" class="form-label">Module:</label>
                <select id="module" name="moduleId" class="form-select" required>
                    <c:forEach var="module" items="${modules}">
                        <option value="${module.idModule}" ${note.module.idModule == module.idModule ? 'selected' : ''}>
                                ${module.nomModule}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label for="noteValue" class="form-label">Note:</label>
                <input type="number" id="noteValue" name="note" class="form-control"
                       value="${note.note}" min="0" max="20" step="0.01" required>
            </div>

            <div class="mb-3">
                <label for="dateExamen" class="form-label">Date d'examen:</label>
                <input type="date" id="dateExamen" name="dateExamen" class="form-control"
                       value="<fmt:formatDate value="${note.dateExamen}" pattern="yyyy-MM-dd" />" required>
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="submit" class="btn btn-success">✅ Enregistrer les modifications</button>
                <a href="${pageContext.request.contextPath}/notes" class="btn btn-secondary">❌ Annuler</a>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>