/**
 * 
 */
package com.example.controller;


import com.example.dao.UserModelMapper;
import com.example.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 * @author Administrator
 *
 */
@Controller
public class BaseController {

	final int pageSize = 13;

	@Autowired
	UserModelMapper userModelMapper;

	@ModelAttribute("currentUser")
	public UserModel getCurrentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication!=null &&  authentication.getPrincipal() instanceof User){
			final User user = (User)authentication.getPrincipal();
			return userModelMapper.selectByCode(user.getUsername());
		}
		return null;
	}
}
