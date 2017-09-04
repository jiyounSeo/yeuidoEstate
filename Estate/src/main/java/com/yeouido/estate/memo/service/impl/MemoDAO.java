package com.yeouido.estate.memo.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("memoDAO")
public class MemoDAO extends AbstractDAO
{
	   public int insertMemo(Map<String, Object> map) throws Exception{
	       return insert("memoDAO.insertMemo",map);
	   }
	   public int modifyMemo(Map<String, Object> map) throws Exception{
	       return update("memoDAO.modifyMemo",map);
	   }
	   public int deleteMemo(Map<String, Object> map) throws Exception{
	       return delete("memoDAO.deleteMemo",map);
	   }	   
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectMemoList(Map map) throws Exception{
	       return selectList("memoDAO.selectMemoList", map);
	   }
	   @SuppressWarnings("unchecked")
	   public Map selectMemoInfo(Map map) throws Exception{
	       return selectMap("memoDAO.selectMemoInfo", map);
	   }
	   
}
