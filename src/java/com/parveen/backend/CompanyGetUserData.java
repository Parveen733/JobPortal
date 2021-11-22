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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Deepak
 */
public class CompanyGetUserData extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doService(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doService(req, resp);
    }

    protected void doService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String c_email2;
        try {
            c_email2 = req.getParameter("c_email1");

            if (c_email2 == null || c_email2.equals("null")) {
                c_email2 = (String) req.getAttribute("c_email1");
            }
        } catch (Exception e) {
            c_email2 = (String) req.getAttribute("c_email1");
        }

        String c_name2 = "", c_mobileno2 = "", contact_person2 = "", industry2 = "", c_pass2 = "";

        Connection con = null;
        try {
            con = DbConnection.getConnect();

            PreparedStatement ps = con.prepareStatement("select * from company_reg where c_email=?");

            ps.setString(1, c_email2);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c_name2 = rs.getString("c_name");
                c_mobileno2 = rs.getString("c_mobile_no");
                contact_person2 = rs.getString("contact_person");
                industry2 = rs.getString("industry");
                c_pass2 = rs.getString("c_password");

                HttpSession session = req.getSession();
                session.setAttribute("session_c_name", c_name2);
                session.setAttribute("session_c_email", c_email2);
                session.setAttribute("session_c_mobile_no", c_mobileno2);
                session.setAttribute("session_contact_person", contact_person2);
                session.setAttribute("session_industry", industry2);
                session.setAttribute("session_c_pass", c_pass2);

                /* String title="", skills="";
                 PreparedStatement ps2=con.prepareStatement("select * from about_user where email=?");
                 ps2.setString(1, email2);
                 ResultSet rs2=ps2.executeQuery();
                 while(rs2.next())
                 {
                 title=rs2.getString("about");
                 skills=rs2.getString("skills");
                 }
                
                 session.setAttribute("session_title", title);
                 session.setAttribute("session_skills", skills);*/
                String c_filename = "", c_pid = "";
                PreparedStatement ps3 = con.prepareStatement("select * from company_profile_pics where c_email=?");
                ps3.setString(1, c_email2);
                ResultSet rs3 = ps3.executeQuery();
                while (rs3.next()) {

                    c_filename = rs3.getString("path");
                    c_pid =rs3.getString("id");

                }
                session.setAttribute("session_c_profilepic", c_filename);
                session.setAttribute("session_c_pid", c_pid);
                resp.sendRedirect("c_profile.jsp");
              
                
            }
            
        } catch (Exception e) {
            out.print(e);
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
