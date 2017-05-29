/**
 * 
 */
package com.example.service;

import com.example.model.UserModel;

/**
 * @author Administrator
 *
 */
public interface UserService {
	int insertSelective(UserModel record);
	
	int updateByPrimaryKeySelective(UserModel record);
	
	UserModel selectByCode(String code);
}
