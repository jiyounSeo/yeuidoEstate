package com.yeouido.estate.object.service;

import java.util.List;
import java.util.Map;
public interface ObjectService
{
	public int insertObject(Map map) throws Exception;
	
	public int modifyObject(Map map) throws Exception;
	
	public int deleteObject(Map map) throws Exception;
	
	public List<Object> selectObjectCnt(Map map) throws Exception;
	
	public List<Object> selectObjectList(Map map) throws Exception;
	
	public Map selectObjectInfo(Map map) throws Exception;
	
}
