package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class bookapptform_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link  rel=\"stylesheet\" type=\"text/css\" href=\"css/add.css\">\n");
      out.write("        <title>Book Appointment</title>\n");
      out.write("        <style>\n");
      out.write("\n");
      out.write("            .bg {\n");
      out.write("                animation:slide 3s ease-in-out infinite alternate;\n");
      out.write("                background-image: linear-gradient(-60deg, #6c3 50%, #87CEEB 50%);\n");
      out.write("                bottom:0;\n");
      out.write("                left:-50%;\n");
      out.write("                opacity:.5;\n");
      out.write("                position:fixed;\n");
      out.write("                right:-50%;\n");
      out.write("                top:0;\n");
      out.write("                z-index:-1;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .bg2 {\n");
      out.write("                animation-direction:alternate-reverse;\n");
      out.write("                animation-duration:4s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .bg3 {\n");
      out.write("                animation-duration:5s;\n");
      out.write("            }\n");
      out.write("            .cont{\n");
      out.write("                display:flex;\n");
      out.write("                width: 100%;\n");
      out.write("                justify-content: center;\n");
      out.write("                align-content: center;\n");
      out.write("            }\n");
      out.write("            .sideimg img{\n");
      out.write("                width:100%;\n");
      out.write("                margin-top: 90px;\n");
      out.write("                height: 50%;\n");
      out.write("                border-radius: 7px;\n");
      out.write("                animation: zoom-in-zoom-out 4s ease infinite;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("            @keyframes slide {\n");
      out.write("                0% {\n");
      out.write("                    transform:translateX(-25%);\n");
      out.write("                }\n");
      out.write("                100% {\n");
      out.write("                    transform:translateX(25%);\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            @keyframes zoom-in-zoom-out {\n");
      out.write("                0% {\n");
      out.write("                    transform: scale(1, 1);\n");
      out.write("                }\n");
      out.write("                75% {\n");
      out.write("                    transform: scale(1.07, 1.07);\n");
      out.write("                }\n");
      out.write("                100% {\n");
      out.write("                    transform: scale(1, 1);\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav>\n");
      out.write("            <div class=\"logo\">\n");
      out.write("                <a href=\"index.html\" target=\"_self\" style=\"color:white;font-weight: bold;\">Be-Well</a>\n");
      out.write("            </div>\n");
      out.write("            <ul class=\"menu-icons\">    \n");
      out.write("                <li> <a href=\"index.html\" target=\"_self\" >Home</a></li>\n");
      out.write("                <li> <a href=\"findadoctor.html\" target=\"_blank\">Find a Doctor</a></li>\n");
      out.write("                <li> <a href=\"login.html\" target=\"_blank\" >Login/SignUp</a></li>      \n");
      out.write("                <li> <a href=\"bookapptform.jsp\" target=\"_blank\">Book Appointment</a></li>   \n");
      out.write("                <li> <a href=\"feedback.html\" target=\"_blank\">Contact Us</a></li>  \n");
      out.write("                <li> <a href=\"userpro.jsp\" target=\"_blank\">My Profile</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <div class=\"bg\"></div>\n");
      out.write("        <div class=\"bg bg2\"></div>\n");
      out.write("        <div class=\"bg bg3\"></div>\n");
      out.write("\n");
      out.write("        \n");
      out.write("        ");

            if (session.getAttribute("userid") != null) {
                if(session.getAttribute("userid").equals("admin")){
                    response.sendRedirect("bookappt.jsp");
                }
        
      out.write("\n");
      out.write("        <div class=\"cont\">\n");
      out.write("            <div class=\"sideimg\" style=\"margin: 30px;width: 60%;\">\n");
      out.write("                <img src=\"images/log2.png\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-container\" style=\"width: 100%;\">\n");
      out.write("                <form action=\"bookapptconnect.jsp\" class=\"adddoc\" style=\"width: 70%;margin-left: 60px;margin-top: 30px;align: center;\">\n");
      out.write("                    <h2>Book An Appointment</h2>\n");
      out.write("                    <input type=\"text\" name=\"firstname\" id=\"fname\" placeholder=\"First Name\" required><br>\n");
      out.write("                    <span id=\"errorfname\" style=\"color: red\"></span>\n");
      out.write("                    <input type=\"text\" name=\"lastname\" id=\"lname\" placeholder=\"Last Name\" ><br>\n");
      out.write("                    <span id=\"errorlname\" style=\"color: red\"></span>\n");
      out.write("                    <label style=\"margin-bottom: 20px;\">UserID : ");
out.print(session.getAttribute("userid"));
      out.write("</label>\n");
      out.write("\n");
      out.write("                    <div class=\"box\" style=\"margin-bottom: 15px;\">\n");
      out.write("                        <label>Doctor Name: </label>\n");
      out.write("                        <select name=\"doctorname\" style=\"margin-top: 20px;width: 255px;height: 25px;\" required>\n");
      out.write("                            <option>----</option>\n");
      out.write("\n");
      out.write("                            ");

                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");

                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("SELECT firstname,lastname,specialization FROM doctor");

                                while (rs.next()) {
                                    String fn = rs.getString("firstname");
                                    String ln = rs.getString("lastname");
                            
      out.write("\n");
      out.write("                            <option>");

                    out.print(fn + " " + ln);
      out.write("</option>                    \n");
      out.write("                                ");

                                    }
                                
      out.write("                \n");
      out.write("                        </select><br></div>\n");
      out.write("\n");
      out.write("                    <div class=\"box\" style=\"margin-bottom: 15px;\">\n");
      out.write("                        <label>Specialization: </label>\n");
      out.write("                        <select name=\"spec\" style=\"margin-top: 20px;width: 255px;height: 25px;\" required>\n");
      out.write("                            <option>----</option>\n");
      out.write("\n");
      out.write("                            ");

                                Statement st2 = con.createStatement();
                                ResultSet rs2 = st2.executeQuery("SELECT distinct specialization FROM doctor");
                                while (rs2.next()) {
                                    String spec = rs2.getString("specialization");
                            
      out.write("\n");
      out.write("                            <option>");

                    out.print(spec);
      out.write("</option>                    \n");
      out.write("                                ");

                                    }
                                
      out.write("                \n");
      out.write("                        </select><br></div>\n");
      out.write("\n");
      out.write("                    <!--<input type=\"text\" name=\"doctorname\" placeholder=\"Doctor Name\" required><br>-->\n");
      out.write("                    <!--<input type=\"text\" name=\"doctorid\" placeholder=\"Doctor UserID\" required><br>-->\n");
      out.write("                    <h5 style=\"margin-bottom:10px;\">Doctor's can be found at <span><a href=\"findadoctor.html\">here</a></span></h5>\n");
      out.write("                    <input type=\"number\" name=\"contactnumber\" id=\"Contactnumber\" placeholder=\"Contact Number\" required><br>\n");
      out.write("                    <span id=\"errornumber\" style=\"color: red\"></span>\n");
      out.write("                    <input type=\"email\" name=\"email\" id=\"Email\" placeholder=\"Email\" required><br>\n");
      out.write("                    <span id=\"erroremail\" style=\"color: red\"></span>\n");
      out.write("                    <div class=\"box\" style=\"margin-bottom: 15px;\">\n");
      out.write("                        <label>Date : </label><input type=\"date\" name=\"dat\" class=\"box\" style=\"width: 290px;\" required><br></div>\n");
      out.write("                    <input type=\"submit\" value=\"Book now\" class=\"btn\">\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");

            } else {
                response.sendRedirect("login.html");
            }
        
      out.write("\n");
      out.write("\n");
      out.write("        <footer>\n");
      out.write("            <ul class=\"social-icons\">\n");
      out.write("                <li><a href=\"#\"><ion-icon name=\"logo-facebook\"></ion-icon></a></li>\n");
      out.write("                <li><a href=\"#\"><ion-icon name=\"logo-instagram\"></ion-icon></a></li>\n");
      out.write("                <li><a href=\"#\"><ion-icon name=\"logo-linkedin\"></ion-icon></a></li>\n");
      out.write("                <li><a href=\"#\"><ion-icon name=\"logo-twitter\"></ion-icon></a></li>\n");
      out.write("            </ul>\n");
      out.write("            <ul class=\"menu\">\n");
      out.write("                <li><a href=\"index.html\">Home |</a></li>\n");
      out.write("                <li><a href=\"findadoctor.html\">Find a Doctor |</a></li>\n");
      out.write("                <li><a href=\"feedback.html\">Contact Us</a></li>\n");
      out.write("            </ul>\n");
      out.write("            <p>@2022 Be-Well Management system | All Rights Reserved</p>\n");
      out.write("        </footer>\n");
      out.write("        <!-- footer section ends  -->\n");
      out.write("        <script type=\"module\" src=\"https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js\"></script>\n");
      out.write("        <script nomodule src=\"https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            function validation() {\n");
      out.write("                var firstname = document.getElementById('fname').value;\n");
      out.write("                var lastname = document.getElementById('lname').value;\n");
      out.write("                var email = document.getElementById('Email').value;\n");
      out.write("                var number = document.getElementById('Contactnumber').value;\n");
      out.write("\n");
      out.write("                var fncheck = /^[A-Za-z]{3,30}$/;\n");
      out.write("                var lncheck = /^[A-Za-z]{3,30}$/;\n");
      out.write("                var emailcheck = /^[A-Za-z_0-9@.]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$/;\n");
      out.write("                var numbercheck = /^[6789][0-9]{9}$/;\n");
      out.write("\n");
      out.write("                if (fncheck.test(firstname)) {\n");
      out.write("                    document.getElementById('errorfname').innerHTML = \" \";\n");
      out.write("                } else {\n");
      out.write("                    document.getElementById('errorfname').innerHTML = \"Please include Upper and lower Case both\";\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                if (lncheck.test(lastname)) {\n");
      out.write("                    document.getElementById('errorlname').innerHTML = \" \";\n");
      out.write("                } else {\n");
      out.write("                    document.getElementById('errorlname').innerHTML = \"Please include Upper and lower Case both\";\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                if (emailcheck.test(email)) {\n");
      out.write("                    document.getElementById('erroremail').innerHTML = \" \";\n");
      out.write("                } else {\n");
      out.write("                    document.getElementById('erroremail').innerHTML = \"Invalid Email\";\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                if (numbercheck.test(number)) {\n");
      out.write("                    document.getElementById('errornumber').innerHTML = \" \";\n");
      out.write("                } else {\n");
      out.write("                    document.getElementById('errornumber').innerHTML = \"Invalid mobile number\";\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
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
