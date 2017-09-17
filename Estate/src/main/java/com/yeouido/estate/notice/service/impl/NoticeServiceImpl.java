package com.yeouido.estate.notice.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.notice.service.NoticeService;

@Service("noticeService")
public class NoticeServiceImpl  implements NoticeService
{
   @Resource(name = "noticeDAO")
   private NoticeDAO noticeDAO;

   public int insertNotice(Map map) throws Exception {
	   return noticeDAO.insertNotice(map);
   }
   public int modifyNotice(Map map) throws Exception {
	   return noticeDAO.modifyNotice(map);
   }
   public int deleteNotice(Map map) throws Exception {
	   return noticeDAO.deleteNotice(map);
   }   
   public List<Map<String,Object>> selectNoticeList(Map map) throws Exception {
	   return noticeDAO.selectNoticeList(map);
   }
   public Map selectNoticeInfo(Map map) throws Exception {
	   return noticeDAO.selectNoticeInfo(map);
   }
   public int increaseViewCount(Map map) throws Exception {
	   return noticeDAO.increaseViewCount(map);
   }  
   public List<Map<String,Object>> selectLatestNoticeList(Map map) throws Exception {
	   return noticeDAO.selectLatestNoticeList(map);
   }
}