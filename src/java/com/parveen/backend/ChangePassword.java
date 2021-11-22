/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parveen.backend;

import com.parveen.connection.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author py742
 */
public class ChangePassword extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        
        String pass = req.getParameter("confirm");
        HttpSession session=req.getSession();
        String email=(String) session.getAttribute("session_emailF");
        String mobileno=(String) session.getAttribute("session_mobileno");
        Connection con = null;

        try {
            con = DbConnection.getConnect();
            if (mobileno != null) {

                PreparedStatement ps = con.prepareStatement("update company_reg set c_password=? where c_email=? and c_mobile_no=?");
                ps.setString(1, pass);
                ps.setString(2, email);
                ps.setString(3, mobileno);

                int i = ps.executeUpdate();
                if (i>0) {

                   
                    resp.sendRedirect("loginAsCompany.jsp");

                }else{
                RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("c_menubar.jsp");
                rd2.include(req, resp);
                
                req.setAttribute("error_message", "Invalid email id and password...!!");
                RequestDispatcher rd3=req.getRequestDispatcher("error.jsp");
                rd3.include(req, resp);
                
                RequestDispatcher rd4=req.getRequestDispatcher("c_logdiv.jsp");
                rd4.include(req, resp);
                
                RequestDispatcher rd5=req.getRequestDispatcher("footer.jsp");
                rd5.include(req, resp);
                }
            } else {
                PreparedStatement ps = con.prepareStatement("update register set password=? where email=?");
                ps.setString(1, pass);
                ps.setString(2, email);
                int i = ps.executeUpdate();
                if (i>0) {

                   
                    resp.sendRedirect("login.jsp");

                }else{
                    RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("menubar.jsp");
                rd2.include(req, resp);
                
                req.setAttribute("error_message", "Invalid email id and password...!!");
                RequestDispatcher rd3=req.getRequestDispatcher("error.jsp");
                rd3.include(req, resp);
                
                RequestDispatcher rd4=req.getRequestDispatcher("logindiv.jsp");
                rd4.include(req, resp);
                
                RequestDispatcher rd5=req.getRequestDispatcher("footer.jsp");
                rd5.include(req, resp);
                }
            }
        } catch (Exception e) {
            try {
                con.close();
            } catch (Exception ee) {
                System.out.println(email);
                e.printStackTrace();
            }
        } finally {
            try {
                con.close();
            } catch (Exception ee) {
                System.out.println(email);
                ee.printStackTrace();
            }
        }
    }
}
