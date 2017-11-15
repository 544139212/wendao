/**
 * 
 */
package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/")
public class HomeController extends BaseController {

	@RequestMapping(method = RequestMethod.GET)
	public String index(final Model model) {
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goLogin(final Model model) {
		return "login";
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

}
