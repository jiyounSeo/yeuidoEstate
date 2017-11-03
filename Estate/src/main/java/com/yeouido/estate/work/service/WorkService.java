package com.yeouido.estate.work.service;

import java.util.List;
import java.util.Map;
public interface WorkService
{
	public int insertWork(Map map) throws Exception;

	public List<Map<String,Object>> selectWorkList(Map map) throws Exception;
	
	public int modifyWork(Map map) throws Exception;
	
	public int deleteWork(Map map) throws Exception;
	
	public List<Map<String,Object>> searchObjtList(Map map) throws Exception;
	
	public int insertInterObject(Map map) throws Exception;

	public List<Map<String,Object>> selectInterObject(Map map) throws Exception;

	public int deleteInterObject(Map map) throws Exception;

	public List<Map<String,Object>> selectWorkListAtDate(Map map) throws Exception;

	public List<Map<String,Object>> selectWorkListAtMonth(Map map) throws Exception;
	
	public Map selectWorkItem(Map map) throws Exception;
}
