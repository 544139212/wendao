/**
 * 
 */
package com.example.controller;

import com.example.dao.BlogModelMapper;
import com.example.data.SearchPageData;
import com.example.model.BlogModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/blog")
public class BlogController extends BaseController {

	@Autowired
	BlogModelMapper blogModelMapper;

	@RequestMapping(method = RequestMethod.GET)
	public String goBlogs(final Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") final int pageNo) {
		List<BlogModel> results = blogModelMapper.selectPageable(null, (pageNo-1) * pageSize, pageSize);
		int totalCounts = blogModelMapper.selectPageableCount(null);
		final SearchPageData<BlogModel> data = new SearchPageData<BlogModel>();
		data.setPageNo(pageNo);
		data.setPageSize(pageSize);
		data.setResults(results);
		data.setTotalRecords(totalCounts);
		
		model.addAttribute("blogPageData", data);
		return "blogs";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String goBlog(final Model model, 
			@PathVariable(value = "id") final Integer id) {
		BlogModel blogData = blogModelMapper.selectByPrimaryKey(id);
		model.addAttribute("blogData", blogData);
		return "blog";
	}

}
