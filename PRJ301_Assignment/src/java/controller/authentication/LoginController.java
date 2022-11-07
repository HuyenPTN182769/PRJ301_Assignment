/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.authentication;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Role;

/**
 *
 * @author Mạc Huyền
 */
public class LoginController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        AccountDBContext db = new AccountDBContext();
        Account account = db.get(username, password);
        if (account == null) {
            req.setAttribute("faild", "Login failed!");
            req.getRequestDispatcher("/authenticate/Login.jsp").forward(req, resp);
        } else {
            req.getSession().setAttribute("account", account);
            Role role = account.getRole().get(0);
            if (role != null) {
                if (role.getRoleID() == 1) {
                    req.getRequestDispatcher("/report/lecturer/Home.jsp").forward(req, resp);
                } else {
                    req.getRequestDispatcher("/report/student/Home.jsp").forward(req, resp);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/authenticate/Login.jsp").forward(req, resp);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
