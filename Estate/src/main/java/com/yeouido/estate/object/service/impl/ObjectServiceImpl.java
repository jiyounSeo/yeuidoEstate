package com.yeouido.estate.object.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
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
   
   /* 물건등록*/
   @Override
   public Map insertObject(Map map) throws Exception {
	   Map<String, Object> custMap = customerDAO.selectCustomerConfirm(map);
	   if (("").equals(custMap.get("custId")) || custMap.get("custId") == null ) {
		   if (!(("").equals(map.get("custNm"))) && map.get("custNm") != null) {
			   map.put("custId", custMap.get("custId2"));
			   customerDAO.insertNewCustomer(map);
		   }
	   } else {
		   map.put("custId", custMap.get("custId"));
	   }
	   objectDAO.insertObject(map);
	   return map;
   }
   /* 물건수정 */
   @Override
   public Map modifyObject(Map map) throws Exception {
	   
	   if (("").equals(map.get("custId")) || map.get("custId") == null ) {
		   if (!(("").equals(map.get("custNm"))) && map.get("custNm") != null) {
			   Map<String, Object> custMap = customerDAO.selectCustomerConfirm(map);
			   if (("").equals(custMap.get("custId")) || custMap.get("custId") == null ) {
				   map.put("custId", custMap.get("custId2"));
				   customerDAO.insertNewCustomer(map);
			   }
		   }
	   } else if (!("").equals(map.get("custId")) && map.get("custId") != null) {
		   if (("").equals(map.get("custNm")) || map.get("custNm") == null ) {
			   customerDAO.deleteWorkDocByCust(map);
			   customerDAO.deleteCustomerLinkInObject(map);
			   customerDAO.deleteCustomer(map);
			   map.put("custId", "");
		   } else {
			   customerDAO.modifyObjtCustomer(map);
		   }
	   }
	   objectDAO.modifyObject(map);
	   return map;
   }
   /* 물건 정보 */
   @Override
   public Map selectObjectInfo(Map map) throws Exception {
	   return objectDAO.selectObjectInfo(map);
   }
   /* 물건 정보 */
   @Override
   public Map selectObjectTotalCnt(Map map) throws Exception {
	   List list = new ArrayList<String>();
	   if (!("").equals(map.get("activeTp1")) && map.get("activeTp1") != null ) {
		   list.add(map.get("activeTp1"));
	   }
	   if (!("").equals(map.get("activeTp2")) && map.get("activeTp2") != null ) {
		   list.add(map.get("activeTp2"));
	   }
	   if (!("").equals(map.get("activeTp3")) && map.get("activeTp3") != null ) {
		   list.add(map.get("activeTp3"));
	   }
	   map.put("activeTpList", list);
	   return objectDAO.selectObjectTotalCnt(map);
   }
   /* 물건 정보 */
   @Override
   public Map selectMainObjectTotalCnt(Map map) throws Exception {
	   return objectDAO.selectMainObjectTotalCnt(map);
   }   
   /* 물건삭제*/
   @Override
   public int deleteObject(Map map) throws Exception {
	   objectDAO.deleteWorkDoc(map);
	   objectDAO.deleteInterObject(map);
	   return objectDAO.deleteObject(map);
   }
   
   /* 물건갯수 */
   @Override
   public List<Object> selectObjectCnt(Map map) throws Exception {
	   return objectDAO.selectObjectCnt(map);
   }
   
   @Override
   public List<Map<String,Object>> selectMainObjtList(Map map) throws Exception {
	   return objectDAO.selectMainObjtList(map);
   }

   @Override
   public List<Map<String,Object>> selectMainObjtListMap(Map map) throws Exception {
	   return objectDAO.selectMainObjtListMap(map);
   }
   @Override
   public List<Map<String,Object>> searchMainObjtList(Map map) throws Exception {
	   return objectDAO.searchMainObjtList(map);
   }
   /* 물건리스트 */
   @Override
   public List<Map<String,Object>> selectObjectList(Map map) throws Exception {
	   List list = new ArrayList<String>();
	   if (!("").equals(map.get("activeTp1")) && map.get("activeTp1") != null ) {
		   list.add(map.get("activeTp1"));
	   }
	   if (!("").equals(map.get("activeTp2")) && map.get("activeTp2") != null ) {
		   list.add(map.get("activeTp2"));
	   }
	   if (!("").equals(map.get("activeTp3")) && map.get("activeTp3") != null ) {
		   list.add(map.get("activeTp3"));
	   }
	   map.put("activeTpList", list);
	   return objectDAO.selectObjectList(map);
   }
   /* 물건리스트 -- 물건명검색 */
   @Override
   public List<Map<String,Object>> objtSearchName(Map map) throws Exception {
	   List list = new ArrayList<String>();
	   if (!("").equals(map.get("activeTp1")) && map.get("activeTp1") != null ) {
		   list.add(map.get("activeTp1"));
	   }
	   if (!("").equals(map.get("activeTp2")) && map.get("activeTp2") != null ) {
		   list.add(map.get("activeTp2"));
	   }
	   if (!("").equals(map.get("activeTp3")) && map.get("activeTp3") != null ) {
		   list.add(map.get("activeTp3"));
	   }
	   map.put("activeTpList", list);
	   return objectDAO.objtSearchName(map);
   }
   /* 물건리스트 -- 물건명검색 결과 개수 */
   @Override
   public Map objtSearchNameTotalCnt(Map map) throws Exception {
	   List list = new ArrayList<String>();
	   if (!("").equals(map.get("activeTp1")) && map.get("activeTp1") != null ) {
		   list.add(map.get("activeTp1"));
	   }
	   if (!("").equals(map.get("activeTp2")) && map.get("activeTp2") != null ) {
		   list.add(map.get("activeTp2"));
	   }
	   if (!("").equals(map.get("activeTp3")) && map.get("activeTp3") != null ) {
		   list.add(map.get("activeTp3"));
	   }
	   map.put("activeTpList", list);
	   return objectDAO.objtSearchNameTotalCnt(map);
   }
   @Override
   public List<Map<String,Object>> selectTotalSearch(Map map) throws Exception {
	   
	   return objectDAO.selectTotalSearch(map);
   }

   /* 만기일 물건 리스트 */
   @Override
   public List<Map<String,Object>> selectDueList(Map map) throws Exception {
	   return objectDAO.selectDueList(map);
   }
}