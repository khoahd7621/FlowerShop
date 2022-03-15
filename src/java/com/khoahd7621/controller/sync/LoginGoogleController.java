/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khoahd7621.controller.sync;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.khoahd7621.dao.AccountDAO;
import com.khoahd7621.model.Account;
import com.khoahd7621.model.Constants;
import com.khoahd7621.model.UserGoogle;
import com.khoahd7621.util.Tools;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

/**
 *
 * @author KhoaHD7621
 */
public class LoginGoogleController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String code = request.getParameter("code");
            String accessToken = getToken(code);
            UserGoogle user = getUserInfo(accessToken);
            String email = user.getEmail();
            AccountDAO accDAO = new AccountDAO();
            boolean check = accDAO.getAccountByEmail(email);
            HttpSession session = request.getSession();
            if (check) {
                Account account = accDAO.getAccountInfoByEmail(email);
                session.setAttribute("LOGIN_USER", account);

            } else {
                Account account = new Account(0, email, "", user.getName(), 1, "", 0);
                accDAO.insertAccount(email, "******", user.getName(), "", 1, 0);
                session.setAttribute("LOGIN_USER", account);
            }

            String token = Tools.generateNewToken();
            new AccountDAO().updateToken(token, email);
            Cookie cookie = new Cookie("selector", token);
            cookie.setMaxAge(60 * 5);
            response.addCookie(cookie);

            String destPage = (String) session.getAttribute("destPage");
            if (destPage != null && destPage.equals("checkOut")) {
                response.sendRedirect("CheckOutController");
            } else {
                response.sendRedirect("HomeController");
            }
        } catch (Exception e) {
            log("Error at LoginGoogleController: " + e.toString());
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogle googlePojo = new Gson().fromJson(response, UserGoogle.class);

        return googlePojo;
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
