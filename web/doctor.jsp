<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" type="text/css" href="css/procss.css">
        <title>Doctor</title>
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
                background-image: linear-gradient(-60deg, #355070 50%, #6d597a 50%);
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
                    color:  #2ecc71 ;
                }
                30%{
                    transform: scale(1.07, 1.07);
                    color: #8bc34a;
                    text-shadow:0 0 4px  #8bc34a;
                }
                100% {
                    transform: scale(1, 1);
                    color:#239b56;
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
                <li> <a href="doctor.jsp" target="_self" >Dashboard</a></li> 
                <li><a onclick="doclist()" style="cursor: pointer;" > Doctor List </a></li>
                <li><a onclick="nurselist()" style="cursor: pointer;"> Nurse List </a></li>
                <li> <a onclick="docappt()" style="cursor: pointer;"> Appointments made </a></li> 
                <li> <a href="feedback.html" target="_blank">Contact Us</a></li> 
                <li> 
                    <div class="menu">
                        <a href="#" >Hello! <%out.print(session.getAttribute("userid"));%></a>
                        <div class="ddmenu">
                            <div class="dropl"><a href="doctor.jsp" > My Profile </a><br></div>
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
                ResultSet rs = st.executeQuery("select * from doctor where userid='" + session.getAttribute("userid") + "'");

                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery("select floor(datediff(current_date(),dob)/365) as age from doctor where userid='" + session.getAttribute("userid") + "'");
                
                String userid = "";
                String firstname = "";
                String lastname = "";
                String email = "";
                String contactnumber = "";
                String gender = "";
                String address = "";
                String bloodgrp = "";
                String dob = "";
                String dojoin = "";
                String specialization = "";
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
                    dojoin = rs.getString("dojoin");
                    specialization = rs.getString("specialization");
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
                    <div class="cols">Full Name </div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(firstname + " " + lastname); %></div>
                </div>
                <div class="row">
                    <div class="cols">User Type </div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print("Doctor"); %></div>
                </div>

                <div class="row">
                    <div class="cols">Specialization</div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(specialization); %></div>
                </div>

                <div class="row">
                    <div class="cols">Blood Type</div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(bloodgrp); %></div>
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
                    <div class="cols">Date of Joining : </div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(dojoin); %></div>
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
                    <div class="cols">Address</div>
                    <div class="cols">:</div>
                    <div class="cols"><%out.print(address); %></div>
                </div>

                <button onclick="uddocpro()" type="button" id="update" >Update</button>
                <%
                    } catch (Exception e) {
                        out.println(e);
                    }
                %>
            </div>
        </div>

        <div id="uddocpro" style="display: none;width:60%;margin-left: 20%;margin-right: 20%;">
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from doctor where userid='" + session.getAttribute("userid") + "'");

                    String firstname = "";
                    String gender = "";

                    while (rs.next()) {
                        firstname = rs.getString("firstname");
                        gender = rs.getString("gender");
                    }

            %>

            <div class="userprofile">
                <h2>Welcome! <% out.print(firstname); %></h2>

                <form oninput="return validation()" action="docupdateDB.jsp" method="post">
                    <div class="usercontent">      

                        <div class="row">
                            <div class="cols">First Name </div>
                            <div class="cols">:</div>
                            <div class="cols"><input type="text" name="firstname" id="finame" placeholder="FirstName"><br></div>
                            <span id="errorfname" style="color: red"></span>
                        </div>

                        <div class="row">
                            <div class="cols">Last Name </div>
                            <div class="cols">:</div>
                            <div class="cols"><input type="text" name="lastname" id="laname" placeholder="LastName" ><br></div>
                            <span id="errorlname" style="color: red"></span>
                        </div>

                        <div class="row">
                            <div class="cols">User Type </div>
                            <div class="cols">:</div>
                            <div class="cols"><%out.print("Doctor"); %></div>
                        </div>

                        <div class="row">
                            <div class="cols">Specialization</div>
                            <div class="cols">:</div>
                            <div class="cols">
                                <div class="box" style="margin-bottom: 15px;">
                                    <select name="spec" style="margin-top: 20px;width: 255px;height: 25px;">
                                        <option>----</option>

                                        <%
                                            Statement st2 = con.createStatement();
                                            ResultSet rs2 = st2.executeQuery("SELECT distinct specialization FROM doctor");
                                            while (rs2.next()) {
                                                String spec = rs2.getString("specialization");
                                        %>
                                            <option><%
                                    out.print(spec);%></option>                    
                                            <%
                                                }
                                            %>                
                                    </select><br>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="cols">Blood Type</div>
                            <div class="cols">:</div>
                            <div class="cols">
                                <div class="box" style="margin-bottom: 15px;">
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
                            <div class="cols">Date of Birth : </div>
                            <div class="cols">:</div>
                            <div class="cols"><input type="date" name="dojoin" class="box" style="width: 200px;"></div>
                        </div>
                        <div class="row">
                            <div class="cols">Email</div>
                            <div class="cols">:</div>
                            <div class="cols"><input type="email" name="email" id="Emailadd" placeholder="Email" ></div>
                            <span id="erroremail" style="color: red"></span>
                        </div>

                        <div class="row">
                            <div class="cols">Contact Number</div>
                            <div class="cols">:</div>
                            <div class="cols"><input type="number" id="Cnumber" name="contactnumber" placeholder="Contact Number" ></div>
                            <span id="errornumber" style="color: red"></span>
                        </div>
                        <div class="row">
                            <div class="cols">Address</div>
                            <div class="cols">:</div>
                            <div class="cols"><input type="text" name="address" id="Add" placeholder="Address" ></div>
                            <span id="erroradd" style="color: red"></span>
                        </div>
                        <input type="submit" value="Save" style="border-width: thin;border-radius: 7px; font-weight: bold;background-color: #87AFC7;width: 120px;margin-left: 45%;height: 40px; margin-bottom: 20px;margin-top: 20px;">
                    </div>
                </form>

                <%
                    } catch (Exception e) {
                        out.println(e);
                    }
                %>
            </div>
        </div>

        <div id="doclist" style="display: none;margin-top: 60px;">
            <div class="content">
                <h2>Doctor List</h2>
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
                    <th>Blood Group</th>
                    </thead>
                    <%  while (rs.next()) {
                            String userid = rs.getString("userid");
                            String firstname = rs.getString("firstname");
                            String lastname = rs.getString("lastname");
                            String email = rs.getString("email");
                            String contactnumber = rs.getString("contactnumber");
                            String gender = rs.getString("gender");
                            String specialization = rs.getString("specialization");
                            String bloodgrp = rs.getString("bloodgrp");

                    %>
                    <tr>
                        <td><%out.println(userid);%></td>
                        <td><%out.println(firstname);%></td>
                        <td><%out.println(lastname);%></td>
                        <td><%out.println(email);%></td>
                        <td><%out.println(contactnumber);%></td>
                        <td><%out.println(gender);%></td>
                        <td><%out.println(specialization);%></td>
                        <td><%out.println(bloodgrp);%></td>

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

        <div id="nurselist" style="display: none;margin-top: 60px;">
            <div class="content">
                <h2>Nurse List</h2>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from nurse");

                %>
                <table>
                    <thead>
                    <th>User ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Contact Number</th>
                    <th>Gender</th>
                    <th>Blood Group</th>
                    </thead>
                    <%  while (rs.next()) {
                            String userid = rs.getString("userid");
                            String firstname = rs.getString("firstname");
                            String lastname = rs.getString("lastname");
                            String email = rs.getString("email");
                            String contactnumber = rs.getString("contactnumber");
                            String gender = rs.getString("gender");
                            String bloodgrp = rs.getString("bloodgrp");

                    %>
                    <tr>
                        <td><%out.println(userid);%></td>
                        <td><%out.println(firstname);%></td>
                        <td><%out.println(lastname);%></td>
                        <td><%out.println(email);%></td>
                        <td><%out.println(contactnumber);%></td>
                        <td><%out.println(gender);%></td>
                        <td><%out.println(bloodgrp);%></td>
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



        <div id="docappt" style="display: none;margin-top: 60px;">
            <div class="content">
                <h2>Appointment List</h2>

                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from bookapp where duserid='" + session.getAttribute("userid") + "'");
                %>
                <table>
                    <thead>
                    <th>Appointment made with</th>                
                    <th>Patient ID</th> 
                    <th>Date</th>
                    <th>Email</th> 
                    <th>Contact number</th> 
                    </thead>
                    <%  while (rs.next()) {
                            String firstname = rs.getString("firstname");
                            String lastname = rs.getString("lastname");
                            String email = rs.getString("email");
                            String contactnumber = rs.getString("contactnumber");
                            String puid = rs.getString("userid");
                            String date = rs.getString("date");
                    %>
                    <tr>
                        <td><%out.println(firstname + " " + lastname);%></td>
                        <td><%out.println(puid);%></td>
                        <td><%out.println(date);%></td>
                        <td><%out.println(email);%></td>
                        <td><%out.println(contactnumber);%></td>
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
                document.getElementById("uddocpro").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("nurselist").style.display = "none";
                document.getElementById("docappt").style.display = "none";
            }
            function uddocpro() {
                var ad = document.getElementById("uddocpro");
                if (ad.style.display === "none") {
                    ad.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("nurselist").style.display = "none";
                document.getElementById("docappt").style.display = "none";
            }

            function doclist() {
                var x = document.getElementById("doclist");
                if (x.style.display === "none") {
                    x.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("uddocpro").style.display = "none";
                document.getElementById("nurselist").style.display = "none";
                document.getElementById("docappt").style.display = "none";
            }
            function nurselist() {
                var x = document.getElementById("nurselist");
                if (x.style.display === "none") {
                    x.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("uddocpro").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("docappt").style.display = "none";
            }
            function docappt() {
                var x = document.getElementById("docappt");
                if (x.style.display === "none") {
                    x.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("uddocpro").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("nurselist").style.display = "none";
            }
            function validation() {
                var firstname = document.getElementById('finame').value;
                var lastname = document.getElementById('laname').value;
                var email = document.getElementById('Emailadd').value;
                var number = document.getElementById('Cnumber').value;
                var address = document.getElementById('Add').value;

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
