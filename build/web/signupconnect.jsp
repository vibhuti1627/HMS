
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
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String contactnumber = request.getParameter("contactnumber");
            String usertype = request.getParameter("usertype");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String bloodgrp = request.getParameter("bloodgrp");
            String dob = request.getParameter("dob");
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
                    userid = "U" + Integer.toString(i);
                }

                PreparedStatement ps2 = con.prepareStatement("insert into signup(id,firstname,lastname,email,contactnumber,usertype,gender,address,password) values(?,?,?,?,?,?,?,?,?)");
                ps2.setString(1, userid);
                ps2.setString(2, firstname);
                ps2.setString(3, lastname);
                ps2.setString(4, email);
                ps2.setString(5, contactnumber);
                ps2.setString(6, usertype);
                ps2.setString(7, gender);
                ps2.setString(8, address);
                ps2.setString(9, password);

                PreparedStatement ps3 = con.prepareStatement("insert into patient(userid,firstname,lastname,email,contactnumber,gender,address,bloodgrp,dob) values(?,?,?,?,?,?,?,?,?)");
                ps3.setString(1, userid);
                ps3.setString(2, firstname);
                ps3.setString(3, lastname);
                ps3.setString(4, email);
                ps3.setString(5, contactnumber);
                ps3.setString(6, gender);
                ps3.setString(7, address);
                ps3.setString(8, bloodgrp);
                ps3.setString(9, dob);
                ps3.executeUpdate();

                final String sub = "Be-Well | Welcome";
                String body = "";
                final String from = "bewell0522@gmail.com";
                final String passw = "BWell@1234";

                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery("select * from signup where email='" + email + "'");

                if (rs2.next()) {
                    String fn = rs2.getString("firstname");
                    String ln = rs2.getString("lastname");

                    body = "Hey " + fn + " " + ln + ",\nWelcome to Be-Well." + "\nHave a good day \nBe-Well";

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
                int x = ps2.executeUpdate();
                if (x > 0) {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('You are done signing up!');");
                    out.print("location='login.html';");
                    out.print("</script>");
                } else {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('Signing up Failed!');");
                    out.print("location='signup.html';");
                    out.print("</script>");
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
