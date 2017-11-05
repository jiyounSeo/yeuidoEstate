package com.yeouido.estate.estate.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("estateDAO")
public class EstateDAO extends AbstractDAO
{

   public int insertEstate(Map<String, Object> map) throws Exception{
       return insert("estateDAO.insertEstate",map);
   }
   
   public int modifyEstate(Map<String, Object> map) throws Exception{
       return update("estateDAO.modifyEstate",map);
   }
   
   public int deleteEstate(Map<String, Object> map) throws Exception{
       return delete("estateDAO.deleteEstate",map);
   }
   
   @SuppressWarnings("unchecked")
   public Map selectEstateInfo(Map map) throws Exception{
       return selectMap("estateDAO.selectEstateInfo", map);
   }
   
   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> selectEstateList(Map map) throws Exception{
       return selectList("estateDAO.selectEstateList", map);
   }
   
   /* 고객등록확인 */
   @SuppressWarnings("unchecked")
   public Map selectEstateConfirm(Map map) throws Exception{
       return selectMap("estateDAO.selectEstateConfirm", map);
   }
   
   @SuppressWarnings("unchecked")
   public List selectEstateCombo(Map map) throws Exception{
       return selectList("estateDAO.selectEstateCombo", map);
   }
   
   /* 고객 필수입력값만으로 등록 */
   public int insertNewEstate(Map<String, Object> map) throws Exception{
       return insert("estateDAO.insertNewEstate",map);
   }
   
   
   
   

}
