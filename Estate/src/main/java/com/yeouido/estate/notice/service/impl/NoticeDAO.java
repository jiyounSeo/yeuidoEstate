package com.yeouido.estate.notice.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO
{
	   public int insertNotice(Map<String, Object> map) throws Exception{
	       return insert("noticeDAO.insertNotice",map);
	   }
	   public int modifyNotice(Map<String, Object> map) throws Exception{
	       return update("noticeDAO.modifyNotice",map);
	   }
	   public int deleteNotice(Map<String, Object> map) throws Exception{
	       return delete("noticeDAO.deleteNotice",map);
	   }	   
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectNoticeList(Map map) throws Exception{
	       return selectList("noticeDAO.selectNoticeList", map);
	   }
	   @SuppressWarnings("unchecked")
	   public Map selectNoticeInfo(Map map) throws Exception{
	       return selectMap("noticeDAO.selectNoticeInfo", map);
	   }
	   @SuppressWarnings("unchecked")
	   public int increaseViewCount(Map<String, Object> map) throws Exception{
		   return update("noticeDAO.increaseViewCount", map);
	   }	   
	   @SuppressWarnings("unchecked")
	   public List<Map<String,Object>> selectLatestNoticeList(Map map) throws Exception{
	       return selectList("noticeDAO.selectLatestNoticeList", map);
	   }
}
