package com.yeouido.estate.work.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.work.service.WorkService;

@Service("workService")
public class WorkServiceImpl  implements WorkService
{
   @Resource(name = "workDAO")
   private WorkDAO workDAO;

   @Override
   public int insertWork(Map map) throws Exception {
	   return workDAO.insertWork(map);
   }
   @Override
   public List<Map<String,Object>> selectWorkList(Map map) throws Exception {
	   return workDAO.selectWorkList(map);
   }
   @Override
   public int modifyWork(Map map) throws Exception {
	   return workDAO.modifyWork(map);
   }
   @Override
   public int deleteWork(Map map) throws Exception {
	   return workDAO.deleteWork(map);
   }
   @Override
   public List<Map<String,Object>> searchObjtList(Map map) throws Exception {
	   return workDAO.searchObjtList(map);
   }
   @Override
   public List<Map<String,Object>> selectInterObject(Map map) throws Exception {
	   return workDAO.selectInterObject(map);
   }
   @Override
   public int insertInterObject(Map map) throws Exception {
	   return workDAO.insertInterObject(map);
   }
   @Override
   public int deleteInterObject(Map map) throws Exception {
	   return workDAO.deleteInterObject(map);
   }


}