package com.yeouido.estate.logbook.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.logbook.service.LogbookService;

@Service("logbookService")
public class LogbookServiceImpl  implements LogbookService
{
   @Resource(name = "logbookDAO")
   private LogbookDAO logbookDAO;

   public int insertLogbook(Map map) throws Exception {
	   return logbookDAO.insertLogbook(map);
   }
   public int modifyLogbook(Map map) throws Exception {
	   return logbookDAO.modifyLogbook(map);
   }
   public int deleteLogbook(Map map) throws Exception {
	   return logbookDAO.deleteLogbook(map);
   }   
   public List<Map<String,Object>> selectLogbookList(Map map) throws Exception {
	   return logbookDAO.selectLogbookList(map);
   }
   public Map selectLogbookInfo(Map map) throws Exception {
	   return logbookDAO.selectLogbookInfo(map);
   }
   public Map selectLogbookConfirm(Map map) throws Exception {
	   return logbookDAO.selectLogbookConfirm(map);
   }
}