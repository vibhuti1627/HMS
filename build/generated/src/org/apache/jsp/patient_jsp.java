package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class patient_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <link  rel=\"stylesheet\" type=\"text/css\" href=\"css/procss.css\">\n");
      out.write("        <title>Patient</title>\n");
      out.write("        <style>\n");
      out.write("            .menu-icons .menu .ddmenu{              \n");
      out.write("                border-radius: 5px;\n");
      out.write("                margin-left: 10px;\n");
      out.write("            }\n");
      out.write("            .menu-icons .menu .ddmenu a{  \n");
      out.write("                display: flex;\n");
      out.write("            }\n");
      out.write("            .userprofile button{\n");
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
      out.write("    <body style=\"background-color: pink;\">\n");
      out.write("        <nav>\n");
      out.write("            <div class=\"logo\">\n");
      out.write("                <a href=\"index.html\" target=\"_self\" style=\"color:white;font-weight: bold;\">Be-Well</a>\n");
      out.write("            </div>\n");
      out.write("            <ul class=\"menu-icons\">    \n");
      out.write("                <li> <a href=\"patient.jsp\" target=\"_self\" >Dashboard</a></li>  \n");
      out.write("                <li> <a onclick=\"doclist()\" style=\"cursor: pointer;\"> Doctor List </a></li>   \n");
      out.write("                <li> <a onclick=\"bedlist()\" style=\"cursor: pointer;\"> Bed List </a></li> \n");
      out.write("                <li> <a onclick=\"patappt()\" style=\"cursor: pointer;\">My Appointments</a></li>\n");
      out.write("                <li> <a href=\"bookappt.html\" target=\"_blank\">Book Appointment</a></li>   \n");
      out.write("                <li> <a href=\"feedback.html\" target=\"_blank\">Contact Us</a></li> \n");
      out.write("                <li> \n");
      out.write("                    <div class=\"menu\">\n");
      out.write("                        <a href=\"#\" >Hello! ");
out.print(session.getAttribute("userid"));
      out.write("</a>\n");
      out.write("                        <div class=\"ddmenu\">\n");
      out.write("                            <a href=\"patient.jsp\" > My Profile </a><br>\n");
      out.write("                            <a href=\"changepassword.html\" >Change Password</a><br>\n");
      out.write("                            <a href=\"logout.jsp\" target=\"_self\">Logout</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("<div id=\"userpro\" class=\"userprofile\">\n");
      out.write("        \n");
      out.write("        ");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from patient where userid='" + session.getAttribute("userid") + "'");
                
                
                String userid = "";
                String firstname = "";
                String lastname = "";
                String email = "";
                String contactnumber = "";
                String gender = "";
                String address = "";
                String bloodgrp = "";
                String dob = "";

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
                }
        
      out.write("\n");
      out.write("        \n");
      out.write("            <h2>Welcome! ");
 out.print(firstname); 
      out.write("</h2>\n");
      out.write("            <div class=\"usercontent\"> \n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"cols\">First Name </div>\n");
      out.write("                    <div class=\"cols\">:</div>\n");
      out.write("                    <div class=\"cols\">");
out.print(firstname); 
      out.write("</div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"cols\">Last Name </div>\n");
      out.write("                    <div class=\"cols\">:</div>\n");
      out.write("                    <div class=\"cols\">");
out.print(lastname); 
      out.write("</div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"cols\">User Type </div>\n");
      out.write("                    <div class=\"cols\">:</div>\n");
      out.write("                    <div class=\"cols\">");
out.print("Patient"); 
      out.write("</div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"cols\">Email</div>\n");
      out.write("                    <div class=\"cols\">:</div>\n");
      out.write("                    <div class=\"cols\">");
out.print(email); 
      out.write("</div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"cols\">Contact Number</div>\n");
      out.write("                    <div class=\"cols\">:</div>\n");
      out.write("                    <div class=\"cols\">");
out.print(contactnumber); 
      out.write("</div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"cols\">Date of Birth : </div>\n");
      out.write("                    <div class=\"cols\">:</div>\n");
      out.write("                    <div class=\"cols\">");
out.print(dob); 
      out.write("</div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"cols\">Gender</div>\n");
      out.write("                    <div class=\"cols\">:</div>\n");
      out.write("                    <div class=\"cols\">");
out.print(gender); 
      out.write("</div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"cols\">Address</div>\n");
      out.write("                    <div class=\"cols\">:</div>\n");
      out.write("                    <div class=\"cols\">");
out.print(address); 
      out.write("</div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"cols\">Blood Type</div>\n");
      out.write("                    <div class=\"cols\">:</div>\n");
      out.write("                    <div class=\"cols\">");
