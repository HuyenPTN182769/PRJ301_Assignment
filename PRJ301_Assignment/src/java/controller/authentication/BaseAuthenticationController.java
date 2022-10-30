/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.authentication;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;

/**
 *
 * @author Mạc Huyền
 */
public abstract class BaseAuthenticationController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(isAuthenticated(req)) {
            processPost(req, resp);
        }
        else {
            resp.getWriter().println("Access denied");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(isAuthenticated(req)) {
            processGet(req, resp);
        }
        else {
            resp.getWriter().println("Access denied!");
        }
    }

    private boolean isAuthenticated(HttpServletRequest req) {
        Account account = (Account)req.getSession().getAttribute("account");
        return account != null;
    }

    protected abstract void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
    protected abstract void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
    
}
