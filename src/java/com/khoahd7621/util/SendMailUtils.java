package com.khoahd7621.util;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author KhoaHD7621
 */
public class SendMailUtils {
    
    private static final String USER = "testmail7621@gmail.com";
    private static final String PASSWORD = "Khoa115599";

    public static boolean send(String to, String sub, String msg) {
        boolean check = false;
        // Create an instance of Properties Class
        Properties props = new Properties();

        /* Specifies the IP address of your default mail server
           for e.g if you are using gmail server as an email server
           you will pass smtp.gmail.com as value of mail.smtp host.
           As shown here in the code.
           Change accordingly, if your email id is not a gmail id
         */
        props.put("mail.smtp.host", "smtp.gmail.com");
        //below mentioned mail.smtp.port is optional
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        /* Pass Properties object(props) and Authenticator object   
           for authentication to Session instance 
         */
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USER, PASSWORD);
            }
        });

        try {

            /* Create an instance of MimeMessage, 
               it accept MIME types and headers 
             */
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USER));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html");

            /* Transport class is used to deliver the message to the recipients */
            Transport.send(message);
            check = true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return check;
    }
    
}
