package com.khoahd7621.controller.async;

import com.google.gson.Gson;
import com.khoahd7621.dao.PlantDAO;
import com.khoahd7621.model.Cart;
import com.khoahd7621.model.Plant;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KhoaHD7621
 */
public class AddToCartAsyncController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            int pid = Integer.parseInt(request.getParameter("pid"));

            // Map<pid, cart(plant, quantity)>
            HttpSession session = request.getSession();
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
            if (carts == null) {
                carts = new LinkedHashMap<>(); // Các phần tử add vào sẽ luôn theo thứ tự
            }
            // 1. Lấy product ứng với id nhận được
            // Có 2 trường hợp
            // TH1: Sản phẩm chưa có trên giỏ hàng -> Thêm nó vào giỏ hàng (Add Product To Session)
            if (carts.containsKey(pid)) {
                int oldQuantity = carts.get(pid).getQuantity();
                carts.get(pid).setQuantity(oldQuantity + 1);

            } else { // TH2: Sản phẩm đã có trên giỏ hàng -> Cập nhật lại số lượng sản phẩm trên giỏ hàng (Update Product int session)
                Plant plant = new PlantDAO().getPlant(pid);
                carts.put(pid, Cart.builder().plant(plant).quantity(1).build());
            }
            // Save carts to session scope
            session.setAttribute("carts", carts);

            // Save cookie contain list cart to client
            Cookie[] cookies = request.getCookies();
            // Remove old cookie "cart" from client if it existed
            Cookie cartCookie = null;
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("cart")) {
                    cartCookie = cooky;
                    cartCookie.setMaxAge(0);
                    response.addCookie(cartCookie);
                }
                if (cartCookie != null) {
                    break;
                }
            }
            // Convert carts to string for save it to cookie
            String cart = "";
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                int plantId = entry.getKey();
                Cart cartEl = entry.getValue();
                if (cart.equals("")) {
                    cart = Integer.toString(plantId) + ":" + Integer.toString(cartEl.getQuantity());
                } else {
                    cart += "-" + Integer.toString(plantId) + ":" + Integer.toString(cartEl.getQuantity());
                }
            }
            Cookie cookieCart = new Cookie("cart", cart);
            cookieCart.setMaxAge(60 * 60 * 24);
            response.addCookie(cookieCart);

            // Return json to browser to update UI cart btn
            List<Plant> list = new ArrayList<>();
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer plantId = entry.getKey();
                Cart cartsss = entry.getValue();

                list.add(cartsss.getPlant());
            }
            Gson gson = new Gson();
            String json = gson.toJson(list);
            response.getWriter().println(json);
        } catch (Exception e) {
            log("Error at AddToCartAsyncController: " + e.toString());
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
