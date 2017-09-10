package com.yeouido.estate.report.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("reportDAO")
public class ReportDAO extends AbstractDAO
{
   public int insertReport(Map<String, Object> map) throws Exception{
       return insert("reportDAO.insertReport", map);
   }

   public int modifyReport(Map<String, Object> map) throws Exception{
       return update("reportDAO.modifyReport", map);
   }

   public int deleteReport(Map<String, Object> map) throws Exception{
       return delete("reportDAO.deleteReport", map);
   }

   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> selectBossList(Map map) throws Exception{
       return selectList("reportDAO.selectBossList", map);
   }

   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> selectReportList(Map map) throws Exception{
       return selectList("reportDAO.selectReportList", map);
   }

   @SuppressWarnings("unchecked")
   public Map selectReportInfo(Map map) throws Exception{
       return selectMap("reportDAO.selectReportInfo", map);
   }
}
