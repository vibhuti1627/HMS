package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class findadoctor_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("<!doctype html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Find a doctor</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css\">\n");
      out.write("        <link  href=\"fad.css\" type=\"text/css\" rel=\"stylesheet\">         \n");
      out.write("    </head>\n");
      out.write("    <body style=\"background-color:#bed9ec;\">\n");
      out.write("        <nav>\n");
      out.write("            <div class=\"logo\">\n");
      out.write("                <a href=\"index.html\" target=\"_self\" style=\"color:white;font-weight: bold;\">Be-Well</a>\n");
      out.write("            </div>\n");
      out.write("            <ul class=\"menu-icons\">    \n");
      out.write("                <li> <a href=\"index.html\" target=\"_self\" >Home</a></li> \n");
      out.write("                <li> <a href=\"findadoctor.jsp\" target=\"_blank\">Find a Doctor</a></li>\n");
      out.write("                <li> <a href=\"login.html\" target=\"_blank\" >Login/SignUp</a></li>      \n");
      out.write("                <li> <a href=\"bookapptform.jsp\" target=\"_blank\">Book Appointment</a></li>   \n");
      out.write("                <li> <a href=\"feedback.html\" target=\"_blank\">Contact Us</a></li> \n");
      out.write("                <li> <a href=\"userpro.jsp\" target=\"_blank\">My Profile</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>       \n");
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        ");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from doctor");

        
      out.write("        \n");
      out.write("        ");
  while (rs.next()) {
                String userid = rs.getString("userid");
                String firstname = rs.getString("firstname");
                String lastname = rs.getString("lastname");
                String email = rs.getString("email");
                String contactnumber = rs.getString("contactnumber");
                String gender = rs.getString("gender");
                String specialization = rs.getString("specialization");

        
      out.write("\n");
      out.write("        <div class=\"docinfo\">\n");
      out.write("            <div class=\"docimg\">\n");
      out.write("                ");
if (gender.equals("f")) {
                
      out.write(" <img src=\"images/girlp.png\" style=\"width:180px;height: 150px; \">\n");
      out.write("                ");
} else {
                
      out.write(" <img src=\"images/boyp.png\" style=\"width:180px;height: 180px;\">\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"docdetails\">\n");
      out.write("                <label>Doctor's ID : </label>");
out.println(userid);
      out.write("<br>\n");
      out.write("                <label>Name : </label>");
out.println(firstname + " " + lastname);
      out.write("<br>\n");
      out.write("                <label>Email : </label>");
out.println(email);
      out.write("<br>\n");
      out.write("                <label>Contact Number : </label>");
out.println(contactnumber);
      out.write("<br>\n");
      out.write("                <label>Gender : </label>");

                    if (gender.equals("f")) {
                        out.println("Female");
                    } else {
                        out.println("Male");
                    }
                
      out.write("<br>\n");
      out.write("                <label>Specialization : </label>");
out.println(specialization);
      out.write("<br>\n");
      out.write("                <a href=\"bookapptform.jsp\"><button type=\"button\" style=\"font-size:medium;\"> Make Appointment</button></a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("\n");
      out.write("    </table>\n");
      out.write("    ");


        } catch (Exception e) {
            out.println(e);
        }
    
      out.write("\n");
      out.write("\n");
      out.write("    <footer>\n");
      out.write("        <ul class=\"social-icons\">\n");
      out.write("            <li><a href=\"#\"><ion-icon name=\"logo-facebook\"></ion-icon></a></li>\n");
      out.write("            <li><a href=\"#\"><ion-icon name=\"logo-instagram\"></ion-icon></a></li>\n");
      out.write("            <li><a href=\"#\"><ion-icon name=\"logo-linkedin\"></ion-icon></a></li>\n");
      out.write("            <li><a href=\"#\"><ion-icon name=\"logo-twitter\"></ion-icon></a></li>\n");
      out.write("        </ul>\n");
      out.write("        <ul class=\"menu\">\n");
      out.write("            <li><a href=\"index.html\">Home |</a></li>\n");
      out.write("            <li><a href=\"findadoctor.html\">Find a Doctor |</a></li>\n");
      out.write("            <li><a href=\"feedback.html\">Contact Us</a></li>\n");
      out.write("        </ul>\n");
      out.write("        <p>@2022 Be-Well Management system | All Rights Reserved</p>\n");
      out.write("    </footer>\n");
      out.write("    <!-- footer section ends  -->\n");
      out.write("    <script type=\"module\" src=\"https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js\"></script>\n");
      out.write("    <script nomodule src=\"https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js\"></script>\n");
      out.write("    <script>\n");
      out.write("        var slideImg = document.getElementById(\"slideImg\");\n");
      out.write("        var images = new Array(\n");
      out.write("                \"images/slider/1.jpg\",\n");
      out.write("                \"images/slider/5.jpg\"\n");
      out.write("                );\n");
      out.write("        var len = images.length;\n");
      out.write("        var i = 0;\n");
      out.write("        function slider() {\n");
      out.write("            if (i > len - 1) {\n");
      out.write("                i = 0;\n");
      out.write("            }\n");
      out.write("            slideImg.src = images[i];\n");
      out.write("            i++;\n");
      out.write("            setTimeout('slider()', 3000);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("\n");
      out.write("    </script>\n");
      out.write("</body>\n");
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