out.print(bloodgrp); 
      out.write("</div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <button onclick=\"udpatpro()\" type=\"button\" id=\"update\" >Update</button>\n");
      out.write("            ");

                } catch (Exception e) {
                    out.println(e);
                }
            
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"udpatpro\" style=\"display: none;\">\n");
      out.write("            ");

                try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from patient where userid='" + session.getAttribute("userid") + "'");

                String firstname = "";
                String gender = "";

                while (rs.next()) {
                    firstname = rs.getString("firstname");
                    gender = rs.getString("gender");
                }

            
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"userprofile\">\n");
      out.write("                <h2>Welcome! ");
 out.print(firstname); 
      out.write("</h2>\n");
      out.write("\n");
      out.write("                <form action=\"patupdateDB.jsp\" method=\"post\">\n");
      out.write("                    <div class=\"usercontent\">      \n");
      out.write("\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                        <div class=\"cols\">First Name </div>\n");
      out.write("                        <div class=\"cols\">:</div>\n");
      out.write("                        <div class=\"cols\"><input type=\"text\" name=\"firstname\" id=\"firstname\" placeholder=\"FirstName\"><br></div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"cols\">Last Name </div>\n");
      out.write("                        <div class=\"cols\">:</div>\n");
      out.write("                        <div class=\"cols\"><input type=\"text\" name=\"lastname\" placeholder=\"LastName\" ><br></div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"cols\">User Type </div>\n");
      out.write("                        <div class=\"cols\">:</div>\n");
      out.write("                        <div class=\"cols\">");
out.print("Patient"); 
      out.write("</div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"cols\">Email</div>\n");
      out.write("                        <div class=\"cols\">:</div>\n");
      out.write("                        <div class=\"cols\"><input type=\"email\" name=\"email\" id=\"email\" placeholder=\"Email\" ></div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"cols\">Contact Number</div>\n");
      out.write("                        <div class=\"cols\">:</div>\n");
      out.write("                        <div class=\"cols\"><input type=\"number\" id=\"number\" name=\"contactnumber\" placeholder=\"Contact Number\" ></div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"cols\">Date of Birth : </div>\n");
      out.write("                        <div class=\"cols\">:</div>\n");
      out.write("                        <div class=\"cols\"><input type=\"date\" name=\"dob\" class=\"box\" style=\"width: 200px;\"></div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"cols\">Gender</div>\n");
      out.write("                        <div class=\"cols\">:</div>\n");
      out.write("                        <div class=\"cols\">");
