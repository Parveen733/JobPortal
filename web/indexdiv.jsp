<%-- 
    Document   : indexdiv
    Created on : 21 Sep, 2021, 3:04:42 PM
    Author     : py742
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.parveen.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
       
        <div class="row carousel slide" style="border: 2px solid black;" id="demo" data-ride="carousel">
             
              

                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                </ul>

                <!-- The slideshow -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/job-portal.jpg" width="1362"/>
                    </div>
                    <div class="carousel-item">
                        <img src="images/career-banner.png" width="1362"/>
                    </div>
                    <div class="carousel-item">
                        <img src="images/job-banner.jpg" width="1362"/>
                    </div>
                
             </div>
            
                <!-- Left and right controls             -->

               <a class="carousel-control-prev " href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>  
             
         </div>

            <!-- ==============search job div starts================= -->
             <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 job_search_div">
                        <h3> Find A Job at India's No.1 Job Site </h3>
                        <form action="search-jobs-result.jsp" method="POST">
                            <input type="text" name="technology1" placeholder="Technology..." class="textfield_design" />
                            <input type="text" name="location1" placeholder="Location..." class="textfield_design" />
                            <input type="submit" value="Search" class="btn btn-primary" />
                        </form>
                    </div>
                    <div class="col-md-2"></div>
                </div>
        
            <!-- ==============search job div ends================= -->


        
        <div class="row">
            <div class="col-md-3">
                <ul>
                    <li> <a href=""> Smart Programming </a> </li>
                    <li> <a href=""> Infosys </a> </li>
                    <li> <a href=""> Wipro </a> </li>
                    <li> <a href=""> IBM </a> </li>
                    <li> <a href=""> Google </a> </li>
                </ul>
            </div>
            <div class="col-md-6" style="background-color: #f9f8f9; margin-top: 10px">
                <div class="row">
                    <jsp:scriptlet>
                            String company =(String) session.getAttribute("session_c_name");
                            String id, job_profile , experience, description, date1, time1;
                            try {
                                Connection con = DbConnection.getConnect();

                                PreparedStatement ps = con.prepareStatement("select * from jobs");
                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                                    id = rs.getString("id");
                                    job_profile = rs.getString("job_profile");
                                    company = rs.getString("company");
                                    experience = rs.getString("experience");
                                    description = rs.getString("description");
                                    date1 = rs.getString("date1");
                                    time1 = rs.getString("time1");
                                     
                    </jsp:scriptlet>

                    <div class="col-md-12 display_job_div">
                        <b> <jsp:expression>job_profile</jsp:expression></b> <span style="font-size: 12px; color: #9f9d9d; float: right"> (<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span> <br>
                        <span><span class="glyphicon glyphicon-home"></span> <span style="color: #9f9d9d"> Company : </span> <jsp:expression>company</jsp:expression> </span> <br>
                        <span> <span class="glyphicon glyphicon-book"></span> <span style="color: #9f9d9d"> Experience : </span> <jsp:expression>experience</jsp:expression> </span> <br>
                        <span> <span class="glyphicon glyphicon-file"></span>  <span style="color: #9f9d9d"> Job Description : </span> <jsp:expression>description</jsp:expression> </span> <br>
                        <br>
                            <input type="text" value="<jsp:expression>id</jsp:expression>" name="jobid" hidden="">
                            <a href="job-description.jsp?jid=<jsp:expression>id</jsp:expression>"> See Full Details </a>
                        
                        
                        </div>

                    <jsp:scriptlet>
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                    </jsp:scriptlet>

                </div>
            </div>
            <div class="col-md-3">
                <ul>
                    <li> <a href=""> Smart Programming </a> </li>
                    <li> <a href=""> Infosys </a> </li>
                    <li> <a href=""> Wipro </a> </li>
                    <li> <a href=""> IBM </a> </li>
                    <li> <a href=""> Google </a> </li>
                </ul>
            </div>
        
        </div>


    </body>
</html>
