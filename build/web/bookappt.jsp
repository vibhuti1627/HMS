<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book an Appointment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link  rel="stylesheet" type="text/css" href="css/add.css">
        <style>

            .bg {
                animation:slide 3s ease-in-out infinite alternate;
                background-image: linear-gradient(-60deg, #6c3 50%, #87CEEB 50%);
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
            .cont{
                display:flex;
                width: 100%;
                justify-content: center;
                align-content: center;
            }
            .sideimg img{
                width:100%;
                margin-top: 90px;
                height: 50%;
                border-radius: 7px;
                animation: zoom-in-zoom-out 4s ease infinite;
            }


            @keyframes slide {
                0% {
                    transform:translateX(-25%);
                }
                100% {
                    transform:translateX(25%);
                }
            }
            @keyframes zoom-in-zoom-out {
                0% {
                    transform: scale(1, 1);
                }
                75% {
                    transform: scale(1.07, 1.07);
                }
                100% {
                    transform: scale(1, 1);
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
                <li> <a href="index.html" target="_self" >Home</a></li>
                <li> <a href="findadoc.jsp" target="_blank">Find a Doctor</a></li>
                <li> <a href="login.html" target="_blank" >Login/SignUp</a></li>      
                <li> <a href="bookappt.jsp" target="_blank">Book Appointment</a></li>   
                <li> <a href="feedback.html" target="_blank">Contact Us</a></li>  
                <li> <a href="userpro.jsp" target="_blank">My Profile</a></li>
            </ul>
        </nav>

        <div class="bg"></div>
        <div class="bg bg2"></div>
        <div class="bg bg3"></div>

        <div class="cont">
            <div class="sideimg" style="margin: 30px;width: 60%;">
                <img src="images/log2.png">
            </div>
            <div class="form-container" style="width: 100%;">
                <form oninput="return validation()" action="bookapptconnect2.jsp" class="adddoc" style="width: 70%;margin-left: 60px;margin-top: 30px;align: center;">
                    <h2>Book An Appointment</h2>
                    <input type="text" name="firstname" id="fname" placeholder="First Name" required><br>
                    <span id="errorfname" style="color: red"></span>
                    <input type="text" name="lastname" id="lname" placeholder="Last Name" ><br>
                    <span id="errorlname" style="color: red"></span>
                    <input type="text" name="userid" id="uid" placeholder="UserID" required><br>
                    
                    <div class="box" style="margin-bottom: 15px;">
                        <label>Doctor Name: </label>
                        <select name="doctorname" style="margin-top: 20px;width: 255px;height: 25px;" required>
                            <option>----</option>

                            <%
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");

                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("SELECT firstname,lastname,specialization FROM doctor");

                                while (rs.next()) {
                                    String fn = rs.getString("firstname");
                                    String ln = rs.getString("lastname");
                            %>
                            <option><%
                    out.print(fn + " " + ln);%></option>                    
                                <%
                                    }
                                %>                
                        </select><br></div>

                    <div class="box" style="margin-bottom: 15px;">
                        <label>Specialization: </label>
                        <select name="spec" style="margin-top: 20px;width: 255px;height: 25px;" required>
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
                        </select><br></div>

                    <h5 style="margin-bottom:10px;">Doctor's userID can be found at <span><a href="findadoc.jsp">here</a></span></h5>
                    <input type="number" name="contactnumber" id="Contactnumber" placeholder="Contact Number" required><br>
                    <span id="errornumber" style="color: red"></span>
                    <input type="email" name="email" id="Email" placeholder="Email" required><br>
                    <span id="erroremail" style="color: red"></span>
                    <div class="box" style="margin-bottom: 15px;">
                        <label>Date : </label><input type="date" name="dat" class="box" style="width: 290px;" required><br></div>
                    <input type="submit" value="Book now" class="btn">
                </form>
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
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script>
            function validation() {
                var firstname = document.getElementById('fname').value;
                var lastname = document.getElementById('lname').value;
                var email = document.getElementById('Email').value;
                var number = document.getElementById('Contactnumber').value;
                

                var fncheck = /^[A-Za-z]{3,30}$/;
                var lncheck = /^[A-Za-z]{3,30}$/;
                var emailcheck = /^[A-Za-z_0-9@.]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$/;
                var numbercheck = /^[6789][0-9]{9}$/;
                

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
            }
        </script>
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
