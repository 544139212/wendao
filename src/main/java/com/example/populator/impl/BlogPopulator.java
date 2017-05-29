/**
 * 
 */
package com.example.populator.impl;

import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import com.example.data.BlogData;
import com.example.model.BlogModel;
import com.example.populator.Populator;

/**
 * @author Administrator
 *
 */
@Component
public class BlogPopulator implements Populator<BlogData, BlogModel> {

	/* (non-Javadoc)
	 * @see com.example.populator.Populator#polulate(java.lang.Object, java.lang.Object)
	 */
	public void polulate(BlogData target, BlogModel source) {
		// TODO Auto-generated method stub
		Assert.notNull(target, "target must be not null");
		Assert.notNull(source, "source must be not null");
		
		target.setId(source.getId());
		target.setTitle(source.getTitle());
		target.setSummary(source.getSummary());
		target.setContent(source.getContent());
		target.setCreateby(source.getCreateby());
		target.setCreatetime(source.getCreatetime());
	}
	
}
