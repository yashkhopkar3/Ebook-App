package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

@WebServlet("/SendEmailServlet")
public class SendEmail extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("name");
        String userEmail = request.getParameter("email");
        String subject = request.getParameter("subject");
        String userMessage = request.getParameter("message");

        // Setup email properties
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Authentication details for BookMart's Gmail
        final String bookMartEmail = "bookmart768@gmail.com";
        final String bookMartPassword = "fdrh xape dmje ipbo";  // Replace with actual password

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(bookMartEmail, bookMartPassword);
            }
        });

        try {
            // Construct the email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(userEmail));  // Set user's email as the sender
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(bookMartEmail));
            message.setSubject(subject);

            // Format the email body to include the user's message
            String emailBody = "Message from: " + userName + " (" + userEmail + ")\n\n" + userMessage;
            message.setText(emailBody);

            // Send the email
            Transport.send(message);

            // On success, set success message
            request.setAttribute("successMsg", "Your message has been sent successfully!");
        } catch (MessagingException e) {
            // On failure, set error message
            e.printStackTrace();
            request.setAttribute("errorMsg", "Failed to send your message. Please try again.");
        }

        // Forward the user back to the contact page
        request.getRequestDispatcher("helpline.jsp").forward(request, response);
    }
}
