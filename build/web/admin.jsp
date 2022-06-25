<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" type="text/css" href="css/admincss.css">
        <title>Admin</title>
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
    <body style="background-color: pink;">
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
        <%

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from admin where adminid='" + session.getAttribute("userid") + "'");

                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery("select floor(datediff(current_date(),dob)/365) as age from admin where adminid='" + session.getAttribute("userid") + "'");

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
                    userid = rs.getString("adminid");
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
                    <div class="cols"><%out.print("Admin"); %></div>
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

            <button onclick="udadpro()" type="button" id="update">Update</button> 
            <%
                } catch (Exception e) {
                    out.println(e);
                }
            %>
        </div>

        <div id="udadpro" style="display: none;width:60%;margin-left: 20%;margin-right: 20%;" >

            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from admin where adminid='" + session.getAttribute("userid") + "'");

                    String firstname = "";
                    String gender = "";

                    while (rs.next()) {
                        firstname = rs.getString("firstname");
                        gender = rs.getString("gender");
                    }

            %>

            <div class="userprofile" style="margin-top:60px;">
                <h2>Welcome! <% out.print(firstname); %></h2>

                <form oninput="return validation()" action="admupdateDB.jsp" method="post">
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
                            <div class="cols"><%out.print("Admin"); %></div>
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
                            <div class="cols"><input type="text" name="address" id="Add" placeholder="Address" ></div>
                            <span id="erroradd" style="color: red"></span>
                        </div>
                        <div class="row">
                            <div class="cols">Blood Type</div>
                            <div class="cols">:</div>
                            <div class="cols">
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

        <div id="addoc" style="display: none;">
            <form oninput="return validation2()" action="adddoc.jsp" method="post" class="adddoc" style="margin-top:60px;">

                <h2>Add a doctor</h2>
                <input type="text" name="firstname" id="finame2" placeholder="FirstName" required><br>
                <span id="errorfname2" style="color: red"></span>

                <input type="text" name="lastname" id="laname2" placeholder="LastName" required><br>
                <span id="errorlname2" style="color: red"></span>
                <div class="box">
                        <label>Blood Group: </label>
                        <select name="bloodgrp" style="margin-top: 20px;width: 225px;height: 25px;" required>
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

                <input type="email" name="email" id="Emailadd2" placeholder="Email" required><br>
                <span id="erroremail2" style="color: red"></span>

                <input type="number" id="Cnumber2" name="contactnumber" placeholder="Contact Number" ><br>
                <span id="errornumber2" style="color: red"></span>

                <div class="box">
                    <label>Date of Birth : </label>
                    <input type="date" name="dob" class="box" style="width: 200px;" required><br>
                </div>

                <div class="box">
                    <label>Gender: </label>
                    <input type="radio" name="gender" value="m" style="width: 20px; height: 15px;margin: 20px;font-size: 5px;"/><label style="margin: 12px;">Male</label>
                    <input type="radio" name="gender" value="f" style="width: 20px; height: 15px;margin: 20px;font-size: 5px;"/><label style="margin: 12px;">Female </label><br>
                </div>

                <div class="box">
                    <label>Date of Joining : </label>
                    <input type="date" name="dojoin" class="box" style="width: 180px;" required><br>
                </div>

                <div class="box" style="margin-bottom: 15px;">
                        <label>Specialization: </label>
                        <select name="spec" style="margin-top: 20px;width: 255px;height: 25px;" required>
                            <option>----</option>

                            <%
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                                Statement st12 = con.createStatement();
                                ResultSet rs12 = st12.executeQuery("SELECT distinct specialization FROM doctor");
                                while (rs12.next()) {
                                    String spec = rs12.getString("specialization");
                            %>
                            <option><%
                    out.print(spec);%></option>                    
                                <%
                                    }
                                %>                
                        </select><br>
                    </div>
                

                <input type="text" name="address" id="Add2" placeholder="Address" ><br>
                <span id="erroradd2" style="color: red"></span>

                <input type="submit" value="Add Doctor" style="width: 180px;">
            </form>
        </div>
        <div id="doclist" style="display: none;">
            <div class="content" style="margin-top:60px;">
                <h2>Doctor List</h2>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                        Statement st = con2.createStatement();
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
                    <th>Address</th>
                    <th>Specialization</th>
                    <th>Date of Joining</th>
                    <th>Date of Birth</th>
                    <th>Blood Group</th> 
                    <!--<th>Action</th>-->
                    </thead>
                    <%  while (rs.next()) {
                            String userid = rs.getString("userid");
                            String firstname = rs.getString("firstname");
                            String lastname = rs.getString("lastname");
                            String email = rs.getString("email");
                            String contactnumber = rs.getString("contactnumber");
                            String gender = rs.getString("gender");
                            String address = rs.getString("address");
                            String specialization = rs.getString("specialization");
                            String dojoin = rs.getString("dojoin");
                            String dob = rs.getString("dob");
                            String bloodgrp = rs.getString("bloodgrp");

                    %>
                    <tr>
                        <td><%out.println(userid);%></td>
                        <td><%out.println(firstname);%></td>
                        <td><%out.println(lastname);%></td>
                        <td><%out.println(email);%></td>
                        <td><%out.println(contactnumber);%></td>
                        <td><%out.println(gender);%></td>
                        <td><%out.println(address);%></td>
                        <td><%out.println(specialization);%></td>
                        <td><%out.println(dojoin);%></td>
                        <td><%out.println(dob);%></td>
                        <td><%out.println(bloodgrp);%></td>
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
        <div id="addnurse" style="display: none;">
            <form oninput="return validation()" action="addnurs.jsp" method="post" class="adddoc" style="margin-top:60px;">
                <h2>Add a Nurse</h2>
                <input type="text" name="firstname" id="finame" placeholder="FirstName" required><br>
                <span id="errorfname" style="color: red"></span>

                <input type="text" name="lastname" id="laname" placeholder="LastName" required><br>
                <span id="errorfname" style="color: red"></span>
                <div class="box">
                        <label>Blood Group: </label>
                        <select name="bloodgrp" style="margin-top: 20px;width: 225px;height: 25px;" required>
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

                <input type="email" name="email" id="Emailadd" placeholder="Email" required><br>
                <span id="erroremail" style="color: red"></span>

                <input type="number" id="Cnumber" name="contactnumber" placeholder="Contact Number" ><br>
                <span id="errornumber" style="color: red"></span>

                <div class="box">
                    <label>Date of Birth : </label>
                    <input type="date" name="dob" class="box" style="width: 200px;" required><br>
                </div>

                <div class="box">
                    <label>Gender: </label>
                    <input type="radio" name="gender" value="m" style="width: 20px; height: 15px;margin: 20px;font-size: 5px;"/><label style="margin: 12px;">Male</label>
                    <input type="radio" name="gender" value="f" style="width: 20px; height: 15px;margin: 20px;font-size: 5px;"/><label style="margin: 12px;">Female </label><br>
                </div>

                <div class="box">
                    <label>Date of Joining : </label>
                    <input type="date" name="dojoin" class="box" style="width: 180px;" required><br></div>

                <input type="text" name="address" id="Add" placeholder="Address" ><br>
                <span id="erroradd" style="color: red"></span>

                <input type="submit" value="Add Nurse" style="width: 180px;">
            </form>
        </div>
        <div id="nurselist" style="display: none;">
            <div class="content" style="margin-top:60px;">
                <h2>Nurse List</h2>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                        Statement st = con3.createStatement();
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
                    <th>Address</th>
                    <th>Date of Joining</th>
                    <th>Date of Birth</th>
                    <th>Blood Group</th>
                    <!--<th>Action</th>-->
                    </thead>
                    <%  while (rs.next()) {
                            String userid = rs.getString("userid");
                            String firstname = rs.getString("firstname");
                            String lastname = rs.getString("lastname");
                            String email = rs.getString("email");
                            String contactnumber = rs.getString("contactnumber");
                            String gender = rs.getString("gender");
                            String address = rs.getString("address");
                            String dojoin = rs.getString("dojoin");
                            String dob = rs.getString("dob");
                            String bloodgrp = rs.getString("bloodgrp");

                    %>
                    <tr>
                        <td><%out.println(userid);%></td>
                        <td><%out.println(firstname);%></td>
                        <td><%out.println(lastname);%></td>
                        <td><%out.println(email);%></td>
                        <td><%out.println(contactnumber);%></td>
                        <td><%out.println(gender);%></td>
                        <td><%out.println(address);%></td>
                        <td><%out.println(dojoin);%></td> 
                        <td><%out.println(dob);%></td> 
                        <td><%out.println(bloodgrp);%></td>
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
        <div id="addpat" style="display: none;">
            <form oninput="return validation3()" action="addpat.jsp" method="post" class="adddoc" style="margin-top:60px;">

                <h2>Add a Patient</h2>
                <input type="text" name="firstname" id="finame3" placeholder="FirstName" required><br>
                <span id="errorfname3" style="color: red"></span>

                <input type="text" name="lastname" id="laname3" placeholder="LastName" required><br>
                <span id="errorlname3" style="color: red"></span>
                <div class="box">
                        <label>Blood Group: </label>
                        <select name="bloodgrp" style="margin-top: 20px;width: 225px;height: 25px;" required>
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

                <input type="email" name="email" id="Emaildd3" placeholder="Email" required><br>
                <span id="erroremail3" style="color: red"></span>

                <input type="number" id="Cnumber3" name="contactnumber" placeholder="Contact Number" required><br>
                <span id="errornumber3" style="color: red"></span>

                <div class="box">
                    <label>Date of Birth : </label>
                    <input type="date" name="dob" class="box" style="width: 200px;" required><br>
                </div>
                <div class="box">
                    <label>Gender: </label>
                    <input type="radio" name="gender" value="m" style="width: 20px; height: 15px;margin: 20px;font-size: 5px;"/><label style="margin: 12px;">Male</label>
                    <input type="radio" name="gender" value="f" style="width: 20px; height: 15px;margin: 20px;font-size: 5px;"/><label style="margin: 12px;">Female </label><br>
                </div>
                <input type="text" name="address" id="Add3" placeholder="Address" ><br>
                <span id="erroradd3" style="color: red"></span>

                <input type="submit" value="Add Patient" style="width: 180px;">
            </form>
        </div>
        <div id="patlist" style="display: none;">
            <div class="content" style="margin-top:60px;">
                <h2>Patient List</h2>

                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                        Statement st = con4.createStatement();
                        ResultSet rs = st.executeQuery("select * from patient");
                %>
                <table>
                    <thead>
                    <th>User ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Contact Number</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Blood Group</th>
                    <th>Date of Birth</th>
                    <!--<th>Action</th>-->
                    </thead>
                    <%  while (rs.next()) {
                            String userid = rs.getString("userid");
                            String firstname = rs.getString("firstname");
                            String lastname = rs.getString("lastname");
                            String email = rs.getString("email");
                            String contactnumber = rs.getString("contactnumber");
                            String gender = rs.getString("gender");
                            String address = rs.getString("address");
                            String bloodgrp = rs.getString("bloodgrp");
                            String dob = rs.getString("dob");
                    %>
                    <tr>
                        <td><%out.println(userid);%></td>
                        <td><%out.println(firstname);%></td>
                        <td><%out.println(lastname);%></td>
                        <td><%out.println(email);%></td>
                        <td><%out.println(contactnumber);%></td>
                        <td><%out.println(gender);%></td>
                        <td><%out.println(address);%></td>
                        <td><%out.println(bloodgrp);%></td>
                        <td><%out.println(dob);%></td>               
                        <!--                <td><button type="button" id="delete" >Delete</button>
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
        <div id="addbed" style="display: none;">
            <form oninput="return validation()" action="addbed2.jsp" method="post" class="adddoc" style="margin-top:60px;">

                <h2>Add a Bed</h2>            
                <input type="text" name="roomno" placeholder="Room Number" required><br>
                <div class="box">
                    <label>Bed is empty: </label>
                    <input type="radio" name="availability" value="y" style="width: 20px; height: 15px;margin: 20px;font-size: 5px;"/><label style="margin: 12px;">Yes</label>
                    <input type="radio" name="availability" value="n" style="width: 20px; height: 15px;margin: 20px;font-size: 5px;"/><label style="margin: 12px;">No </label><br>
                </div>
                <input type="text" name="givenTo" id="finame" placeholder="Given To"><br>
                <span id="errorfname" style="color: red"></span>
                <input type="text" name="nurid" id="nurseid" placeholder="ID of Nurse to be attending "><br>
                <input type="submit" value="Add Bed" style="width: 180px;margin-bottom: 20px;">
            </form>
        </div>
        <div id="bedlist" style="display: none;">
            <div class="content" style="margin-top:60px;">
                <h2>Bed List</h2>
                <%                try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                        Statement st = con5.createStatement();
                        ResultSet rs = st.executeQuery("select * from bedavailability");

                %>
                <table>
                    <thead>
                    <th>Bed ID</th>
                    <th>Room Number</th>
                    <th>Room Availability</th>
                    <th>Room Given To</th>
                    <!--<th>Action</th>-->
                    </thead>
                    <%  while (rs.next()) {
                            String bedid = rs.getString("bedid");
                            String roomno = rs.getString("roomno");
                            String availability = rs.getString("availability");
                            String givenTo = rs.getString("givenTo");
                    %>
                    <tr>
                        <td><%out.println(bedid);%></td>
                        <td><%out.println(roomno);%></td>
                        <td><%out.println(availability);%></td>
                        <td><%out.println(givenTo);%></td>
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
                document.getElementById("udadpro").style.display = "none";
                document.getElementById("addoc").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("addnurse").style.display = "none";
                document.getElementById("nurselist").style.display = "none";
                document.getElementById("addpat").style.display = "none";
                document.getElementById("patlist").style.display = "none";
                document.getElementById("addbed").style.display = "none";
                document.getElementById("bedlist").style.display = "none";
            }
            function udadpro() {
                var ad = document.getElementById("udadpro");
                if (ad.style.display === "none") {
                    ad.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("addoc").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("addnurse").style.display = "none";
                document.getElementById("nurselist").style.display = "none";
                document.getElementById("addpat").style.display = "none";
                document.getElementById("patlist").style.display = "none";
                document.getElementById("addbed").style.display = "none";
                document.getElementById("bedlist").style.display = "none";
            }
            function addoc() {
                var ad = document.getElementById("addoc");
                if (ad.style.display === "none") {
                    ad.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("udadpro").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("addnurse").style.display = "none";
                document.getElementById("nurselist").style.display = "none";
                document.getElementById("addpat").style.display = "none";
                document.getElementById("patlist").style.display = "none";
                document.getElementById("addbed").style.display = "none";
                document.getElementById("bedlist").style.display = "none";
            }

            function doclist() {
                var x = document.getElementById("doclist");
                if (x.style.display === "none") {
                    x.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("udadpro").style.display = "none";
                document.getElementById("addoc").style.display = "none";
                document.getElementById("addnurse").style.display = "none";
                document.getElementById("nurselist").style.display = "none";
                document.getElementById("addpat").style.display = "none";
                document.getElementById("patlist").style.display = "none";
                document.getElementById("addbed").style.display = "none";
                document.getElementById("bedlist").style.display = "none";
            }
            function addnurse() {
                var x = document.getElementById("addnurse");
                if (x.style.display === "none") {
                    x.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("udadpro").style.display = "none";
                document.getElementById("addoc").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("nurselist").style.display = "none";
                document.getElementById("addpat").style.display = "none";
                document.getElementById("patlist").style.display = "none";
                document.getElementById("addbed").style.display = "none";
                document.getElementById("bedlist").style.display = "none";
            }
            function nurselist() {
                var x = document.getElementById("nurselist");
                if (x.style.display === "none") {
                    x.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("udadpro").style.display = "none";
                document.getElementById("addoc").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("addnurse").style.display = "none";
                document.getElementById("addpat").style.display = "none";
                document.getElementById("patlist").style.display = "none";
                document.getElementById("addbed").style.display = "none";
                document.getElementById("bedlist").style.display = "none";
            }
            function addpat() {
                var x = document.getElementById("addpat");
                if (x.style.display === "none") {
                    x.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("udadpro").style.display = "none";
                document.getElementById("addoc").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("addnurse").style.display = "none";
                document.getElementById("nurselist").style.display = "none";
                document.getElementById("patlist").style.display = "none";
                document.getElementById("addbed").style.display = "none";
                document.getElementById("bedlist").style.display = "none";
            }
            function patlist() {
                var x = document.getElementById("patlist");
                if (x.style.display === "none") {
                    x.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("udadpro").style.display = "none";
                document.getElementById("addoc").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("addnurse").style.display = "none";
                document.getElementById("nurselist").style.display = "none";
                document.getElementById("addpat").style.display = "none";
                document.getElementById("addbed").style.display = "none";
                document.getElementById("bedlist").style.display = "none";
            }
            function addbed() {
                var x = document.getElementById("addbed");
                if (x.style.display === "none") {
                    x.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("udadpro").style.display = "none";
                document.getElementById("addoc").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("addnurse").style.display = "none";
                document.getElementById("nurselist").style.display = "none";
                document.getElementById("addpat").style.display = "none";
                document.getElementById("patlist").style.display = "none";
                document.getElementById("bedlist").style.display = "none";
            }
            function bedlist() {
                var x = document.getElementById("bedlist");
                if (x.style.display === "none") {
                    x.style.display = "block";
                }
                document.getElementById("userpro").style.display = "none";
                document.getElementById("udadpro").style.display = "none";
                document.getElementById("addoc").style.display = "none";
                document.getElementById("doclist").style.display = "none";
                document.getElementById("addnurse").style.display = "none";
                document.getElementById("nurselist").style.display = "none";
                document.getElementById("addpat").style.display = "none";
                document.getElementById("patlist").style.display = "none";
                document.getElementById("addbed").style.display = "none";
            }
        </script>

        <script type="text/javascript">
            function validation2() {
                var firstname = document.getElementById('finame2').value;
                var lastname = document.getElementById('laname2').value;
                var email = document.getElementById('Emailadd2').value;
                var number = document.getElementById('Cnumber2').value;
                var address = document.getElementById('Add2').value;

                var fncheck = /^[A-Za-z]{3,30}$/;
                var lncheck = /^[A-Za-z]{3,30}$/;
                var emailcheck = /^[A-Za-z_0-9@.]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$/;
                var numbercheck = /^[6789][0-9]{9}$/;
                var addresscheck = /(\d{1,}) [a-zA-Z0-9\s]+(\.)? [a-zA-Z]+(\,)? [A-Z]{2} [0-9]{5,6}$/;

                if (fncheck.test(firstname)) {
                    document.getElementById('errorfname2').innerHTML = " ";
                } else {
                    document.getElementById('errorfname2').innerHTML = "Please include Upper and lower Case both";
                    return false;
                }

                if (lncheck.test(lastname)) {
                    document.getElementById('errorlname2').innerHTML = " ";
                } else {
                    document.getElementById('errorlname2').innerHTML = "Please include Upper and lower Case both";
                    return false;
                }

                if (emailcheck.test(email)) {
                    document.getElementById('erroremail2').innerHTML = " ";
                } else {
                    document.getElementById('erroremail2').innerHTML = "Invalid Email";
                }

                if (numbercheck.test(number)) {
                    document.getElementById('errornumber2').innerHTML = " ";
                } else {
                    document.getElementById('errornumber2').innerHTML = "Invalid mobile number";
                }
//                if (addresscheck.test(address)) {
//                    document.getElementById('erroraddress').innerHTML = " ";
//                } else {
//                    document.getElementById('erroraddress').innerHTML = "Invalid Address";
//                }                
            }
            function validation3() {
                var firstname = document.getElementById('finame3').value;
                var lastname = document.getElementById('laname3').value;
                var email = document.getElementById('Emailadd3').value;
                var number = document.getElementById('Cnumber3').value;
                var address = document.getElementById('Add3').value;

                var fncheck = /^[A-Za-z]{3,30}$/;
                var lncheck = /^[A-Za-z]{3,30}$/;
                var emailcheck = /^[A-Za-z_0-9@.]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$/;
                var numbercheck = /^[6789][0-9]{9}$/;
                var addresscheck = /(\d{1,}) [a-zA-Z0-9\s]+(\.)? [a-zA-Z]+(\,)? [A-Z]{2} [0-9]{5,6}$/;

                if (fncheck.test(firstname)) {
                    document.getElementById('errorfname3').innerHTML = " ";
                } else {
                    document.getElementById('errorfname3').innerHTML = "Please include Upper and lower Case both";
                    return false;
                }

                if (lncheck.test(lastname)) {
                    document.getElementById('errorlname3').innerHTML = " ";
                } else {
                    document.getElementById('errorlname3').innerHTML = "Please include Upper and lower Case both";
                    return false;
                }

                if (emailcheck.test(email)) {
                    document.getElementById('erroremail3').innerHTML = " ";
                } else {
                    document.getElementById('erroremail3').innerHTML = "Invalid Email";
                }

                if (numbercheck.test(number)) {
                    document.getElementById('errornumber3').innerHTML = " ";
                } else {
                    document.getElementById('errornumber3').innerHTML = "Invalid mobile number";
                }
//                if (addresscheck.test(address)) {
//                    document.getElementById('erroraddress3').innerHTML = " ";
//                } else {
//                    document.getElementById('erroraddress3').innerHTML = "Invalid Address";
//                }                
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
