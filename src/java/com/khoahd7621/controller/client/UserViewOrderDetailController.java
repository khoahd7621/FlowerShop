package com.khoahd7621.controller.client;

import com.khoahd7621.dao.OrderDAO;
import com.khoahd7621.dao.OrderDetailDAO;
import com.khoahd7621.dao.PlantDAO;
import com.khoahd7621.dao.ShippingDAO;
import com.khoahd7621.model.Account;
import com.khoahd7621.model.Order;
import com.khoahd7621.model.OrderDetail;
import com.khoahd7621.model.Plant;
import com.khoahd7621.model.Shipping;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KhoaHD7621
 */
public class UserViewOrderDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            session.setAttribute("destPage", "order");
            Account account = (Account) session.getAttribute("LOGIN_USER");
            if (account != null) {
                String orderIdTxt = request.getParameter("orderId");
                if (orderIdTxt != null) {
                    int orderId = Integer.parseInt(orderIdTxt);
                    Order order = new OrderDAO().getOrderById(orderId);
                    if (order != null) {
                        List<OrderDetail> listOrdersDetail = new OrderDetailDAO().getListOrdersDetail(orderId);
                        List<Plant> listPlantOrder = new ArrayList<>();
                        PlantDAO plantDAO = new PlantDAO();
                        for (OrderDetail orderDetail : listOrdersDetail) {
                            listPlantOrder.add(plantDAO.getPlant(orderDetail.getPlantId()));
                        }
                        Shipping shipping = new ShippingDAO().getShippingById(order.getShippingId());
                        request.setAttribute("order", order);
                        request.setAttribute("listOrdersDetail", listOrdersDetail);
                        request.setAttribute("listPlantOrder", listPlantOrder);
                        request.setAttribute("shipping", shipping);
                        request.getRequestDispatcher("orderdetail.jsp").forward(request, response);
                    } else {
                        request.setAttribute("MSG_ERROR", "Opps! Some things wrong!");
                        String url = (String) session.getAttribute("urlOrderHistory");
                        request.getRequestDispatcher(url).forward(request, response);
                    }
                } else {
                    request.setAttribute("MSG_ERROR", "Opps! Some things wrong!");
                    String url = (String) session.getAttribute("urlOrderHistory");
                    request.getRequestDispatcher(url).forward(request, response);
                }
            } else {
                response.sendRedirect("HomeController");
            }
        } catch (Exception e) {
            log("Error at UserViewOrderDetailController: " + e.toString());
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
