package com.example.utils;

import java.util.List;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.MultiPartEmail;

public class MailUtils {
	static String smtp = "smtp.sina.com.cn";
//	static String user = "no_reply_aishk@sina.com";
//	static String password = "wanghua";
	
	static String user = "dlj838690@sina.com";
	static String password = "13477618286ding";
	
//		String port = 25;
	
	static String fromEmail = "dlj838690@sina.com";
//		String fromEmail = "<dlj838690@sina.com>";
	
//			String toEmail = "wh@aishk.com";
	
	public static void notifySignUp(String username, String useremail, String userpassword) {
		MultiPartEmail email = new MultiPartEmail();
		email.setHostName(smtp);
		email.setAuthentication(user, password);
		email.setSubject("wiki-wendao用户注册通知");
		email.setCharset("UTF-8");
		
		try {
			List<String> fromAddressList = StringUtils.tokenizer(fromEmail, ",");
			for (int i = 0; i < fromAddressList.size(); i++) {
				String fromAddress = fromAddressList.get(0);
				if (fromAddress.indexOf("<") != -1 && fromAddress.indexOf(">") != -1) {
					String name = fromAddress.substring(0, fromAddress.indexOf("<"));
					String addr = fromAddress.replace(name, "").replace("<", "").replace(">", "");
					email.setFrom(addr, name);
				}else {
					email.setFrom(fromAddress);
				}
			}
			
			email.addTo(useremail);
//			email.setContent("<html><head><meta charset=\"utf-8\"></head><body style=\"font-family:sans-serif;\">Hi " + username + "：<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;感谢您注册wiki-wendao，请牢记您的个人信息！<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱：" + useremail + "<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码：" + userpassword + "<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击此链接开始您的wiki-wendao之旅吧<a href=\"http://wiki-wendao.rhcloud.com/Demo\">http://wiki-wendao.rhcloud.com/Demo</a><br/><br/>wiki-wendao团队</body></html>", "text/html;charset=utf-8");
			email.send();
		} catch (EmailException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static void notifyPwdChange(String username, String useremail, String userpassword) {
		MultiPartEmail email = new MultiPartEmail();
		email.setHostName(smtp);
		email.setAuthentication(user, password);
		email.setSubject("wiki-wendao用户密码变更通知");
		email.setCharset("UTF-8");
		
		try {
			List<String> fromAddressList = StringUtils.tokenizer(fromEmail, ",");
			for (int i = 0; i < fromAddressList.size(); i++) {
				String fromAddress = fromAddressList.get(0);
				if (fromAddress.indexOf("<") != -1 && fromAddress.indexOf(">") != -1) {
					String name = fromAddress.substring(0, fromAddress.indexOf("<"));
					String addr = fromAddress.replace(name, "").replace("<", "").replace(">", "");
					email.setFrom(addr, name);
				}else {
					email.setFrom(fromAddress);
				}
			}
			
			email.addTo(useremail);
//			email.setContent("<html><head><meta charset=\"utf-8\"></head><body style=\"font-family:sans-serif;\">Hi " + username + "：<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您在wiki-wendao的密码已修改成功，请牢记您的个人信息！<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱：" + useremail + "<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码：" + userpassword + "<br/><br/>wiki-wendao团队</body></html>", "text/html;charset=utf-8");
			email.send();
		} catch (EmailException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
