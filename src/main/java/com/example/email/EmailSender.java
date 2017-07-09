/**
 * 
 */
package com.example.email;

import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.Properties;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.ImageHtmlEmail;
import org.apache.commons.mail.resolver.DataSourceUrlResolver;
import org.springframework.stereotype.Component;

import com.example.utils.ResourceUtils;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * @author Administrator
 *
 */
@Component
public class EmailSender {
	private Properties prop = null;
	
	public EmailSender(){
		prop = ResourceUtils.getEmailConfig();
	};
	
	public void sendMail(String toEmail,String subject,String htmlEmailTemplate, String serverPath) throws EmailException, MalformedURLException {
		ImageHtmlEmail email = new ImageHtmlEmail();
		
		email.setHostName(prop.getProperty("mail.smtp.server"));
		email.setFrom(prop.getProperty("mail.smtp.useremail"), prop.getProperty("mail.smtp.name"));
		
		String auth = prop.getProperty("mail.smtp.auth");
		if("true".equalsIgnoreCase(auth)){
			email.setAuthentication(prop.getProperty("mail.smtp.username"), prop.getProperty("mail.smtp.password"));
		}
		email.setSmtpPort(Integer.valueOf(prop.getProperty("mail.smtp.port")));
		email.addTo(toEmail);
		email.setCharset("UTF-8");
		email.setSubject(subject);
		email.setHtmlMsg(htmlEmailTemplate);


		// set the alternative message
		//email.setTextMsg("Your email client does not support HTML messages");


		URL url = new URL(serverPath);
		email.setDataSourceResolver(new DataSourceUrlResolver(url));
		email.send();
	}


	// 未测试
	public static void send() throws Exception {
		ImageHtmlEmail email = new ImageHtmlEmail();
//		 HtmlEmail email = new HtmlEmail();

		email.setHostName("smtp.sina.com.cn");
//		email.setSmtpPort(110);
		email.setAuthentication("dlj838690@sina.com", "13477618286ding");

		// 1001@aishk.com ais1001

//		email.setSSLOnConnect(true);//开启SSL加密
//        email.setStartTLSEnabled(true);//开启TLS加密
		email.setFrom("dlj838690@sina.com");
		email.addTo("wh@aishk.com");

		email.setCharset("UTF-8");

		email.setSubject("测试");

		// 0
		email.setHtmlMsg("这是测试内容&lt;img src=\"http://www.apache.org/images/asf_logo_wide.gif\" /&gt;");
		email.buildMimeMessage();
		email.sendMimeMessage();



//		URL url = new URL("http://www.apache.org/images/asf_logo_wide.gif");

		//1
//		email.setDataSourceResolver(new DataSourceUrlResolver(url));
//		email.setHtmlMsg("weeqweqwe");

//		//2
//	  String cid = email.embed(url, "Apache logo");
//	  email.setHtmlMsg("<html>The apache logo - <img src=\"cid:"+cid+"\"></html>");
//	  email.setTextMsg("Y厕所生生世世事实上");


//		email.send();
	}

	public static void send2() throws AddressException, MessagingException, UnknownHostException {
		// TODO Auto-generated method stub
		Properties props = new Properties();
//		props.put("mail.smtp.host", "mail.aishk.com");
		props.put("mail.transport.protocol", "smtp");
//		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, null);

		MimeMessage msg = new MimeMessage(session);
		msg.setSubject("Mamiaomiao");
		msg.setFrom(new InternetAddress("huayushuangfei@126.com"));
//		msg.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress("360802847@qq.com"));
		msg.setText("MamiaomiaoMamiaomiaoMamiaomiaoMamiaomiao!");
		msg.saveChanges();

		Transport transport = session.getTransport();

		transport.connect("smtp.126.com",25,"huayushuangfei", "wanghua");

		Address[] addr = new Address[1];
		addr[0] = new InternetAddress("360802847@qq.com");
		transport.sendMessage(msg, addr);
	}
}