out.print(gender); 
      out.write("</div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"cols\">Address</div>\n");
      out.write("                        <div class=\"cols\">:</div>\n");
      out.write("                        <div class=\"cols\"><input type=\"text\" name=\"address\" placeholder=\"Address\" ></div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"cols\">Blood Type</div>\n");
      out.write("                        <div class=\"cols\">:</div>\n");
      out.write("                        <div class=\"cols\"><input type=\"text\" name=\"bloodgrp\" placeholder=\"Blood Group\" ></div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                        <input type=\"submit\" value=\"Save\" style=\"border-width: thin;border-radius: 7px; font-weight: bold;background-color: #87AFC7;width: 120px;margin-left: 45%;height: 40px; margin-bottom: 20px;margin-top: 20px;\">\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("\n");
      out.write("                ");

                    } catch (Exception e) {
                        out.println(e);
                    }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"doclist\" style=\"display: none;\">\n");
      out.write("            <div class=\"content\">\n");
      out.write("                <h2>Doctor List</h2>\n");
      out.write("                ");

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from doctor");

                
      out.write("\n");
      out.write("                <table>\n");
      out.write("                    <thead>\n");
      out.write("                    <th>User ID</th>\n");
      out.write("                    <th>First Name</th>\n");
      out.write("                    <th>Last Name</th>\n");
      out.write("                    <th>Email</th>\n");
      out.write("                    <th>Contact Number</th>\n");
      out.write("                    <th>Gender</th>\n");
      out.write("                    <th>Address</th>\n");
      out.write("                    <th>Specialization</th>\n");
      out.write("                    <th>Date of Joining</th>\n");
      out.write("                    <th>Date of Birth</th>\n");
      out.write("                    <th>Blood Group</th>\n");
      out.write("                    </thead>\n");
      out.write("                    ");
  while (rs.next()) {
                            String userid = rs.getString("userid");
                            String firstname = rs.getString("firstname");
                            String lastname = rs.getString("lastname");
                            String email = rs.getString("email");
                            String contactnumber = rs.getString("contactnumber");
                            String gender = rs.getString("gender");
                            String address = rs.getString("address");
                            String specialization = rs.getString("specialization");
                            String dojoin = rs.getString("dojoin");
                            String dob = rs.getString("dob");
                            String bloodgrp = rs.getString("bloodgrp");

                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
out.println(userid);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(firstname);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(lastname);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(email);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(contactnumber);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(gender);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(address);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(specialization);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(dojoin);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(dob);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(bloodgrp);
      out.write("</td>\n");
      out.write("\n");
      out.write("                    </tr>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("\n");
      out.write("                </table>\n");
      out.write("                ");


                    } catch (Exception e) {
                        out.println(e);
                    }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"bedlist\" style=\"display: none;\">\n");
      out.write("            <div class=\"content\">\n");
      out.write("                <h2>Bed List</h2>\n");
      out.write("                ");
                try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from bedavailability");

                
      out.write("\n");
      out.write("                <table>\n");
      out.write("                    <thead>\n");
      out.write("                    <th>Bed ID</th>\n");
      out.write("                    <th>Room Number</th>\n");
      out.write("                    <th>Room Availability</th>\n");
      out.write("                    <th>Room Given To</th>\n");
      out.write("                    </thead>\n");
      out.write("                    ");
  while (rs.next()) {
                            String bedid = rs.getString("bedid");
                            String roomno = rs.getString("roomno");
                            String availability = rs.getString("availability");
                            String givenTo = rs.getString("givenTo");
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
out.println(bedid);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(roomno);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(availability);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(givenTo);
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("\n");
      out.write("                </table>\n");
      out.write("                ");


                    } catch (Exception e) {
                        out.println(e);
                    }


                
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"patappt\" style=\"display: none;\">\n");
      out.write("            <div class=\"content\">\n");
      out.write("                <h2>Appointment List</h2>\n");
      out.write("\n");
      out.write("                ");
            try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from bookapp where userid='" + session.getAttribute("userid") + "'");
                
      out.write("\n");
      out.write("                <table>\n");
      out.write("                    <thead>\n");
      out.write("                    <th>Date</th>\n");
      out.write("                    <th>Appointment made with</th>                \n");
      out.write("                    </thead>\n");
      out.write("                    ");
  while (rs.next()) {
                            String date = rs.getString("date");
                            String amw = rs.getString("doctorname");
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
out.println(date);
      out.write("</td>\n");
      out.write("                        <td>");
out.println(amw);
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("\n");
      out.write("                </table>\n");
      out.write("                ");

                    } catch (Exception e) {
                        out.println(e);
                    }
                
      out.write("\n");
      out.write("\n");
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
      out.write("        <!-- footer section ends  -->  \n");
      out.write("        <script>\n");
      out.write("            function userpro() {\n");
      out.write("                var ad = document.getElementById(\"userpro\");\n");
      out.write("                if (ad.style.display === \"none\") {\n");
      out.write("                    ad.style.display = \"block\";\n");
      out.write("                }\n");
      out.write("                document.getElementById(\"udpatpro\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"doclist\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"bedlist\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"patappt\").style.display = \"none\";\n");
      out.write("            }\n");
      out.write("            function udpatpro() {\n");
      out.write("                var ad = document.getElementById(\"udpatpro\");\n");
      out.write("                if (ad.style.display === \"none\") {\n");
      out.write("                    ad.style.display = \"block\";\n");
      out.write("                }\n");
      out.write("                document.getElementById(\"userpro\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"doclist\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"bedlist\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"patappt\").style.display = \"none\";\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function doclist() {\n");
      out.write("                var x = document.getElementById(\"doclist\");\n");
      out.write("                if (x.style.display === \"none\") {\n");
      out.write("                    x.style.display = \"block\";\n");
      out.write("                }\n");
      out.write("                document.getElementById(\"userpro\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"udpatpro\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"bedlist\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"patappt\").style.display = \"none\";\n");
      out.write("            }\n");
      out.write("            function bedlist() {\n");
      out.write("                var x = document.getElementById(\"bedlist\");\n");
      out.write("                if (x.style.display === \"none\") {\n");
      out.write("                    x.style.display = \"block\";\n");
      out.write("                }\n");
      out.write("                document.getElementById(\"userpro\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"udpatpro\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"doclist\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"patappt\").style.display = \"none\";\n");
      out.write("            }\n");
      out.write("            function patappt() {\n");
      out.write("                var x = document.getElementById(\"patappt\");\n");
      out.write("                if (x.style.display === \"none\") {\n");
      out.write("                    x.style.display = \"block\";\n");
      out.write("                }\n");
      out.write("                document.getElementById(\"userpro\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"udpatpro\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"doclist\").style.display = \"none\";\n");
      out.write("                document.getElementById(\"bedlist\").style.display = \"none\";\n");
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
