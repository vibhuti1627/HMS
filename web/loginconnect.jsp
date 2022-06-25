
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%@page import="java.sql.*, java.util.*" %>
        <%
            String userid = request.getParameter("userid");
            String password = request.getParameter("password");
            String usertype = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                
                Statement st1=con.createStatement();
                ResultSet rs1=st1.executeQuery("select * from signup where id='"+userid+"' and password='"+password+"' and usertype='doctor'");
                
                Statement st2=con.createStatement();
                ResultSet rs2=st2.executeQuery("select * from signup where id='"+userid+"' and password='"+password+"' and usertype='nurse'");
                
                Statement st3=con.createStatement();
                ResultSet rs3=st3.executeQuery("select * from signup where id='"+userid+"' and password='"+password+"' and usertype='patient'");
                
                if (userid.equals("admin") && password.equals("Admin@123")) {
                    session.setAttribute("userid", userid);
                    session.setAttribute("usertype", "admin");
                    response.sendRedirect("admin.jsp");
                } 
                else if (rs1.next()) {
                   session.setAttribute("userid", userid);
                   session.setAttribute("usertype", "doctor");
                   response.sendRedirect("doctor.jsp");
                } 
                else if (rs2.next()) {
                   session.setAttribute("userid", userid);
                   session.setAttribute("usertype", "nurse");
                   response.sendRedirect("nurse.jsp");
                } 
                else if (rs3.next()) {
                   session.setAttribute("userid", userid);
                   session.setAttribute("usertype", "patient");
                   response.sendRedirect("patient.jsp");
                } 
                else {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('Username adn Password do not match');");
                    out.print("location='login.html';");
                    out.print("</script>");
                }

            } catch (Exception e) {
                out.println(e);
            }

        %>
    </body>
</html>
