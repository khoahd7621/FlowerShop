package com.khoahd7621.controller;

import com.khoahd7621.dao.AccountDAO;
import com.khoahd7621.model.Account;
import com.khoahd7621.util.SecurityUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KhoaHD7621
 */
public class UpdateUserController extends HttpServlet {

    private static final String USER_PAGE = "UserHomeController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("LOGIN_USER");
            AccountDAO accDAO = new AccountDAO();
            if (acc != null) {
                String action = request.getParameter("action");
                if (action != null) {
                    switch (action) {
                        case "updateInfo":
                            String name = request.getParameter("name");
                            String phone = request.getParameter("phone");
                            boolean check = accDAO.changeAccount(acc.getEmail(), name, phone);
                            if (check) {
                                acc = accDAO.getAccountInfoByEmail(acc.getEmail());
                                session.setAttribute("LOGIN_USER", acc);
                                request.setAttribute("MSG_SUCCESS", "Update profile information successfully!");
                                request.getRequestDispatcher(USER_PAGE).forward(request, response);
                            } else {
                                request.setAttribute("MSG_ERROR", "Oops! Something went wrong! Try later!");
                                request.getRequestDispatcher(USER_PAGE).forward(request, response);
                            }
                            break;
                        case "changePassword":
                            String oldPassword = SecurityUtils.hashMd5(request.getParameter("oldPassword"));
                            boolean checkOldPsw = accDAO.checkOldPassword(acc.getAccId(), oldPassword);
                            if (checkOldPsw) {
                                String newPasword = SecurityUtils.hashMd5(request.getParameter("newPassword"));
                                boolean checkNewPsw = accDAO.updateAccountPassword(acc.getAccId(), newPasword);
                                if (checkNewPsw) {
                                    request.setAttribute("MSG_SUCCESS", "Change password successfully!");
                                    request.getRequestDispatcher(USER_PAGE).forward(request, response);
                                } else {
                                    request.setAttribute("MSG_ERROR", "Oops! Something went wrong! Try later!");
                                    request.getRequestDispatcher(USER_PAGE).forward(request, response);
                                }
                            } else {
                                request.setAttribute("MSG_ERROR", "You entered the wrong old password! Please try again!");
                                request.getRequestDispatcher(USER_PAGE).forward(request, response);
                            }
                            break;
                    }
                } else {
                    request.setAttribute("MSG_ERROR", "Oops! Something went wrong! Try later!");
                    request.getRequestDispatcher("invalid.jsp").forward(request, response);
                }
            } else {
            }
        } catch (Exception e) {
            log("Error at UpdateUserController: " + e.toString());
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
