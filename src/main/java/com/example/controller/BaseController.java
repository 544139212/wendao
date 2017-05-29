/**
 * 
 */
package com.example.controller;


import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.data.UserData;
import com.example.facade.BlogFacade;
import com.example.facade.LinkFacade;
import com.example.facade.UserFacade;

/**
 * @author Administrator
 *
 */
@Controller
public class BaseController {
	
	final int pageSize = 13;
	
	@Resource
	BlogFacade blogFacade;
	
	@Resource
	LinkFacade linkFacade;
	
	@Resource
	UserFacade userFacade;
	
	@ModelAttribute("currentUser")
	public UserData getCurrentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication!=null &&  authentication.getPrincipal() instanceof User){
			final User user = (User)authentication.getPrincipal();
			return userFacade.selectByCode(user.getUsername());
		}
		return null;
	}
	
}
