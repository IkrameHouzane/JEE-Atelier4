package ma.fstt.servlets;

import ma.fstt.entities.Suivie;
import ma.fstt.entities.Etudiant;
import ma.fstt.entities.Module;
import ma.fstt.services.SuivieServiceRemote;
import ma.fstt.services.EtudiantServiceRemote;
import ma.fstt.services.ModuleServiceRemote;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.ejb.EJB;  // <--- INJECTION AUTOMATIQUE
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "SuivieServlet", value = "/notes")
public class SuivieServlet extends HttpServlet {

    @EJB
    private SuivieServiceRemote suivieService;

    @EJB
    private EtudiantServiceRemote etudiantService;

    @EJB
    private ModuleServiceRemote moduleService;

    // SUPPRIME TOUT LE init() avec InitialContext !

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
                    deleteNote(request, response);
                    break;
                default:
                    listNotes(request, response);
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
                createNote(request, response);
            } else if ("update".equals(action)) {
                updateNote(request, response);
            }
        } catch (Exception e) {
            throw new ServletException("Erreur EJB: " + e.getMessage(), e);
        }
    }

    private void listNotes(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<Suivie> notes = suivieService.findAllSuivies();
        request.setAttribute("notes", notes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/notes/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<Etudiant> etudiants = etudiantService.findAllEtudiants();
        List<Module> modules = moduleService.findAllModules();

        request.setAttribute("etudiants", etudiants);
        request.setAttribute("modules", modules);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/notes/add.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        Suivie note = suivieService.findSuivieById(id);
        List<Etudiant> etudiants = etudiantService.findAllEtudiants();
        List<Module> modules = moduleService.findAllModules();

        request.setAttribute("note", note);
        request.setAttribute("etudiants", etudiants);
        request.setAttribute("modules", modules);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/notes/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void createNote(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Double note = Double.parseDouble(request.getParameter("note"));
        LocalDate dateExamen = LocalDate.parse(request.getParameter("dateExamen"));
        Long etudiantId = Long.parseLong(request.getParameter("etudiantId"));
        Long moduleId = Long.parseLong(request.getParameter("moduleId"));

        Etudiant etudiant = etudiantService.findEtudiantById(etudiantId);
        Module module = moduleService.findModuleById(moduleId);

        Suivie suivie = new Suivie();
        suivie.setNote(note);
        suivie.setDateExamen(dateExamen);
        suivie.setEtudiant(etudiant);
        suivie.setModule(module);

        suivieService.createSuivie(suivie);
        response.sendRedirect("notes");
    }

    private void updateNote(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        Double noteValue = Double.parseDouble(request.getParameter("note"));
        LocalDate dateExamen = LocalDate.parse(request.getParameter("dateExamen"));
        Long etudiantId = Long.parseLong(request.getParameter("etudiantId"));
        Long moduleId = Long.parseLong(request.getParameter("moduleId"));

        Etudiant etudiant = etudiantService.findEtudiantById(etudiantId);
        Module module = moduleService.findModuleById(moduleId);

        Suivie suivie = suivieService.findSuivieById(id);
        suivie.setNote(noteValue);
        suivie.setDateExamen(dateExamen);
        suivie.setEtudiant(etudiant);
        suivie.setModule(module);

        suivieService.updateSuivie(suivie);
        response.sendRedirect("notes");
    }

    private void deleteNote(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        suivieService.deleteSuivie(id);
        response.sendRedirect("notes");
    }
}