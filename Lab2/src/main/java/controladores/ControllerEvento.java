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
import modelos.Evento;
import modelos.Lugares;
import modelosDAO.EventoDAO;
import modelosDAO.LugaresDAO;

/**
 *
 * @author steve
 */
@WebServlet(name = "ControllerEvento", urlPatterns = {"/ControllerEvento"})
public class ControllerEvento extends HttpServlet {

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
            out.println("<title>Servlet ControllerEvento</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerEvento at " + request.getContextPath() + "</h1>");
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
        try {
            RequestDispatcher dispatcher = null;
            EventoDAO eventodao = new EventoDAO();
            LugaresDAO lugardao = new LugaresDAO();

            // Listar Eventos
            List<Evento> eventos = eventodao.listar();
            request.setAttribute("eventos", eventos);

            // Listar Lugares
            List<Lugares> lugares = lugardao.Listar();
            request.setAttribute("lugares", lugares);


            dispatcher = request.getRequestDispatcher("Evento/eventos.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
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
        //processRequest(request, response);
        String action = request.getParameter("action");
        if ("agregar".equals(action)) {
            try {
                String fecha = request.getParameter("fecha");
                int idLugar = Integer.parseInt(request.getParameter("lugar"));

                // Crear el objeto Evento
                Evento nuevoEvento = new Evento();
                nuevoEvento.setFechaEvento(fecha);
                nuevoEvento.setLugarId(idLugar);

                EventoDAO eventodao = new EventoDAO();
                // Guardar el nuevo evento en la base de datos
                eventodao.agregar(nuevoEvento);

                // Redirigir después de agregar
                            // Listar Eventos
            LugaresDAO lugardao = new LugaresDAO();
            List<Evento> eventos = eventodao.listar();
            request.setAttribute("eventos", eventos);

            // Listar Lugares
            List<Lugares> lugares = lugardao.Listar();
            request.setAttribute("lugares", lugares);
            RequestDispatcher dispatcher = null;
            dispatcher = request.getRequestDispatcher("Evento/eventos.jsp");
            
            dispatcher.forward(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ControllerEvento.class.getName()).log(Level.SEVERE, null, ex);
            }
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
