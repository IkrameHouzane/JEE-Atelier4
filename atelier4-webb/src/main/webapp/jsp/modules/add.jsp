<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Module</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>📚 Ajouter un Module</h1>
        <a href="${pageContext.request.contextPath}/modules" class="btn btn-secondary">
            ↩️ Retour
        </a>
    </header>

    <div class="form-container">
        <form action="${pageContext.request.contextPath}/modules" method="post" class="form">
            <input type="hidden" name="action" value="create">

            <div class="form-group">
                <label for="nomModule">Nom du Module *</label>
                <input type="text" id="nomModule" name="nomModule" required class="form-control">
            </div>

            <div class="form-group">
                <label for="codeModule">Code du Module *</label>
                <input type="text" id="codeModule" name="codeModule" required class="form-control">
            </div>

            <div class="form-group">
                <label for="coefficient">Coefficient</label>
                <input type="number" id="coefficient" name="coefficient" step="0.1" min="0.5" max="5" value="1.0" class="form-control">
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" rows="4"></textarea>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-success">✅ Enregistrer</button>
                <a href="${pageContext.request.contextPath}/modules" class="btn btn-secondary">❌ Annuler</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
