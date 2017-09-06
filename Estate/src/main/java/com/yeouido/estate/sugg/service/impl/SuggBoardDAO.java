package com.yeouido.estate.sugg.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("suggbdkDAO")
public class SuggBoardDAO extends AbstractDAO
{
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectSuggBoardList(Map map) throws Exception{
	       return selectList("suggbdkDAO.selectSuggBoardList", map);
	   }
	   @SuppressWarnings("unchecked")
	   public Map selectSuggBoardInfo(Map map) throws Exception{
	       return selectMap("suggbdkDAO.selectLogbookInfo", map);
	   }	   
}
