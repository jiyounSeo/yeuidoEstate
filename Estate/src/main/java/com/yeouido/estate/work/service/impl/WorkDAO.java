package com.yeouido.estate.work.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("workDAO")
public class WorkDAO extends AbstractDAO
{
	   public int insertWork(Map<String, Object> map) throws Exception{
	       return insert("workDAO.insertWork",map);
	   }
	   public int modifyWork(Map<String, Object> map) throws Exception{
	       return update("workDAO.modifyWork",map);
	   }
	   public int deleteWork(Map<String, Object> map) throws Exception{
	       return delete("workDAO.deleteWork",map);
	   }	   
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectWorkList(Map map) throws Exception{
	       return selectList("workDAO.selectWorkList", map);
	   }
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> searchObjtList(Map map) throws Exception{
	       return selectList("workDAO.searchObjtList", map);
	   }
	   public int insertInterObject(Map<String, Object> map) throws Exception{
	       return insert("workDAO.insertInterObject",map);
	   }
	   public int deleteInterObject(Map<String, Object> map) throws Exception{
	       return delete("workDAO.deleteInterObject",map);
	   }	   
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectInterObject(Map map) throws Exception{
	       return selectList("workDAO.selectInterObject", map);
	   }	   
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectWorkListAtDate(Map map) throws Exception{
	       return selectList("workDAO.selectWorkListAtDate", map);
	   }   
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectWorkListAtMonth(Map map) throws Exception{
	       return selectList("workDAO.selectWorkListAtMonth", map);
	   }
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectWorkListWithEndDate(Map map) throws Exception{
	       return selectList("workDAO.selectWorkListWithEndDate", map);
	   }
	   @SuppressWarnings("unchecked")
	   public Map selectWorkItem(Map map) throws Exception{
	       return selectMap("workDAO.selectWorkItem", map);
	   }
}
