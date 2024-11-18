package com.utils;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

    // Sender's email ID and password
    private static final String EMAIL = "bookmart768@gmail.com";
    private static final String PASSWORD = "fdrh xape dmje ipbo"; // Be cautious with hardcoding passwords

    /**
     * Sends an email with the specified subject and HTML body to the provided recipient email address.
     * 
     * @param toEmail The recipient's email address.
     * @param subject The subject of the email.
     * @param body The HTML body of the email.
     */
    public static void sendEmail(String toEmail, String subject, String body) {
        // Set up the properties for the mail session
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        
        // Enable debug mode for JavaMail
        props.put("mail.debug", "true");

        // Create the session
        Session session = Session.getInstance(props,
            new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(EMAIL, PASSWORD);
                }
            });

        try {
            // Create a message object
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setContent(body, "text/html; charset=UTF-8"); // Set content type to HTML

            // Send the email
            Transport.send(message);

            System.out.println("Email sent successfully");

        } catch (MessagingException e) {
            // Print detailed error information
            System.err.println("Error sending email: " + e.getMessage());
            e.printStackTrace();  // Print the stack trace to understand where the problem occurred
        }
    }
}
