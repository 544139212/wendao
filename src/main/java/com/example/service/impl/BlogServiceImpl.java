/**
 * 
 */
package com.example.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.dao.BlogModelMapper;
import com.example.model.BlogModel;
import com.example.service.BlogService;

/**
 * @author Administrator
 *
 */
@Service("blogService")
public class BlogServiceImpl implements BlogService {
	@Resource
	BlogModelMapper blogModelMapper;
	
	/* (non-Javadoc)
	 * @see com.example.service.BlogService#deleteByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return blogModelMapper.deleteByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see com.example.service.BlogService#insertSelective(com.example.model.BlogModel)
	 */
	@Override
	public int insertSelective(BlogModel record) {
		// TODO Auto-generated method stub
		return blogModelMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see com.example.service.BlogService#selectByPrimaryKey(java.lang.Integer)
	 */
	public BlogModel selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return blogModelMapper.selectByPrimaryKey(id);
	}
	
	/* (non-Javadoc)
	 * @see com.example.service.BlogService#updateByPrimaryKeySelective(com.example.model.BlogModel)
	 */
	@Override
	public int updateByPrimaryKeySelective(BlogModel record) {
		// TODO Auto-generated method stub
		return blogModelMapper.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see com.example.service.BlogService#selectPageable(java.lang.String, int, int)
	 */
	@Override
	public List<BlogModel> selectPageable(String createBy, int offset, int rows) {
		// TODO Auto-generated method stub
		return blogModelMapper.selectPageable(createBy, offset, rows);
	}

	/* (non-Javadoc)
	 * @see com.example.service.BlogService#selectPageableCount(java.lang.String)
	 */
	@Override
	public int selectPageableCount(String createBy) {
		// TODO Auto-generated method stub
		return blogModelMapper.selectPageableCount(createBy);
	}
	
}
