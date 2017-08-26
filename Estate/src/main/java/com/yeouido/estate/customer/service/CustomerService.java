package com.yeouido.estate.customer.service;

import java.util.List;
import java.util.Map;
public interface CustomerService
{
	public int insertCustomer(Map map) throws Exception;
	
	public int modifyCustomer(Map map) throws Exception;
	
	public int deleteCustomer(Map map) throws Exception;
	
	public List<Map<String,Object>> selectCustomerList(Map map) throws Exception;
	
	public Map selectCustomerInfo(Map map) throws Exception;
	
}
