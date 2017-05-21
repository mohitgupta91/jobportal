package com.job.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job.cache.StateCityCache;
import com.job.constants.Caste;
import com.job.constants.Constants;
import com.job.constants.JobTypes;
import com.job.dto.AddEditDto;
import com.job.service.RegistrationService;

@Controller
@RequestMapping("/register")
public class RegistrationController {

	@Inject 
	private StateCityCache stateCityCache;
	
	@Inject
	private RegistrationService regService;
	
	@RequestMapping("")
	public String registerHome(@RequestParam(value="id",required=false) Long id,ModelMap map)
	{
		List<String> cityList = new ArrayList<>();
		stateCityCache.getCache().keySet().forEach( key -> cityList.addAll(stateCityCache.getCache().get(key)));
		Collections.sort(cityList);
		map.put("title","Register");
		if(id != null)
		{
			map.put("message", "Successfully Added . Registeration ID :"+id);
			map.put("type", "success");
		}
		map.put("states", stateCityCache.getCache().keySet());
		map.put("cities", cityList);
		map.put("degree", Constants.degree);
		map.put("castes", Arrays.asList(Caste.values()));
		map.put("jobTypes", Arrays.asList(JobTypes.values()));
		return "add";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public @ResponseBody Long addInfo(@RequestBody AddEditDto data, ModelMap map) {
		Long response = regService.addJobSeeker(data);
		
		return response;
	}
	
	@RequestMapping("/edit/home")
	public String editHome(@RequestParam("id") Long id,ModelMap map)
	{
		List<String> cityList = new ArrayList<>();
		stateCityCache.getCache().keySet().forEach( key -> cityList.addAll(stateCityCache.getCache().get(key)));
		Collections.sort(cityList);
		map.put("title","Edit");
		map.put("states", stateCityCache.getCache().keySet());
		map.put("cities", cityList);
		map.put("degree", Constants.degree);
		map.put("castes", Arrays.asList(Caste.values()));
		map.put("jobTypes", Arrays.asList(JobTypes.values()));
		map.put("data", regService.getJobSeeker(id));
		return "edit";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public @ResponseBody Long editInfo(@RequestBody AddEditDto data, ModelMap map) {
		return regService.editJobSeeker(data);
	}
}
