package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class test_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        ");

//            String firstname = request.getParameter("firstname");
//            String lastname = request.getParameter("lastname");
//            String email = request.getParameter("email");
//            String contactnumber = request.getParameter("contactnumber");
//            String gender = request.getParameter("gender");
//            String address = request.getParameter("address");            
//            
//            String bloodgrp = request.getParameter("bloodgrp");
//            String dob = request.getParameter("dob");
String userid = "";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT id FROM signup ORDER BY id DESC LIMIT 1");
                while (rs.next()) {
                    String uid = rs.getString("id");
                    int i = Integer.parseInt(uid.substring(1));
                    i++;
                    out.print(userid);
                    out.print(i);
                    userid = "U" + Integer.toString(i);
                    out.print(userid);
                }
                
                
//                PreparedStatement ps = con.prepareStatement("insert into patient(userid,firstname,lastname,email,contactnumber,gender,address,bloodgrp,dob) values(?,?,?,?,?,?,?,?,?)");
//                ps.setString(1, userid);
//                ps.setString(2, firstname);
//                ps.setString(3, lastname);
//                ps.setString(4, email);
//                ps.setString(5, contactnumber);
//                ps.setString(6, gender);
//                ps.setString(7, address);
//                ps.setString(8, bloodgrp);
//                ps.setString(9, dob);
//                
//                String usertype="patient";
//                String password="123";
//                PreparedStatement ps2 = con.prepareStatement("insert into signup(id,firstname,lastname,email,contactnumber,usertype,gender,address,password) values(?,?,?,?,?,?,?,?,?)");
//                    ps2.setString(1, userid);
//                    ps2.setString(2, firstname);
//                    ps2.setString(3, lastname);
//                    ps2.setString(4, email);
//                    ps2.setString(5, contactnumber);
//                    ps2.setString(6, usertype);
//                    ps2.setString(7, gender);
//                    ps2.setString(8, address);
//                    ps2.setString(9, password);

//                int x = ps.executeUpdate();
//                if (x > 0) {
//                    out.println("A new entry was successfully made!");
//                } else {
//                    out.println("A new entry could not be made!");
//                }
                
//                int x2 = ps2.executeUpdate();
//                if (x2 > 0) {
//                    out.println("A new entry was successfully made!");
//                } else {
//                    out.println("A new entry could not be made!");
//                }

            } catch (Exception e) {
                out.println(e);
            }
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
