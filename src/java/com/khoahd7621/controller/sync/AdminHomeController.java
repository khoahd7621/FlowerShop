package com.khoahd7621.controller.sync;

import com.khoahd7621.dao.AccountDAO;
import com.khoahd7621.dao.CategoryDAO;
import com.khoahd7621.dao.OrderDAO;
import com.khoahd7621.dao.PlantDAO;
import com.khoahd7621.model.Account;
import com.khoahd7621.model.Order;
import com.khoahd7621.model.Plant;
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
public class AdminHomeController extends HttpServlet {
    
    private static final String ADMIN_PAGE = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ADMIN_PAGE;
        try {
            HttpSession session = request.getSession();
            
            Map<Integer, String> listCategories = new CategoryDAO().getCategories();
            List<Plant> listPlants = new PlantDAO().getAllPlants();
            List<Account> listAccounts = new AccountDAO().getAccounts();
            List<Order> listOrders = new OrderDAO().getAllOrders();
            
            session.setAttribute("listCategories", listCategories);
            request.setAttribute("listPlants", listPlants);
            request.setAttribute("listAccounts", listAccounts);
            request.setAttribute("listOrders", listOrders);
            request.setAttribute("destPage", "dashboard");
        } catch (Exception e) {
            log("Error at AdminHomeController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
