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
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class JobPost extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String job_profile2 = req.getParameter("jobProfile1");
        String company2 = req.getParameter("company1");
        String experience2 = req.getParameter("experience1");
        String salary2 = req.getParameter("salary1");
        String no_of_openings2 = req.getParameter("no_Of_Opening1");
        String location2 = req.getParameter("location1");
        String time_venue2 = req.getParameter("time_venue1");
        String description2 = req.getParameter("description1");
        String c_email2 = req.getParameter("c_email1");
        String c_person_profile2 = req.getParameter("Cperson_profile1");
        String date2 = req.getParameter("date1");
        String time2 = req.getParameter("time1");
        String jid = req.getParameter("jid");
        
        System.out.println(jid);

        Date d = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
        String date1 = sdf1.format(d);
        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
        String time1 = sdf2.format(d);
        

        

        Connection con = null;
        try {
            con = DbConnection.getConnect();
            con.setAutoCommit(false);
            PreparedStatement ps1 = con.prepareStatement("insert into jobs(job_profile,company, experience, salary, no_of_openings, job_location, time_venue,description,c_email, c_person_profile, date1, time1) values(?,?,?,?,?,?,?,?,?,?,?,?)");

            ps1.setString(1, job_profile2);
            ps1.setString(2, company2);
            ps1.setString(3, experience2);
            ps1.setString(4, salary2);
            ps1.setString(5, no_of_openings2);
            ps1.setString(6, location2);
            ps1.setString(7, time_venue2);
            ps1.setString(8, description2);
            ps1.setString(9, c_email2);
            ps1.setString(10, c_person_profile2);
            ps1.setString(11, date2);
            ps1.setString(12, time2);

            int i1 = ps1.executeUpdate();
           
           
            if (i1 > 0) {
                con.commit();
                              
                RequestDispatcher rd = req.getRequestDispatcher("CompanyGetUserData");
                rd.include(req, resp);
                //RequestDispatcher rd1= req.getRequestDispatcher("Jobdesc");
                //rd1.include(req, resp);
                req.setAttribute("success_message", "You have successfully Post job...!!");

                RequestDispatcher rd2 = req.getRequestDispatcher("success.jsp");
                rd2.include(req, resp);
                resp.sendRedirect("my_post_job.jsp");

            } else {
                con.rollback();

                req.setAttribute("error_message", "Job not post due to some error...!!");

                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);

              
            }

        } catch (Exception e) {
            try {
                con.rollback();

                req.setAttribute("error_message", "Job not posted due to some error...!!");

                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);

            } catch (Exception ee) {
                ee.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

}
