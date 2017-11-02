package com.yeouido.estate.direction.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("directionDAO")
public class DirectionDAO extends AbstractDAO
{
	   public int insertDirection(Map<String, Object> map) throws Exception{
	       return insert("directionDAO.insertDirection",map);
	   }
	   public int modifyDirection(Map<String, Object> map) throws Exception{
	       return update("directionDAO.modifyDirection",map);
	   }
	   public int deleteDirection(Map<String, Object> map) throws Exception{
	       return delete("directionDAO.deleteDirection",map);
	   }	   
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectALLRegDirList(Map map) throws Exception{
	       return selectList("directionDAO.selectALLRegDirList", map);
	   }
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectALLDirList(Map map) throws Exception{
	       return selectList("directionDAO.selectALLDirList", map);
	   }
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectDoneDirList(Map map) throws Exception{
	       return selectList("directionDAO.selectDoneDirList", map);
	   }
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectNotDoneDirList(Map map) throws Exception{
	       return selectList("directionDAO.selectNotDoneDirList", map);
	   }
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectDirListAtWork(Map map) throws Exception{
	       return selectList("directionDAO.selectDirListAtWork", map);
	   }


}
