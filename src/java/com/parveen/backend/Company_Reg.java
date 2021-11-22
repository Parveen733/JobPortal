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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Company_Reg extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String c_name2 = req.getParameter("name1");
        String c_email2 = req.getParameter("c_email1");
        String c_mobileno2 = req.getParameter("mobileno1");
        String c_person2 = req.getParameter("Cperson1");
        String c_industry2 = req.getParameter("industry1");
        String c_pass2 = req.getParameter("pass1");
        
        Connection con=null;
        try
        {
             
            con=DbConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("select * from company_reg where c_email=?");
            ps.setString(1, c_email2);
            ResultSet rs=ps.executeQuery();
            
            if(rs.next()){
                RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
                rd1.include(req, resp);
                RequestDispatcher rd2=req.getRequestDispatcher("c_menubar.jsp");
                rd2.include(req, resp);
                req.setAttribute("error_message", "Email id Already Registered...!!");
                RequestDispatcher rd3=req.getRequestDispatcher("error.jsp");
                rd3.include(req, resp);
                RequestDispatcher rd4=req.getRequestDispatcher("c_regdiv.jsp");
                rd4.include(req, resp);
                RequestDispatcher rd5=req.getRequestDispatcher("footer.jsp");
                rd5.include(req, resp);
            }
            else{
               con.setAutoCommit(false);
            
            
            PreparedStatement ps1=con.prepareStatement("insert into company_reg(c_name, c_email,c_mobile_no,contact_person,industry, c_password) values(?,?,?,?,?,?)");
            ps1.setString(1, c_name2);
            ps1.setString(2, c_email2);            
            ps1.setString(3, c_mobileno2);
            ps1.setString(4, c_person2);
            ps1.setString(5, c_industry2);
            ps1.setString(6, c_pass2);
            int i1=ps1.executeUpdate();
            
            
            PreparedStatement ps4=con.prepareStatement("insert into company_profile_pics(c_email, path) values(?,?)");
            ps4.setString(1, c_email2);
            ps4.setString(2, "c_profilepic.png");
            int i4=ps4.executeUpdate();
            if(i1>0 && i4>0){
                con.commit();
                HttpSession session=req.getSession();
                session.setAttribute("session_c_name", c_name2);
                session.setAttribute("session_c_email", c_email2);
                session.setAttribute("session_c_mobile_no", c_mobileno2);
                session.setAttribute("session_contact_person", c_person2);
                session.setAttribute("session_industry", c_industry2);
                session.setAttribute("session_c_pass", c_pass2);
                session.setAttribute("session_c_profilepic", "c_profilepic.png");
               
                resp.sendRedirect("c_profile.jsp");
            }
            }
        }
        catch(Exception e)
        {
            try
            {
                con.rollback();
            }
            catch(Exception ee)
            {
                ee.printStackTrace();
            }
            out.print(e);
        }
        finally
        {
            try
            {
                con.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
    }
}
