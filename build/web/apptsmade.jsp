<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointments made</title>
        <link  rel="stylesheet" type="text/css" href="css/admincss.css">
        <style>
            .menu-icons li{
                display: inline;
            }
            .menu-icons .menu{
                display: inline;
                margin-left: 10px;
            }
            .menu-icons .menu .ddmenu a{
                margin-top: 5px;                
            } 
            .menu-icons .menu .ddmenu .dropl{  
                height: 30px;
                border-style: solid;                
                border-width: thin;
                background-color: #aed6f1;
            }
            .menu-icons .menu .ddmenu .dropl:hover{                 
                background-color:  #fff ;
            }
            .userprofile button{
                border-radius: 7px;
                border-width: thin;
                font-weight: bold;
                background-color: #87AFC7;
                width: 120px;
                margin-left: 45%;
                height: 40px;
                margin-bottom: 20px;
                margin-top: 20px;
            }
            

            .bg {
                animation:slide 3s ease-in-out infinite alternate;
                background-image: linear-gradient(-60deg, #9F2B68 50%, #F88379 50%);
                bottom:0;
                left:-50%;
                opacity:.5;
                position:fixed;
                right:-50%;
                top:0;
                z-index:-1;
            }

            .bg2 {
                animation-direction:alternate-reverse;
                animation-duration:4s;
            }

            .bg3 {
                animation-duration:5s;
            }

            h2{
                animation: zoom-in-zoom-out 5s ease infinite;
            }


            @keyframes zoom-in-zoom-out {
                0% {
                    transform: scale(1, 1);
                    color:#800020;
                }
                30%{
                    transform: scale(1.07, 1.07);
                    color:#702963;
                    text-shadow:0 0 4px #702963;
                }
                100% {
                    transform: scale(1, 1);
                    color:#AA336A;
                }
            }
            @keyframes slide {
                0% {
                    transform:translateX(-25%);
                }
                100% {
                    transform:translateX(25%);
                }
            }

        </style>
    </head>
    <body>
        <nav>
            <div class="logo">
                <a href="index.html" target="_self" style="color:white;font-weight: bold;">Be-Well</a>
            </div>
            <ul class="menu-icons">    
                <li> 
                    <div class="menu">
                        <a href="#" >Hello! <%out.print(session.getAttribute("userid"));%></a>
                        <div class="ddmenu">                            
                            <div class="dropl"><a href="admin.jsp" >My Profile</a><br></div>
                            <div class="dropl" style="height:40px;"><a href="changepassword.html" >Change Password</a><br></div>
                            <div class="dropl"><a href="logout.jsp" target="_self">Logout</a></div>
                        </div>
                    </div>
                </li>
                <li>                     
                    <div class="menu" >
                        <a href="#" ">Doctor</a>
                        <div class="ddmenu" >
                            <div class="dropl"><a onclick="addoc()"> Add Doctor </a><br></div>
                            <div class="dropl"><a onclick="doclist()"> Doctor List </a></div>              
                        </div>
                    </div>
                </li>              
                <li> 
                    <div class="menu">
                        <a href="#" >Nurse</a>
                        <div class="ddmenu">
                            <div class="dropl"><a onclick="addnurse()"> Add Nurse </a><br></div>
                            <div class="dropl"><a onclick="nurselist()"> Nurse List </a></div>              
                        </div>
                    </div>
                </li>
                <li> 
                    <div class="menu">
                        <a href="#" >Patient</a>
                        <div class="ddmenu">
                            <div class="dropl"><a onclick="addpat()"> Add Patient </a><br></div>
                            <div class="dropl"><a onclick="patlist()"> Patient List </a></div>              
                        </div>
                    </div>
                </li>  
                <li> 
                    <div class="menu">
                        <a href="#" >Bed</a>
                        <div class="ddmenu">
                            <div class="dropl"><a onclick="addbed()"> Add Bed </a><br></div>
                            <div class="dropl"><a onclick="bedlist()"> Bed List </a></div>
                        </div>
                    </div>
                </li>


                <li> <a href="admin.jsp" target="_self" >Dashboard</a></li> 
                <li> <a href="bookappt.jsp">Book Appointment</a></li>   
                <li> <a href="apptsmade.jsp">Appointments made</a></li>
                <li> <a href="feedback.html">Contact Us</a></li> 
            </ul>
        </nav>

        <div class="bg"></div>
        <div class="bg bg2"></div>
        <div class="bg bg3"></div>
        <%@page import="java.sql.*, java.util.*" %>
        <div class="content" style="margin-top:60px;">
                <h2>Appointment List</h2>

                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from bookapp ");
                %>
                <table>
                    <thead>
                    <th>Appointments</th>                
                    <th>Patient ID</th> 
                    <th>Date</th>
                    <th>Email</th> 
                    <th>Contact number</th> 
                    <th>Doctor ID</th>
                    </thead>
                    <%  while (rs.next()) {
                            String firstname = rs.getString("firstname");
                            String lastname = rs.getString("lastname");
                            String email = rs.getString("email");
                            String contactnumber = rs.getString("contactnumber");
                            String puid = rs.getString("userid");
                            String duid = rs.getString("duserid");
                            String date = rs.getString("date");
                    %>
                    <tr>
                        <td><%out.println(firstname + " " + lastname);%></td>
                        <td><%out.println(puid);%></td>
                        <td><%out.println(date);%></td>
                        <td><%out.println(email);%></td>
                        <td><%out.println(contactnumber);%></td>
                        <td><%out.println(duid);%></td>
                    </tr>
                    <%}%>
                </table>
                <%
                    } catch (Exception e) {
                        out.println(e);
                    }
                %>
            </div>
            <footer>
            <ul class="social-icons">
                <li><a href="#"><ion-icon name="logo-facebook"></ion-icon></a></li>
                <li><a href="#"><ion-icon name="logo-instagram"></ion-icon></a></li>
                <li><a href="#"><ion-icon name="logo-linkedin"></ion-icon></a></li>
                <li><a href="#"><ion-icon name="logo-twitter"></ion-icon></a></li>
            </ul>
            <ul class="menu">
                <li><a href="index.html">Home |</a></li>
                <li><a href="findadoc.jsp">Find a Doctor |</a></li>
                <li><a href="feedback.html">Contact Us</a></li>
            </ul>
            <p>@2022 Be-Well Management system | All Rights Reserved</p>
        </footer>
        <!-- footer section ends  -->
        
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script>
            var slideImg = document.getElementById("slideImg");
            var images = new Array(
                    "images/slider/1.jpg",
                    "images/slider/5.jpg"
                    );
            var len = images.length;
            var i = 0;
            function slider() {
                if (i > len - 1) {
                    i = 0;
                }
                slideImg.src = images[i];
                i++;
                setTimeout('slider()', 3000);
            }


        </script>
    </body>
</html>
