<%@ page language="java" contentType="text/html; charset=ISO-8859-1"          pageEncoding="ISO-8859-1"%>

<jsp:scriptlet>
    String c_name=(String)session.getAttribute("session_c_name");
    String c_profile_pic = (String) session.getAttribute("session_c_profilepic");
    String email=(String)session.getAttribute("session_cemail");
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title> </title>
        
    </head>
    <body>
        <div class="row header_bg">
            <div class="col-md-4">
                <a href="c_index.jsp">
                    <img src="images/job4u.png" height="70" />
                    <span class="logo_text_design">.com </span>
                </a>
            </div>
            <div class="col-md-6">
                <span style="color: yellow"> <a href="c_profile.jsp" style="text-decoration: none; color: white; font-size: 18px"> <img src="company-logo/<jsp:expression>c_profile_pic</jsp:expression>" height="30" style="border-radius: 15px"/> <jsp:expression> c_name </jsp:expression> </a> </span>
            </div>
            <div class="col-md-2">
                <a href="C_Logout" class="hyperlinks_design"> Logout </a>
            </div>
        </div>
    </body>
</html>