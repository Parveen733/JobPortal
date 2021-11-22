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
public class SendEmailOtp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String mobileno = req.getParameter("mob1");

        String email = req.getParameter("email1");
        Connection con = null;

        try {
            con = DbConnection.getConnect();
            if (mobileno != null) {

                PreparedStatement ps = con.prepareStatement("select * from company_reg where c_email=? and c_mobile_no=?");
                ps.setString(1, email);
                ps.setString(2, mobileno);

                ResultSet rs = ps.executeQuery();
                if (rs.next()) {

                    Random rng = new Random();
                    int min = 000001;
                    int max = 999999;
                    int upperBound = max - min + 1; // upper bound is exclusive, so +1
                    int num = min + rng.nextInt(upperBound);
                    String message = Integer.toString(num);
                    
                    String message1 = "Your Otp is " + message;
                    HttpSession session= req.getSession();
                    session.setAttribute("session_otp", message);
                    session.setAttribute("session_emailF", email);
                    session.setAttribute("session_mobileno", mobileno);
                    SendConfirmationMail.sendConfirmationMail(email, "Your otp", message1);
                    
                    resp.sendRedirect("otpsuccess.jsp");

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
                PreparedStatement ps = con.prepareStatement("select * from register where email=?");
                ps.setString(1, email);
                

                ResultSet rs = ps.executeQuery();
                if (rs.next()) {

                    Random rng = new Random();
                    int min = 000001;
                    int max = 999999;
                    int upperBound = max - min + 1; // upper bound is exclusive, so +1
                    int num = min + rng.nextInt(upperBound);
                    String message = Integer.toString(num);
                    HttpSession session= req.getSession();
                    session.setAttribute("session_otp", message);
                    session.setAttribute("session_email", email);
                    String message1 = "Your Otp is " + message;
                    SendConfirmationMail.sendConfirmationMail(email, "Your otp", message1);
                    
                    resp.sendRedirect("otpsuccess.jsp");

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
