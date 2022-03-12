package com.khoahd7621.controller.sync;

import com.khoahd7621.util.SendMailUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author KhoaHD7621
 */
public class SendEmailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            PrintWriter out = response.getWriter();
            String action = request.getParameter("action");
            if (action != null) {
                if (action.equals("subscribeEmail")) {
                    String email = request.getParameter("email");
                    String subject = "Register to receive promotional information successfully";
                    String message = "<!DOCTYPE html>\n"
                            + "<html lang=\"en\">\n"
                            + "\n"
                            + "<head>\n"
                            + "</head>\n"
                            + "\n"
                            + "<body>\n"
                            + "    <div style=\"color: blue;\">Hello,</div>\n"
                            + "    <div>Thank you for believing and using our services! We highly appreciate it.</div>\n"
                            + "    <div>We will send you several emails a week.</div>\n"
                            + "    <div>Building a unique website has never been easier!</div>\n"
                            + "    <h3 style=\"color: blue;\">Thank you very much!</h3>\n"
                            + "\n"
                            + "</body>\n"
                            + "\n"
                            + "</html>";
                    SendMailUtils.send(email, subject, message);
                } else if (action.equals("pageDirect")) {
                    request.setAttribute("destPage", "sendMail");
                    response.sendRedirect("sendMail.jsp");
                } else if (action.equals("sendEmailToCust")) {
                    String email = request.getParameter("email");
                    String subject = request.getParameter("subject");
                    String message = request.getParameter("message");
                    boolean check = SendMailUtils.send(email, subject, message);
                    if (check) {
                        request.setAttribute("MSG_SUCCESS", "You have been send mail to \"" + email + "\" successfully!");
                        request.setAttribute("destPage", "sendMail");
                        request.getRequestDispatcher("sendMail.jsp").forward(request, response);
                    } else {
                        request.setAttribute("MSG_ERROR", "You have been send mail to \"" + email + "\" failed! Try later!");
                        request.setAttribute("destPage", "sendMail");
                        request.getRequestDispatcher("sendMail.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            log("Error at SendEmailController: " + e.toString());
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
