<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter une Note</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>📊 Ajouter une Note</h1>
        <a href="${pageContext.request.contextPath}/notes" class="btn btn-secondary">
            ↩️ Retour
        </a>
    </header>

    <div class="form-container">
        <form action="${pageContext.request.contextPath}/notes" method="post" class="form">
            <input type="hidden" name="action" value="create">

            <div class="form-group">
                <label for="etudiantId">Étudiant *</label>
                <select id="etudiantId" name="etudiantId" required class="form-control">
                    <option value="">Sélectionner un étudiant</option>
                    <c:forEach var="etudiant" items="${etudiants}">
                        <option value="${etudiant.idEtudiant}">
                                ${etudiant.nom} ${etudiant.prenom} (${etudiant.cne})
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="moduleId">Module *</label>
                <select id="moduleId" name="moduleId" required class="form-control">
                    <option value="">Sélectionner un module</option>
                    <c:forEach var="module" items="${modules}">
                        <option value="${module.idModule}">
                                ${module.nomModule} (${module.codeModule})
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="note">Note *</label>
                <input type="number" id="note" name="note" step="0.5" min="0" max="20" required class="form-control">
            </div>

            <div class="form-group">
                <label for="dateExamen">Date d'examen *</label>
                <input type="date" id="dateExamen" name="dateExamen" required class="form-control">
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-success">✅ Enregistrer</button>
                <a href="${pageContext.request.contextPath}/notes" class="btn btn-secondary">❌ Annuler</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
