package com.yeouido.estate.direction.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.direction.service.DirectionService;

@Service("directionService")
public class DirectionServiceImpl  implements DirectionService
{
   @Resource(name = "directionDAO")
   private DirectionDAO directionDAO;

   @Override
   public int insertDirection(Map map) throws Exception {
	   return directionDAO.insertDirection(map);
   }
   @Override
   public List<Map<String,Object>> selectALLRegDirList(Map map) throws Exception {
	   return directionDAO.selectALLRegDirList(map);
   }
   @Override
   public List<Map<String,Object>> selectALLDirList(Map map) throws Exception {
	   return directionDAO.selectALLDirList(map);
   }
   @Override
   public List<Map<String,Object>> selectDoneDirList(Map map) throws Exception {
	   return directionDAO.selectDoneDirList(map);
   }
   @Override
   public List<Map<String,Object>> selectNotDoneDirList(Map map) throws Exception {
	   return directionDAO.selectNotDoneDirList(map);
   }
   @Override
   public List<Map<String,Object>> selectDirListAtWork(Map map) throws Exception {
	   return directionDAO.selectDirListAtWork(map);
   }
   @Override
   public int modifyDirection(Map map) throws Exception {
	   return directionDAO.modifyDirection(map);
   }
   @Override
   public int deleteDirection(Map map) throws Exception {
	   return directionDAO.deleteDirection(map);
   }


}