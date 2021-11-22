
<jsp:scriptlet>
    String name1=(String) session.getAttribute("session_name");
    String email1=(String) session.getAttribute("session_email");
    String c_name1=(String) session.getAttribute("session_c_name");
    String c_email1=(String) session.getAttribute("session_c_email");
</jsp:scriptlet>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>contact-Us-user</title>
    </head>
    <body>
        <div class="reg_div_design">
            <form method="POST" action="ContactUs">
                <br> <h2> Contact Us </h2> <br>
                
                 <jsp:scriptlet>
            
            if (c_email1 == null ? c_email1 == null : c_email1.trim().equals("null")) {
                
            </jsp:scriptlet>
                <input type="text" placeholder="Enter Name" name="name1" value="<jsp:expression>name1</jsp:expression>" readonly="" class="reglog_tf_design" /> <br> <br>
                <input type="text" placeholder="Enter Email" name="email1" value="<jsp:expression>email1</jsp:expression>" readonly="" class="reglog_tf_design" /> <br> <br>
                 <jsp:scriptlet>
            }else{
            </jsp:scriptlet>
                 <input type="text" placeholder="Enter Name" name="name1" value="<jsp:expression>c_name1</jsp:expression>" readonly="" class="reglog_tf_design" /> <br> <br>
                <input type="text" placeholder="Enter Email" name="email1" value="<jsp:expression>c_email1</jsp:expression>" readonly="" class="reglog_tf_design" /> <br> <br>
                <jsp:scriptlet>
            }
            </jsp:scriptlet>
                <input type="text" placeholder="Enter Subject" name="subject1" class="reglog_tf_design" /> <br> <br>
                <textarea placeholder="Enter Message" name="message1" style="padding: 5px 10px; width: 350px; height: 100px; border-radius: 5px; border: 1px solid gray;"></textarea> <br> <br>
                <input type="submit" value="Send" class="btn btn-primary" /> <br> <br> <br>
            </form>
        </div>
    </body>
</html>
