package com.job.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job.cache.StateCityCache;
import com.job.constants.Caste;
import com.job.constants.Constants;
import com.job.constants.JobTypes;

@Controller
@RequestMapping("/")
public class HomeController {

	@Inject 
	private StateCityCache stateCityCache;
	
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap map, @RequestParam(required=false) String error, @RequestParam(required=false) String logout) 
    {
        if (error != null)
        {
            map.put("message", "Your username and password is invalid.");
            map.put("type", "danger");
            return "index";
        }
        if (logout != null)
        {
        	map.put("message", "You have been logged out successfully.");
            map.put("type", "success");
        	return "index";
        }
       return "redirect:home";
    }
    
	@RequestMapping("home")
	public String home(ModelMap map)
	{
		map.put("title","Search");
		List<String> cityList = new ArrayList<>();
		stateCityCache.getCache().keySet().forEach(key -> cityList.addAll(stateCityCache.getCache().get(key)));
		map.put("states", cityList);
		map.put("castes", Arrays.asList(Caste.values()));
		map.put("jobTypes", Arrays.asList(JobTypes.values()));
		map.put("degree", Constants.degree);
		return "search";
	}
		
	@RequestMapping("getCity")
	@ResponseBody
	public List<String> getCities(@RequestParam String state)
	{
		return stateCityCache.getCache().get(state);
	}
	
	@RequestMapping("getStates")
	@ResponseBody
	public Set<String> getStates()
	{
		return stateCityCache.getCache().keySet();
	}
}
