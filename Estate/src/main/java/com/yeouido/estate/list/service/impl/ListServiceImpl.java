package com.yeouido.estate.list.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.list.service.ListService;

@Service("listService")
public class ListServiceImpl  implements ListService
{
   @Resource(name = "listDAO")
   private ListDAO listDAO;
   public int insertListList(Map map) throws Exception {
	   return listDAO.insertList(map);
   }
   
   public List<Object> selectListList(Map map) throws Exception {
	   List<Object> list = listDAO.selectListList(map);
	   return list;
   }
}