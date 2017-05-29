/**
 * 
 */
package com.example.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.modelmapper.ModelMapper;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.example.dto.LocationListWsDTO;
import com.example.dto.LocationWsDTO;
import com.example.facade.BlogFacade;
import com.example.model.LocationModel;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/home")
public class Home1Controller extends BaseController {
	@Resource
	BlogFacade blogFacade;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getBlogs() {
//		return "redirect:page_" + DEFAULT_CURRENT_PAGE; // error
//		return "redirect:/page_" + DEFAULT_CURRENT_PAGE; // error
//		return "redirect:home/page_" + DEFAULT_CURRENT_PAGE; // ok
		return "redirect:/home/page_" + 1;// ok
	}
	
	@RequestMapping(value = "/object")
	@ResponseBody
	public String callWsObject() {
		try {
			RestTemplate template = new RestTemplate();
			
			String url = "http://localhost:8080/Kitty/location/object";
			
			LocationModel model = new LocationModel();
			model.setLongitude("110.234567");
			model.setLatitude("222.238043");
			model.setAddressLine1("1");
			model.setAddressLine2("2");
			model.setAddressLine3("3");
			model.setAddressLine4("4");
			model.setAddressLine5("5");
			model.setAddressLine6("6");
			model.setAddressLine7("7");
			model.setAddressLine8("8");
			model.setAddressLine9("9");
			model.setAddressLine10("10");
			model.setCreateBy("wh@aishk.com");
			model.setCreateTime("2016-08-21 14:03:26");
			
			ModelMapper modelMapper = new ModelMapper();
			LocationWsDTO orderDTO = modelMapper.map(model, LocationWsDTO.class);
			System.out.println(orderDTO.getLongitude());
			
			LocationListWsDTO locationListWsDTO = template.postForObject(url, model, LocationListWsDTO.class);
			if (locationListWsDTO == null || locationListWsDTO.getLocationWsDTOList() == null) 
				return "404 Not Found";
			
			return "Record Count: " + locationListWsDTO.getLocationWsDTOList().size();
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
			
			String url = "http://localhost:8080/Kitty/location/map";
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("createBy", "wh@aishk.com");
			
			LocationListWsDTO locationListWsDTO = template.postForObject(url, map, LocationListWsDTO.class);
			if (locationListWsDTO == null || locationListWsDTO.getLocationWsDTOList() == null) 
				return "404 Not Found";
			
			return "Record Count: " + locationListWsDTO.getLocationWsDTOList().size();
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
			
			String url = "http://localhost:8080/Kitty/location/date";
			
			return template.postForObject(url, new Date(), String.class);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	public static void main(String[] args) {
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		String generatePassword = md5PasswordEncoder.encodePassword("admin", "admin@admin.com");
		System.out.println(generatePassword);
	}

}
