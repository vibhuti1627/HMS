<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String contactnumber = request.getParameter("contactnumber");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String userid = "";
            String bloodgrp = request.getParameter("bloodgrp");
            String dojoin = request.getParameter("dojoin");
            String dob = request.getParameter("dob");
            String specialization = request.getParameter("spec");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT id FROM signup ORDER BY id DESC LIMIT 1");
                while (rs.next()) {
                    String uid = rs.getString("id");
                    int i = Integer.parseInt(uid.substring(1));
                    i++;
                    userid = "U" + Integer.toString(i);
                }
                PreparedStatement ps = con.prepareStatement("insert into doctor(userid,firstname,lastname,email,contactnumber,gender,address,specialization,dojoin,dob,bloodgrp) values(?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, userid);
                ps.setString(2, firstname);
                ps.setString(3, lastname);
                ps.setString(4, email);
                ps.setString(5, contactnumber);
                ps.setString(6, gender);
                ps.setString(7, address);
                ps.setString(8, specialization);
                ps.setString(9, dojoin);
                ps.setString(10, dob);
                ps.setString(11, bloodgrp);
                int x = ps.executeUpdate();

                String usertype = "doctor";
                String password = "User@123";
                PreparedStatement ps2 = con.prepareStatement("insert into signup(id,firstname,lastname,email,contactnumber,usertype,gender,address,password) values(?,?,?,?,?,?,?,?,?)");
                ps2.setString(1, userid);
                ps2.setString(2, firstname);
                ps2.setString(3, lastname);
                ps2.setString(4, email);
                ps2.setString(5, contactnumber);
                ps2.setString(6, usertype);
                ps2.setString(7, gender);
                ps2.setString(8, address);
                ps2.setString(9, password);
                ps2.executeUpdate();

                
                    if (x > 0) {
                        out.print("<script type=\"text/javascript\">");
                        out.print("alert('A new doctor was added!');");
                        out.print("location='admin.jsp';");
                        out.print("</script>");
                    } else {
                        out.print("<script type=\"text/javascript\">");
                        out.print("alert('A new was not made because of some error!');");
                        out.print("location='admin.jsp';");
                        out.print("</script>");
                    }
//                int x = ps.executeUpdate();
//                if (x > 0) {
//                    out.println("A new entry was successfully made!");
//                } else {
//                    out.println("A new entry could not be made!");
//                }
//                
//                int x2 = ps2.executeUpdate();
//                if (x2 > 0) {
//                    out.println("A new entry was successfully made!");
//                } else {
//                    out.println("A new entry could not be made!");
//                }

            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
