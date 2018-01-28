package com.yeouido.estate.object.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.customer.service.impl.CustomerDAO;
import com.yeouido.estate.object.service.ObjectService;

@Service("objectService")
public class ObjectServiceImpl  implements ObjectService
{
   @Resource(name = "objectDAO")
   private ObjectDAO objectDAO;
   
   @Resource(name = "customerDAO")
   private CustomerDAO customerDAO;
   
   /* ���ǵ��*/
   @Override
   public Map insertObject(Map map) throws Exception {
	   Map<String, Object> custMap = customerDAO.selectCustomerConfirm(map);
	   if (("").equals(custMap.get("custId")) || custMap.get("custId") == null ) {
		   if (!("").equals(custMap.get("custNm")) || custMap.get("custNm") != null) {
			   map.put("custId", custMap.get("custId2"));
			   customerDAO.insertNewCustomer(map);
		   }
	   } else {
		   map.put("custId", custMap.get("custId"));
	   }
	   objectDAO.insertObject(map);
	   return map;
   }
   /* ���Ǽ��� */
   @Override
   public Map modifyObject(Map map) throws Exception {
	   
	   if (!("").equals(map.get("custId")) && map.get("custId") != null) {
		   customerDAO.modifyObjtCustomer(map);
	   }
	   objectDAO.modifyObject(map);
	   return map;
   }
   /* ���� ���� */
   @Override
   public Map selectObjectInfo(Map map) throws Exception {
	   return objectDAO.selectObjectInfo(map);
   }
   /* ���� ���� */
   @Override
   public Map selectObjectTotalCnt(Map map) throws Exception {
	   return objectDAO.selectObjectTotalCnt(map);
   }
   /* ���� ���� */
   @Override
   public Map selectMainObjectTotalCnt(Map map) throws Exception {
	   return objectDAO.selectMainObjectTotalCnt(map);
   }   
   /* ���ǻ���*/
   @Override
   public int deleteObject(Map map) throws Exception {
	   objectDAO.deleteWorkDoc(map);
	   objectDAO.deleteInterObject(map);
	   return objectDAO.deleteObject(map);
   }
   
   /* ���ǰ��� */
   @Override
   public List<Object> selectObjectCnt(Map map) throws Exception {
	   return objectDAO.selectObjectCnt(map);
   }
   
   @Override
   public List<Map<String,Object>> selectMainObjtList(Map map) throws Exception {
	   return objectDAO.selectMainObjtList(map);
   }

   @Override
   public List<Map<String,Object>> searchMainObjtList(Map map) throws Exception {
	   return objectDAO.searchMainObjtList(map);
   }
   /* ���Ǹ���Ʈ */
   @Override
   public List<Map<String,Object>> selectObjectList(Map map) throws Exception {
	   return objectDAO.selectObjectList(map);
   }
   
   @Override
   public List<Map<String,Object>> selectTotalSearch(Map map) throws Exception {
	   return objectDAO.selectTotalSearch(map);
   }

   /* ������ ���� ����Ʈ */
   @Override
   public List<Map<String,Object>> selectDueList(Map map) throws Exception {
	   return objectDAO.selectDueList(map);
   }
}