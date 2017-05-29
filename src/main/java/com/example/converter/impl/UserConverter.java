/**
 * 
 */
package com.example.converter.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.example.converter.Converter;
import com.example.data.UserData;
import com.example.model.UserModel;
import com.example.populator.impl.UserPopulator;

/**
 * @author Administrator
 *
 */
@Component
public class UserConverter implements Converter<UserData, UserModel> {
	@Resource
	UserPopulator userPopulator;
	
	/* (non-Javadoc)
	 * @see com.example.converter.Converter#convert(java.lang.Object)
	 */
	public UserData convert(UserModel source) {
		// TODO Auto-generated method stub
		if (source == null) {
			return null;
		}
		UserData target = new UserData();
		userPopulator.polulate(target, source);
		return target;
	}

	/* (non-Javadoc)
	 * @see com.example.converter.Converter#convert(java.util.List)
	 */
	public List<UserData> convert(List<UserModel> source) {
		// TODO Auto-generated method stub
		if (source == null || source.isEmpty()) {
			return null;
		}
		List<UserData> target = new ArrayList<UserData>();
		for (UserModel model : source) {
			target.add(convert(model));
		}
		return target;
	}
	
}
