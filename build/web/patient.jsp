<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" type="text/css" href="css/admincss.css">
        <title>Patient</title>
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
                width: 100px;
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
                background-image: linear-gradient(-60deg, #FFAC1C 50%, #F2D2BD 50%);
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
            .profile h2{
                animation: zoom-in-zoom-out 5s ease infinite;
            }


            @keyframes zoom-in-zoom-out {
                0% {
                    transform: scale(1, 1);
                    color:#F2D2BD;
                }
                30%{
                    transform: scale(1.07, 1.07);
                    color:#FFAC1C;
                    text-shadow:0 0 4px #FFAC1C;
                }
                100% {
                    transform: scale(1, 1);
                    color:#E97451;
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
    <body style="background-color: pink;">
        <nav>
            <div class="logo">
                <a href="index.html" target="_self" style="color:white;font-weight: bold;">Be-Well</a>
            </div>
            <ul class="menu-icons">  
                <li> <a href="patient.jsp" target="_self" >Dashboard</a></li>
                <li> <a onclick="doclist()" style="cursor:pointer;"> Doctor List </a></li> 
                <li> <a onclick="bedlist()" style="cursor:pointer;"> Bed List </a></li>
                <li> <a onclick="patappts()" style="cursor:pointer;">My Appointments</a></li>
                <li> <a href="bookapptform.jsp" target="_blank">Book Appointment</a></li>   
                <li> <a href="feedback.html" target="_blank">Contact Us</a></li> 
                <li> 
                    <div class="menu">
                        <a href="#" >Hello! <%out.print(session.getAttribute("userid"));%></a>
                        <div class="ddmenu" style="width:150px;">
                            <div class="dropl"><a href="patient.jsp" >My Profile</a><br></div>
                            <div class="dropl" style="height:40px;"><a href="changepassword.html" >Change Password</a><br></div>
                            <div class="dropl"><a href="logout.jsp" target="_self">Logout</a></div>
                        </div>
                    </div>
                </li>
            </ul>
        </nav>

        <div class="bg"></div>
        <div class="bg bg2"></div>
        <div class="bg bg3"></div>

        <%@page import="java.sql.*, java.util.*" %>
        <%

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from patient where userid='" + session.getAttribute("userid") + "'");

                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery("select floor(datediff(current_date(),dob)/365) as age from patient where userid='" + session.getAttribute("userid") + "'");

                String userid = "";
                String firstname = "";
                String lastname = "";
                String email = "";
                String contactnumber = "";
                String gender = "";
                String address = "";
                String bloodgrp = "";
                String dob = "";
                String age = "";

                while (rs.next()) {
                    userid = rs.getString("userid");
                    firstname = rs.getString("firstname");
                    lastname = rs.getString("lastname");
                    email = rs.getString("email");
                    contactnumber = rs.getString("contactnumber");
                    gender = rs.getString("gender");
                    address = rs.getString("address");
                    bloodgrp = rs.getString("bloodgrp");
                    dob = rs.getString("dob");
                }
                while (rs2.next()) {
                    age = rs2.getString("age");
                }

        %>
        <div id="userpro" class="userprofile" style="margin-top:60px;width:60%;margin-left: 20%;margin-right: 20%;">
            <%if (gender.equals("f")) {
            %> <img src="images/girlp.png" style="width:100px;height: 100px; margin-left: 42%;margin-top: 20px;">
            <%} else {
            %> <img src="images/boyp.png" style="width:130px;height: 130px;margin-left: 42%;margin-top: 20px;">
            <%}%>
            <h2>Welcome! <% out.print(firstname); %></h2>
            <div class="usercontent"> 

                <div class="row">
                    <div class="cols">First Name </div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(firstname); %></div>
                </div>

                <div class="row">
                    <div class="cols">Last Name </div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(lastname); %></div>
                </div>

                <div class="row">
                    <div class="cols">User Type </div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print("Patient"); %></div>
                </div>

                <div class="row">
                    <div class="cols">Email</div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(email); %></div>
                </div>

                <div class="row">
                    <div class="cols">Contact Number</div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(contactnumber); %></div>
                </div>

                <div class="row">
                    <div class="cols">Date of Birth : </div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(dob); %></div>
                </div>

                <div class="row">
                    <div class="cols">Age : </div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(age); %></div>
                </div>

                <div class="row">
                    <div class="cols">Gender</div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(gender); %></div>
                </div>
                <div class="row">
                    <div class="cols">Address</div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(address); %></div>
                </div>
                <div class="row">
                    <div class="cols">Blood Type</div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(bloodgrp); %></div>
                </div>
            </div>

            <button onclick="udpatpro()" type="button" id="update">Update</button> 
            <%
                } catch (Exception e) {
                    out.println(e);
                }
            %>
        </div>

        <div id="udpatpro" style="display: none;width:60%;margin-left: 20%;margin-right: 20%;" >

            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from patient where userid='" + session.getAttribute("userid") + "'");

                    String firstname = "";
                    String gender = "";

                    while (rs.next()) {
                        firstname = rs.getString("firstname");
                        gender = rs.getString("gender");
                    }

            %>

            <div class="userprofile" style="margin-top:60px;">
                <h2>Welcome! <% out.print(firstname); %></h2>

                <form oninput="return validation()" action="patupdateDB.jsp" method="post">
                    <div class="usercontent">      

                        <div class="row">
                            <div class="cols">First Name </div>
                            <div class="cols">:</div>
                            <div class="cols"><input type="text" name="firstname" id="fname" placeholder="FirstName"><br></div>
                            <span id="errorfname" style="color: red"></span>
                        </div>

                        <div class="row">
                            <div class="cols">Last Name </div>
                            <div class="cols">:</div>
                            <div class="cols"><input type="text" name="lastname" id="lname" placeholder="LastName" ><br></div>
                            <span id="errorlname" style="color: red"></span>
                        </div>

                        <div class="row">
                            <div class="cols">User Type </div>
                            <div class="cols">:</div>
                            <div class="cols"><%out.print("Patient"); %></div>
                        </div>

                        <div class="row">
                            <div class="cols">Email</div>
                            <div class="cols">:</div>
                            <div class="cols"><input type="email" name="email" id="Email" placeholder="Email" ></div>
                            <span id="erroremail" style="color: red"></span>
                        </div>

                        <div class="row">
                            <div class="cols">Contact Number</div>
                            <div class="cols">:</div>
                            <div class="cols"><input type="number" id="Contactnumber" name="contactnumber" placeholder="Contact Number" ></div>
                            <span id="errornumber" style="color: red"></span>
                        </div>

                        <div class="row">
                            <div class="cols">Date of Birth : </div>
                            <div class="cols">:</div>
                            <div class="cols"><input type="date" name="dob" class="box" style="width: 200px;"></div>
                        </div>

                        <div class="row">
                            <div class="cols">Gender</div>
                            <div class="cols">:</div>
                            <div class="cols"><%out.print(gender); %></div>
                        </div>
                        <div class="row">
                            <div class="cols">Address</div>
                            <div class="cols">:</div>
                            <div class="cols"><input type="text" name="address" id="Address" placeholder="Address" ></div>
                            <span id="erroradd" style="color: red"></span>
                        </div>
                        <div class="row">
                            <div class="cols">Blood Type</div>
                            <div class="cols">:</div>
                            <div class="cols">
                                <div class="box">
                                    <select name="bloodgrp" style="margin-top: 20px;width: 225px;height: 25px;">
                                        <option>----</option>
                                        <option>AB+</option>
                                        <option>AB-</option>
                                        <option>A-</option>
                                        <option>A+</option>
                                        <option>B-</option>
                                        <option>B+</option>
                                        <option>O-</option>
                                        <option>O+</option>
                                    </select><br>
                                </div>
                            </div>
                        </div>

                        <input type="submit" value="Save" style="background-color: #87AFC7;width: 120px;margin-left: 45%;height: 40px; margin-bottom: 20px;margin-top: 20px;">
                    </div>
                </form>

                <%
                    } catch (Exception e) {
                        out.println(e);
                    }
                %>
            </div>
        </div>


        <div id="doclist" style="display: none;">
            <div class="content" style="margin-top:60px;">
                <h2 >Doctor List</h2>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from doctor");

                %>
                <table>
                    <thead>
                    <th>User ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Contact Number</th>
                    <th>Gender</th>
                    <th>Specialization</th>
                    <!--<th>Action</th>-->
                    </thead>
                    <%  while (rs.next()) {
                            String userid = rs.getString("userid");
                            String firstname = rs.getString("firstname");
                            String lastname = rs.getString("lastname");
                            String email = rs.getString("email");
                            String contactnumber = rs.getString("contactnumber");
                            String gender = rs.getString("gender");
                            String specialization = rs.getString("specialization");

                    %>
                    <tr>
                        <td><%out.println(userid);%></td>
                        <td><%out.println(firstname);%></td>
                        <td><%out.println(lastname);%></td>
                        <td><%out.println(email);%></td>
                        <td><%out.println(contactnumber);%></td>
                        <td><%out.println(gender);%></td>
                        <td><%out.println(specialization);%></td>
                        <!--<td><button type="button" id="delete" >Delete</button><button type="button" id="update" style="background-color: #5dade2;">Update</button> </td>-->
                    </tr>
                    <%}%>

                </table>
                <%

                    } catch (Exception e) {
                        out.println(e);
                    }
                %>
            </div>
        </div>
        <div id="bedlist" style="display: none;">
            <div class="content" style="margin-top:60px;">
                <h2>Bed List</h2>
                <%                try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from bedavailability");

                %>
                <table>
                    <thead>
                    <th>Bed ID</th>
                    <th>Room Number</th>
                    <th>Room Availability</th>
                    <!--<th>Action</th>-->
                    </thead>
                    <%  while (rs.next()) {
                            String bedid = rs.getString("bedid");
                            String roomno = rs.getString("roomno");
                            String availability = rs.getString("availability");
                    %>
                    <tr>
                        <td><%out.println(bedid);%></td>
                        <td><%out.println(roomno);%></td>
                        <td><%out.println(availability);%></td>
                        <!--                    <td><button type="button" id="delete" >Delete</button>
                                                <button type="button" id="update" style="background-color: #5dade2;">Update</button> </td>-->
                    </tr>
                    <%}%>

                </table>
                <%

                    } catch (Exception e) {
                        out.println(e);
                    }


                %>
            </div>
        </div>

        <div id="patappts" style="display: none;">
            <div class="content" style="margin-top:60px;">
                <h2>Appointment List</h2>

                <%                try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from bookapp where userid='" + session.getAttribute("userid") + "'");
                %>
                <table>
                    <thead>
                    <th>Date</th>
                    <th>Appointment made with</th>                
                    </thead>
                    <%  while (rs.next()) {
                            String date = rs.getString("date");
                            String amw = rs.getString("doctorname");
                    %>
                    <tr>
                        <td><%out.println(date);%></td>
                        <td><%out.println(amw);%></td>
                    </tr>
                    <%}%>

                </table>
                <%

                    } catch (Exception e) {
                        out.println(e);
                    }


                %>

            </div>
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
        <script>
            function userpro() {
                var ad = document.getElementById("userpro");
                if (ad.style.display === "none") {
                    ad.style.display = "block";
                }
                document.getElementById("udpatpro").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("bedlist").style.display = "none";
                document.getElementById("patappts").style.display = "none";
            }
            function udpatpro() {
                var ad = document.getElementById("udpatpro");
                if (ad.style.display === "none") {
                    ad.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("bedlist").style.display = "none";
                document.getElementById("patappts").style.display = "none";
            }

            function doclist() {
                var x = document.getElementById("doclist");
                if (x.style.display === "none") {
                    x.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("udpatpro").style.display = "none";
                document.getElementById("bedlist").style.display = "none";
                document.getElementById("patappts").style.display = "none";
            }
            function bedlist() {
                var x = document.getElementById("bedlist");
                if (x.style.display === "none") {
                    x.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("udpatpro").style.display = "none";
                document.getElementById("patappts").style.display = "none";
                document.getElementById("doclist").style.display = "none";
            }
            function patappts() {
                var x = document.getElementById("patappts");
                if (x.style.display === "none") {
                    x.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("udpatpro").style.display = "none";
                document.getElementById("bedlist").style.display = "none";
                document.getElementById("doclist").style.display = "none";
            }
        </script>
        <script type="text/javascript">
            function validation() {
                var firstname = document.getElementById('fname').value;
                var lastname = document.getElementById('lname').value;
                var email = document.getElementById('Email').value;
                var number = document.getElementById('Contactnumber').value;
                var address = document.getElementById('Address').value;

                var fncheck = /^[A-Za-z]{3,30}$/;
                var lncheck = /^[A-Za-z]{3,30}$/;
                var emailcheck = /^[A-Za-z_0-9@.]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$/;
                var numbercheck = /^[6789][0-9]{9}$/;
                var addresscheck = /(\d{1,}) [a-zA-Z0-9\s]+(\.)? [a-zA-Z]+(\,)? [A-Z]{2} [0-9]{5,6}$/;

                if (fncheck.test(firstname)) {
                    document.getElementById('errorfname').innerHTML = " ";
                } else {
                    document.getElementById('errorfname').innerHTML = "Please include Upper and lower Case both";
                    return false;
                }

                if (lncheck.test(lastname)) {
                    document.getElementById('errorlname').innerHTML = " ";
                } else {
                    document.getElementById('errorlname').innerHTML = "Please include Upper and lower Case both";
                    return false;
                }

                if (emailcheck.test(email)) {
                    document.getElementById('erroremail').innerHTML = " ";
                } else {
                    document.getElementById('erroremail').innerHTML = "Invalid Email";
                }

                if (numbercheck.test(number)) {
                    document.getElementById('errornumber').innerHTML = " ";
                } else {
                    document.getElementById('errornumber').innerHTML = "Invalid mobile number";
                }
//                if (addresscheck.test(address)) {
//                    document.getElementById('erroraddress').innerHTML = " ";
//                } else {
//                    document.getElementById('erroraddress').innerHTML = "Invalid Address";
//                }
            }
        </script>

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
