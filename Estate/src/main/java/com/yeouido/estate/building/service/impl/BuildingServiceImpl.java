package com.yeouido.estate.building.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.building.service.BuildingService;

@Service("buildingService")
public class BuildingServiceImpl  implements BuildingService
{
   @Resource(name = "buildingDAO")
   private BuildingDAO buildingDAO;
   @Override
   public int insertBuilding(Map map) throws Exception {
	   return buildingDAO.insertBuilding(map);
   }
   @Override
   public int modifyBuilding(Map map) throws Exception {
	   return buildingDAO.modifyBuilding(map);
   }
   @Override
   public int deleteBuilding(Map map) throws Exception {
	   return buildingDAO.deleteBuilding(map);
   }
   @Override
   public List<Map<String,Object>> selectBuildingList(Map map) throws Exception {
	   return buildingDAO.selectBuildingList(map);
   }
   @Override
   public Map selectBuildingInfo(Map map) throws Exception {
	   return buildingDAO.selectBuildingInfo(map);
   }
   @Override
   public Map selectBuildingConfirm(Map map) throws Exception {
	   return buildingDAO.selectBuildingConfirm(map);
   }
   @Override
   public List selectBuildingCombo(Map map)  throws Exception {
	   return buildingDAO.selectBuildingCombo(map);
   }
}