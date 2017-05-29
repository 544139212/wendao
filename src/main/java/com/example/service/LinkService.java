/**
 * 
 */
package com.example.service;

import java.util.List;

import com.example.model.LinkModel;

/**
 * @author Administrator
 *
 */
public interface LinkService {
	int deleteByPrimaryKey(Integer id);
	
	int insertSelective(LinkModel record);
	
	LinkModel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LinkModel record);
	
	List<LinkModel> selectPageable(String createBy, int offset, int rows);
	
	int selectPageableCount(String createBy);
}
