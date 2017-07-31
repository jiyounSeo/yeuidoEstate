package com.yeouido.estate.list.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("listDAO")
public class ListDAO extends AbstractDAO
{
  
   @SuppressWarnings("unchecked")
   public List<Object> selectListList(Map map) throws Exception{
       return selectList("listDAO.selectListList", map);
   }
   
   public int insertList(Map<String, Object> map) throws Exception{
       return selectOne("listDAO.insertList",map);
   }

}
