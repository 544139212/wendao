/**
 * 
 */
package com.example.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.data.BlogData;
import com.example.data.SearchPageData;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/blog")
public class BlogController extends BaseController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String goBlogs(final Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") final int pageNo) {
		List<BlogData> results = blogFacade.selectPageable(null, (pageNo-1) * pageSize, pageSize);
		int totalCounts = blogFacade.selectPageableCount(null);
		final SearchPageData<BlogData> data = new SearchPageData<BlogData>();
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
		BlogData blogData = blogFacade.selectByPrimaryKey(id);
		model.addAttribute("blogData", blogData);
		return "blog";
	}
	
	@RequestMapping(value = "/goBlogs", method = RequestMethod.GET)
	@ResponseBody
	public SearchPageData<BlogData> goBlogs(@RequestParam(value = "page", required = false, defaultValue = "1") final int pageNo) {
		List<BlogData> results = blogFacade.selectPageable(null, (pageNo-1) * pageSize, pageSize);
		int totalCounts = blogFacade.selectPageableCount(null);
		final SearchPageData<BlogData> data = new SearchPageData<BlogData>();
		data.setPageNo(pageNo);
		data.setPageSize(pageSize);
		data.setResults(results);
		data.setTotalRecords(totalCounts);
		
		return data;
	}
}
