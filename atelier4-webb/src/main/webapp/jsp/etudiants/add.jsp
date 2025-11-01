<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Étudiant</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
        <h1 class="display-4">👨‍🎓 Ajouter un Étudiant</h1>
    </header>

    <div class="form-card">
        <form action="${pageContext.request.contextPath}/etudiants" method="post">
            <input type="hidden" name="action" value="create">

            <div class="mb-3">
                <label for="nom" class="form-label">Nom *</label>
                <input type="text" id="nom" name="nom" required class="form-control">
            </div>

            <div class="mb-3">
                <label for="prenom" class="form-label">Prénom *</label>
                <input type="text" id="prenom" name="prenom" required class="form-control">
            </div>

            <div class="mb-3">
                <label for="cne" class="form-label">CNE *</label>
                <input type="text" id="cne" name="cne" required class="form-control">
            </div>

            <div class="mb-3">
                <label for="adresse" class="form-label">Adresse</label>
                <textarea id="adresse" name="adresse" class="form-control" rows="3"></textarea>
            </div>

            <div class="mb-3">
                <label for="niveau" class="form-label">Niveau</label>
                <input type="text" id="niveau" name="niveau" class="form-control">
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="submit" class="btn btn-success">✅ Enregistrer</button>
                <a href="${pageContext.request.contextPath}/etudiants" class="btn btn-secondary">❌ Annuler</a>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>