package com.khoahd7621.controller.sync;

import com.khoahd7621.dao.PlantDAO;
import com.khoahd7621.model.Plant;
import java.io.IOException;
import java.io.PrintWriter;
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
public class LoadMoreController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            Map<Integer, String> listCategories = (Map<Integer, String>) session.getAttribute("listCategories");
            PrintWriter out = response.getWriter();
            String action = request.getParameter("action");
            List<Plant> list;
            if (action != null) {
                switch (action) {
                    case "loadMoreOurProduct":
                        int amount = Integer.parseInt(request.getParameter("exists"));
                        list = new PlantDAO().getNext4Plants(amount);
                        for (Plant p : list) {
                            String status = p.getStatus() == 1 ? "Available" : "Sold out";
                            out.println("<!-- Product -->\n" +
"                        <div class=\"col mb-5 product-all\">\n" +
"                            <div class=\"card h-100\">\n" +
"                                <!-- Sale badge-->\n" +
"                                <div class=\"position-absolute bg-black text-white default-cursor\"\n" +
"                                     style=\"padding: 5px 15px; left: 15px; top: 15px;\">\n" +
"                                    " + status + "\n" +
"                                </div>\n" +
"                                <!-- Product image-->\n" +
"                                <a href=\"PlantDetailController?pid=" + p.getId() + "\"><img class=\"card-img-top\"\n" +
"                                                 src=\"" + p.getImgPath() + "\"\n" +
"                                                 alt=\"...\" /></a>\n" +
"                                <!-- Product details-->\n" +
"                                <div class=\"card-body p-2\">\n" +
"                                    <div class=\"text-center product-info\">\n" +
"                                        <div class=\"category ms-3 mt-3 text-start\">\n" +
"                                            " + listCategories.get(p.getCategoryId()) + "\n" +
"                                        </div>\n" +
"                                        <!-- Product name-->\n" +
"                                        <div class=\"name\">\n" +
"                                            <a class=\"text-decoration-none text-black\" href=\"PlantDetailController?pid=" + p.getId() + "\">\n" +
"                                                " + p.getName() + "\n" +
"                                            </a>\n" +
"                                        </div>\n" +
"                                        <!-- Product reviews-->\n" +
"                                        <div class=\"d-flex justify-content-center small text-warning mb-2\">\n" +
"                                            <div class=\"bi-star-fill\"></div>\n" +
"                                            <div class=\"bi-star-fill\"></div>\n" +
"                                            <div class=\"bi-star-fill\"></div>\n" +
"                                            <div class=\"bi-star-fill\"></div>\n" +
"                                            <div class=\"bi-star-fill\"></div>\n" +
"                                        </div>\n" +
"                                        <!-- Product price-->\n" +
"                                        <div class=\"price text-center fs-4 fw-bold default-cursor\">\n" +
"                                            <span class=\"text-muted text-decoration-line-through\">$20</span>\n" +
"                                            $" + p.getPrice() + "\n" +
"                                        </div>\n" +
"                                    </div>\n" +
"                                </div>\n" +
"                                <!-- Product actions-->\n" +
"                                <div class=\"card-footer p-4 pt-0 border-top-0 bg-transparent\">\n" +
"                                    <div class=\"text-center\">\n" +
"                                        <a onclick=\"addToCartAsync(" + p.getId() + ")\" class=\"btn btn-outline-dark mt-auto w-50\"><i\n" +
"                                                class=\"bi bi-cart-plus-fill\"></i></a>" +
"                                    </div>\n" +
"                                </div>\n" +
"                            </div>\n" +
"                        </div>");
                        }
                        break;
                    case "loadProductsById":
                        int cateId = Integer.parseInt(request.getParameter("cateId"));
                        list = new PlantDAO().getTop4PlantsByCateId(cateId);
                        for (Plant pl : list) {
                            String status = pl.getStatus() == 1 ? "Available" : "Sold out";
                            out.println("<div class=\"col mb-5 product-all\">\n" +
"                            <div class=\"card h-100\">\n" +
"                                <!-- Sale badge-->\n" +
"                                <div class=\"position-absolute bg-black text-white default-cursor\"\n" +
"                                     style=\"padding: 5px 15px; left: 15px; top: 15px;\">\n" +
"                                    " + status + "\n" +
"                                </div>\n" +
"                                <!-- Product image-->\n" +
"                                <a href=\"PlantDetailController?pid=" + pl.getId() + "\"><img class=\"card-img-top\"\n" +
"                                                 src=\"" + pl.getImgPath() + "\"\n" +
"                                                 alt=\"...\" /></a>\n" +
"                                <!-- Product details-->\n" +
"                                <div class=\"card-body p-2\">\n" +
"                                    <div class=\"text-center product-info\">\n" +
"                                        <div class=\"category ms-3 mt-3 text-start\">\n" +
"                                            " + listCategories.get(pl.getCategoryId()) + "\n" +
"                                        </div>\n" +
"                                        <!-- Product name-->\n" +
"                                        <div class=\"name\">\n" +
"                                            <a class=\"text-decoration-none text-black\" href=\"PlantDetailController?pid=" + pl.getId() + "\">\n" +
"                                                " + pl.getName() + "\n" +
"                                            </a>\n" +
"                                        </div>\n" +
"                                        <!-- Product reviews-->\n" +
"                                        <div class=\"d-flex justify-content-center small text-warning mb-2\">\n" +
"                                            <div class=\"bi-star-fill\"></div>\n" +
"                                            <div class=\"bi-star-fill\"></div>\n" +
"                                            <div class=\"bi-star-fill\"></div>\n" +
"                                            <div class=\"bi-star-fill\"></div>\n" +
"                                            <div class=\"bi-star-fill\"></div>\n" +
"                                        </div>\n" +
"                                        <!-- Product price-->\n" +
"                                        <div class=\"price text-center fs-4 fw-bold default-cursor\">\n" +
"                                            <span class=\"text-muted text-decoration-line-through\">$20</span>\n" +
"                                            $" + pl.getPrice() +"\n" +
"                                        </div>\n" +
"                                    </div>\n" +
"                                </div>\n" +
"                                <!-- Product actions-->\n" +
"                                <div class=\"card-footer p-4 pt-0 border-top-0 bg-transparent\">\n" +
"                                    <div class=\"text-center\">\n" +
"                                        <a onclick=\"addToCartAsync(" + pl.getId() + ")\" class=\"btn btn-outline-dark mt-auto w-50\"><i\n" +
"                                                class=\"bi bi-cart-plus-fill\"></i></a>" +
"                                    </div>\n" +
"                                </div>\n" +
"                            </div>\n" +
"                        </div>");
                        }
                        break;
                }
            }
        } catch (Exception e) {
            log("Error at LoadMoreController: " + e.toString());
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
