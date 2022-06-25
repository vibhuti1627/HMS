
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");

                String firstname = request.getParameter("firstname");
                String lastname = request.getParameter("lastname");
                String email = request.getParameter("email");
                String contactnumber = request.getParameter("contactnumber");
                String address = request.getParameter("address");
                String bloodgrp = request.getParameter("bloodgrp");
                String dob = request.getParameter("dob");

                if (!(firstname.equals(""))) {
                    PreparedStatement ps = con.prepareStatement("update admin set firstname=? where adminid='" + session.getAttribute("userid") + "'");
                    ps.setString(1, firstname);
                    ps.executeUpdate();
                }
                if (!(lastname.equals(""))) {
                    PreparedStatement ps = con.prepareStatement("update admin set lastname=? where adminid='" + session.getAttribute("userid") + "'");
                    ps.setString(1, lastname);
                    ps.executeUpdate();
                }
                if (!(email.equals(""))) {
                    PreparedStatement ps = con.prepareStatement("update admin set email=? where adminid='" + session.getAttribute("userid") + "'");
                    ps.setString(1, email);
                    ps.executeUpdate();
                }
                if (!(contactnumber.equals(""))) {
                    PreparedStatement ps = con.prepareStatement("update admin set contactnumber=? where adminid='" + session.getAttribute("userid") + "'");
                    ps.setString(1, contactnumber);
                    ps.executeUpdate();
                }
                if (!(address.equals(""))) {
                    PreparedStatement ps = con.prepareStatement("update admin set address=? where adminid='" + session.getAttribute("userid") + "'");
                    ps.setString(1, address);
                    ps.executeUpdate();
                }
                if (!(bloodgrp.equals(""))) {
                    PreparedStatement ps = con.prepareStatement("update admin set bloodgrp=? where adminid='" + session.getAttribute("userid") + "'");
                    ps.setString(1, bloodgrp);
                    ps.executeUpdate();
                }
                if (!(dob.equals(""))) {
                    PreparedStatement ps = con.prepareStatement("update admin set dob=? where adminid='" + session.getAttribute("userid") + "'");
                    ps.setString(1, dob);
                    ps.executeUpdate();
                }

                if (!(firstname.equals(""))) {
                    PreparedStatement ps = con.prepareStatement("update signup set firstname=? where id='" + session.getAttribute("userid") + "'");
                    ps.setString(1, firstname);
                    ps.executeUpdate();
                }
                if (!(lastname.equals(""))) {
                    PreparedStatement ps = con.prepareStatement("update signup set lastname=? where id='" + session.getAttribute("userid") + "'");
                    ps.setString(1, lastname);
                    ps.executeUpdate();
                }
                if (!(email.equals(""))) {
                    PreparedStatement ps = con.prepareStatement("update signup set email=? where id='" + session.getAttribute("userid") + "'");
                    ps.setString(1, email);
                    ps.executeUpdate();
                }
                if (!(contactnumber.equals(""))) {
                    PreparedStatement ps = con.prepareStatement("update signup set contactnumber=? where id='" + session.getAttribute("userid") + "'");
                    ps.setString(1, contactnumber);
                    ps.executeUpdate();
                }
                if (!(address.equals(""))) {
                    PreparedStatement ps = con.prepareStatement("update signup set address=? where id='" + session.getAttribute("userid") + "'");
                    ps.setString(1, address);
                    ps.executeUpdate();
                }
                response.sendRedirect("admin.jsp");

            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
