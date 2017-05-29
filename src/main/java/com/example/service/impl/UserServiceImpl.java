/**
 * 
 */
package com.example.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.dao.UserModelMapper;
import com.example.model.UserModel;
import com.example.service.UserService;

/**
 * @author Administrator
 *
 */
@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	UserModelMapper userModelMapper;

	/* (non-Javadoc)
	 * @see com.example.service.UserService#insertSelective(com.example.model.UserModel)
	 */
	@Override
	public int insertSelective(UserModel record) {
		// TODO Auto-generated method stub
		return userModelMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see com.example.service.UserService#updateByPrimaryKeySelective(com.example.model.UserModel)
	 */
	@Override
	public int updateByPrimaryKeySelective(UserModel record) {
		// TODO Auto-generated method stub
		return userModelMapper.updateByPrimaryKeySelective(record);
	}


	/* (non-Javadoc)
	 * @see com.example.service.UserService#selectByCode(java.lang.String)
	 */
	public UserModel selectByCode(String code) {
		// TODO Auto-generated method stub
		return userModelMapper.selectByCode(code);
	}

}
