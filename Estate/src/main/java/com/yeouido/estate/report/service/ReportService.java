package com.yeouido.estate.report.service;

import java.util.List;
import java.util.Map;
public interface ReportService
{
	public int insertReport(Map map) throws Exception;

	public int modifyReport(Map map) throws Exception;

	public int deleteReport(Map map) throws Exception;

	public List<Map<String,Object>> selectBossList(Map map) throws Exception;

	public List<Map<String,Object>> selectManagerList(Map map) throws Exception;
	
	public List<Map<String,Object>> selectReportList(Map map) throws Exception;

	public Map selectReportInfo(Map map) throws Exception;
}
