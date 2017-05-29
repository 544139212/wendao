/**
 * 
 */
package com.example.populator.impl;

import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import com.example.data.LinkData;
import com.example.model.LinkModel;
import com.example.populator.Populator;

/**
 * @author Administrator
 *
 */
@Component
public class LinkPopulator implements
		Populator<LinkData, LinkModel> {

	/* (non-Javadoc)
	 * @see com.example.populator.Populator#polulate(java.lang.Object, java.lang.Object)
	 */
	@Override
	public void polulate(LinkData target, LinkModel source) {
		// TODO Auto-generated method stub
		Assert.notNull(target, "target must be not null");
		Assert.notNull(source, "source must be not null");
		
		target.setId(source.getId());
		target.setName(source.getName());
		target.setUrl(source.getUrl());
		target.setCreateby(source.getCreateby());
		target.setCreatetime(source.getCreatetime());
	}
	
}
