<%-- 
    Document   : c_regdiv
    Created on : 20 Sep, 2021, 11:46:45 AM
    Author     : py742
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                document.getElementById(v).innerHTML = "";
            }
            function validation()
            {
                var flag = true;

                var name2 = document.regform.name1.value;
                var email2 = document.regform.c_email1.value;
                var pass2 = document.regform.pass1.value;
                var mobile2 = document.regform.mobileno1.value;
                var Cperson2 = document.regform.Cperson1.value;
                var industry2 = document.regform.industry1.value;

                var name_pattern = /^[a-zA-Z ]{3,40}$/;
                var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
                var mobile_pattern = /^\d{10}$/;

                if (!name2.match(name_pattern))
                {
                    document.getElementById('name_error').innerHTML = "Name is not properly formated";
                    flag = false;
                }
                if (name2 === "")
                {
                    document.getElementById('name_error').innerHTML = "Name cannot be empty";
                    flag = false;
                }

                if (!email2.match(email_pattern))
                {
                    document.getElementById('email_error').innerHTML = "Email is not properly formatted";
                    flag = false;
                }
                if (email2 === "")
                {
                    document.getElementById('email_error').innerHTML = "Email cannot be empty";
                    flag = false;
                }
                if (!mobile2.match(mobile_pattern))
                {
                    document.getElementById('mobile_error').innerHTML = "Mobile Number is not properly formated";
                    flag = false;
                }
                if (mobile2 === "")
                {
                    document.getElementById('mobile_error').innerHTML = "Mobile Number cannot be empty";
                    flag = false;
                }

                if (Cperson2 === "")
                {
                    document.getElementById('Cperson_error').innerHTML = "Name cannot be empty";
                    flag = false;
                }
                if (industry2 === "")
                {
                    document.getElementById('industry_error').innerHTML = "Company industry cannot be empty";
                    flag = false;
                }

                if (!pass2.match(password_pattern))
                {
                    document.getElementById('password_error').innerHTML = "Password is not properly formatted (should contain 0-9,special characters)";
                    flag = false;
                }
                if (pass2 === "")
                {
                    document.getElementById('password_error').innerHTML = "Password cannot be empty";
                    flag = false;
                }
                return flag;
            }
        </script>
    </head>
    <body>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-6">
                    <img src="images/rcomp5.png" height="500"/>
                </div>
                <div class="col-md-5">
                    <form method="post" name="regform" onsubmit="return validation()" action="regCom" >
                        <br> <h3> Create Account </h3>
                        <Span> or already registered ? <a href="loginAsCompany.jsp"> Login Now</a></span><br><br>
                        <input type="text" placeholder="Enter Company Name" name="name1" class="reglog_tf_design" onkeyup="val('name_error')" /> <br> <span id="name_error" style="color: red"> </span> <br> <br>

                        <input type="text" placeholder="Enter Email" name="c_email1" class="reglog_tf_design" onkeyup="val('email_error')" /> <br> <span id="email_error" style="color: red"> </span> <br> <br>
                        <input type="text" placeholder="Enter mobil np/ landine no." name="mobileno1" class="reglog_tf_design" onkeyup="val('mobile_error')" /> <br> <span id="mobile_error" style="color: red"> </span> <br> <br>
                        <input type="text" placeholder="Enter Contact person Name" name="Cperson1" class="reglog_tf_design" onkeyup="val('Cperson_error')" /> <br> <span id="Cperson_error" style="color: red"> </span> <br> <br>
                        <input type="text" placeholder="Company industry Name" name="industry1" class="reglog_tf_design" onkeyup="val('industry_error')" /> <br> <span id="industry_error" style="color: red"> </span> <br> <br>


                        <input type="password" placeholder="Enter Password" name="pass1" class="reglog_tf_design" onkeyup="val('password_error')" /> <br> <span id="password_error" style="color: red"> </span> <br> <br>


                        <input type="submit" value="Register" class="btn btn-primary" /> <br> <br>
                    </form>
                </div>

            </div>
        

    </body>
</html>
