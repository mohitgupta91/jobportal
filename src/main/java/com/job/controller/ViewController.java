package com.job.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.dao.PersonalInfoRepository;

@Controller
@RequestMapping("/view")
public class ViewController {

	@Inject
	PersonalInfoRepository repo;
	
	@RequestMapping("/")
	public String view(ModelMap map)
	{
		map.put("data", repo.findAll());
		map.put("title","View");
		return "view";
	}
}
