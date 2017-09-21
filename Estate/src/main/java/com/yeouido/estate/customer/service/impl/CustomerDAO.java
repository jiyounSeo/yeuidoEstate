package com.yeouido.estate.customer.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("customerDAO")
public class CustomerDAO extends AbstractDAO
{

   public int insertCustomer(Map<String, Object> map) throws Exception{
       return insert("customerDAO.insertCustomer",map);
   }
   public int modifyCustomer(Map<String, Object> map) throws Exception{
       return update("customerDAO.modifyCustomer",map);
   }
   public int modifyObjtCustomer(Map<String, Object> map) throws Exception{
       return update("customerDAO.modifyObjtCustomer",map);
   }
   
   public int deleteCustomer(Map<String, Object> map) throws Exception{
       return delete("customerDAO.deleteCustomer",map);
   }
   @SuppressWarnings("unchecked")
   public Map selectCustomerInfo(Map map) throws Exception{
       return selectMap("customerDAO.selectCustomerInfo", map);
   }
   
   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> selectCustomerList(Map map) throws Exception{
       return selectList("customerDAO.selectCustomerList", map);
   }
   
   /* 고객등록확인 */
   @SuppressWarnings("unchecked")
   public Map selectCustomerConfirm(Map map) throws Exception{
       return selectMap("customerDAO.selectCustomerConfirm", map);
   }
   /* 고객 필수입력값만으로 등록 */
   public int insertNewCustomer(Map<String, Object> map) throws Exception{
       return insert("customerDAO.insertNewCustomer",map);
   }
   
   
   
   

}
