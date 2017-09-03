package com.yeouido.estate.logbook.service;

import java.util.List;
import java.util.Map;
public interface LogbookService
{
	public int insertLogbook(Map map) throws Exception;
	
	public int modifyLogbook(Map map) throws Exception;
	
	public int deleteLogbook(Map map) throws Exception;
	
	public List<Map<String,Object>> selectLogbookList(Map map) throws Exception;
	
	public Map selectLogbookInfo(Map map) throws Exception;
	
	public Map selectLogbookConfirm(Map map) throws Exception;
}
