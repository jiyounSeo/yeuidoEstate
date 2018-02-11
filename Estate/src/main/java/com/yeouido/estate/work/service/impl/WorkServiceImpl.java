package com.yeouido.estate.work.service.impl;

import java.util.ArrayList;
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
	   List list = new ArrayList<String>();
	   if (!("").equals(map.get("objtTp1")) && map.get("objtTp1") != null ) {
		   list.add(map.get("objtTp1"));
	   }
	   if (!("").equals(map.get("objtTp2")) && map.get("objtTp2") != null ) {
		   list.add(map.get("objtTp2"));
	   }
	   if (!("").equals(map.get("objtTp3")) && map.get("objtTp3") != null ) {
		   list.add(map.get("objtTp3"));
	   }
	   if (!("").equals(map.get("objtTp4")) && map.get("objtTp4") != null ) {
		   list.add(map.get("objtTp4"));
	   }
	   if (!("").equals(map.get("objtTp5")) && map.get("objtTp5") != null ) {
		   list.add(map.get("objtTp5"));
	   }
	   if (!("").equals(map.get("objtTp6")) && map.get("objtTp6") != null ) {
		   list.add(map.get("objtTp6"));
	   }
	   map.put("objtTpList", list);
	   

	   List list2 = new ArrayList<String>();
	   if (!("").equals(map.get("saleTp1")) && map.get("saleTp1") != null ) {
		   list2.add(map.get("saleTp1"));
	   }
	   if (!("").equals(map.get("saleTp2")) && map.get("saleTp2") != null ) {
		   list2.add(map.get("saleTp2"));
	   }
	   if (!("").equals(map.get("saleTp3")) && map.get("saleTp3") != null ) {
		   list2.add(map.get("saleTp3"));
	   }
	   if (!("").equals(map.get("saleTp4")) && map.get("saleTp4") != null ) {
		   list2.add(map.get("saleTp4"));
	   }
	   if ( ( (!("").equals(map.get("objtTp2")) && map.get("objtTp2") != null) || (!("").equals(map.get("objtTp3")) && map.get("objtTp3") != null) )
			   && (!("").equals(map.get("saleTp3")) && map.get("saleTp3") != null)  ) {
		   list2.add("ST005");
	   }
	   map.put("saleTpList", list2);
	   
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
   @Override
   public List<Map<String,Object>> selectWorkListAtDate(Map map) throws Exception {
	   return workDAO.selectWorkListAtDate(map);
   }
   @Override
   public List<Map<String,Object>> selectWorkListAtMonth(Map map) throws Exception {
	   return workDAO.selectWorkListAtMonth(map);
   }
   @Override
   public List<Map<String,Object>> selectWorkListWithEndDate(Map map) throws Exception {
	   return workDAO.selectWorkListWithEndDate(map);
   }

   public Map selectWorkItem(Map map) throws Exception {
	   return workDAO.selectWorkItem(map);
   }

}