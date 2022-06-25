
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" type="text/css" href="css/add.css">
        <title>Delete Profile</title>
    </head>
    <body>
        <%@page import="java.sql.*, java.util.*" %>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");

                PreparedStatement ps = con.prepareStatement("delete from signup where id='" + session.getAttribute("userid") + "'");
                ps.executeUpdate();
                int x = ps.executeUpdate();

                if (x > 0) {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('Profile deleted successfully.!');");
                    out.print("location='logout.jsp';");
                    out.print("</script>");
                } else {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('Profile could not be deleted successfully.!');");
                    out.print("location='logout.jsp';");
                    out.print("</script>");
                }

            } catch (Exception e) {
                out.println(e);
            }

        %>
    </body>
</html>
