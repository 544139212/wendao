/**
 * 
 */
package com.example.facade;

import com.example.data.UserData;

/**
 * @author Administrator
 *
 */
public interface UserFacade {
	int insertSelective(UserData record);
	
	int updateByPrimaryKeySelective(UserData record);
	
	UserData selectByCode(String code);
}
