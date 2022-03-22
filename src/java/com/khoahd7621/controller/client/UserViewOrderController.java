package com.khoahd7621.controller.client;

import com.khoahd7621.dao.OrderDAO;
import com.khoahd7621.dao.OrderStatusDAO;
import com.khoahd7621.model.Account;
import com.khoahd7621.model.Order;
import java.io.IOException;
import java.util.List;
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
public class UserViewOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            HttpSession session = request.getSession();
            session.setAttribute("destPage", "order");
            Account account = (Account) session.getAttribute("LOGIN_USER");

            Map<Integer, String> listOrderStatus = new OrderStatusDAO().getOrderStatus();
            session.setAttribute("listOrderStatus", listOrderStatus);

            String orderStatus = request.getParameter("orderStatus");

            OrderDAO orderDAO = new OrderDAO();
            if (orderStatus == null || orderStatus.isEmpty()) {
                List<Order> orderList = orderDAO.getOrders(account.getAccId());
                if (orderList.isEmpty()) {
                    request.setAttribute("NO_ORDER", "Don't have any order!");
                    session.setAttribute("urlOrderHistory", "UserViewOrderController");
                    request.getRequestDispatcher("order.jsp").forward(request, response);
                } else {
                    request.setAttribute("orderList", orderList);
                    request.setAttribute("orderStatus", 0);
                    session.setAttribute("urlOrderHistory", "UserViewOrderController");
                    request.getRequestDispatcher("order.jsp").forward(request, response);
                }
            } else {
                int orderStatusNum = Integer.parseInt(orderStatus);
                List<Order> orderList = orderDAO.getOrderByStatus(account.getAccId(), orderStatusNum);
                if (orderList.isEmpty()) {
                    request.setAttribute("NO_ORDER", "Don't have any " + listOrderStatus.get(orderStatusNum) + " order!");
                    request.setAttribute("orderStatus", orderStatus);
                    session.setAttribute("urlOrderHistory", "UserViewOrderController?orderStatus=" + orderStatus);
                    request.getRequestDispatcher("order.jsp").forward(request, response);
                } else {
                    request.setAttribute("orderList", orderList);
                    request.setAttribute("orderStatus", orderStatus);
                    session.setAttribute("urlOrderHistory", "UserViewOrderController?orderStatus=" + orderStatus);
                    request.getRequestDispatcher("order.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            log("Error at UserViewOrderController: " + e.toString());
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
