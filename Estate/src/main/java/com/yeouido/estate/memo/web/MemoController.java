package com.yeouido.estate.memo.web;

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
import com.yeouido.estate.comm.web.Interceptor;
import com.yeouido.estate.memo.service.MemoService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemoController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemoController.class);
	
	@Resource(name="memoService")
	protected MemoService memoService;
	
	@RequestMapping(value="/memoList.do", method=RequestMethod.GET)
	public String memoList(){
		
		return "/memo/memoList";
	}	
	
	@RequestMapping(value="/newMemo.do", method=RequestMethod.GET)
	public String newMemoPage(){
		
		return "/memo/newMemo";
	}
	
	/*
	 * ��� 
	 */
	@RequestMapping(value= "/insertMemo.do", method=RequestMethod.POST)
	public ModelAndView insertMemo(@RequestParam Map<String,Object> map, HttpSession session)  {   // 1. session �� sql �������� (, HttpSession session) �߰�
		ModelAndView mav= new ModelAndView();
		try {
			logger.error("insertTest : ",map);
			map.put("user",  session.getAttribute("user")); // map�� ��� �ش������� #{user.mbrId} �̷��� ���ֱ�
			int result = memoService.insertMemo(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "�޸� ��Ͽ� �����Ͽ����ϴ�.");
			
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
	@RequestMapping(value= "/selectMemoList.do", method=RequestMethod.POST)
	public ModelAndView selectCustomerList( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			Paging paging = new Paging();
	        			
			List<Map<String,Object>> memoList = new ArrayList<Map<String,Object>>();
			try {
				int currentPage = Integer.parseInt(map.get("currentPage").toString());
				int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
				map.put("rowNum", (currentPage-1)*pagePerRow);
				map.put("pagePerRow", pagePerRow);
				map.put("user",  session.getAttribute("user"));
				memoList = memoService.selectMemoList(map);
				if (!memoList.isEmpty()) {
							
					int totalCount = Integer.parseInt(memoList.get(0).get("totalCnt").toString());
					int pageSize = Integer.parseInt(map.get("pageSize").toString());
					Map<String, Object> pagingMap = paging.pagingMethod( currentPage, totalCount, pagePerRow, pageSize);
					mav.addAllObjects(pagingMap);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("memoList",memoList);
		    mav.setViewName("jsonView");
		    return mav;

	}
	
	/*
	 *  �� ��ȸ
	 */	
	@RequestMapping(value= "/selectMemoDtl.do", method=RequestMethod.POST)
	public ModelAndView selectMemoDtl(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = memoService.selectMemoInfo(map);
			mav.addObject("messageCd", "1");

		} catch (Exception e) {
			mav.addObject("messageCd", "2");

			e.printStackTrace();
		}
		mav.addObject("MemoInfo",result);
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	@RequestMapping(value="/viewMemoItem.do")
	public ModelAndView viewMemoItem(HttpServletRequest request, @RequestParam Map<String,Object> map){
		ModelAndView mav= new ModelAndView();		
		Map<String, Object> result = new HashMap<String, Object>();
		map.put("memoDocId", request.getParameter("memoDocId"));
		try {
			result = memoService.selectMemoInfo(map);
			mav.addObject("messageCd", "1");
			
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.addObject("item", result);
		mav.setViewName("/memo/memoView");
		return mav;	
	}	
	
	/*
	 *  ����
	 */		
	@RequestMapping(value= "/deleteMemo.do", method=RequestMethod.POST)
	public ModelAndView deleteMemo(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		
		try {
			int result = memoService.deleteMemo(map);
			mav.addObject("messageCd", "1");
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}

	@RequestMapping(value="/modifyMemoInfo.do",method = RequestMethod.GET)
	public String modifyMemoInfo(@RequestParam Map<String,Object> map, Model model){
		model.addAllAttributes(map);
		return "/memo/newMemo" ;
	}
	
	/*
	 *  ���� ���
	 */		
	@RequestMapping(value= "/modifyMemo.do", method=RequestMethod.POST)
	public ModelAndView modifyMemo(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		try {
			map.put("user",  session.getAttribute("user"));
			int result = memoService.modifyMemo(map);
			mav.addObject("messageCd", "1");
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
}
