package com.khoahd7621.controller;

import com.khoahd7621.dao.AccountDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author KhoaHD7621
 */
public class UpdateAccountController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            String email = request.getParameter("email");
            if (action != null) {
                switch (action) {
                    case "blockAccount":
                        if (email != null) {
                            boolean check = new AccountDAO().updateAccountStatus(email, 0);
                            if (check) {
                                request.setAttribute("MSG_SUCCESS", "You have successfully blocked the user!");
                            } else {
                                request.setAttribute("MSG_ERROR", "An error occurred! Block user failed!");
                            }
                        } else {
                            request.setAttribute("MSG_ERROR", "Oops, something went wrong! Please try later!");
                        }
                        break;
                    case "unblockAccount":
                        if (email != null) {
                            boolean check = new AccountDAO().updateAccountStatus(email, 1);
                            if (check) {
                                request.setAttribute("MSG_SUCCESS", "You have successfully unblocked the user!");
                            } else {
                                request.setAttribute("MSG_ERROR", "An error occurred! Unblock user failed!");
                            }
                        } else {
                            request.setAttribute("MSG_ERROR", "Oops, something went wrong! Please try later!");
                        }
                        break;
                }
            } else {
                request.setAttribute("MSG_ERROR", "Oops, something went wrong! Please try later!");
            }
        } catch (Exception e) {
            log("Error at AdminManageAccountController: " + e.toString());
        } finally {
            request.getRequestDispatcher("AdminManageAccountController").forward(request, response);
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
