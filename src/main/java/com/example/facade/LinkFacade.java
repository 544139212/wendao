/**
 * 
 */
package com.example.facade;

import java.util.List;

import com.example.data.LinkData;

/**
 * @author Administrator
 *
 */
public interface LinkFacade {
	int deleteByPrimaryKey(Integer id);
	
	int insertSelective(LinkData record);
	
	LinkData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LinkData record);
    
	List<LinkData> selectPageable(String createBy, int offset, int rows);
	
	int selectPageableCount(String createBy);
}
