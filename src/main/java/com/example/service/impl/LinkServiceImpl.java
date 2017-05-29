/**
 * 
 */
package com.example.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.dao.LinkModelMapper;
import com.example.model.LinkModel;
import com.example.service.LinkService;

/**
 * @author Administrator
 *
 */
@Service("linkService")
public class LinkServiceImpl implements LinkService {
	@Resource
	LinkModelMapper linkModelMapper;
	
	/* (non-Javadoc)
	 * @see com.example.service.LinkService#deleteByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return linkModelMapper.deleteByPrimaryKey(id);
	}
	
	/* (non-Javadoc)
	 * @see com.example.service.LinkService#insertSelective(com.example.model.LinkModel)
	 */
	@Override
	public int insertSelective(LinkModel record) {
		// TODO Auto-generated method stub
		return linkModelMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see com.example.service.LinkService#selectByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public LinkModel selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return linkModelMapper.selectByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see com.example.service.LinkService#updateByPrimaryKeySelective(com.example.model.LinkModel)
	 */
	@Override
	public int updateByPrimaryKeySelective(LinkModel record) {
		// TODO Auto-generated method stub
		return linkModelMapper.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see com.example.service.LinkService#selectPageable(java.lang.String, int, int)
	 */
	@Override
	public List<LinkModel> selectPageable(String createBy, int offset,
			int rows) {
		// TODO Auto-generated method stub
		return linkModelMapper.selectPageable(createBy, offset, rows);
	}

	/* (non-Javadoc)
	 * @see com.example.service.LinkService#selectPageableCount(java.lang.String)
	 */
	@Override
	public int selectPageableCount(String createBy) {
		// TODO Auto-generated method stub
		return linkModelMapper.selectPageableCount(createBy);
	}
	
}
