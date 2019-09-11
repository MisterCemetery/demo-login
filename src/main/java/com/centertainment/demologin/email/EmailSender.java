package com.centertainment.demologin.email;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EmailSender {

	public static void sendEmail(String to, String newPassword) throws Exception {

		System.out.println(">>>>>>>Preparing message");
		
		Properties props = new Properties();
		props.setProperty("mail.smtp.quitwait", "false");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		String myAccountMail = "richard.makky@gmail.com";
		String password = "1992bacsenG";
		
		System.out.println(">>>>>>>Preparing session");
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(myAccountMail, password);
			}
		});
		
		System.out.println(">>>>>>>Setting up message");

		Message message = prepareMessage(session, myAccountMail, to, newPassword);
		
		System.out.println(">>>>>>>Message ready with text: " + newPassword);
		
		Transport t = session.getTransport();
		t.connect();
		t.sendMessage(message, message.getAllRecipients());
		t.close();

		System.out.println(">>>>>Message was sent successfully to " + to);
	}

	private static Message prepareMessage(Session session, String emailAccount, String recipient, String newPassword) {
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(emailAccount));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			message.setSubject("New password generated");
			message.setText(newPassword);
			
			return message; 
		} catch (Exception e) {
			return null;
		}
	}
}
