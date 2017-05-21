package com.job.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.job.dao.PersonalInfoRepository;
import com.job.model.PersonalInfo;

@Controller
@RequestMapping("/view")
public class ViewController {

	@Inject
	PersonalInfoRepository repo;
	
	@RequestMapping("")
	public String view(@RequestParam(value="flag",required=false)Boolean flag,ModelMap map)
	{
		List<PersonalInfo> list = (List<PersonalInfo>) repo.findAll();
		map.put("data", list);
		map.put("title","View");
		if(flag != null)
		{
			map.put("message", "Updated Successfully");
			map.put("type","success");
		}
		return "view";
	}
}
