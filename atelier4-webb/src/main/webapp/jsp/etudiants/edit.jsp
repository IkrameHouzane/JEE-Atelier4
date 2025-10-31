<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un Étudiant</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>👨‍🎓 Modifier un Étudiant</h1>
        <a href="${pageContext.request.contextPath}/etudiants" class="btn btn-secondary">
            ↩️ Retour
        </a>
    </header>

    <div class="form-container">
        <form action="${pageContext.request.contextPath}/etudiants" method="post" class="form">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${etudiant.idEtudiant}">

            <div class="form-group">
                <label for="nom">Nom *</label>
                <input type="text" id="nom" name="nom" required class="form-control" value="${etudiant.nom}">
            </div>

            <div class="form-group">
                <label for="prenom">Prénom *</label>
                <input type="text" id="prenom" name="prenom" required class="form-control" value="${etudiant.prenom}">
            </div>

            <div class="form-group">
                <label for="cne">CNE *</label>
                <input type="text" id="cne" name="cne" required class="form-control" value="${etudiant.cne}">
            </div>

            <div class="form-group">
                <label for="adresse">Adresse</label>
                <textarea id="adresse" name="adresse" class="form-control" rows="3">${etudiant.adresse}</textarea>
            </div>

            <div class="form-group">
                <label for="niveau">Niveau</label>
                <input type="text" id="niveau" name="niveau" class="form-control" value="${etudiant.niveau}">
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-success">✅ Modifier</button>
                <a href="${pageContext.request.contextPath}/etudiants" class="btn btn-secondary">❌ Annuler</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>