package com.job.controller;

import static com.job.util.DtoEntityConvertor.convertWebUserDto;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job.dto.WebUserDto;
import com.job.model.WebUser;
import com.job.service.UserService;
import com.job.sro.ResponseSRO;

@Controller
@RequestMapping("/user")
public class UserController {

	Logger logger = Logger.getLogger(UserController.class);
	
	@Inject
	private UserService userService;

	@RequestMapping("")
	public String user(ModelMap map)
	{
		map.put("title","User Management");
		map.put("users", userService.getUsers());
		return "user";
	}
	
	@RequestMapping(value="/current", method=RequestMethod.GET)
	@ResponseBody
	public WebUser getCurrentUser() {
		return (WebUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String addUser(@ModelAttribute WebUserDto dto, ModelMap map) {
		userService.saveOrUpdateUser(convertWebUserDto(dto, new WebUser()));
		map.put("title", "User Management");
		return "user";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public ResponseSRO editUser(@ModelAttribute WebUserDto dto) {
		try {
			userService.saveOrUpdateUser(convertWebUserDto(dto, new WebUser()));
			return new ResponseSRO("Updated Successfully", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new ResponseSRO("Error Ocurred -> " + e.toString(), true);
		}
	}
	
	@RequestMapping(value="/changePassword", method=RequestMethod.POST)
	@ResponseBody
	public ResponseSRO changePassword(@RequestParam("passwd") String passwd) {
		try {
			System.out.println(passwd);
			userService.changeCurrentUserPassword(passwd);
			return new ResponseSRO("Password Changed", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new ResponseSRO("Error Ocurred -> " + e.toString(), true);
		}
	}

	@RequestMapping(value="/{id}/changePassword", method=RequestMethod.POST)
	@ResponseBody
	public ResponseSRO changePasswordUser(@PathVariable Long id,@RequestParam("passwd") String passwd) {
		try {
			userService.changeUserPassword(id,passwd);
			return new ResponseSRO("Password Changed", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new ResponseSRO("Error Ocurred -> " + e.toString(), true);
		}
	}
	
	@RequestMapping(value="/{id}/enable")
	public String enableUser(@PathVariable Long id,ModelMap map) {
		userService.enableUser(id);
		map.put("title","User Management");
		map.put("users", userService.getUsers());
		return "user";
	}
	
	@RequestMapping(value="/{id}/disable")
	public String disableUser(@PathVariable Long id,ModelMap map) {
		userService.disableUser(id);
		map.put("title","User Management");
		map.put("users", userService.getUsers());
		return "user";
	}
}
