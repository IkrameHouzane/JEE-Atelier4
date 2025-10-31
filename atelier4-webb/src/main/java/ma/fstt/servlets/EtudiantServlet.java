package ma.fstt.servlets;

import ma.fstt.entities.Etudiant;
import ma.fstt.services.EtudiantServiceRemote;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "EtudiantServlet", value = "/etudiants")
public class EtudiantServlet extends HttpServlet {

    private EtudiantServiceRemote etudiantService;

    @Override
    public void init() throws ServletException {
        try {
            Context context = new InitialContext();
            etudiantService = (EtudiantServiceRemote) context.lookup(
                    "java:global/atelier4-webb/EtudiantServiceImpl!ma.fstt.services.EtudiantServiceRemote"
            );
            System.out.println("✅ EJB EtudiantService connecté avec succès!\n");
        } catch (NamingException e) {
            System.err.println("❌ Erreur EJB: " + e.getMessage());
            throw new ServletException("Erreur lors de l\'initialisation du EJB", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            if (action == null) {
                action = "list";
            }

            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteEtudiant(request, response);
                    break;
                default:
                    listEtudiants(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException("Erreur EJB: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            if ("create".equals(action)) {
                createEtudiant(request, response);
            } else if ("update".equals(action)) {
                updateEtudiant(request, response);
            }
        } catch (Exception e) {
            throw new ServletException("Erreur EJB: " + e.getMessage(), e);
        }
    }

    private void listEtudiants(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<Etudiant> etudiants = etudiantService.findAllEtudiants();
        request.setAttribute("etudiants", etudiants);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/etudiants/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/etudiants/add.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        Etudiant etudiant = etudiantService.findEtudiantById(id);
        request.setAttribute("etudiant", etudiant);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/etudiants/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void createEtudiant(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String cne = request.getParameter("cne");
        String adresse = request.getParameter("adresse");
        String niveau = request.getParameter("niveau");

        Etudiant etudiant = new Etudiant();
        etudiant.setNom(nom);
        etudiant.setPrenom(prenom);
        etudiant.setCne(cne);
        etudiant.setAdresse(adresse);
        etudiant.setNiveau(niveau);

        etudiantService.createEtudiant(etudiant);
        response.sendRedirect("etudiants");
    }

    private void updateEtudiant(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String cne = request.getParameter("cne");
        String adresse = request.getParameter("adresse");
        String niveau = request.getParameter("niveau");

        Etudiant etudiant = etudiantService.findEtudiantById(id);
        etudiant.setNom(nom);
        etudiant.setPrenom(prenom);
        etudiant.setCne(cne);
        etudiant.setAdresse(adresse);
        etudiant.setNiveau(niveau);

        etudiantService.updateEtudiant(etudiant);
        response.sendRedirect("etudiants");
    }

    private void deleteEtudiant(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        etudiantService.deleteEtudiant(id);
        response.sendRedirect("etudiants");
    }
}