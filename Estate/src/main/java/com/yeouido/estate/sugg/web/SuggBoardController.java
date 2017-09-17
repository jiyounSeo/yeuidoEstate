package com.yeouido.estate.sugg.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yeouido.estate.Paging;
import com.yeouido.estate.list.web.ListController;
import com.yeouido.estate.sugg.service.SuggBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SuggBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(SuggBoardController.class);
	
	@Resource(name="suggbdService")
	protected SuggBoardService suggbdService;
	
	/* 고객 리스트 화면 */
	@RequestMapping(value= "/suggBoardList.do", method=RequestMethod.GET)
	public ModelAndView commClListView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/sugg/suggList");
		 return mv;
	}	


	/* 
	 * 목록조회
	 */
	@RequestMapping(value= "/selectSuggBoardList.do", method=RequestMethod.POST)
	public ModelAndView selectSuggBoardList( @RequestParam Map<String,Object> map)  {  
		
		ModelAndView mav= new ModelAndView();
		Paging paging = new Paging();
		 			
		List<Map<String,Object>> suggList = new ArrayList<Map<String,Object>>();
		try {
			int currentPage = Integer.parseInt(map.get("currentPage").toString());
			int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
			map.put("rowNum", (currentPage-1)*pagePerRow);
			map.put("pagePerRow", pagePerRow);
			map.put("mbrId", "test");
			suggList = suggbdService.selectSuggBoardList(map);
			
			if (!suggList.isEmpty()) {
				
				int totalCount = Integer.parseInt(suggList.get(0).get("totalCnt").toString());
				int pageSize = Integer.parseInt(map.get("pageSize").toString());
				Map<String, Object> pagingMap = paging.pagingMethod( currentPage, totalCount, pagePerRow, pageSize);
				mav.addAllObjects(pagingMap);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("sbList",suggList);
	    mav.setViewName("jsonView");
	    return mav;
	}	
	
	/*
	 * 상세 조회
	 */	
	@RequestMapping(value="/viewSuggItem.do")
	public ModelAndView viewSuggItem(HttpServletRequest request, @RequestParam Map<String,Object> map){
		ModelAndView mav= new ModelAndView();		
		Map<String, Object> result = new HashMap<String, Object>();
		map.put("taskDocId", request.getParameter("taskDocId"));
		try {
			logger.error("getParam : ", request.getParameter("taskDocId"));
			result = suggbdService.selectSuggBoardInfo(map);
			mav.addObject("messageCd", "1");
			
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.addObject("item", result);
		mav.setViewName("/sugg/suggView");
		return mav;	
	}
	
	/* 최근게시물 */
	@RequestMapping(value= "/selectLatestTaskList.do", method=RequestMethod.POST)
	public ModelAndView selectLatestTaskList( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			int endNum = Integer.parseInt(map.get("endNum").toString());
			map.put("endNum", endNum);
			
			list = suggbdService.selectLatestTaskList(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("리스트조회실패");
		}
	    mav.addObject("list",list);
	    mav.setViewName("jsonView");
	    return mav;
	}
}
