/**
 * 
 */
package com.example.facade.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.converter.impl.UserConverter;
import com.example.data.UserData;
import com.example.facade.UserFacade;
import com.example.model.UserModel;
import com.example.service.UserService;

/**
 * @author Administrator
 *
 */
@Service("userFacade")
public class UserFacadeImpl implements UserFacade {
	@Resource
	UserService userService;
	
	@Resource
	UserConverter userConverter;

	/* (non-Javadoc)
	 * @see com.example.facade.UserFacade#insertSelective(com.example.data.UserData)
	 */
	@Override
	public int insertSelective(UserData record) {
		// TODO Auto-generated method stub
		UserModel model = new UserModel();
		model.setName(record.getName());
		model.setEmail(record.getEmail());
		model.setPassword(record.getPassword());
		return userService.insertSelective(model);
	}

	/* (non-Javadoc)
	 * @see com.example.facade.UserFacade#updateByPrimaryKeySelective(com.example.data.UserData)
	 */
	@Override
	public int updateByPrimaryKeySelective(UserData record) {
		// TODO Auto-generated method stub
		UserModel model = new UserModel();
		model.setId(record.getId());
		model.setName(record.getName());
		model.setEmail(record.getEmail());
		model.setPassword(record.getPassword());
		model.setAccountLocked(record.getAccountLocked());
		model.setRole(record.getRole());
		model.setPhoto(record.getPhoto());
		return userService.updateByPrimaryKeySelective(model);
	}

	/* (non-Javadoc)
	 * @see com.example.facade.UserFacade#selectByCode(java.lang.String)
	 */
	public UserData selectByCode(String code) {
		// TODO Auto-generated method stub
		return userConverter.convert(userService.selectByCode(code));
	}

}
