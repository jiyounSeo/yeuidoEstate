package com.yeouido.estate.building.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("buildingDAO")
public class BuildingDAO extends AbstractDAO
{

   public int insertBuilding(Map<String, Object> map) throws Exception{
       return insert("buildingDAO.insertBuilding",map);
   }
   public int modifyBuilding(Map<String, Object> map) throws Exception{
       return update("buildingDAO.modifyBuilding",map);
   }
   public int deleteBuilding(Map<String, Object> map) throws Exception{
       return delete("buildingDAO.deleteBuilding",map);
   }
   @SuppressWarnings("unchecked")
   public Map selectBuildingInfo(Map map) throws Exception{
       return selectMap("buildingDAO.selectBuildingInfo", map);
   }
   
   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> selectBuildingList(Map map) throws Exception{
       return selectList("buildingDAO.selectBuildingList", map);
   }
   
   /* 고객등록확인 */
   @SuppressWarnings("unchecked")
   public Map selectBuildingConfirm(Map map) throws Exception{
       return selectMap("buildingDAO.selectBuildingConfirm", map);
   }
   
   @SuppressWarnings("unchecked")
   public List selectBuildingCombo(Map map) throws Exception{
       return selectList("buildingDAO.selectBuildingCombo", map);
   }
   
   /* 고객 필수입력값만으로 등록 */
   public int insertNewbuilding(Map<String, Object> map) throws Exception{
       return insert("buildingDAO.insertNewbuilding",map);
   }
   
   
   
   

}
