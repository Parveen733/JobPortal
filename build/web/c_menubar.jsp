<%-- 
    Document   : c_menubar
    Created on : 20 Sep, 2021, 1:00:37 PM
    Author     : py742
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<jsp:scriptlet>
    String c_email = (String) session.getAttribute("session_c_email");
</jsp:scriptlet>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body>
        <div class="row menubardiv">
            <div class="col-md-7" id="mynavbar">
                <ul>
                    <li> <a href="c_index.jsp"> Home </a> </li>
                    
                    
                    <jsp:scriptlet>
                        if (c_email == null ? c_email == null : c_email.trim().equals("null")) {
                    </jsp:scriptlet>
                        <li> <a href="postJob.jsp"> Post Jobs </a> </li>
                    <jsp:scriptlet>
                    } else {
                    </jsp:scriptlet>
                        <li> <a href="postJob.jsp"> Post Jobs </a> </li>
                        <li> <a href="my_post_job.jsp"> My Post Jobs </a> </li>
                    <jsp:scriptlet>
                        }
                    </jsp:scriptlet>
                </ul>
            </div>
            <div class="col-md-5" id="mynavbar">
                <ul>
                    <li> <a href="about-us.jsp"> About Us </a> </li>
                    <li> <a href="contact-us.jsp"> Contact Us </a> </li>
                </ul>
            </div>
        </div>
    </body>
</html>