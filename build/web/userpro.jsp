
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        <%
            if(session.getAttribute("userid")!=null){
                if (session.getAttribute("usertype").equals("doctor")) {
                   response.sendRedirect("doctor.jsp");
                } 
                else if (session.getAttribute("usertype").equals("nurse")) {
                   response.sendRedirect("nurse.jsp");
                } 
                else if (session.getAttribute("usertype").equals("patient")) {
                   response.sendRedirect("patient.jsp");
                }
                else if (session.getAttribute("usertype").equals("admin")) {
                   response.sendRedirect("admin.jsp");
                }
            }
            else{
                response.sendRedirect("login.html");
            }
            %>
    </body>
</html>
