package com.job.controller;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job.cache.StateCityCache;
import com.job.constants.Caste;
import com.job.constants.Constants;
import com.job.constants.JobTypes;
import com.job.dto.SearchDto;
import com.job.model.PersonalInfo;
import com.job.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Inject
	private SearchService searchService;

	@Inject 
	private StateCityCache stateCityCache;
	
	@RequestMapping("")
	public String search(ModelMap map)
	{
		map.put("title","Search");
		map.put("states", stateCityCache.getCache().keySet());
		map.put("castes", Arrays.asList(Caste.values()));
		map.put("jobTypes", Arrays.asList(JobTypes.values()));
		map.put("degree", Constants.degree);
		return "search";
	}
	
	@RequestMapping(value = "/getResult", method = RequestMethod.POST)
	public String search(@ModelAttribute SearchDto dto, ModelMap map) {
		System.out.println(dto);
		List<PersonalInfo> result = searchService.search(dto);
		System.out.println(result);
		map.put("result", result);
		map.put("message", result == null ? "No entries found. " : result.size()+" entries found");
		map.put("type", "success");
		map.put("title","Search");
		map.put("states", stateCityCache.getCache().keySet());
		map.put("castes", Arrays.asList(Caste.values()));
		map.put("jobTypes", Arrays.asList(JobTypes.values()));
		map.put("degree", Constants.degree);
		return "search";
	}

	@RequestMapping(value = "/getResult", method = RequestMethod.GET)
	public @ResponseBody PersonalInfo searchById(@RequestParam String regID) {
		PersonalInfo result = searchService.searchByID(regID);
		System.out.println("Found - >"+result);
		return result;
	}
}
