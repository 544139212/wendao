/**
 * 
 */
package com.example.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.converter.impl.LocationConverter;
import com.example.dao.impl.LocationDao;
import com.example.data.LocationData;
import com.example.dto.LocationListWsDTO;
import com.example.dto.LocationWsDTO;
import com.example.model.LocationModel;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/location")
public class LocationController extends BaseController {
	
	@Resource
	private LocationDao locationDao;
	
	@Resource
	private LocationConverter locationConverter;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "location";
	}
	
	@ModelAttribute("locationDataList")
	public List<LocationData> getLocationDataList() {
		List<LocationModel> locationModelList = locationDao.getByCreateBy("wh@aishk.com");
		return locationConverter.convert(locationModelList);
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public String add(
			String longitude, String latitude,
			String addressLine1, String addressLine2, String addressLine3,
			String addressLine4, String addressLine5, String addressLine6,
			String addressLine7, String addressLine8, String addressLine9,
			String addressLine10, String createTime, String createBy) {
		
		LocationModel model = new LocationModel();
		model.setLongitude(longitude);
		model.setLatitude(latitude);
		model.setAddressLine1(addressLine1);
		model.setAddressLine2(addressLine2);
		model.setAddressLine3(addressLine3);
		model.setAddressLine4(addressLine4);
		model.setAddressLine5(addressLine5);
		model.setAddressLine6(addressLine6);
		model.setAddressLine7(addressLine7);
		model.setAddressLine8(addressLine8);
		model.setAddressLine9(addressLine9);
		model.setAddressLine10(addressLine10);
		model.setCreateBy(createBy);
		model.setCreateTime(createTime);
		locationDao.add(model);
		
		return null;
	}
	
	@RequestMapping(value = "/getByCreateBy", method = {RequestMethod.GET, RequestMethod.POST}, produces={"application/json"})
	@ResponseBody
	public LocationListWsDTO getLocationListWsDTOByCreateBy(String createBy) {
		List<LocationModel> locationModelList = locationDao.getByCreateBy(createBy);
		List<LocationData> locationDataList = locationConverter.convert(locationModelList);
		List<LocationWsDTO> locationWsDTOList = new ArrayList<LocationWsDTO>();
		if (locationDataList != null && !locationDataList.isEmpty()) {
			LocationWsDTO locationWsDTO = null;
			for (LocationData locationData : locationDataList) {
				locationWsDTO = new LocationWsDTO();
				locationWsDTO.setId(locationData.getId());
				locationWsDTO.setLongitude(locationData.getLongitude());
				locationWsDTO.setLatitude(locationData.getLatitude());
				locationWsDTO.setAddressLine1(locationData.getAddressLine1());
				locationWsDTO.setAddressLine2(locationData.getAddressLine2());
				locationWsDTO.setAddressLine3(locationData.getAddressLine3());
				locationWsDTO.setAddressLine4(locationData.getAddressLine4());
				locationWsDTO.setAddressLine5(locationData.getAddressLine5());
				locationWsDTO.setAddressLine6(locationData.getAddressLine6());
				locationWsDTO.setAddressLine7(locationData.getAddressLine7());
				locationWsDTO.setAddressLine8(locationData.getAddressLine8());
				locationWsDTO.setAddressLine9(locationData.getAddressLine9());
				locationWsDTO.setAddressLine10(locationData.getAddressLine10());
				locationWsDTO.setCreateBy(locationData.getCreateBy());
				locationWsDTO.setCreateTime(locationData.getCreateTime());
				locationWsDTOList.add(locationWsDTO);
			}
		}
		LocationListWsDTO locationListWsDTO = new LocationListWsDTO();
		locationListWsDTO.setLocationWsDTOList(locationWsDTOList);
		return locationListWsDTO;
	}
	
	@RequestMapping(value = "/object", method = RequestMethod.POST)
	@ResponseBody
	public LocationListWsDTO object(@RequestBody LocationModel model) {
		locationDao.add(model);
		return getLocationListWsDTOByCreateBy(model.getCreateBy());
	}
	
	@RequestMapping(value = "/map", method = RequestMethod.POST)
	@ResponseBody
	public LocationListWsDTO map(@RequestBody Map<String, String> map) {
		String createBy = map.get("createBy");
		return getLocationListWsDTOByCreateBy(createBy);
	}
	
	@RequestMapping(value = "/date", method = RequestMethod.POST)
	@ResponseBody
	public String map(@RequestBody Date date) {
		return date.toString();
	}
}
