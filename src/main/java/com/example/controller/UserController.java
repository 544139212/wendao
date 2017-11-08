/**
 * 
 */
package com.example.controller;

import com.example.dao.BlogModelMapper;
import com.example.data.SearchPageData;
import com.example.enums.ErrorCodeEnum;
import com.example.model.BlogModel;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/u")
@SessionAttributes(value = {"blogData", "linkData"})
public class UserController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	BlogModelMapper blogModelMapper;

	@RequestMapping(method = RequestMethod.GET)
	public String goUser(final Model model) {
		String createBy = getCurrentUser().getEmail();
		int blogCount = blogModelMapper.selectPageableCount(createBy);
		model.addAttribute("blogCount", blogCount);
		model.addAttribute("linkCount", 500);
		model.addAttribute("starLevel", blogCount/10 + 500/200);
		return "user";
	}
	
	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String goBlog(final Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") final int pageNo) {
		String createBy = getCurrentUser().getEmail();
		List<BlogModel> results = blogModelMapper.selectPageable(createBy, (pageNo-1) * pageSize, pageSize);
		int totalCounts = blogModelMapper.selectPageableCount(createBy);
		final SearchPageData<BlogModel> data = new SearchPageData<BlogModel>();
		data.setPageNo(pageNo);
		data.setPageSize(pageSize);
		data.setResults(results);
		data.setTotalRecords(totalCounts);
		
		model.addAttribute("blogPageData", data);
		return "userBlogs";
	}
	
	@RequestMapping(value = "/blog/create", method=RequestMethod.GET)
	public String goBlogCreate(final Model model) {
		BlogModel blogData = new BlogModel();
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
		BlogModel blogData = blogModelMapper.selectByPrimaryKey(id);
		model.addAttribute("blogData", blogData);
		
		return "publishBlog";
	}
	
	@RequestMapping(value = "/blog/save", method=RequestMethod.POST)
	public String goBlogSave(final RedirectAttributes redirectAttributes,
			@ModelAttribute(value = "blogData") final BlogModel blogData) {
		super.setRedirectAttributes(redirectAttributes);

		boolean flag = false;
		if (StringUtils.isEmpty(blogData.getTitle())) {
			addErrorMessage(ErrorCodeEnum.E0001.getMsg());
			flag = true;
		}
		if (blogData.getId() == null) {
			if (flag) {
				return "redirect:/u/blog/create";
			}
			blogData.setCreateby(getCurrentUser().getEmail());
			blogModelMapper.insertSelective(blogData);
		} else {
			if (flag) {
				return "redirect:/u/blog/update/" + blogData.getId();
			}
			blogModelMapper.updateByPrimaryKeySelective(blogData);
		}
		
		return "redirect:/u/blog";
	}
	
	@RequestMapping(value = "/blog/delete/{id}", method=RequestMethod.GET)
	public String goBlogDelete(final Model model, 
			@PathVariable(value = "id") final Integer id) {
		blogModelMapper.deleteByPrimaryKey(id);
		return "redirect:/u/blog";
	}

	@RequestMapping(value = "/link/create", method=RequestMethod.GET)
	public String goLinkCreate(final Model model) {
		return "publishLink";
	}

}
