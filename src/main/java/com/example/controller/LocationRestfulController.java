/**
 * 
 */
package com.example.controller;

import com.example.model.LocationModel;
import org.modelmapper.ModelMapper;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/home")
public class LocationRestfulController extends BaseController {

	
	@RequestMapping(method = RequestMethod.GET)
	public String getBlogs() {
//		return "redirect:page_" + DEFAULT_CURRENT_PAGE; // error
//		return "redirect:/page_" + DEFAULT_CURRENT_PAGE; // error
//		return "redirect:home/page_" + DEFAULT_CURRENT_PAGE; // ok
		return "redirect:/home/page_" + 1;// ok

//		ModelMapper modelMapper = new ModelMapper();
//		String result1= modelMapper.map(model, String.class);
//		System.out.println(result1);
	}
	
	@RequestMapping(value = "/object")
	@ResponseBody
	public String callWsObject() {
		try {
			RestTemplate template = new RestTemplate();
			String url = "http://localhost:8080/location/object";
			LocationModel model = new LocationModel();
			model.setLongitude("110.234567");
			model.setLatitude("222.238043");
			model.setCreateBy("wh@aishk.com");
			model.setCreateTime("2016-08-21 14:03:26");
			String result = template.postForObject(url, model, String.class);
			return "Result: " + result;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@RequestMapping(value = "/map")
	@ResponseBody
	public String callWsMap() {
		try {
			RestTemplate template = new RestTemplate();
			String url = "http://localhost:8080/location/map";
			Map<String, String> map = new HashMap<String, String>();
			map.put("createBy", "wh@aishk.com");
			String result = template.postForObject(url, map, String.class);
			return "Result: " + result;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@RequestMapping(value = "/date")
	@ResponseBody
	public String callWsDate() {
		try {
			RestTemplate template = new RestTemplate();
			String url = "http://localhost:8080/location/date";
			return template.postForObject(url, new Date(), String.class);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return e.getMessage();
		}
	}

}
