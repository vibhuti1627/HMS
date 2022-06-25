<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Patient</title>
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
            String dob = request.getParameter("dob");

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

                PreparedStatement ps = con.prepareStatement("insert into patient(userid,firstname,lastname,email,contactnumber,gender,address,bloodgrp,dob) values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, userid);
                ps.setString(2, firstname);
                ps.setString(3, lastname);
                ps.setString(4, email);
                ps.setString(5, contactnumber);
                ps.setString(6, gender);
                ps.setString(7, address);
                ps.setString(8, bloodgrp);
                ps.setString(9, dob);

                String usertype = "patient";
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

                int x = ps.executeUpdate();
                if (x > 0) {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('A new patient was added!');");
                    out.print("location='admin.jsp';");
                    out.print("</script>");
                } else {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('A new was not made because of some error!');");
                    out.print("location='admin.jsp';");
                    out.print("</script>");
                }

            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
