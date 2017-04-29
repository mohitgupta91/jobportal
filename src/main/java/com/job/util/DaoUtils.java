package com.job.util;

import java.util.Collection;
import java.util.List;

public class DaoUtils {

	public static String addParamPaths(Collection<?> collection,Integer argNum) {
		String marks = "";
		Integer arg = argNum;
		for (int i = 0; i < collection.size() - 1; i++)
			marks += "?"+(++arg)+", ";
		marks += "?"+(++arg);
		argNum = arg;
		return marks;
	}
	
	public static String handleMinMax(List<Object> paramList, String column, Integer min, Integer max, Integer argNum) {
		if(min == null && max == null)	return "";
		Integer args = argNum;
		String query = "";
		if(min != null)
		{
			query += column+" > ?"+(++args) ;
			paramList.add(min);
		}
		if(max != null)
		{
			query += column+" < ?"+(++args);
			paramList.add(max);
		}
		argNum = args;
		return query;
	}
}
