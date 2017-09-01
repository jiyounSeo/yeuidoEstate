package com.yeouido.estate.customer.service.impl;

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
	   return customerDAO.deleteCustomer(map);
   }
   
   public List<Map<String,Object>> selectCustomerList(Map map) throws Exception {
	   return customerDAO.selectCustomerList(map);
   }
   
   public Map selectCustomerInfo(Map map) throws Exception {
	   return customerDAO.selectCustomerInfo(map);
   }
   public Map selectCustomerConfirm(Map map) throws Exception {
	   return customerDAO.selectCustomerConfirm(map);
   }
   
}