/**
 * 
 */
package com.example.email;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Properties;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.ImageHtmlEmail;
import org.apache.commons.mail.resolver.DataSourceUrlResolver;
import org.springframework.stereotype.Component;

import com.example.utils.ResourceUtils;

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
		URL url = new URL(serverPath);
		email.setDataSourceResolver(new DataSourceUrlResolver(url));
		email.send();
	}
}
