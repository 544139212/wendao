/**
 * 
 */
package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/")
public class IndexController {

	@RequestMapping(method = RequestMethod.GET)
	public String index(final Model model) {
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goLogin(final Model model) {
		return "login";
	}

}
