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
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Register extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        String name2=req.getParameter("name1");
        String email2=req.getParameter("email1");
        String pass2=req.getParameter("pass1");
        String gender2=req.getParameter("gender1");
        String[] field2=req.getParameterValues("field1");
        String city2=req.getParameter("city1");
         
        String fields2="";
        if(field2!=null)
        {
            for(String s:field2)
            {
                fields2=fields2+","+s;
            }
        }
         
        Connection con=null;
        try
        {
             
            con=DbConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("select * from register where email=?");
            ps.setString(1, email2);
            ResultSet rs=ps.executeQuery();
            
            if(rs.next()){
                RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
                rd1.include(req, resp);
                RequestDispatcher rd2=req.getRequestDispatcher("menubar.jsp");
                rd2.include(req, resp);
                req.setAttribute("error_message", "Email id Already Registered...!!");
                RequestDispatcher rd3=req.getRequestDispatcher("error.jsp");
                rd3.include(req, resp);
                RequestDispatcher rd4=req.getRequestDispatcher("regdiv.jsp");
                rd4.include(req, resp);
                RequestDispatcher rd5=req.getRequestDispatcher("footer.jsp");
                rd5.include(req, resp);
            }
            else{
               con.setAutoCommit(false);
            
            
            PreparedStatement ps1=con.prepareStatement("insert into register(name, email, password, gender, field, city) values(?,?,?,?,?,?)");
            ps1.setString(1, name2);
            ps1.setString(2, email2);
            ps1.setString(3, pass2);
            ps1.setString(4, gender2);
            ps1.setString(5, fields2);
            ps1.setString(6, city2);
            int i1=ps1.executeUpdate();
            
            PreparedStatement ps2=con.prepareStatement("insert into about_user(email, about, skills) values(?,?,?)");
            ps2.setString(1, email2);
            ps2.setString(2, "");
            ps2.setString(3, "");
            int i2=ps2.executeUpdate();
            // INSERT DATA OF COMPANY
           /* PreparedStatement ps3=con.prepareStatement("insert into about_company(email, about, skills) values(?,?,?)");
            ps3.setString(1, email2);
            ps3.setString(2, "");
            ps3.setString(3, "");
            int i2=ps3.executeUpdate();*/
            
            PreparedStatement ps4=con.prepareStatement("insert into profile_pics(email, path) values(?,?)");
            ps4.setString(1, email2);
            ps4.setString(2, "profilepic.png");
//                System.out.println("12");
            int i4=ps4.executeUpdate();
            
            if(i1>0 && i2>0 && i4>0)
            {
                con.commit();
                HttpSession session=req.getSession();
                session.setAttribute("session_name", name2);
                session.setAttribute("session_email", email2);
                session.setAttribute("session_gender", gender2);
                session.setAttribute("session_city", city2);
                session.setAttribute("session_fields", field2);
                
                session.setAttribute("session_title", "");
                session.setAttribute("session_skills", "");
                
                session.setAttribute("session_profilepic", "profilepic.png");
                
                resp.sendRedirect("profile.jsp");
            }
            else
            {
                con.rollback();
                out.println("Failed");
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

//create table register(id INT AUTO_INCREMENT, name VARCHAR(30) NOT NULL, email VARCHAR(100) NOT NULL, password VARCHAR(16) NOT NULL, gender VARCHAR(6) NOT NULL, field VARCHAR(200) NOT NULL, city VARCHAR(20) NOT NULL, PRIMARY KEY(id));