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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * @author Administrator
 *
 */
@Controller
public class BaseController {

	static final String ERROR_MESSAGES = "errors";

	static RedirectAttributes redirectAttributes;
	
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

	protected static void addErrorMessage(final String message) {
		RedirectAttributes redirectAttributes = getRedirectAttributes();
		if (redirectAttributes != null) {
			final Map<String, ?> map = redirectAttributes.getFlashAttributes();
			if (map.containsKey(ERROR_MESSAGES)) {
				final List<String> messages = new ArrayList<String>((List<String>) map.get(ERROR_MESSAGES));
				messages.add(message);
				redirectAttributes.addFlashAttribute(ERROR_MESSAGES, messages);
			} else {
				redirectAttributes.addFlashAttribute(ERROR_MESSAGES, Collections.singletonList(message));
			}
		}
	}

	public static RedirectAttributes getRedirectAttributes() {
		return redirectAttributes;
	}

	public void setRedirectAttributes(RedirectAttributes redirectAttributes) {
		this.redirectAttributes = redirectAttributes;
	}
}
