package com.job.cache;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.stereotype.Component;

import com.job.dao.StateCityRepository;

@Component
public class StateCityCache {

	@Inject
	StateCityRepository repo;

	private Map<String, List<String>> stateCityCache;

	public void load() {
		stateCityCache = new HashMap<>();
		List<String> states = repo.findStates();
		for (String state : states) {
			List<String> cities = repo.findByState(state)
									  .stream().map(city -> new String(city.getCity()))
									  .collect(Collectors.toList());
			stateCityCache.put(state, cities);
		}
	}
	
	public void clear() {
		stateCityCache.clear();
	}

	public Map<String, List<String>> getCache() {
		return stateCityCache;
	}
}
