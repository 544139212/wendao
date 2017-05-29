/**
 * 
 */
package com.example.populator.impl;

import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import com.example.data.UserData;
import com.example.model.UserModel;
import com.example.populator.Populator;

/**
 * @author Administrator
 *
 */
@Component
public class UserPopulator implements Populator<UserData, UserModel> {

	/* (non-Javadoc)
	 * @see com.example.populator.Populator#polulate(java.lang.Object, java.lang.Object)
	 */
	public void polulate(UserData target, UserModel source) {
		// TODO Auto-generated method stub
		Assert.notNull(target, "target must be not null");
		Assert.notNull(source, "source must be not null");
		
		target.setId(source.getId());
		target.setEmail(source.getEmail());
		target.setName(source.getName());
		target.setPassword(source.getPassword());
		target.setAccountLocked(source.getAccountLocked());
		target.setRole(source.getRole());
		target.setPhoto(source.getPhoto());
	}
	
}
