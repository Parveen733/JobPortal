<%-- 
    Document   : newjsp
    Created on : 21 Sep, 2021, 10:54:04 AM
    Author     : py742
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Company Login</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
       <div class="row">
                 <div class="col-md-1"></div>
            <div class="col-md-6"> 
                <img src="images/rcomp5.png" height="500"/>
            </div>
            <div class="col-md-5">
                
                    <form method="POST" action="c_login">
                        <br><h3>Login to Job4u </h3>
                        <span> New Client ?<a href="registerAsCompany.jsp"> Create Account</a></span><br><br>
                        
                        <input type="text" placeholder="Enter Email" name="c_email1" class="reglog_tf_design" /> <br> <br>
                        <input type="password" placeholder="Enter Password" name="pass1" class="reglog_tf_design" /> <br> <br>
                        <input type="checkbox" name="rememberme1" value="rememberme" /> Remember Me <br> <br>
                        <a href="forget.jsp"> Forget Password</a> <br><br>
                        <input type="submit" value="Login" class="btn btn-primary" /> 
                    </form>
                    
                </div>
        </div>
        
        
    </body>
</html>
