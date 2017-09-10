package com.yeouido.estate.report.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.report.service.ReportService;

@Service("reportService")
public class ReportServiceImpl implements ReportService
{
   @Resource(name = "reportDAO")
   private ReportDAO reportDAO;

   public int insertReport(Map map) throws Exception {
	   return reportDAO.insertReport(map);
   }

   public int modifyReport(Map map) throws Exception {
	   return reportDAO.modifyReport(map);
   }

   public int deleteReport(Map map) throws Exception {
	   return reportDAO.deleteReport(map);
   }

   public List<Map<String,Object>> selectBossList(Map map) throws Exception {
	   return reportDAO.selectBossList(map);
   }

   public List<Map<String,Object>> selectReportList(Map map) throws Exception {
	   return reportDAO.selectReportList(map);
   }

   public Map selectReportInfo(Map map) throws Exception {
	   return reportDAO.selectReportInfo(map);
   }
}