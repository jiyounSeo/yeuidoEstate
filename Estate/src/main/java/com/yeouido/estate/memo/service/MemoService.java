package com.yeouido.estate.memo.service;

import java.util.List;
import java.util.Map;
public interface MemoService
{
	public int insertMemo(Map map) throws Exception;
	
	public int modifyMemo(Map map) throws Exception;
	
	public int deleteMemo(Map map) throws Exception;
	
	public List<Map<String,Object>> selectMemoList(Map map) throws Exception;
	
	public Map selectMemoInfo(Map map) throws Exception;
	
}
