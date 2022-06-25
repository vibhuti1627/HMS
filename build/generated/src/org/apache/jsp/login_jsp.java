package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Login</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link  rel=\"stylesheet\" type=\"text/css\" href=\"css/add.css\"> \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav>\n");
      out.write("            <div class=\"logo\">\n");
      out.write("                Be-Well\n");
      out.write("            </div>\n");
      out.write("            <ul class=\"menu-icons\">    \n");
      out.write("                <li> <a href=\"index.html\" target=\"_self\" >Home</a></li> \n");
      out.write("                <li> <a href=\"findadoctor.html\" target=\"_blank\">Find a Doctor</a></li>\n");
      out.write("                <li> <a href=\"login.jsp\">Login/SignUp</a></li>      \n");
      out.write("                <li> <a href=\"bookappt.html\" target=\"_blank\">Book Appointment</a></li>   \n");
      out.write("                <li> <a href=\"feedback.html\" target=\"_blank\">Contact Us</a></li>                                   \n");
      out.write("            </ul>\n");
      out.write("        </nav>        \n");
      out.write("        \n");
      out.write("        <div class=\"bg\"></div>\n");
      out.write("<div class=\"bg bg2\"></div>\n");
      out.write("<div class=\"bg bg3\"></div>\n");
      out.write("        <div id=\"logform\" class=\"form-container\">\n");
      out.write("            <form onsubmit=\"return validation()\" action=\"loginconnect.jsp\" method=\"post\" class=\"adddoc\" style=\"margin-top: 30px;align: center;\">\n");
      out.write("                <h2>Login</h2>\n");
      out.write("                <input type=\"text\" name=\"userid\" placeholder=\"UserID\" required ><br>\n");
      out.write("                <input type=\"password\" name=\"password\" id=\"password\" placeholder=\"Password\" required>\n");
      out.write("                <span id=\"errorpassword\" style=\"color: red\"></span>\n");
      out.write("\n");
      out.write("                <br><a onclick=\"forpass()\" style=\"cursor: pointer;margin-left: 50%\"><u>Forgot password?</u></a>\n");
      out.write("                <br><a onclick=\"foruid()\" style=\"cursor: pointer;margin-left: 50%\"><u>Forgot userID?</u></a>\n");
      out.write("                <div class=\"btn-layer\"></div>\n");
      out.write("                <input type=\"submit\" value=\"Login\" style=\"margin-top: 20px;\"><br>\n");
      out.write("                <a href=\"signup2.html\">Not a member? Signup now</a>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"forpass\" style=\"display: none;\">\n");
      out.write("            <div class=\"form-container\">\n");
      out.write("                <form  action=\"forgotpass.jsp\" class=\"adddoc\" style=\"margin-top: 30px;align: center;\">\n");
      out.write("                    <h2>Get your Password</h2>\n");
      out.write("                    <input type=\"email\" name=\"emailp\" id=\"email\" placeholder=\"Enter your registered Email ID\" required><br>\n");
      out.write("                    <br><a href=\"login.jsp\" style=\"cursor: pointer;margin-left: 50%;margin-bottom:7px; \">Back to Login</a>\n");
      out.write("                    <br><a onclick=\"foruid()\" style=\"cursor: pointer;margin-left: 50%\"><u>Forgot userID?</u></a>\n");
      out.write("                    <span id=\"erroremail\" style=\"color: red\"></span>\n");
      out.write("                    <input type=\"submit\" value=\"Get Password\" style=\"margin-top: 20px;\"><br>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"foruid\" style=\"display: none;\">\n");
      out.write("            <div class=\"form-container\">\n");
      out.write("                <form  action=\"forgotuid.jsp\" class=\"adddoc\" style=\"margin-top: 30px;align: center;\">\n");
      out.write("                    <h2>Get Your UserID</h2>\n");
      out.write("                    <input type=\"email\" name=\"emailu\" id=\"email\" placeholder=\"Enter your registered Email ID\" required><br>\n");
      out.write("                    <br><a href=\"login.jsp\" style=\"cursor: pointer;margin-left: 50%; margin-bottom:7px; \">Back to Login</a>\n");
      out.write("                    <br><a onclick=\"forpass()\" style=\"cursor: pointer;margin-left: 50%\"><u>Forgot password?</u></a>\n");
      out.write("                    <span id=\"erroremail\" style=\"color: red\"></span>\n");
      out.write("                    <input type=\"submit\" value=\"Get UserID\" style=\"margin-top: 20px;\"><br>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
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
      out.write("        <script>\n");
      out.write("            function logform() {\n");
      out.write("                var ad = document.getElementById(\"logform\");\n");
      out.write("                if (ad.style.display === \"none\") {\n");
      out.write("                    ad.style.display = \"block\";\n");
      out.write("                }\n");
      out.write("                document.getElementById(\"forpass\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"foruid\").style.display = \"none\";\n");
      out.write("            }\n");
      out.write("            function forpass() {\n");
      out.write("                var ad = document.getElementById(\"forpass\");\n");
      out.write("                if (ad.style.display === \"none\") {\n");
      out.write("                    ad.style.display = \"block\";\n");
      out.write("                }\n");
      out.write("                document.getElementById(\"logform\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"foruid\").style.display = \"none\";\n");
      out.write("            }\n");
      out.write("            function foruid() {\n");
      out.write("                var ad = document.getElementById(\"foruid\");\n");
      out.write("                if (ad.style.display === \"none\") {\n");
      out.write("                    ad.style.display = \"block\";\n");
      out.write("                }\n");
      out.write("                document.getElementById(\"logform\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"forpass\").style.display = \"none\";\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            function validation() {\n");
      out.write("                var password = document.getElementById('password').value;\n");
      out.write("\n");
      out.write("                var passwordcheck = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/;\n");
      out.write("\n");
      out.write("                if (passwordcheck.test(password)) {\n");
      out.write("                    document.getElementById('errorpassword').innerHTML = \" \";\n");
      out.write("                } else {\n");
      out.write("                    document.getElementById('errorpassword').innerHTML = \"Invalid Password\";\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
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
      out.write("\n");
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
