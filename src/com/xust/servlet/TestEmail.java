package com.xust.servlet;

import java.io.IOException;
import java.util.Date;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/TestEmail")
public class TestEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		InternetAddress[] address = null;
		String mailserver = "luo.cn";
		String from = "luo@luo.cn";
		String to = "635142812@qq.com";
		String subject = "≤‚ ‘";
		String messageText = "Hello World";
		java.util.Properties props = null;
		props = System.getProperties();
		props.put("mail.smtp.host", mailserver);
		props.put("mail.smtp.auth", "true");
		MySecurity msec = new MySecurity("luo", "luo");
		Session mailSession = Session.getDefaultInstance(props, msec);
		
		mailSession.setDebug(false);
		Message msg =new MimeMessage(mailSession);
		try {
			msg.setFrom(new InternetAddress(from));
			address = InternetAddress.parse(to, false);
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			msg.setText(messageText);
			Transport.send(msg, msg.getAllRecipients());
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
