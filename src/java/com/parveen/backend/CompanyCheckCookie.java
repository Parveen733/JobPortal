/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parveen.backend;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Deepak
 */
public class CompanyCheckCookie extends HttpServlet
{
    protected void doService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session=req.getSession();
        
        String email=(String) session.getAttribute("session_c_email");
        
        
        if(email==null ? email==null : email.trim().equals("null"))
        {  
            Cookie[] ck=req.getCookies();
            if(ck != null)
            {
                
                for(Cookie cookie : ck)
                {   
                    if(cookie.getName().equals("cookie_email"))
                    {
                        email=cookie.getValue();
                        
                        req.setAttribute("c_email1", email);

                        RequestDispatcher rd=req.getRequestDispatcher("CompanyGetUserData");
                        rd.include(req, resp);
                    }
                }
            }
            else
            {
                
                resp.sendRedirect("c_index.jsp");
            }
            
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doService(req, resp);
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doService(req, resp);
    }
}