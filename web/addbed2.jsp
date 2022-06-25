
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Bed</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%
            String bedid = "";
            String roomno = request.getParameter("roomno");
            String availability = request.getParameter("availability");
            String givenTo = request.getParameter("givenTo");
            String nid = request.getParameter("nurseid");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT bedid FROM bedavailability ORDER BY bedid DESC LIMIT 1");
                while (rs.next()) {
                    String bid = rs.getString("bedid");
                    int i = Integer.parseInt(bid.substring(3));
                    i++;
                    bedid = "Bed" + Integer.toString(i);
                }
                
                PreparedStatement ps = con.prepareStatement("insert into bedavailability(bedid,roomno,availability,givenTo,nurseid) values(?,?,?,?,?)");
                ps.setString(1, bedid);
                ps.setString(2, roomno);
                ps.setString(3, availability);
                ps.setString(4, givenTo);
                ps.setString(5, nid);

                int x = ps.executeUpdate();
                if (x > 0) {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('A new bed was added!');");
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
