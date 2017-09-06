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

	/* 
	 * 목록조회
	 */
	@RequestMapping(value= "/selectSuggBoardList.do", method=RequestMethod.POST)
	public ModelAndView selectSuggBoardList( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		 			
		List<Map<String,Object>> suggList = new ArrayList<Map<String,Object>>();
		try {
			map.put("mbrId", "test");
			suggList = suggbdService.selectSuggBoardList(map);
			logger.error("suggdbService : ", suggList.size());
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
	@RequestMapping(value= "/selectSuggBoardDtl.do", method=RequestMethod.POST)
	public ModelAndView selectSuggBoardDtl(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = suggbdService.selectSuggBoardInfo(map);
			mav.addObject("messageCd", "1");

		} catch (Exception e) {
			mav.addObject("messageCd", "2");

			e.printStackTrace();
		}
		mav.addObject("suggInfo",result);
	    mav.setViewName("jsonView");
	    return mav;
	}	
}
