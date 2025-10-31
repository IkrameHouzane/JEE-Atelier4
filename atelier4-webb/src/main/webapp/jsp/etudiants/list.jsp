<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Étudiants</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>👨‍🎓 Liste des Étudiants</h1>
        <a href="${pageContext.request.contextPath}/etudiants?action=new" class="btn btn-success">
            ➕ Ajouter un étudiant
        </a>
        <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">
            🏠 Accueil
        </a>
    </header>

    <c:if test="${not empty etudiants}">
        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>CNE</th>
                    <th>Adresse</th>
                    <th>Niveau</th>
                    <th>Actions</th>
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
                               class="btn btn-warning btn-sm">✏️</a>
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
        <div class="empty-state">
            <p>📝 Aucun étudiant enregistré pour le moment.</p>
            <a href="${pageContext.request.contextPath}/etudiants?action=new" class="btn btn-primary">
                Ajouter le premier étudiant
            </a>
        </div>
    </c:if>
</div>
</body>
</html>
