package com.yeouido.estate.estate.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.estate.service.EstateService;

@Service("estateService")
public class EstateServiceImpl  implements EstateService
{
   @Resource(name = "estateDAO")
   private EstateDAO estateDAO;
   @Override
   public int insertEstate(Map map) throws Exception {
	   return estateDAO.insertEstate(map);
   }
   @Override
   public int modifyEstate(Map map) throws Exception {
	   return estateDAO.modifyEstate(map);
   }
   @Override
   public int deleteEstate(Map map) throws Exception {
	   return estateDAO.deleteEstate(map);
   }
   @Override
   public List<Map<String,Object>> selectEstateList(Map map) throws Exception {
	   return estateDAO.selectEstateList(map);
   }
   @Override
   public Map selectEstateInfo(Map map) throws Exception {
	   return estateDAO.selectEstateInfo(map);
   }
   @Override
   public Map selectEstateConfirm(Map map) throws Exception {
	   return estateDAO.selectEstateConfirm(map);
   }
   @Override
   public List selectEstateCombo(Map map)  throws Exception {
	   return estateDAO.selectEstateCombo(map);
   }
}