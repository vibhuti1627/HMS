
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
    </head>
    <body>
        <%@page import="java.sql.*, java.util.*, javax.mail.*" %>
        <%@page import="javax.mail.internet.*"%>
        <%
            try {
                String email = request.getParameter("emailu");
                final String sub = "Be-Well | Forgot UserID";
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
                    String ud=rs.getString("id");
                    
                    body="Hey "+fn+" "+ln+",\nYour accounts details are: \nUserID = "+ud+"\nHave a good day \nBe-Well";                 
                                       
                    
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

        %>
    </body>
</html>
