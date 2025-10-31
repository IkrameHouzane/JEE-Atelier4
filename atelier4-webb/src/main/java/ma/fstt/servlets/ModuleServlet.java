package ma.fstt.servlets;

import ma.fstt.entities.Module;
import ma.fstt.services.ModuleServiceRemote;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.ejb.EJB;  // <--- AJOUTE ÇA
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ModuleServlet", value = "/modules")
public class ModuleServlet extends HttpServlet {

    @EJB  // <--- INJECTION AUTOMATIQUE
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
                    deleteModule(request, response);
                    break;
                default:
                    listModules(request, response);
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
                createModule(request, response);
            } else if ("update".equals(action)) {
                updateModule(request, response);
            }
        } catch (Exception e) {
            throw new ServletException("Erreur EJB: " + e.getMessage(), e);
        }
    }

    private void listModules(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<Module> modules = moduleService.findAllModules();
        request.setAttribute("modules", modules);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/modules/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/modules/add.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        Module module = moduleService.findModuleById(id);
        request.setAttribute("module", module);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/modules/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void createModule(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String nomModule = request.getParameter("nomModule");
        String codeModule = request.getParameter("codeModule");
        String coefficientStr = request.getParameter("coefficient");
        String description = request.getParameter("description");

        Double coefficient = 1.0;
        if (coefficientStr != null && !coefficientStr.isEmpty()) {
            coefficient = Double.parseDouble(coefficientStr);
        }

        Module module = new Module();
        module.setNomModule(nomModule);
        module.setCodeModule(codeModule);
        module.setCoefficient(coefficient);
        module.setDescription(description);

        moduleService.createModule(module);
        response.sendRedirect("modules");
    }

    private void updateModule(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        String nomModule = request.getParameter("nomModule");
        String codeModule = request.getParameter("codeModule");
        String coefficientStr = request.getParameter("coefficient");
        String description = request.getParameter("description");

        Double coefficient = 1.0;
        if (coefficientStr != null && !coefficientStr.isEmpty()) {
            coefficient = Double.parseDouble(coefficientStr);
        }

        Module module = moduleService.findModuleById(id);
        module.setNomModule(nomModule);
        module.setCodeModule(codeModule);
        module.setCoefficient(coefficient);
        module.setDescription(description);

        moduleService.updateModule(module);
        response.sendRedirect("modules");
    }

    private void deleteModule(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        moduleService.deleteModule(id);
        response.sendRedirect("modules");
    }
}