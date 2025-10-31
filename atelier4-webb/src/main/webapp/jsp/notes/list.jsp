<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Notes</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>📊 Liste des Notes</h1>
        <a href="${pageContext.request.contextPath}/notes?action=new" class="btn btn-success">
            ➕ Ajouter une note
        </a>
        <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">
            🏠 Accueil
        </a>
    </header>

    <c:if test="${not empty notes}">
        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Étudiant</th>
                    <th>Module</th>
                    <th>Note</th>
                    <th>Date d'examen</th>
                    <th>Actions</th>
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
                               class="btn btn-warning btn-sm">✏️</a>
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
        <div class="empty-state">
            <p>📝 Aucune note enregistrée pour le moment.</p>
            <a href="${pageContext.request.contextPath}/notes?action=new" class="btn btn-primary">
                Ajouter la première note
            </a>
        </div>
    </c:if>
</div>
</body>
</html>
