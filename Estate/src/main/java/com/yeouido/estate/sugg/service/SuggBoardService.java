package com.yeouido.estate.sugg.service;

import java.util.List;
import java.util.Map;
public interface SuggBoardService
{
	public List<Map<String,Object>> selectSuggBoardList(Map map) throws Exception;
	public List<Map<String,Object>> selectLatestTaskList(Map map) throws Exception;
	
	public Map selectSuggBoardInfo(Map map) throws Exception;
	
}
