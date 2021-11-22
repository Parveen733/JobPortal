<%-- 
    Document   : changepass
    Created on : 18 Oct, 2021, 4:18:18 PM
    Author     : py742
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:scriptlet>
    String otp = (String) session.getAttribute("session_otp");
    String otpvalue = request.getParameter("otpvalue");
    System.out.println(otp);
    if (otp.equals(otpvalue)) {
</jsp:scriptlet>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script>
            function val(v)
            {
                document.getElementById(v).innerHTML="";
            }
            function validation()
            {
                
                var flag=true;
                var pass2=document.passvalid.new.value;
                var passconfirm2=document.passvalid.confirm.value;
                
                var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
                
                if(!pass2.match(password_pattern)){
                    document.getElementById('password_format_error').innerHTML="Password is not properly formatted (should contain 0-9,special characters";
                    flag=false;
                }
                if(pass2==="")
                {
                    document.getElementById('password_format_error').innerHTML="Password cannot be empty";
                    flag=false;
                }
                if(pass2!==passconfirm2){
                    document.getElementById('password_error').innerHTML="Password is not matchs";
                    flag=false;
                }
                return flag;
            }
        </script>
    </head>
    <body><div class="container-fluid">
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="c_menubar.jsp"></jsp:include>
                <br>
                <br><div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <form action="changepassword" method="post" name="passvalid" onsubmit="return validation()">
                            <table>

                                <tr><td>New Password<br><br></td><td><input type="password" name="new" placeholder="Enter new Password" class="textfield_design" onkeyup="val('password_format_error')" ><br><span id="password_format_error" style="color: red"></span><br></td></tr>
                                <tr><td>Confirm Password<br><br></td><td><input type="password" placeholder="re-enter Password" name="confirm" class="textfield_design" onkeyup="val('password_error')" ><br><span id="password_error" style="color: red"> </span><br></td></tr>
                                <tr><td></td><td><input type="submit" class="btn btn-success" value="Update"></td></tr>
                            </table>
                        </form>
                    <jsp:scriptlet>
        } else {
                    </jsp:scriptlet>
                    <jsp:include page="error.jsp"></jsp:include>
                    <jsp:scriptlet>
            }
                    </jsp:scriptlet>
                </div>
                <div class="col-md-3"></div>
            </div>
            <br>
            <br>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
