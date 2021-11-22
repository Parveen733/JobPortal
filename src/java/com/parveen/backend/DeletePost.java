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
public class DeletePost extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        
        String jid= req.getParameter("jobid");
         Connection con=null;
         try{
             con=DbConnection.getConnect();
             con.setAutoCommit(false);
             /*PreparedStatement ps= con.prepareStatement("delete from post_jobs where id=?");
             ps.setString(1, jid);
             int i1=ps.executeUpdate();*/
             
             PreparedStatement ps1= con.prepareStatement("delete from jobs where id=?");
             ps1.setString(1, jid);
             int i2= ps1.executeUpdate();
             
             if( i2>0){
                 con.commit();
                 resp.sendRedirect("my_post_job.jsp");
             }
             else{
                 con.rollback();
             }
         }
         catch(Exception e){
             try{
                 
             }
             catch(Exception ee){
                 
             }
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
