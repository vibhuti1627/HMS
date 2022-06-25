package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public final class forgotpass_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Forgot Password</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        ");

            try {
                String email = request.getParameter("emailp");
                final String sub = "Be-Well | Forgot Password";
                String body="";
                final String from="bewell0522@gmail.com";
                final String passw="BWell@1234";
                    
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
              
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from signup where email='"+email+"'");
                                
                if (rs.next()) {
                    String fn=rs.getString("firstname");
                    String ln=rs.getString("lastname");
                    String up=rs.getString("password");
                    
                    body="Hey "+fn+" "+ln+",\nYour accounts details are: \nPassword = "+up+"\nHave a good day \nBe-Well";                 
                                       
                    
                    Properties pro=new Properties();
                    
                    pro.put("mail.smtp.host","smtp.gmail.com");
                    pro.put("mail.smtp.socketFactory.port", "587");
                    pro.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
                    pro.put("mail.smtp.auth","true");
                    pro.put("mail.smtp.port","587");
                    pro.put("mail.transport.protocol","smtp");
                    pro.put("mail.smtp.ssl.trust","mail.man.com");
                    pro.put("mail.smtp.starttls.enable","true");
                    pro.put("mail.smtp.debug", "true");
                    pro.put("mail.smtp.user",from);
                    pro.put("mail.smtp.password",passw);
                    
                    Session mailSession=Session.getInstance(pro, new javax.mail.Authenticator(){
                        
                        @Override
                        
                        protected PasswordAuthentication getPasswordAuthentication(){
                            return new PasswordAuthentication(from,passw);
                    }
                    });
                    
                    try{
                        MimeMessage mes=new MimeMessage(mailSession);
                        mes.setFrom(new InternetAddress(from));
                        mes.addRecipient(Message.RecipientType.TO, new InternetAddress("bewell0522@gmail.com"));
                        mes.setSubject(sub);
                        mes.setText(body);
                        Transport.send(mes);                        
                    }catch(Exception e){
                        out.print(e);
                    }
                    
                    
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('An email has been sent to your registered email with your login credentials!');");
                    out.print("location='login.html';");
                    out.print("</script>");
                } 
                else {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('Email is not register! Please SignUp');");
                    out.print("location='signup2.html';");
                    out.print("</script>");
                }

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
