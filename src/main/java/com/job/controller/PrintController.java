package com.job.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.model.PersonalInfo;
import com.job.service.SearchService;

@Controller
@RequestMapping("/print")
public class PrintController {

	@Inject
	private SearchService searchService; 
	
	@RequestMapping("/{id}")
	public String printOne(@PathVariable("id") String id, ModelMap map){
		PersonalInfo result = searchService.searchByID(id);
		map.put("data",result);
		return "print";
	}
}
