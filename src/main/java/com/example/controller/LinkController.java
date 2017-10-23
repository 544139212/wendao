/**
 * 
 */
package com.example.controller;

import com.example.dao.LinkModelMapper;
import com.example.data.SearchPageData;
import com.example.model.LinkModel;
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
@RequestMapping(value = "/link")
public class LinkController extends BaseController {

	@Autowired
	LinkModelMapper linkModelMapper;
	
	@RequestMapping(method = RequestMethod.GET)
	public String goLinks(final Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") final int pageNo) {
		List<LinkModel> results = linkModelMapper.selectPageable(null, (pageNo-1) * pageSize, pageSize);
		int totalCounts = linkModelMapper.selectPageableCount(null);
		final SearchPageData<LinkModel> data = new SearchPageData<LinkModel>();
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
		LinkModel linkData = linkModelMapper.selectByPrimaryKey(id);
		model.addAttribute("linkData", linkData);
		return "link";
	}

}
