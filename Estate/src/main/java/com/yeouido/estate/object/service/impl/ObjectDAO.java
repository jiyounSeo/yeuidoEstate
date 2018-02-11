package com.yeouido.estate.object.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("objectDAO")
public class ObjectDAO extends AbstractDAO
{

   public int insertObject(Map<String, Object> map) throws Exception{
       return insert("objectDAO.insertObject",map);
   }
   public int modifyObject(Map<String, Object> map) throws Exception{
       return update("objectDAO.modifyObject",map);
   }
   public int deleteObject(Map<String, Object> map) throws Exception{
       return delete("objectDAO.deleteObject",map);
   }
   public int deleteInterObject(Map<String, Object> map) throws Exception{
       return delete("objectDAO.deleteInterObject",map);
   }
   public int deleteWorkDoc(Map<String, Object> map) throws Exception{
       return delete("objectDAO.deleteWorkDoc",map);
   }

   @SuppressWarnings("unchecked")
   public List<Object> selectObjectCnt(Map map) throws Exception{
       return selectList("objectDAO.selectObjectCnt", map);
   }
   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> selectMainObjtList(Map map) throws Exception{
       return selectList("objectDAO.selectMainObjtList", map);
   }
   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> searchMainObjtList(Map map) throws Exception{
       return selectList("objectDAO.searchMainObjtList", map);
   }

   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> objtSearchName(Map map) throws Exception{
       return selectList("objectDAO.objtSearchName", map);
   }
   @SuppressWarnings("unchecked")
   public Map objtSearchNameTotalCnt(Map map) throws Exception{
       return selectMap("objectDAO.objtSearchNameTotalCnt", map);
   }
   
   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> selectObjectList(Map map) throws Exception{
       return selectList("objectDAO.selectObjectList", map);
   }
   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> selectTotalSearch(Map map) throws Exception{
       return selectList("objectDAO.selectTotalSearch", map);
   }
   @SuppressWarnings("unchecked")
   public Map selectObjectTotalCnt(Map map) throws Exception{
       return selectMap("objectDAO.selectObjectTotalCnt", map);
   }

   @SuppressWarnings("unchecked")
   public Map selectMainObjectTotalCnt(Map map) throws Exception{
       return selectMap("objectDAO.selectMainObjectTotalCnt", map);
   }
   @SuppressWarnings("unchecked")
   public Map selectObjectInfo(Map map) throws Exception{
       return selectMap("objectDAO.selectObjectInfo", map);
   }

   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> selectDueList(Map map) throws Exception{
       return selectList("objectDAO.selectDueList", map);
   }
   

}
