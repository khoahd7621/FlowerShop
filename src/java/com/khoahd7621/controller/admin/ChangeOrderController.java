package com.khoahd7621.controller.admin;

import com.khoahd7621.dao.OrderDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author KhoaHD7621
 */
public class ChangeOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            if (action != null) {
                switch(action) {
                    case "completeOrder":
                        String orderIdTxt = request.getParameter("orderId");
                        if (orderIdTxt != null) {
                            boolean check = new OrderDAO().finishOrder(Integer.parseInt(orderIdTxt), 2);
                            if (check) {
                                request.setAttribute("MSG_SUCCESS", "You have successfully completed orders!");
                            } else {
                                request.setAttribute("MSG_ERROR", "An error occurred! Completed order failed!");
                            }
                        } else {
                            request.setAttribute("MSG_ERROR", "Oops, something went wrong! Try later!");
                        }
                        break;
                }
            } else {
                request.setAttribute("MSG_ERROR", "Oops, something went wrong! Try later!");
            }
        } catch (Exception e) {
            log("Error at ChangeOrderController: " + e.toString());
        } finally {
            request.getRequestDispatcher("AdminManageOrderController").forward(request, response);
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
