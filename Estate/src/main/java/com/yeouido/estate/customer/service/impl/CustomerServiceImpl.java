package com.yeouido.estate.customer.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.customer.service.CustomerService;

@Service("customerService")
public class CustomerServiceImpl  implements CustomerService
{
   @Resource(name = "customerDAO")
   private CustomerDAO customerDAO;
   
   public int insertCustomer(Map map) throws Exception {
	   return customerDAO.insertCustomer(map);
   }
   public int modifyCustomer(Map map) throws Exception {
	   return customerDAO.modifyCustomer(map);
   }
   public int deleteCustomer(Map map) throws Exception {
	   customerDAO.deleteWorkDocByCust(map);
	   customerDAO.deleteCustomerLinkInObject(map);
	   return customerDAO.deleteCustomer(map);
   }
   
   public List<Map<String,Object>> selectCustomerList(Map map) throws Exception {
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
	   return customerDAO.selectCustomerList(map);
   }

   public Map selectCustomerTotalCnt(Map map) throws Exception {
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
	   return customerDAO.selectCustomerTotalCnt(map);
   }
   
   public List<Map<String,Object>> custSearchName(Map map) throws Exception {
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
	   
	   return customerDAO.custSearchName(map);
   }
   
   public Map custSearchNameTotalCnt(Map map) throws Exception {
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
	   return customerDAO.custSearchNameTotalCnt(map);
   }
   
   public Map selectCustomerInfo(Map map) throws Exception {
	   return customerDAO.selectCustomerInfo(map);
   }
   public Map selectCustomerConfirm(Map map) throws Exception {
	   return customerDAO.selectCustomerConfirm(map);
   }
   
}