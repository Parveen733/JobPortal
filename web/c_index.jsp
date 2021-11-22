<%-- 
    Document   : c_index
    Created on : 21 Sep, 2021, 2:51:46 PM
    Author     : py742
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:include page="CompanyCheckCookie"></jsp:include>

<jsp:scriptlet>
   String c_email = (String) session.getAttribute("session_c_email");
</jsp:scriptlet>

<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Job4u.com</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <div class="container-fluid">
       
            
            <jsp:scriptlet>
             
                if (c_email == null ? c_email == null : c_email.trim().equals("null")) {
            </jsp:scriptlet>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
            } else {
            </jsp:scriptlet>
            <jsp:include page="c_header.jsp"></jsp:include>
            <jsp:scriptlet>
                }
               
            </jsp:scriptlet>
            <jsp:include page="c_menubar.jsp"></jsp:include>

            <jsp:include page="indexdiv.jsp"></jsp:include>
               
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>