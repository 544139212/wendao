/**
 * 
 */
package com.example.facade.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.converter.impl.BlogConverter;
import com.example.data.BlogData;
import com.example.facade.BlogFacade;
import com.example.model.BlogModel;
import com.example.service.BlogService;

/**
 * @author Administrator
 *
 */
@Service("blogFacade")
public class BlogFacadeImpl implements BlogFacade {
	@Resource
	BlogService blogService;
	
	@Resource
	BlogConverter blogConverter;
	
	/* (non-Javadoc)
	 * @see com.example.facade.BlogFacade#deleteByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return blogService.deleteByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see com.example.facade.BlogFacade#insertSelective(com.example.data.BlogData)
	 */
	@Override
	public int insertSelective(BlogData record) {
		// TODO Auto-generated method stub
		BlogModel model = new BlogModel();
		model.setTitle(record.getTitle());
		model.setSummary(record.getSummary());
		model.setContent(record.getContent());
		model.setCreateby(record.getCreateby());
		return blogService.insertSelective(model);
	}
	
	/* (non-Javadoc)
	 * @see com.example.facade.BlogFacade#selectByPrimaryKey(java.lang.Integer)
	 */
	public BlogData selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return blogConverter.convert(blogService.selectByPrimaryKey(id));
	}
	
	/* (non-Javadoc)
	 * @see com.example.facade.BlogFacade#updateByPrimaryKeySelective(com.example.data.BlogData)
	 */
	@Override
	public int updateByPrimaryKeySelective(BlogData record) {
		// TODO Auto-generated method stub
		BlogModel model = new BlogModel();
		model.setId(record.getId());
		model.setTitle(record.getTitle());
		model.setSummary(record.getSummary());
		model.setContent(record.getContent());
		return blogService.updateByPrimaryKeySelective(model);
	}

	/* (non-Javadoc)
	 * @see com.example.facade.BlogFacade#selectPageable(java.lang.String, int, int)
	 */
	@Override
	public List<BlogData> selectPageable(String createBy, int offset, int rows) {
		// TODO Auto-generated method stub
		return blogConverter.convert(blogService.selectPageable(createBy, offset, rows));
	}

	/* (non-Javadoc)
	 * @see com.example.facade.BlogFacade#selectPageableCount(java.lang.String)
	 */
	@Override
	public int selectPageableCount(String createBy) {
		// TODO Auto-generated method stub
		return blogService.selectPageableCount(createBy);
	}

}
