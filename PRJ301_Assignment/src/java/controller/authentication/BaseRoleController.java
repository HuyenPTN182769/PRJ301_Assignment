/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.authentication;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Feature;
import model.Role;

/**
 *
 * @author Mạc Huyền
 */
public abstract class BaseRoleController extends BaseAuthenticationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(isAuthorized(req))
        {
            processPost(req, resp, (Account)req.getSession().getAttribute("account"));
        }
        else
        {
            resp.getWriter().println("Access denied!");
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(isAuthorized(req)) {
            processGet(req, resp, (Account)req.getSession().getAttribute("account"));
        }
        else {
            resp.getWriter().println("Access denied!");
        }
    }

    private boolean isAuthorized(HttpServletRequest req) {
        Account account = (Account)req.getSession().getAttribute("account");
        String currentUrl = req.getServletPath();
        for (Role role : account.getRole()) {
            for (Feature feature : role.getFeature()) {
                if(feature.getUrl().equals(currentUrl))
                    return true;
            }
        }
        return false;
    }

    protected abstract void processPost(HttpServletRequest req, HttpServletResponse resp,Account account) throws ServletException, IOException;
    protected abstract void processGet(HttpServletRequest req, HttpServletResponse resp,Account account) throws ServletException, IOException;
    
}
