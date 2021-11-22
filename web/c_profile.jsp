<%---
    Document   : c_profile
    Created on : 20 Sep, 2021, 12:13:26 PM
    Author     : py742
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="CompanyCheckCookie"></jsp:include>
<jsp:scriptlet>
    String c_name = (String) session.getAttribute("session_c_name");
    String c_email=(String) session.getAttribute("session_c_email");
    String c_molibeno=(String) session.getAttribute("session_c_mobile_no");
    String contact_person=(String) session.getAttribute("session_contact_person");
    String industry=(String) session.getAttribute("session_industry");
    String c_profile_pic = (String) session.getAttribute("session_c_profilepic");
</jsp:scriptlet>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

            <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <div class="container-fluid">
            
       
         <jsp:include page="c_header.jsp" />
        <jsp:include page="c_menubar.jsp" />
        <div class="row">
            <div class="col-md-2"> </div>
            <div class="col-md-8">
                <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                    <div class="col-md-2">
                        <a href="company-edit-profile-pics.jsp" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-pencil"></span></a>
                        <img src="company-logo/<jsp:expression>c_profile_pic</jsp:expression>" height="100" style="border-radius: 50px"/>
                    </div>
                    <div class="col-md-10">
                        <h3 style="color: blue"> <jsp:expression> c_name.toUpperCase()</jsp:expression> <a href="" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-pencil"></span> </a> </h3>
                        
                        <span style="color: #acaaaa"> Email : </span> <jsp:expression>c_email</jsp:expression> <br> <br>
                        <span style="color: #acaaaa"> Contact No : </span> <jsp:expression> c_molibeno</jsp:expression> <br>
                        <span style="color: #acaaaa"> Contact Person : </span> <jsp:expression> contact_person</jsp:expression> <br>
                        <span style="color: #acaaaa"> Fields : </span> <jsp:expression> industry</jsp:expression> <br>
                        
                        
                        </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
         </div>
    </body>
</html>
