package com.yeouido.estate.direction.service;

import java.util.List;
import java.util.Map;
public interface DirectionService
{
	public int insertDirection(Map map) throws Exception;

	public List<Map<String,Object>> selectALLRegDirList(Map map) throws Exception;
	
	public List<Map<String,Object>> selectALLDirList(Map map) throws Exception;
	
	public List<Map<String,Object>> selectDoneDirList(Map map) throws Exception;
	
	public List<Map<String,Object>> selectNotDoneDirList(Map map) throws Exception;

	public List<Map<String,Object>> selectDirListAtWork(Map map) throws Exception;
	
	public int modifyDirection(Map map) throws Exception;
	
	public int deleteDirection(Map map) throws Exception;
}
