/**
 * 
 */
package com.example.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.data.BlogData;
import com.example.data.LinkData;
import com.example.data.SearchPageData;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/u")
@SessionAttributes(value = {"blogData", "linkData"})
public class UserController extends BaseController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String goUser(final Model model) {
		String createBy = getCurrentUser().getEmail();
		int blogCount = blogFacade.selectPageableCount(createBy);
		int linkCount = linkFacade.selectPageableCount(createBy);
		model.addAttribute("blogCount", blogCount);
		model.addAttribute("linkCount", linkCount);
		model.addAttribute("starLevel", blogCount/10 + linkCount/200);
		return "user";
	}
	
	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String goBlog(final Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") final int pageNo) {
		String createBy = getCurrentUser().getEmail();
		List<BlogData> results = blogFacade.selectPageable(createBy, (pageNo-1) * pageSize, pageSize);
		int totalCounts = blogFacade.selectPageableCount(createBy);
		final SearchPageData<BlogData> data = new SearchPageData<BlogData>();
		data.setPageNo(pageNo);
		data.setPageSize(pageSize);
		data.setResults(results);
		data.setTotalRecords(totalCounts);
		
		model.addAttribute("blogPageData", data);
		return "userBlogs";
	}
	
	@RequestMapping(value = "/blog/create", method=RequestMethod.GET)
	public String goBlogCreate(final Model model) {
		BlogData blogData = new BlogData();
		model.addAttribute("blogData", blogData);
		// When click edit(then click save or not click save), go to create page, the edit data stay on the page.
		// because we store the data in the @SessionAttribute
		// so, add the above 2 lines to Reset blogData in @SessionAttribute before create
		// There is an other way to do so, 
		// just add /SessionStatus sessionStatus/ as a method parameter, use /sessionStatus.setComplete();/ in the method body
		// we try to use this way, but we need to call this /u/blog/create twice to get the result we want, why??? 
		
		return "publishBlog";
	}
	
	@RequestMapping(value = "/blog/update/{id}", method=RequestMethod.GET)
	public String goBlogUpdate(final Model model, 
			@PathVariable(value = "id") final Integer id) {
		BlogData blogData = blogFacade.selectByPrimaryKey(id);
		model.addAttribute("blogData", blogData);
		
		return "publishBlog";
	}
	
	@RequestMapping(value = "/blog/save", method=RequestMethod.POST)
	public String goBlogSave(final Model model,
			@ModelAttribute(value = "blogData") final BlogData blogData) {
		if (blogData.getId() == null) {
			blogData.setCreateby(getCurrentUser().getEmail());
			blogFacade.insertSelective(blogData);
		} else {
			blogFacade.updateByPrimaryKeySelective(blogData);
		}
		
		return "redirect:/u/blog";
	}
	
	@RequestMapping(value = "/blog/delete/{id}", method=RequestMethod.GET)
	public String goBlogDelete(final Model model, 
			@PathVariable(value = "id") final Integer id) {
		blogFacade.deleteByPrimaryKey(id);
		return "redirect:/u/blog";
	}
	
	@RequestMapping(value = "/link", method = RequestMethod.GET)
	public String goLink(final Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") final int pageNo) {
		String createBy = getCurrentUser().getEmail();
		List<LinkData> results = linkFacade.selectPageable(createBy, (pageNo-1) * pageSize, pageSize);
		int totalCounts = linkFacade.selectPageableCount(createBy);
		final SearchPageData<LinkData> data = new SearchPageData<LinkData>();
		data.setPageNo(pageNo);
		data.setPageSize(pageSize);
		data.setResults(results);
		data.setTotalRecords(totalCounts);
		
		model.addAttribute("linkPageData", data);
		return "userLinks";
	}
	
	@RequestMapping(value = "/link/create", method=RequestMethod.GET)
	public String goLinkCreate(final Model model) {
		LinkData linkData = new LinkData();
		model.addAttribute("linkData", linkData);
		
		return "publishLink";
	}
	
	@RequestMapping(value = "/link/update/{id}", method=RequestMethod.GET)
	public String goLinkUpdate(final Model model, 
			@PathVariable(value = "id") final Integer id) {
		LinkData linkData = linkFacade.selectByPrimaryKey(id);
		model.addAttribute("linkData", linkData);
		
		return "publishLink";
	}
	
	@RequestMapping(value = "/link/save", method=RequestMethod.POST)
	public String goLinkSave(final Model model,
		@ModelAttribute(value = "linkData") final LinkData linkData) {
		if (linkData.getId() == null) {
			linkData.setCreateby(getCurrentUser().getEmail());
			linkFacade.insertSelective(linkData);
		} else {
			linkFacade.updateByPrimaryKeySelective(linkData);
		}
		
		return "redirect:/u/link";
	}
	
	@RequestMapping(value = "/link/delete/{id}", method=RequestMethod.GET)
	public String goLinkDelete(final Model model, 
			@PathVariable(value = "id") final Integer id) {
		linkFacade.deleteByPrimaryKey(id);
		return "redirect:/u/link";
	}
	
}
