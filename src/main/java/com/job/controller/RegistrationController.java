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

import com.job.cache.StateCityCache;
import com.job.constants.Caste;
import com.job.constants.JobTypes;
import com.job.dto.AddEditDto;
import com.job.service.RegistrationService;
import com.job.sro.ResponseSRO;

@Controller
@RequestMapping("/register")
public class RegistrationController {

	@Inject 
	private StateCityCache stateCityCache;
	
	@Inject
	private RegistrationService regService;
	
	@RequestMapping("")
	public String registerHome(ModelMap map)
	{
		List<String> cityList = new ArrayList<>();
		for(String key : stateCityCache.getCache().keySet())
			cityList.addAll(stateCityCache.getCache().get(key));
		Collections.sort(cityList);
		map.put("title","Register");
		map.put("states", stateCityCache.getCache().keySet());
		map.put("cities", cityList);
		map.put("castes", Arrays.asList(Caste.values()));
		map.put("jobTypes", Arrays.asList(JobTypes.values()));
		return "add";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addInfo(@RequestBody AddEditDto data, ModelMap map) {
		ResponseSRO response = regService.addJobSeeker(data);
		map.put("type", response.getError() ? "danger" : "success");
		map.put("message", response.getMessage());
		
		return "add";
	}
}
