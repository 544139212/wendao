/**
 * 
 */
package com.example.converter.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.example.converter.Converter;
import com.example.data.LinkData;
import com.example.model.LinkModel;
import com.example.populator.impl.LinkPopulator;

/**
 * @author Administrator
 *
 */
@Component
public class LinkConverter implements
		Converter<LinkData, LinkModel> {
	@Resource
	LinkPopulator linkPopulator;

	/* (non-Javadoc)
	 * @see com.example.converter.Converter#convert(java.lang.Object)
	 */
	@Override
	public LinkData convert(LinkModel source) {
		// TODO Auto-generated method stub
		if (source == null) {
			return null;
		}
		LinkData target = new LinkData();
		linkPopulator.polulate(target, source);
		return target;
	}

	/* (non-Javadoc)
	 * @see com.example.converter.Converter#convert(java.util.List)
	 */
	@Override
	public List<LinkData> convert(List<LinkModel> source) {
		// TODO Auto-generated method stub
		if (source == null || source.isEmpty()) {
			return null;
		}
		List<LinkData> target = new ArrayList<LinkData>();
		for (LinkModel model : source) {
			target.add(convert(model));
		}
		return target;
	}

}
