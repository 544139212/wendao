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

import com.example.data.LinkData;
import com.example.data.SearchPageData;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/link")
public class LinkController extends BaseController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String goLinks(final Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") final int pageNo) {
		List<LinkData> results = linkFacade.selectPageable(null, (pageNo-1) * pageSize, pageSize);
		int totalCounts = linkFacade.selectPageableCount(null);
		final SearchPageData<LinkData> data = new SearchPageData<LinkData>();
		data.setPageNo(pageNo);
		data.setPageSize(pageSize);
		data.setResults(results);
		data.setTotalRecords(totalCounts);
		
		model.addAttribute("linkPageData", data);
		return "links";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String goLink(final Model model, 
			@PathVariable(value = "id") final Integer id) {
		LinkData linkData = linkFacade.selectByPrimaryKey(id);
		model.addAttribute("linkData", linkData);
		return "link";
	}
}
