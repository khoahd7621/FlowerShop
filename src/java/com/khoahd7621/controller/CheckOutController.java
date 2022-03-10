package com.khoahd7621.controller;

import com.khoahd7621.dao.OrderDAO;
import com.khoahd7621.model.Account;
import com.khoahd7621.model.Cart;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KhoaHD7621
 */
public class CheckOutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("LOGIN_USER");
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
            if (carts != null && !carts.isEmpty()) {
                if (account == null) {
                    response.sendRedirect("login.jsp");
                } else {
                    // Tinh tong tien
                    double totalMoney = 0;
                    for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                        Integer pid = entry.getKey();
                        Cart cart = entry.getValue();

                        totalMoney += cart.getQuantity() * cart.getPlant().getPrice();
                    }
                    request.setAttribute("totalMoney", totalMoney);
                    session.setAttribute("destPage", "");
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);
                }
            } else {
                session.setAttribute("destPage", "home");
                response.sendRedirect("HomeController");
            }
        } catch (Exception e) {
            log("Error at CheckOutController: " + e.toString());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            HttpSession session = request.getSession();

            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String note = request.getParameter("note").trim();
            if (note == null || note.isEmpty() || note.equals("")) {
                note = "None";
            }

            Account account = (Account) session.getAttribute("LOGIN_USER");

            // Save all to database
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
            if (carts != null && !carts.isEmpty()) { // Cart is not empty
                if (account != null) { // User had login
                    boolean result = new OrderDAO().insertOrder(account.getAccId(), carts, name, phone, address, note);
                    if (result) {
                        session.removeAttribute("carts");
                        request.setAttribute("MSG_SUCCESS", "Save your cart successfully!");
                        request.getRequestDispatcher("carts.jsp").forward(request, response);
                    } else {
                        request.setAttribute("MSG_ERROR", "These products are out of stock!");
                        request.getRequestDispatcher("carts.jsp").forward(request, response);
                    }
                } else {
                    response.sendRedirect("HomeController");
                }
            } else {
                response.sendRedirect("HomeController");
            }
        } catch (Exception e) {
            log("Error at CheckoutController: " + e.toString());
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
