package com.yeouido.estate.building.service;

import java.util.List;
import java.util.Map;
public interface BuildingService
{
	public int insertBuilding(Map map) throws Exception;
	
	public int modifyBuilding(Map map) throws Exception;
	
	public int deleteBuilding(Map map) throws Exception;
	
	public List<Map<String,Object>> selectBuildingList(Map map) throws Exception;
	
	public Map selectBuildingInfo(Map map) throws Exception;
	
	public Map selectBuildingConfirm(Map map) throws Exception;

	public List selectBuildingCombo(Map map)  throws Exception;
}
