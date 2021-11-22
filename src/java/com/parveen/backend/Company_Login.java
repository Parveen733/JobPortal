/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parveen.backend;

import com.parveen.connection.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class Company_Login extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String c_email2=req.getParameter("c_email1");
        String pass2=req.getParameter("pass1");
       
        
       
        
        Connection con=null;
         
        
        try {
           
            con=DbConnection.getConnect();
            
            PreparedStatement ps = con.prepareStatement("select * from company_reg where c_email=? and c_password=?");
            
            ps.setString(1,c_email2);
            ps.setString(2,pass2);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
               
                 RequestDispatcher rd=req.getRequestDispatcher("CompanyGetUserData");
                    rd.include(req, resp);
                resp.sendRedirect("c_profile.jsp");
            }
            else{
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
        } catch (SQLException e) {
           
            e.printStackTrace();
        }
        finally{
            try{
               con.close();
            }
            catch(Exception ee){
                
            }
            
        }
    }
    
}
