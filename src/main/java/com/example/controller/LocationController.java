/**
 * 
 */
package com.example.controller;

import com.example.dao.impl.LocationDao;
import com.example.model.LocationModel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/location")
public class LocationController extends BaseController {
	
	@Resource
	private LocationDao locationDao;

	@RequestMapping(value = "/object", method = RequestMethod.POST)
	@ResponseBody
	public String object(@RequestBody LocationModel model) {
		locationDao.add(model);
		return model.getLongitude() + " " + model.getLatitude() + " " + model.getCreateBy() + " " + model.getCreateTime();
	}
	
	@RequestMapping(value = "/map", method = RequestMethod.POST)
	@ResponseBody
	public String map(@RequestBody Map<String, String> map) {
		String createBy = map.get("createBy");
		return createBy;
	}
	
	@RequestMapping(value = "/date", method = RequestMethod.POST)
	@ResponseBody
	public String map(@RequestBody Date date) {
		return date.toString();
	}
}
