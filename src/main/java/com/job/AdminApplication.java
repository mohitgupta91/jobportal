package com.job;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.job.cache.StateCityCache;

@SpringBootApplication
public class AdminApplication {

	@Inject
	private StateCityCache stateCityCache;
	
	public static void main(String[] args) {
		SpringApplication.run(AdminApplication.class, args);
	}
	
	@PostConstruct
	public void loadCache()
	{
		stateCityCache.load();
	}
}
