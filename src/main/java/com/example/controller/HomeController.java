/**
 * 
 */
package com.example.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.data.UserData;
import com.example.email.EmailSender;
import com.example.utils.PasswordUtils;
import com.example.utils.VerifyCodeUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/")
public class HomeController extends BaseController {
	
	@Resource
	EmailSender emailSender;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(final Model model) {
		
		return "home";
	}

	@RequestMapping(value = "/goVideo", method = RequestMethod.GET)
	public String goVideo(final Model model) {
		List<Integer> videoTypeList = new ArrayList<>();
		videoTypeList.add(1);
		videoTypeList.add(2);
		videoTypeList.add(3);

		model.addAttribute("videoTypeList", videoTypeList);

		return "video";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goLogin(final Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String goRegister(final Model model) {
		return "register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(final Model model,
			@ModelAttribute(value = "userData") final UserData userData,
			HttpServletRequest request) {
		UserData existUserData = userFacade.selectByCode(userData.getEmail());
		if (existUserData != null) {
			// 用户已存在，直接返回
			return "redirect:register";
		}
		
		String generatePassword = PasswordUtils.getGeneratePassword();
		
		String subject = "「Java 社区」Java Community - Register";
		StringBuffer htmlEmailTemplate = new StringBuffer();
		htmlEmailTemplate.append("<html>");
		htmlEmailTemplate.append("<head>");
		htmlEmailTemplate.append("<meta charset=\"utf-8\">");
		htmlEmailTemplate.append("</head>");
		htmlEmailTemplate.append("<body style=\"font-family:sans-serif;\">");
		htmlEmailTemplate.append("<img src=\"").append("image/img/5.jpg").append("\" />");
		htmlEmailTemplate.append("<br/>");
		htmlEmailTemplate.append("请以下列初始密码登录「Java 社区」网站，并于登录成功后及时修改初始密码");
		htmlEmailTemplate.append("<br/>");
		htmlEmailTemplate.append("Please log in Java Community website with the initial password below and change password immediately after success log in.");
		htmlEmailTemplate.append("<br/>");
		htmlEmailTemplate.append("<br/>");
		htmlEmailTemplate.append("初始密码 Initial Password:" + generatePassword);
		htmlEmailTemplate.append("</body>");
		htmlEmailTemplate.append("</html>");
		
		try {
			String serverPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
			emailSender.sendMail(userData.getEmail(), subject, htmlEmailTemplate.toString(), serverPath);
			
			Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
			String password = md5PasswordEncoder.encodePassword(generatePassword, userData.getEmail());
			
			userData.setPassword(password);
			userFacade.insertSelective(userData);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "redirect:register";
	}
	
	@RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
	public String goResetPasswordGet(final Model model,
			@RequestParam(value = "step", defaultValue = "1", required = false)final int step,
			HttpServletRequest request) {
		if (step == 2) {
			String verifyCodeStore = (String)request.getSession().getAttribute("verifyCodeStore");
			if (StringUtils.isEmpty(verifyCodeStore)) {
				return "redirect:resetPassword";
			}
		}
		if (step == 3) {
			String authentication = (String)request.getSession().getAttribute("authentication");
			if (StringUtils.isEmpty(authentication)) {
				return "redirect:resetPassword?step=2";
			}
		}
		model.addAttribute("step", step);
		return "resetPassword";
	}
	
	// 发送身份验证邮件
	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public String goResetPasswordPost(final Model model,
			@RequestParam(value = "email", required = true) final String email,
			HttpServletRequest request) {
		
		String verifyCode = VerifyCodeUtils.getGenerateVerifyCode();
		
		String subject = "「Java 社区」Java Community - Reset Password";
		StringBuffer htmlEmailTemplate = new StringBuffer();
		htmlEmailTemplate.append("<html>");
		htmlEmailTemplate.append("<head>");
		htmlEmailTemplate.append("<meta charset=\"utf-8\">");
		htmlEmailTemplate.append("</head>");
		htmlEmailTemplate.append("<body style=\"font-family:sans-serif;\">");
		htmlEmailTemplate.append("<img src=\"").append("image/img/5.jpg").append("\" />");
		htmlEmailTemplate.append("<br/>");
		htmlEmailTemplate.append("你正在找回「Java 社区」网站密码，请将以下资料填入对应位置以验证身份");
		htmlEmailTemplate.append("<br/>");
		htmlEmailTemplate.append("You are finding the password of Java Community, please fill the below information to check your cridents.");
		htmlEmailTemplate.append("<br/>");
		htmlEmailTemplate.append("<br/>");
		htmlEmailTemplate.append("验证码 Verify Code:" + verifyCode);
		htmlEmailTemplate.append("</body>");
		htmlEmailTemplate.append("</html>");
		
		try {
			String serverPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
			emailSender.sendMail(email, subject, htmlEmailTemplate.toString(), serverPath);
			
			request.getSession().setAttribute("email", email);
			request.getSession().setAttribute("verifyCodeStore", verifyCode);
			
			// 发送成功，进入身份验证页面
			return "redirect:resetPassword?step=2";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		// 发送失败，刷新当前页
		return "redirect:resetPassword";
	}
	
	// 身份验证
	@RequestMapping(value = "/resetPassword2", method = RequestMethod.POST)
	public String goResetPasswordPost2(final Model model,
			@RequestParam(value = "verifyCode", required = true) final String verifyCode,
			HttpServletRequest request) {

		String verifyCodeStore = (String)request.getSession().getAttribute("verifyCodeStore");
		if (verifyCode.equals(verifyCodeStore)) {
			// 验证成功，进入密码重置页面
			request.getSession().setAttribute("authentication", "Y");
			
			return "redirect:resetPassword?step=3";
		}
		
		// 验证失败，刷新当前页
		return "redirect:resetPassword?step=2";
	}
	
	// 重置密码
	@RequestMapping(value = "/resetPassword3", method = RequestMethod.POST)
	public String goResetPasswordPost3(final Model model,
			@RequestParam(value = "newPassword", required = true) final String newPassword,
			HttpServletRequest request) {
		
		String email = (String)request.getSession().getAttribute("email");
		
		UserData userData = userFacade.selectByCode(email);
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		String password = md5PasswordEncoder.encodePassword(newPassword, userData.getEmail());
		
		userData.setPassword(password);
		userFacade.updateByPrimaryKeySelective(userData);
		
		request.getSession().removeAttribute("email");
		request.getSession().removeAttribute("verifyCodeStore");
		request.getSession().removeAttribute("authentication");
		
		return "redirect:login";
	}
	
}
