/**
 * 
 */
package com.example.controller;

import com.example.dao.BlogModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/u")
@SessionAttributes(value = {"blogData"})
public class UserController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	BlogModelMapper blogModelMapper;

	@RequestMapping(method = RequestMethod.GET)
	public String goUser(final Model model) {
		return "user";
	}

	@RequestMapping(value = "/link/create", method=RequestMethod.GET)
	public String goLinkCreate(final Model model) {
		return "publishLink";
	}

	@RequestMapping(value = "/blog/create", method=RequestMethod.GET)
	public String goBlogCreate(final Model model) {
		return "publishBlog";
	}

}
