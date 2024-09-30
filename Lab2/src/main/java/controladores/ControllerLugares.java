/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Lugares;
import modelosDAO.LugaresDAO;

/**
 *
 * @author MINED
 */
@WebServlet(name = "ControllerLugares", urlPatterns = {"/ControllerLugares"})
public class ControllerLugares extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControllerLugares</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerLugares at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = null;
        try {
            LugaresDAO lugaresDAO = new LugaresDAO();
            List<Lugares> consulta = lugaresDAO.Listar();
            request.setAttribute("consulta", consulta);
            dispatcher = request.getRequestDispatcher("Lugares/verlugares.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ControllerLugares.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            // Capturar los datos del formulario
            String nombre = request.getParameter("nombre");
            String direccion = request.getParameter("direccion");
            int capacidad = Integer.parseInt(request.getParameter("capacidad"));

            // Crear el objeto Lugares
            Lugares lugar = new Lugares();
            lugar.setNombreLugar(nombre);
            lugar.setDireccion(direccion);
            lugar.setCapacidad(capacidad);

            try {
                LugaresDAO dao = new LugaresDAO();
                dao.agregar(lugar);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ControllerLugares.class.getName()).log(Level.SEVERE, null, ex);
            }

            // Redirigir de vuelta a la lista de lugares
            RequestDispatcher dispatcher = request.getRequestDispatcher("Lugares/verlugares.jsp");
            dispatcher.forward(request, response);
        } else if ("actualizar".equals(action)) {
            // Capturar los datos del formulario
            int idLugar = Integer.parseInt(request.getParameter("idLugar"));
            String nombre = request.getParameter("nombre");
            String direccion = request.getParameter("direccion");
            int capacidad = Integer.parseInt(request.getParameter("capacidad"));

            // Crear el objeto Lugares
            Lugares lugar = new Lugares();
            lugar.setIdLugar(idLugar);
            lugar.setNombreLugar(nombre);
            lugar.setDireccion(direccion);
            lugar.setCapacidad(capacidad);

            try {
                LugaresDAO dao = new LugaresDAO();
                dao.actualizar(lugar);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ControllerLugares.class.getName()).log(Level.SEVERE, null, ex);
            }

            // Redirigir de vuelta a la lista de lugares
            RequestDispatcher dispatcher = request.getRequestDispatcher("Lugares/verlugares.jsp");
            dispatcher.forward(request, response);
        } else if ("eliminar".equals(action)) {
            // Capturar el ID del lugar a eliminar
            int idLugar = Integer.parseInt(request.getParameter("idLugar"));
            try {
                LugaresDAO dao = new LugaresDAO();
                if (dao.eliminar(idLugar)) {
                    // Si se eliminó correctamente, redirigir a la lista de lugares
                    request.setAttribute("mensaje", "Lugar eliminado exitosamente");
                } else {
                    request.setAttribute("mensaje", "Error al eliminar el lugar");
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ControllerLugares.class.getName()).log(Level.SEVERE, null, ex);
            }

            // Redirigir de vuelta a la lista de lugares
             RequestDispatcher dispatcher = request.getRequestDispatcher("Lugares/verlugares.jsp");
             dispatcher.forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
