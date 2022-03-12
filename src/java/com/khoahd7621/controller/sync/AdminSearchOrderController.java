package com.khoahd7621.controller.sync;

import com.khoahd7621.dao.OrderDAO;
import com.khoahd7621.model.Order;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author KhoaHD7621
 */
public class AdminSearchOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            List<Order> listOrders = new OrderDAO().getOrdersByPeriodTime(from, to);
            if (listOrders != null && listOrders.size() > 0) {
                request.setAttribute("listOrders", listOrders);
                request.setAttribute("from", from);
                request.setAttribute("to", to);
                request.setAttribute("destPage", "manageOrder");
                request.setAttribute("MSG_SUCCESS", "Found " + listOrders.size() + " orders in the period entered");
                request.getRequestDispatcher("manageOrder.jsp").forward(request, response);
            } else {
                request.setAttribute("from", from);
                request.setAttribute("to", to);
                request.setAttribute("destPage", "manageOrder");
                request.setAttribute("MSG_ERROR", "No orders found for this time period!");
                request.getRequestDispatcher("manageOrder.jsp").forward(request, response);
            }
        } catch (Exception e) {
            log("Error at AdminSearchOrderController: " + e.toString());
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
        processRequest(request, response);
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
