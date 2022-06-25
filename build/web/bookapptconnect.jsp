
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%@page import="java.sql.*, java.util.*, javax.mail.*" %>
        <%@page import="javax.mail.internet.*"%>
        <%
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String email=request.getParameter("email");
            String doctorname=request.getParameter("doctorname");
            String spec=request.getParameter("spec");
            String contactnumber=request.getParameter("contactnumber");
            String date=request.getParameter("dat");
            String duserid="";
            int aid=0;
            String[] splitString = doctorname.split(" ");
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false","root","root@v");
                
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT apptid FROM bookapp ORDER BY apptid DESC LIMIT 1");
                while (rs.next()) {
                    aid=rs.getInt("apptid");
                    aid++;
                }
                
                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery("SELECT * FROM doctor where firstname='"+splitString[0]+"' and lastname='"+splitString[1]+"' and specialization='"+spec+"'");
                while (rs2.next()) {
                    duserid=rs2.getString("userid");
                }
                
                PreparedStatement ps=con.prepareStatement("insert into bookapp(firstname,lastname,userid,email,contactnumber,date,doctorname,duserid,apptid) values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, firstname);
                ps.setString(2, lastname);
                ps.setString(3, (String)session.getAttribute("userid"));
                ps.setString(4, email);
                ps.setString(5, contactnumber);
                ps.setString(6, date);
                ps.setString(7, doctorname);
                ps.setString(8, duserid);
                ps.setInt(9,aid);
                
                final String sub = "Be-Well | Appointment made Successfully";
                String body = "";
                final String from = "bewell0522@gmail.com";
                final String passw = "BWell@1234";

                Statement st3 = con.createStatement();
                ResultSet rs3 = st3.executeQuery("select * from signup where email='" + email + "'");

                if (rs3.next()) {
                    String fn = rs3.getString("firstname");
                    String ln = rs3.getString("lastname");

                    body = "Hey " + fn + " " + ln + ",\nYou have succesfully booked an appointment on "+date+". Please be there 10 minutes before your alloted time." + "\nHave a good day \nBe-Well";

                    Properties pro = new Properties();

                    pro.put("mail.smtp.host", "smtp.gmail.com");
                    pro.put("mail.smtp.socketFactory.port", "587");
                    pro.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                    pro.put("mail.smtp.auth", "true");
                    pro.put("mail.smtp.port", "587");
                    pro.put("mail.transport.protocol", "smtp");
                    pro.put("mail.smtp.ssl.trust", "mail.man.com");
                    pro.put("mail.smtp.starttls.enable", "true");
                    pro.put("mail.smtp.debug", "true");
                    pro.put("mail.smtp.user", from);
                    pro.put("mail.smtp.password", passw);

                    Session mailSession = Session.getInstance(pro, new javax.mail.Authenticator() {

                        @Override

                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(from, passw);
                        }
                    });

                    try {
                        MimeMessage mes = new MimeMessage(mailSession);
                        mes.setFrom(new InternetAddress(from));
                        mes.addRecipient(Message.RecipientType.TO, new InternetAddress("bewell0522@gmail.com"));
                        mes.setSubject(sub);
                        mes.setText(body);
                        Transport.send(mes);
                    } catch (Exception e) {
                        out.print(e);
                    }
                }
                
                
                int x = ps.executeUpdate();
                if (x > 0) {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('A Appointment was made!');");
                    out.print("location='bookapptform.jsp';");
                    out.print("</script>");
                } else {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('Appointment could not be made because of some error!');");
                    out.print("location='bookapptform.jsp';");
                    out.print("</script>");
                }                
            }   
            
            catch(Exception e){
                out.println(e);
            }
        %>
    </body>
</html>
