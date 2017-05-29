/**
 * 
 */
package com.example.converter.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.example.converter.Converter;
import com.example.data.BlogData;
import com.example.model.BlogModel;
import com.example.populator.impl.BlogPopulator;

/**
 * @author Administrator
 *
 */
@Component
public class BlogConverter implements Converter<BlogData, BlogModel> {
	@Resource
	BlogPopulator blogPopulator;

	/* (non-Javadoc)
	 * @see com.example.converter.Converter#convert(java.lang.Object)
	 */
	public BlogData convert(BlogModel source) {
		// TODO Auto-generated method stub
		if (source == null) {
			return null;
		}
		BlogData target = new BlogData();
		blogPopulator.polulate(target, source);
		return target;
	}

	/* (non-Javadoc)
	 * @see com.example.converter.Converter#convert(java.util.List)
	 */
	public List<BlogData> convert(List<BlogModel> source) {
		// TODO Auto-generated method stub
		if (source == null || source.isEmpty()) {
			return null;
		}
		List<BlogData> target = new ArrayList<BlogData>();
		for (BlogModel model : source) {
			target.add(convert(model));
		}
		return target;
	}
	
}
