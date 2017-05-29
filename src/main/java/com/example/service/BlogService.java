/**
 * 
 */
package com.example.service;

import java.util.List;

import com.example.model.BlogModel;

/**
 * @author Administrator
 *
 */
public interface BlogService {
	int deleteByPrimaryKey(Integer id);
	
	int insertSelective(BlogModel record);
	
	BlogModel selectByPrimaryKey(Integer id);
	
	int updateByPrimaryKeySelective(BlogModel record);
	
	List<BlogModel> selectPageable(String createBy, int offset, int rows);
	
	int selectPageableCount(String createBy);
}
