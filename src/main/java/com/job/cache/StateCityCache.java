package com.job.cache;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.stereotype.Component;

import com.job.dao.StateCityRepository;

@Component
public class StateCityCache {

	@Inject
	StateCityRepository repo;

	private TreeMap<String, List<String>> stateCityCache;

	public void load() {
		stateCityCache = new TreeMap<>();
		List<String> states = repo.findStates();
		for (String state : states) {
			List<String> cities = repo.findByState(state)
									  .stream().map(city -> new String(city.getCity()))
									  .collect(Collectors.toList());
			Collections.sort(cities);
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
