package com.yeouido.estate.object.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.object.service.ObjectService;

@Service("objectService")
public class ObjectServiceImpl  implements ObjectService
{
   @Resource(name = "objectDAO")
   private ObjectDAO objectDAO;
   
   public int insertObject(Map map) throws Exception {
	   return objectDAO.insertObject(map);
   }
   public int modifyObject(Map map) throws Exception {
	   return objectDAO.modifyObject(map);
   }
   public int deleteObject(Map map) throws Exception {
	   return objectDAO.deleteObject(map);
   }
   public List<Object> selectObjectCnt(Map map) throws Exception {
	   return objectDAO.selectObjectCnt(map);
   }
   
   public List<Object> selectObjectList(Map map) throws Exception {
	   return objectDAO.selectObjectList(map);
   }
   
   public Map selectObjectInfo(Map map) throws Exception {
	   return objectDAO.selectObjectInfo(map);
   }
   
   
}