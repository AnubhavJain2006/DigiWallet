//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
package com.service;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class EmailService {
	static String to;

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	String usermessage;

	public String getUsermessage() {
		return usermessage;
	}

	public void setUsermessage(String usermessage) {
		this.usermessage = usermessage;
	}

	public void SendMail() {
		// Sender's email ID needs to be mentioned
		String from = "anubhavjainjaak@gmail.com";
		final String username = "anubhavjainjaak@gmail.com";// change accordingly
		final String password = "JainAnubhavjaak2025";// change accordingly

		Properties props = new Properties();
		props.put("mail.smtp.user", "username");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.debug", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.EnableSSL.enable", "true");

		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");

		// Get the Session object.
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			// Create a default MimeMessage object.
			Message message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

			// Set Subject: header field
			message.setSubject("Forgot Password");

			// Now set the actual message
			message.setText(usermessage);

			// Send message
			Transport.send(message);

			System.out.println("Sent message successfully....");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}

	public static void main(String[] args) {
		System.out.println("Hello");
		EmailService e = new EmailService();
		e.setUsermessage("hello");		
		e.setTo("janubhav560@gmail.com");
		e.SendMail();
	}

	
}