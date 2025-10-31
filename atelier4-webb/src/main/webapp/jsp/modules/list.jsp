<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Modules</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>📚 Liste des Modules</h1>
        <a href="${pageContext.request.contextPath}/modules?action=new" class="btn btn-success">
            ➕ Ajouter un module
        </a>
        <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">
            🏠 Accueil
        </a>
    </header>

    <c:if test="${not empty modules}">
        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Code</th>
                    <th>Coefficient</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="module" items="${modules}">
                    <tr>
                        <td>${module.idModule}</td>
                        <td>${module.nomModule}</td>
                        <td>${module.codeModule}</td>
                        <td>${module.coefficient}</td>
                        <td>${module.description}</td>
                        <td class="actions">
                            <a href="${pageContext.request.contextPath}/modules?action=edit&id=${module.idModule}"
                               class="btn btn-warning btn-sm">✏️</a>
                            <a href="${pageContext.request.contextPath}/modules?action=delete&id=${module.idModule}"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce module ?')">🗑️</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <c:if test="${empty modules}">
        <div class="empty-state">
            <p>📝 Aucun module enregistré pour le moment.</p>
            <a href="${pageContext.request.contextPath}/modules?action=new" class="btn btn-primary">
                Ajouter le premier module
            </a>
        </div>
    </c:if>
</div>
</body>
</html>