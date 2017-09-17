package com.yeouido.estate.notice.service;

import java.util.List;
import java.util.Map;
public interface NoticeService
{
	public int insertNotice(Map map) throws Exception;
	
	public int modifyNotice(Map map) throws Exception;
	
	public int deleteNotice(Map map) throws Exception;
	
	public List<Map<String,Object>> selectNoticeList(Map map) throws Exception;
	
	public Map selectNoticeInfo(Map map) throws Exception;

	public int increaseViewCount(Map map) throws Exception;
	
	public List<Map<String,Object>> selectLatestNoticeList(Map map) throws Exception;
}
