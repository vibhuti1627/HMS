package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class nurseprofile_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Profile</title>\n");
      out.write("        <link  rel=\"stylesheet\" type=\"text/css\" href=\"css/profilecss.css\"> \n");
      out.write("        <style>\n");
      out.write("            .profile button{\n");
      out.write("                border-radius: 7px;\n");
      out.write("                border-width: thin;\n");
      out.write("                font-weight: bold;\n");
      out.write("                background-color: #87AFC7;\n");
      out.write("                width: 120px;\n");
      out.write("                margin-left: 45%;\n");
      out.write("                height: 40px;\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("                margin-top: 20px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav>\n");
      out.write("            <div class=\"logo\">\n");
      out.write("                Be-Well\n");
      out.write("            </div>\n");
      out.write("            <ul class=\"menu-icons\">    \n");
      out.write("                <li> <a href=\"home.html\" target=\"_self\" >Home</a></li> \n");
      out.write("                <li> \n");
      out.write("                    <div class=\"menu\">\n");
      out.write("                        <a href=\"#\" >Doctor</a>\n");
      out.write("                        <div class=\"ddmenu\">\n");
      out.write("                            <a href=\"adddoctor.html\" > Add Doctor </a><br>\n");
      out.write("                            <a href=\"doclist.jsp\" > Doctor List </a>              \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </li>              \n");
      out.write("                <li> \n");
      out.write("                    <div class=\"menu\">\n");
      out.write("                        <a href=\"#\" >Nurse</a>\n");
      out.write("                        <div class=\"ddmenu\">\n");
      out.write("                            <a href=\"addnurse.html\" > Add Nurse </a><br>\n");
      out.write("                            <a href=\"nurselist.jsp\" > Nurse List </a>              \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                <li> \n");
      out.write("                    <div class=\"menu\">\n");
      out.write("                        <a href=\"#\" >Patient</a>\n");
      out.write("                        <div class=\"ddmenu\">\n");
      out.write("                            <a href=\"addpatient.html\" > Add Patient </a><br>\n");
      out.write("                            <a href=\"patientlist.jsp\" > Patient List </a>              \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </li>  \n");
      out.write("                <li> \n");
      out.write("                    <div class=\"menu\">\n");
      out.write("                        <a href=\"#\" >Bed</a>\n");
      out.write("                        <div class=\"ddmenu\">\n");
      out.write("                            <a href=\"addbed.html\" > Add Bed </a><br>\n");
      out.write("                            <a href=\"bedlist.jsp\" > Bed List </a>              \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                <li> <a href=\"bookappt.html\" target=\"_blank\">Book Appointment</a></li>   \n");
      out.write("                <li> <a href=\"feedback.html\" target=\"_blank\">Contact Us</a></li> \n");
      out.write("                <li> <a href=\"logout.jsp\" target=\"_self\">Logout</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        \n");
      out.write("        ");


            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from nurse where userid='" + session.getAttribute("userid") + "'");

                String userid = "";
                String firstname = "";
                String lastname = "";
                String email = "";
                String contactnumber = "";
                String gender = "";
                String address = "";
                String bloodgrp = "";
                String dob = "";
                String dojoin = "";

                while (rs.next()) {
                    userid = rs.getString("userid");
                    firstname = rs.getString("firstname");
                    lastname = rs.getString("lastname");
                    email = rs.getString("email");
                    contactnumber = rs.getString("contactnumber");
                    gender = rs.getString("gender");
                    address = rs.getString("address");
                    bloodgrp = rs.getString("bloodgrp");
                    dob = rs.getString("dob");
                    dojoin = rs.getString("dojoin");
                }

        
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"profile\">\n");
      out.write("        <h2>Welcome! ");
 out.print(firstname); 
      out.write("</h2>\n");
      out.write("        <div class=\"content\">            \n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Full Name </div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">");
out.print(firstname + " " + lastname); 
      out.write("</div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">User Type </div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">");
out.print("Nurse"); 
      out.write("</div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Email</div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">");
out.print(email); 
      out.write("</div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Contact Number</div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">");
out.print(contactnumber); 
      out.write("</div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Date of Birth : </div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">");
out.print(dob); 
      out.write("</div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Gender</div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">");
out.print(gender); 
      out.write("</div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Date of Joining : </div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">");
out.print(dojoin); 
      out.write("</div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Address</div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">");
out.print(address); 
      out.write("</div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Blood Type</div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">");
out.print(bloodgrp); 
      out.write("</div>\n");
      out.write("            </div>\n");
      out.write("            <button type=\"button\" id=\"update\" >Update</button> \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        ");

            } catch (Exception e) {
                out.println(e);
            }
        
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <footer>\n");
      out.write("            <ul class=\"social-icons\">\n");
      out.write("                <li><a href=\"#\"><ion-icon name=\"logo-facebook\"></ion-icon></a></li>\n");
      out.write("                <li><a href=\"#\"><ion-icon name=\"logo-instagram\"></ion-icon></a></li>\n");
      out.write("                <li><a href=\"#\"><ion-icon name=\"logo-linkedin\"></ion-icon></a></li>\n");
      out.write("                <li><a href=\"#\"><ion-icon name=\"logo-twitter\"></ion-icon></a></li>\n");
      out.write("            </ul>\n");
      out.write("            <ul class=\"menu\">\n");
      out.write("                <li><a href=\"#\">Home |</a></li>\n");
      out.write("                <li><a href=\"#\">About |</a></li>\n");
      out.write("                <li><a href=\"#\">Contact Us</a></li>\n");
      out.write("            </ul>\n");
      out.write("            <p>@2022 Be-Well Management system | All Rights Reserved</p>\n");
      out.write("        </footer>\n");
      out.write("        <!-- footer section ends  -->\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            document.getElementById(\"update\").onclick = function () {\n");
      out.write("                location.href = \"nurproupdate.jsp\";\n");
      out.write("            };\n");
      out.write("        </script>\n");
      out.write("        <script type=\"module\" src=\"https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js\"></script>\n");
      out.write("        <script nomodule src=\"https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            var slideImg = document.getElementById(\"slideImg\");\n");
      out.write("            var images = new Array(\n");
      out.write("                    \"images/slider/1.jpg\",\n");
      out.write("                    \"images/slider/5.jpg\"\n");
      out.write("                    );\n");
      out.write("            var len = images.length;\n");
      out.write("            var i = 0;\n");
      out.write("            function slider() {\n");
      out.write("                if (i > len - 1) {\n");
      out.write("                    i = 0;\n");
      out.write("                }\n");
      out.write("                slideImg.src = images[i];\n");
      out.write("                i++;\n");
      out.write("                setTimeout('slider()', 3000);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("        </script>\n");
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
