<%-- 
    Document   : postJob
    Created on : 30 Sep, 2021, 2:25:36 PM
    Author     : py742
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.parveen.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="CompanyCheckCookie"></jsp:include>
<jsp:scriptlet>
    String c_name = (String) session.getAttribute("session_c_name");
    String c_email = (String) session.getAttribute("session_c_email");
    String c_mobileno = (String) session.getAttribute("session_c_mobileno");
    String contact_person = (String) session.getAttribute("session_contact_person");
    String industry = (String) session.getAttribute("session_industry");
    String c_profile_pic = (String) session.getAttribute("session_c_profilepic");
</jsp:scriptlet>
<html>
    <script>
        function val(v)
        {
            document.getElementById(v).innerHTML = "";
        }
        function validation()
        {
            var flag = true;

            var jobProfile2 = document.regform.jobProfile1.value;
            var experience2 = document.regform.experience1.value;
            var salary2 = document.regform.salary1.value;
            var no_Of_Opening2 = document.regform.no_Of_Opening1.value;
            var location2 = document.regform.location1.value;
            var time_venue2 = document.regform.time_venue1.value;
            var Cperson_profile2 = document.regform.Cperson_profile1.value;
            var date2 = document.regform.date1.value;
            var time2 = document.regform.time1.value;
            var discription2 = document.regform.description1.value;

            var name_pattern=/^[ ]/;
            if (jobProfile2 === "" || jobProfile2.match(name_pattern))
            {
                document.getElementById('profile_error').innerHTML = "Field cannot be empty";
                flag = false;
            }

            if (experience2 === "" ||experience2.match(name_pattern))
            {
                document.getElementById('experience_error').innerHTML = "Field cannot be empty";
                flag = false;
            }

            if (salary2 === "" ||salary2.match(name_pattern))
            {
                document.getElementById('salary_error').innerHTML = "Field cannot be empty";
                flag = false;
            }
            if (no_Of_Opening2 === "" ||no_Of_Opening2.match(name_pattern))
            {
                document.getElementById('no_Of_Opening_error').innerHTML = "Field cannot be empty";
                flag = false;
            }
            /*else if(fields2==="")
             {
             alert("Please select atleast one field");
             return false;
             }*/
            if (location2 === "" ||location2.match(name_pattern))
            {
                document.getElementById('location_error').innerHTML = "Field cannot be empty";
                flag = false;
            }
            if (time_venue2 === "" ||time_venue2.match(name_pattern))
            {
                document.getElementById('time_venue_error').innerHTML = "Field cannot be empty";
                flag = false;
            }
            if (Cperson_profile2 === "" ||Cperson_profile2.match(name_pattern))
            {
                document.getElementById('cpp_error').innerHTML = "Field cannot be empty";
                flag = false;
            }
            if (date2 === "" ||date2.match(name_pattern))
            {
                document.getElementById('date_error').innerHTML = "Field cannot be empty";
                flag = false;
            }
            if (time2 === "" ||time2.match(name_pattern))
            {
                document.getElementById('time_error').innerHTML = "Field cannot be empty";
                flag = false;
            }
            if (discription2 === "" ||discription2.match(name_pattern))
            {
                document.getElementById('desc_error').innerHTML = "Field cannot be empty";
                flag = false;
            }
            return flag;


        }
    </script>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="container-fluid">
            <jsp:scriptlet>
                if (c_email == null ? c_email == null : c_email.trim().equals("null")) {
            </jsp:scriptlet>
            <jsp:include page="header.jsp"/>
            <jsp:scriptlet>
    } else {
            </jsp:scriptlet>
            <jsp:include page="c_header.jsp"/>

            <jsp:scriptlet>
        }
            </jsp:scriptlet>
            <jsp:include page="c_menubar.jsp"/>

            <div class="row">
                <div class="col-md-3">

                </div>
                <div class="col-md-6" style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                    <h2 style="color: blue; text-align:center"> Post Jobs</h2><br><br>
                    <form method="POST" name="regform" onsubmit="return validation()" action="jobpost">
                        <table >
                            
                            <input type="text" Value="jid" name="jobid" hidden="">
                            <tr>
                                <td><h4>Job Profile</h4><br></td>
                                <td><input type="text" placeholder="eg.: Java developer" name="jobProfile1" class="reglog_tf_design" onkeyup="val('profile_error')" /> <br> <span id="profile_error" style="color: red"> </span> <br></td>
                            </tr>
                            <tr>
                                <td><h4>Company</h4><br></td>
                                <td><input type="text" Value="<jsp:expression>c_name</jsp:expression>" name="company1" class="reglog_tf_design" readonly=""  style="color: #9f9d9d" /> <br><br></td>
                                </tr>
                                <tr>
                                    <td><h4>Experience</h4><br></td>
                                    <td><input type="text" placeholder="eg.:-7" name="experience1" class="reglog_tf_design"  onkeyup="val('experience_error')" /> <br> <span id="experience_error" style="color: red"> </span><br></td>
                                </tr>
                                <tr>
                                    <td><h4>Salary</h4><br></td>
                                    <td><input type="text" placeholder="eg.: Jaipur" name="salary1" class="reglog_tf_design" onkeyup="val('salary_error')" /> <br> <span id="salary_error" style="color: red"> </span><br></td>
                                </tr>
                                <tr>
                                    <td><h4>No. Of Opening</h4><br></td>
                                    <td><input type="text" placeholder="eg.:-7" name="no_Of_Opening1" class="reglog_tf_design" onkeyup="val('no_Of_Opening_error')" /> <br> <span id="no_Of_Opening_error" style="color: red"> </span><br></td>
                                </tr>
                                <tr>
                                    <td><h4>Job Location</h4><br></td>
                                    <td><input type="text" placeholder="eg.: Jaipur" name="location1" class="reglog_tf_design" onkeyup="val('location_error')" /> <br> <span id="location_error" style="color: red"> </span><br></td>
                                </tr>
                                <tr>
                                    <td><h4>Time Venue</h4><br></td>
                                    <td><input type="text" placeholder="Eg: 1st January, 2021, JW Marriot Hotel" name="time_venue1" class="reglog_tf_design"  onkeyup="val('time_venue_error')" /> <br> <span id="time_venue_error" style="color: red"> </span><br></td>
                                </tr>
                                <tr>
                                    <td><h4>Contact person profile &nbsp;</h4><br></td>
                                    <td><input type="text" placeholder="Eg: HR" name="Cperson_profile1" class="reglog_tf_design"  onkeyup="val('cpp_error')" /> <br> <span id="cpp_error" style="color: red"> </span><br></td>
                                </tr>
                                <tr>
                                    <td><h4>c_email</h4><br></td>
                                    <td><input type="text" value="<jsp:expression>c_email</jsp:expression>" name="c_email1" class="reglog_tf_design" readonly=""  style="color: #9f9d9d" /> <br><br></td>
                                </tr>
                                <tr>
                                    <td><h4>Date</h4><br></td>
                                    <td><input type="text" placeholder="Eg: 21/2/2021" name="date1" class="reglog_tf_design" onkeyup="val('date_error')" /> <br> <span id="date_error" style="color: red"> </span><br></td>
                                </tr>
                                <tr>
                                    <td><h4>Time</h4><br></td>
                                    <td><input type="text" placeholder="10:10:10" name="time1" class="reglog_tf_design" onkeyup="val('time_error')" /> <br> <span id="time_error" style="color: red"> </span><br></td>
                                </tr>
                                <tr>
                                    <td><h4>Description</h4><br></td>
                                    <td><textarea placeholder="Eg:Req. good knowledhe of JSP, Servlet, JDBC, any framework like spring & hibernate, web services knowledge, have worked on live projects, have good knowledge of IBM servers " name="description1" class="reglog_tf_design" style="height: 100px" onkeyup="val('desc_error')"></textarea> <br> <span id="desc_error" style="color: red"> </span></td>
                                </tr>

                            </table>
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <input type="submit" value="Post" class="btn btn-success"/>
                                    <input type="reset" value="Reset" class="btn btn-primary"/>
                                </div>
                                <div class="col-md-4"></div>
                            </div>
                        </form>
                    </div>     
                    <div class="col-md-3">

                    </div>

                </div>

            <jsp:include page="footer.jsp" />
        </div>



    </body>
</html>