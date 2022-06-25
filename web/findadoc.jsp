
<!doctype html>
<html>
    <head>
        <title>Find a doctor</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link  href="css/fad.css" type="text/css" rel="stylesheet">         
        <style>
            span{
                font-weight:700;
            }
            .docinfo{
                display: flex;    
                background-color: rgba(255, 255, 255, 1);
                height: 200px;
                margin: 20px;
                margin-left: 20%;
                margin-right: 20%;
                border-radius: 10px;
                box-shadow: 8px 7px 8px #888888;
            }
            .docinfo:hover{
                transform: scale(1.05);
            }
            .docinfo .docimg{    
                margin: 10px;
            }
            .docinfo .docimg img{
                opacity: 1;
            }
            .docinfo .docdetails{
                margin: 10px;
                margin-left: 70px;
                font-weight: bold;
                font-size: larger;
                font-family: Arial;
            }
            button{
                width:250px;
                padding: 10px 10px;
                text-align: center;
                margin: 0 80px;
                margin-top: 10px;
                border-radius: 30px;
                font-weight: bold;
                border: 2px solid #2832c2;
                background:#2832c2;
                color: #fff;
                cursor: pointer;
                font-size: larger;
                transition:background 0.5s;
            }

            button:hover{
                color:#1d131b;
                border: 2px solid rgb(36, 31, 31);
            }
        </style>
    </head>
    <body style="background-color:#bed9ec;">
        <nav>
            <div class="logo">
                <a href="index.html" target="_self" style="color:white;font-weight: bold;">Be-Well</a>
            </div>
            <ul class="menu-icons">    
                <li> <a href="index.html" target="_self" >Home</a></li> 
                <li> <a href="findadoc.jsp" target="_blank">Find a Doctor</a></li>
                <li> <a href="login.html" target="_blank" >Login/SignUp</a></li>      
                <li> <a href="bookapptform.jsp" target="_blank">Book Appointment</a></li>   
                <li> <a href="feedback.html" target="_blank">Contact Us</a></li> 
                <li> <a href="userpro.jsp" target="_blank">My Profile</a></li>
            </ul>
        </nav>       

        <%@page import="java.sql.*, java.util.*" %>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from doctor");

        %>        
        <%  while (rs.next()) {
                String userid = rs.getString("userid");
                String firstname = rs.getString("firstname");
                String lastname = rs.getString("lastname");
                String email = rs.getString("email");
                String contactnumber = rs.getString("contactnumber");
                String gender = rs.getString("gender");
                String specialization = rs.getString("specialization");

        %>
        <div class="docinfo">
            <div class="docimg">
                <%if (gender.equals("f")) {
                %> <img src="images/girlp.png" style="width:180px;height: 150px; ">
                <%} else {
                %> <img src="images/boyp.png" style="width:180px;height: 180px;">
                <%}%>
            </div>
            <div class="docdetails">
                <label>Doctor's ID : </label><%out.println(userid);%><br>
                <label>Name : </label><%out.println(firstname + " " + lastname);%><br>
                <label>Email : </label><%out.println(email);%><br>
                <label>Contact Number : </label><%out.println(contactnumber);%><br>
                <label>Gender : </label><%
                    if (gender.equals("f")) {
                        out.println("Female");
                    } else {
                        out.println("Male");
                    }
                %><br>
                <label>Specialization : </label><%out.println(specialization);%><br>
                <a href="bookapptform.jsp"><button type="button" style="font-size:medium;"> Make Appointment</button></a>
            </div>
        </div>
        <%}%>

    </table>
    <%

        } catch (Exception e) {
            out.println(e);
        }
    %>

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
