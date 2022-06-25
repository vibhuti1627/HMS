
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" type="text/css" href="css/add.css">
        <title>Change Password</title>
    </head>
    <body>
        <%@page import="java.sql.*, java.util.*" %>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");

                String pass = request.getParameter("password");

                if (session.getAttribute("userid") != null) {

                    if (session.getAttribute("usertype") == "admin") {
                        PreparedStatement ps = con.prepareStatement("update admin set passwrd=? where adminID='" + session.getAttribute("userid") + "'");
                        ps.setString(1, pass);
                        ps.executeUpdate();
                        int x = ps.executeUpdate();

                        if (x > 0) {
                            out.print("<script type=\"text/javascript\">");
                            out.print("alert('Password was successfully changed!');");
                            out.print("location='logout.jsp';");
                            out.print("</script>");
                        } else {
                            out.print("<script type=\"text/javascript\">");
                            out.print("alert('Password could not be changed!');");
                            out.print("location='logout.jsp';");
                            out.print("</script>");
                        }
                    } else {
                        PreparedStatement ps = con.prepareStatement("update signup set password=? where id='" + session.getAttribute("userid") + "'");
                        ps.setString(1, pass);
                        ps.executeUpdate();
                        int x = ps.executeUpdate();

                        if (x > 0) {
                            out.print("<script type=\"text/javascript\">");
                            out.print("alert('Password was successfully changed!');");
                            out.print("location='logout.jsp';");
                            out.print("</script>");
                        } else {
                            out.print("<script type=\"text/javascript\">");
                            out.print("alert('Password could not be changed!');");
                            out.print("location='logout.jsp';");
                            out.print("</script>");
                        }
                    }
                } else {
                    response.sendRedirect("login.html");
                }

            } catch (Exception e) {
                out.println(e);
            }

        %>
    </body>
</html>
