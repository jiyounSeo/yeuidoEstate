package com.yeouido.estate.object.service;

import java.util.List;
import java.util.Map;
public interface ObjectService
{
	public int insertObject(Map map) throws Exception;
	
	public int modifyObject(Map map) throws Exception;
	
	public int deleteObject(Map map) throws Exception;
	
	public List<Object> selectObjectCnt(Map map) throws Exception;
	
	public List<Map<String,Object>> selectMainObjtList(Map map) throws Exception;

	public List<Map<String,Object>> selectObjectList(Map map) throws Exception;
	
	public List<Map<String,Object>> selectTotalSearch(Map map) throws Exception;
	
	public Map selectObjectTotalCnt(Map map) throws Exception;
	
	public Map selectObjectInfo(Map map) throws Exception;

	public List<Map<String,Object>> selectDueList(Map map) throws Exception;
	
}
