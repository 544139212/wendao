/**
 * 
 */
package com.example.converter.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.example.converter.Converter;
import com.example.data.LocationData;
import com.example.model.LocationModel;
import com.example.populator.Populator;

/**
 * @author Administrator
 *
 */
@Component
public class LocationConverter implements
		Converter<LocationData, LocationModel> {
	@Resource
	Populator<LocationData, LocationModel> locationPopulator;

	/* (non-Javadoc)
	 * @see com.kitty.converter.Converter#convert(java.lang.Object)
	 */
	public LocationData convert(LocationModel source) {
		// TODO Auto-generated method stub
		if (source == null) {
			return null;
		}
		LocationData target = new LocationData();
		locationPopulator.polulate(target, source);
		return target;
	}

	/* (non-Javadoc)
	 * @see com.kitty.converter.Converter#convert(java.util.List)
	 */
	public List<LocationData> convert(List<LocationModel> source) {
		// TODO Auto-generated method stub
		if (source == null || source.isEmpty()) {
			return null;
		}
		List<LocationData> target = new ArrayList<LocationData>();
		for (LocationModel model : source) {
			target.add(convert(model));
		}
		return target;
	}

}
