package com.yeouido.estate.logbook.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("logbookDAO")
public class LogbookDAO extends AbstractDAO
{
	   public int insertLogbook(Map<String, Object> map) throws Exception{
	       return insert("LogbookDAO.insertLogbook",map);
	   }
	   public int modifyLogbook(Map<String, Object> map) throws Exception{
	       return update("LogbookDAO.modifyLogbook",map);
	   }
	   public int deleteLogbook(Map<String, Object> map) throws Exception{
	       return delete("LogbookDAO.deleteLogbook",map);
	   }	   
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectLogbookList(Map map) throws Exception{
	       return selectList("LogbookDAO.selectLogbookList", map);
	   }
	   @SuppressWarnings("unchecked")
	   public Map selectLogbookInfo(Map map) throws Exception{
	       return selectMap("LogbookDAO.selectLogbookInfo", map);
	   }
	   /* 업무일지등록확인 */
	   @SuppressWarnings("unchecked")
	   public Map selectLogbookConfirm(Map map) throws Exception{
	       return selectMap("LogbookDAO.selectLogbookConfirm", map);
	   }
	   
}
