<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un Module</title>
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
        <h1 class="display-4">✏️ Modifier un Module</h1>
    </header>

    <div class="form-card">
        <form action="${pageContext.request.contextPath}/modules" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${module.idModule}">

            <div class="mb-3">
                <label for="nomModule" class="form-label">Nom du Module:</label>
                <input type="text" id="nomModule" name="nomModule" class="form-control"
                       value="${module.nomModule}" required>
            </div>

            <div class="mb-3">
                <label for="codeModule" class="form-label">Code du Module:</label>
                <input type="text" id="codeModule" name="codeModule" class="form-control"
                       value="${module.codeModule}" required>
            </div>

            <div class="mb-3">
                <label for="coefficient" class="form-label">Coefficient:</label>
                <input type="number" id="coefficient" name="coefficient" class="form-control"
                       value="${module.coefficient}" min="0" step="0.01" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description:</label>
                <textarea id="description" name="description" class="form-control" rows="3">${module.description}</textarea>
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="submit" class="btn btn-success">✅ Enregistrer les modifications</button>
                <a href="${pageContext.request.contextPath}/modules" class="btn btn-secondary">❌ Annuler</a>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>