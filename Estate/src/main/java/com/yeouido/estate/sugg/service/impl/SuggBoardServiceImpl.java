package com.yeouido.estate.sugg.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.sugg.service.SuggBoardService;

@Service("suggbdService")
public class SuggBoardServiceImpl  implements SuggBoardService
{
   @Resource(name = "suggbdkDAO")
   private SuggBoardDAO suggbdkDAO;

   public List<Map<String,Object>> selectSuggBoardList(Map map) throws Exception {
	   return suggbdkDAO.selectSuggBoardList(map);
   }
   public Map selectSuggBoardInfo(Map map) throws Exception {
	   return suggbdkDAO.selectSuggBoardInfo(map);
   }
   public List<Map<String,Object>> selectLatestTaskList(Map map) throws Exception {
	   return suggbdkDAO.selectLatestTaskList(map);
   }
}