/**
 * 
 */
package com.example.facade.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.converter.impl.LinkConverter;
import com.example.data.LinkData;
import com.example.facade.LinkFacade;
import com.example.model.LinkModel;
import com.example.service.LinkService;

/**
 * @author Administrator
 *
 */
@Service("linkFacade")
public class LinkFacadeImpl implements LinkFacade {
	@Resource
	LinkService linkService;
	
	@Resource
	LinkConverter linkConverter;
	
	/* (non-Javadoc)
	 * @see com.example.facade.LinkFacade#deleteByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return linkService.deleteByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see com.example.facade.LinkFacade#insertSelective(com.example.data.LinkData)
	 */
	@Override
	public int insertSelective(LinkData record) {
		// TODO Auto-generated method stub
		LinkModel model = new LinkModel();
		model.setName(record.getName());
		model.setUrl(record.getUrl());
		model.setCreateby(record.getCreateby());
		return linkService.insertSelective(model);
	}

	/* (non-Javadoc)
	 * @see com.example.facade.LinkFacade#selectByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public LinkData selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return linkConverter.convert(linkService.selectByPrimaryKey(id));
	}

	/* (non-Javadoc)
	 * @see com.example.facade.LinkFacade#updateByPrimaryKeySelective(com.example.data.LinkData)
	 */
	@Override
	public int updateByPrimaryKeySelective(LinkData record) {
		// TODO Auto-generated method stub
		LinkModel model = new LinkModel();
		model.setId(record.getId());
		model.setName(record.getName());
		model.setUrl(record.getUrl());
		return linkService.updateByPrimaryKeySelective(model);
	}

	/* (non-Javadoc)
	 * @see com.example.facade.LinkFacade#selectPageable(java.lang.String, int, int)
	 */
	@Override
	public List<LinkData> selectPageable(String createBy, int offset,
			int rows) {
		// TODO Auto-generated method stub
		return linkConverter.convert(linkService.selectPageable(createBy, offset, rows));
	}

	/* (non-Javadoc)
	 * @see com.example.facade.LinkFacade#selectPageableCount(java.lang.String)
	 */
	@Override
	public int selectPageableCount(String createBy) {
		// TODO Auto-generated method stub
		return linkService.selectPageableCount(createBy);
	}

}
