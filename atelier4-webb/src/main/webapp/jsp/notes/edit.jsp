<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier une Note</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>Modifier une Note</h1>
        <a href="${pageContext.request.contextPath}/notes" class="btn btn-secondary">
            Retour à la liste
        </a>
    </header>

    <form action="${pageContext.request.contextPath}/notes" method="post" class="form-card">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${note.idSuivie}">

        <div class="form-group">
            <label for="etudiant">Étudiant:</label>
            <select id="etudiant" name="etudiantId" class="form-control" required>
                <c:forEach var="etudiant" items="${etudiants}">
                    <option value="${etudiant.idEtudiant}" ${note.etudiant.idEtudiant == etudiant.idEtudiant ? 'selected' : ''}>
                            ${etudiant.nom} ${etudiant.prenom}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="module">Module:</label>
            <select id="module" name="moduleId" class="form-control" required>
                <c:forEach var="module" items="${modules}">
                    <option value="${module.idModule}" ${note.module.idModule == module.idModule ? 'selected' : ''}>
                            ${module.nomModule}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="noteValue">Note:</label>
            <input type="number" id="noteValue" name="note" class="form-control"
                   value="${note.note}" min="0" max="20" step="0.01" required>
        </div>

        <div class="form-group">
            <label for="dateExamen">Date d'examen:</label>
            <input type="date" id="dateExamen" name="dateExamen" class="form-control"
                   value="${note.dateExamen}" required>
        </div>

        <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
    </form>
</div>
</body>
</html>