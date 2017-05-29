/**
 * 
 */
package com.example.facade;

import java.util.List;

import com.example.data.BlogData;

/**
 * @author Administrator
 *
 */
public interface BlogFacade {
	int deleteByPrimaryKey(Integer id);
	
	int insertSelective(BlogData record);
	
	BlogData selectByPrimaryKey(Integer id);
	
	int updateByPrimaryKeySelective(BlogData record);
	
	List<BlogData> selectPageable(String createBy, int offset, int rows);
	
	int selectPageableCount(String createBy);
}
