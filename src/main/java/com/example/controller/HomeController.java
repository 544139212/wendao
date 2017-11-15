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

		model.addAttribute("threePic", "http://h.hiphotos.baidu.com/image/h%3D300/sign=1f6a583caeefce1bf52bceca9f50f3e8/d000baa1cd11728bc89597e8c1fcc3cec2fd2cbb.jpg,http://a.hiphotos.baidu.com/image/h%3D300/sign=3b2d3fbcfb1fbe09035ec5145b620c30/00e93901213fb80e3b0a611d3fd12f2eb8389424.jpg,http://e.hiphotos.baidu.com/image/h%3D300/sign=bf89b7dcc6fc1e17e2bf8a317a91f67c/42166d224f4a20a4ba033c0d99529822730ed0df.jpg");
		model.addAttribute("onePic", "http://e.hiphotos.baidu.com/image/h%3D300/sign=a9e671b9a551f3dedcb2bf64a4eff0ec/4610b912c8fcc3cef70d70409845d688d53f20f7.jpg");

		return "video";
	}

}
