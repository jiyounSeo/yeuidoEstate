package com.yeouido.estate.notice.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yeouido.estate.Paging;
import com.yeouido.estate.notice.service.NoticeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Resource(name="noticeService")
	protected NoticeService noticeService;
	
	@RequestMapping(value="/noticeList.do", method=RequestMethod.GET)
	public String noticeList(){
		
		return "/notice/noticeList";
	}

	@RequestMapping(value= "/newNoticeView.do", method=RequestMethod.GET)
	public String newLogbookView(@RequestParam Map<String,Object> map)  {  
		return "/notice/newNotice";	
	}

	/* 
	 * ���� ������ ��ȸ
	 */
	@RequestMapping(value="/modifyNoticeInfo.do",method = RequestMethod.GET)
	public String modifyNoticeInfo(@RequestParam Map<String,Object> map, Model model){
		model.addAllAttributes(map);
		return "/notice/newNotice" ;
	}
	/*
	 * ��� 
	 */
	@RequestMapping(value= "/insertNotice.do", method=RequestMethod.POST)
	public ModelAndView insertNotice(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		try {
			logger.error("insertTest : ",map);
			map.put("user",  session.getAttribute("user")); // map�� ��� �ش������� #{user.mbrId} �̷��� ���ֱ�
			int result = noticeService.insertNotice(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "�������� ��Ͽ� �����Ͽ����ϴ�.");
			
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	/* 
	 * �����ȸ
	 */
	@RequestMapping(value= "/selectNoticeList.do", method=RequestMethod.POST)
	public ModelAndView selectNoticeList( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Paging paging = new Paging();
        			
		List<Map<String,Object>> ntList = new ArrayList<Map<String,Object>>();
		try {
			int currentPage = Integer.parseInt(map.get("currentPage").toString());
			int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
			map.put("rowNum", (currentPage-1)*pagePerRow);
			map.put("pagePerRow", pagePerRow);
			
			ntList = noticeService.selectNoticeList(map);
			if (!ntList.isEmpty()) {
						
				int totalCount = Integer.parseInt(ntList.get(0).get("totalCnt").toString());
				int pageSize = Integer.parseInt(map.get("pageSize").toString());
				Map<String, Object> pagingMap = paging.pagingMethod( currentPage, totalCount, pagePerRow, pageSize);
				mav.addAllObjects(pagingMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("ntList",ntList);
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	/*
	 * �� ��ȸ
	 */	
	@RequestMapping(value="/viewNoticeItem.do")
	public ModelAndView viewNoticeItem(HttpServletRequest request, @RequestParam Map<String,Object> map){
		ModelAndView mav= new ModelAndView();		
		Map<String, Object> result = new HashMap<String, Object>();
		map.put("noticeId", request.getParameter("noticeId"));
		try {
			noticeService.increaseViewCount(map);
			result = noticeService.selectNoticeInfo(map);
			mav.addObject("messageCd", "1");
			
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.addObject("item", result);
		mav.setViewName("/notice/noticeView");
		return mav;	
	}
	/*
	 *  �� ��ȸ -- ������
	 */	
	@RequestMapping(value= "/selectNoticeDtl.do", method=RequestMethod.POST)
	public ModelAndView selectNoticeDtl(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = noticeService.selectNoticeInfo(map);
			mav.addObject("messageCd", "1");

		} catch (Exception e) {
			mav.addObject("messageCd", "2");

			e.printStackTrace();
		}
		mav.addObject("item",result);
	    mav.setViewName("jsonView");
	    return mav;
	}
	/*
	 *  ����
	 */		
	@RequestMapping(value= "/deleteNotice.do", method=RequestMethod.POST)
	public ModelAndView deleteNotice(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		
		try {
			int result = noticeService.deleteNotice(map);
			mav.addObject("messageCd", "1");
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}

	/*
	 *  ���� ���
	 */		
	@RequestMapping(value= "/modifyNotice.do", method=RequestMethod.POST)
	public ModelAndView modifyNotice(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		
		try {
			map.put("user",  session.getAttribute("user"));
			int result = noticeService.modifyNotice(map);
			mav.addObject("messageCd", "1");
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	/* �ֱٰԽù� */
	@RequestMapping(value= "/selectLatestNoticeList.do", method=RequestMethod.POST)
	public ModelAndView selectLatestNoticeList( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			int endNum = Integer.parseInt(map.get("endNum").toString());
			map.put("endNum", endNum);
			
			list = noticeService.selectLatestNoticeList(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("����Ʈ��ȸ����");
		}
	    mav.addObject("list",list);
	    mav.setViewName("jsonView");
	    return mav;
	}
}
