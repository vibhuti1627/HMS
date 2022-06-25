package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class profile_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Profile</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link  rel=\"stylesheet\" type=\"text/css\" href=\"css/profilecss.css\"> \n");
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
      out.write("                    <div class=\"ddmenu\">\n");
      out.write("                        <a href=\"#\" > Add Doctor </a>\n");
      out.write("                        <a href=\"#\" > Doctor List </a>              \n");
      out.write("                    </div>\n");
      out.write("                    </div>\n");
      out.write("                </li>              \n");
      out.write("                <li> \n");
      out.write("                    <div class=\"menu\">\n");
      out.write("                        <a href=\"#\" >Nurse</a>\n");
      out.write("                    <div class=\"ddmenu\">\n");
      out.write("                        <a href=\"#\" > Add Nurse </a>\n");
      out.write("                        <a href=\"#\" > Nurse List </a>              \n");
      out.write("                    </div>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                <li> \n");
      out.write("                    <div class=\"menu\">\n");
      out.write("                        <a href=\"#\" >Patient</a>\n");
      out.write("                    <div class=\"ddmenu\">\n");
      out.write("                        <a href=\"#\" > Add Patient </a>\n");
      out.write("                        <a href=\"#\" > Patient List </a>              \n");
      out.write("                    </div>\n");
      out.write("                    </div>\n");
      out.write("                </li>      \n");
      out.write("                <li> <a href=\"bookappt.html\" target=\"_blank\">Book Appointment</a></li>   \n");
      out.write("                <li> <a href=\"feedback.html\" target=\"_blank\">Contact Us</a></li>                                   \n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <h2>Profile</h2>\n");
      out.write("        <div class=\"content\">            \n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Full Name </div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">RS</div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Email</div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">riya123@gmail.com</div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Contact Number</div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">1234567891</div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">User Type</div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">Doctor</div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Gender</div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">Female</div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Address</div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">123 ABCMNO XYZ</div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"cols\">Blood Type</div>\n");
      out.write("                <div class=\"cols\">:</div>\n");
      out.write("                <div class=\"cols\">O+</div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <footer>\n");
      out.write("        <ul class=\"social-icons\">\n");
      out.write("            <li><a href=\"#\"><ion-icon name=\"logo-facebook\"></ion-icon></a></li>\n");
      out.write("            <li><a href=\"#\"><ion-icon name=\"logo-instagram\"></ion-icon></a></li>\n");
      out.write("            <li><a href=\"#\"><ion-icon name=\"logo-linkedin\"></ion-icon></a></li>\n");
      out.write("            <li><a href=\"#\"><ion-icon name=\"logo-twitter\"></ion-icon></a></li>\n");
      out.write("        </ul>\n");
      out.write("        <ul class=\"menu\">\n");
      out.write("            <li><a href=\"#\">Home |</a></li>\n");
      out.write("            <li><a href=\"#\">About |</a></li>\n");
      out.write("            <li><a href=\"#\">Contact Us</a></li>\n");
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
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
