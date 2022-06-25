
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String email=request.getParameter("email");
            String contactnumber=request.getParameter("contactnumber");
            int feid=0;
            String message=request.getParameter("message");
            
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false","root","root@v");
                
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT fid FROM feedback ORDER BY fid DESC LIMIT 1");
                while (rs.next()) {
                    feid=rs.getInt("fid");
                    feid++;
                }
                
                PreparedStatement ps=con.prepareStatement("insert into feedback(firstname,lastname,email,contactnumber,message,fid) values(?,?,?,?,?,?)");
                ps.setString(1, firstname);
                ps.setString(2, lastname);
                ps.setString(3, email);
                ps.setString(4, contactnumber);
                ps.setString(5, message);
                ps.setInt(6,feid);
                    
                int x = ps.executeUpdate();
                if (x > 0) {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('Thank you for your feedback!');");
                    out.print("location='feedback.html';");
                    out.print("</script>");
                } else {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('The feedback could not be sent because of some error!');");
                    out.print("location='feedback.html';");
                    out.print("</script>");
                } 
                
            }   
            
            catch(Exception e){
                out.println(e);
            }
        %>
    </body>
</html>
