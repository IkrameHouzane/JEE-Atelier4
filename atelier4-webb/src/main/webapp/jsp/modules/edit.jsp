<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un Module</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>Modifier un Module</h1>
        <a href="${pageContext.request.contextPath}/modules" class="btn btn-secondary">
            Retour à la liste
        </a>
    </header>

    <form action="${pageContext.request.contextPath}/modules" method="post" class="form-card">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${module.idModule}">

        <div class="form-group">
            <label for="nomModule">Nom du Module:</label>
            <input type="text" id="nomModule" name="nomModule" class="form-control"
                   value="${module.nomModule}" required>
        </div>

        <div class="form-group">
            <label for="codeModule">Code du Module:</label>
            <input type="text" id="codeModule" name="codeModule" class="form-control"
                   value="${module.codeModule}" required>
        </div>

        <div class="form-group">
            <label for="coefficient">Coefficient:</label>
            <input type="number" id="coefficient" name="coefficient" class="form-control"
                   value="${module.coefficient}" min="0" step="0.01" required>
        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" class="form-control" rows="3">${module.description}</textarea>
        </div>

        <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
    </form>
</div>
</body>
</html>