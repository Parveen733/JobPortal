<%-- 
    Document   : forget
    Created on : 18 Oct, 2021, 11:40:21 AM
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
    </head>
    <body>
        <div class="container-fluid">
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="c_menubar.jsp"></jsp:include>
                <br>
                <br><div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <form action="otpsent" method="POST">

                            Email &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email1" placeholder="Insert your Register Email" class="textfield_design"><br><br>
                            Mobile No. <input type="text" name="mob1" placeholder="Insert your Register Mobile no." class="textfield_design"><br><br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="btn btn-primary" value="Send OTP">

                        </form>
                    </div>
                    <div class="col-md-3"></div>
                </div>
                <br>
                <br>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
