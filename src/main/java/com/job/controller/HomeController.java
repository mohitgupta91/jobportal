package com.job.controller;

import static com.job.util.DtoEntityConvertor.convertWebUserDto;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job.cache.StateCityCache;
import com.job.constants.Category;
import com.job.constants.Constants;
import com.job.constants.JobTypes;
import com.job.constants.Religion;
import com.job.constants.Role;
import com.job.dto.WebUserDto;
import com.job.model.WebUser;
import com.job.service.UserService;

@Controller
@RequestMapping("/")
public class HomeController {

	@Inject
	private StateCityCache stateCityCache;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap map, @RequestParam(name = "error", required = false) String error,
			@RequestParam(required = false) String logout,
			@RequestParam(name = "userName", required = false) String userName) {
		if (error != null) {
			map.put("message", "Your username and password is invalid.");
			map.put("type", "danger");
			return "index";
		}
		if (logout != null) {
			map.put("message", "You have been logged out successfully.");
			map.put("type", "success");
			return "index";
		}
		return "redirect:home";
	}

	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUp(@ModelAttribute WebUserDto dto, ModelMap map) {
		userService.saveOrUpdateUser(convertWebUserDto(dto, new WebUser()));
		userService.autoLogin(dto.getUserName(), dto.getPassword());
		return "redirect:home";
	}

	@RequestMapping("home")
	public String home(ModelMap map)
	{
		WebUser currentUser = (WebUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if( currentUser.getRole().equals(Role.ROLE_ADMIN) ){
			map.put("title","Search");
			List<String> cityList = new ArrayList<>();
			stateCityCache.getCache().keySet().forEach(key -> cityList.addAll(stateCityCache.getCache().get(key)));
			map.put("states", stateCityCache.getCache().keySet());
			map.put("categories", Arrays.asList(Category.values()));
			map.put("religions", Arrays.asList(Religion.values()));
			map.put("jobTypes", Arrays.asList(JobTypes.values()));
			map.put("degree", Constants.degree);
			
			return "search";
		}
		else {
			if(currentUser.getRegisterationID() != null)
				return "redirect:/register/edit/home";
			else
				return "redirect:/register";
		}
	}

	@RequestMapping("getCity")
	@ResponseBody
	public List<String> getCities(@RequestParam String state) {
		return stateCityCache.getCache().get(state);
	}

	@RequestMapping("getStates")
	@ResponseBody
	public Set<String> getStates() {
		return stateCityCache.getCache().keySet();
	}
}
