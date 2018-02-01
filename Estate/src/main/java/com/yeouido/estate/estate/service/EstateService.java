package com.yeouido.estate.estate.service;

import java.util.List;
import java.util.Map;
public interface EstateService
{
	public int insertEstate(Map map) throws Exception;
	
	public int modifyEstate(Map map) throws Exception;
	
	public int deleteEstate(Map map) throws Exception;
	
	public List<Map<String,Object>> selectEstateList(Map map) throws Exception;

	public List<Map<String,Object>> selectEstateListBottom(Map map) throws Exception;
	
	public Map selectEstateInfo(Map map) throws Exception;
	
	public Map selectEstateConfirm(Map map) throws Exception;

	public List selectEstateCombo(Map map)  throws Exception;
}
