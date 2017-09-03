package com.yeouido.estate.logbook.web;

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
import com.yeouido.estate.logbook.service.LogbookService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LogbookController {
	
	private static final Logger logger = LoggerFactory.getLogger(LogbookController.class);
	
	@Resource(name="logbookService")
	protected LogbookService logbookService;

	/* 
	 * 목록조회
	 */
	@RequestMapping(value= "/selectLogbookList.do", method=RequestMethod.POST)
	public ModelAndView selectLogbookList( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		 			
		List<Map<String,Object>> logbookList = new ArrayList<Map<String,Object>>();
		try {
			map.put("mbrId", "test");
			logbookList = logbookService.selectLogbookList(map);
			logger.error("logbookList : ", logbookList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("lbList",logbookList);
	    mav.setViewName("jsonView");
	    return mav;
	}	
	
	/*
	 * 상세 조회
	 */	
	@RequestMapping(value= "/selectLogbookDtl.do", method=RequestMethod.POST)
	public ModelAndView selectLogbookDtl(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = logbookService.selectLogbookInfo(map);
			mav.addObject("messageCd", "1");

		} catch (Exception e) {
			mav.addObject("messageCd", "2");

			e.printStackTrace();
		}
		mav.addObject("logbookInfo",result);
	    mav.setViewName("jsonView");
	    return mav;
	}	
	
	@RequestMapping(value="/viewLogbook.do",method = RequestMethod.GET)
	public String viewClient(@RequestParam Map<String,Object> map, Model model){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = logbookService.selectLogbookInfo(map);
			model.addAllAttributes(result);
			model.addAttribute("messageCd", "1");
			
		} catch (Exception e) {
			model.addAttribute("messageCd", "2");
			e.printStackTrace();
		}
		return "/logbook/viewLb";
	
	}
	
	@RequestMapping(value= "/logbookListView")
	public String memberListView(@RequestParam Map<String,Object> map)  {  
		return "/logbook/lbMain";	
	}
	
	@RequestMapping(value= "/newLogbookView")
	public String newLogbookView(@RequestParam Map<String,Object> map)  {  
		return "/logbook/newLb";	
	}
	
	/*
	 * 삭제
	 */	
	@RequestMapping(value="/deleteLogbook.do",method = RequestMethod.POST)
	public String deleteCustomer(HttpServletRequest request,Model model){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("taskDocId", request.getParameter("taskDocId"));
		logger.error("taskDocId:",request.getParameter("taskDocId"));
		try {
			int result = logbookService.deleteLogbook(map);
			model.addAttribute("messageCd", "1");
			
		} catch (Exception e) {
			model.addAttribute("messageCd", "2");
			e.printStackTrace();
		}
		return "/logbook/lbMain";	
	}
	
	/* 
	 * 수정 페이지 조회
	 */
	@RequestMapping(value="/modifyLogbookInfo.do",method = RequestMethod.GET)
	public String modifyLogbookInfo(@RequestParam Map<String,Object> map, Model model){
		model.addAllAttributes(map);
		return "/logbook/newLb" ;
	}
	
	/*
	 *  수정 등록
	 */		
	@RequestMapping(value= "/modifyLogbook.do", method=RequestMethod.POST)
	public ModelAndView modifyCustomer(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		
		try {
			int result = logbookService.modifyLogbook(map);
			mav.addObject("messageCd", "1");
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	/*
	 * 등록 
	 */
	@RequestMapping(value= "/insertLogbook.do", method=RequestMethod.POST)
	public ModelAndView insertLogbook(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Map logbookInfo = new HashMap<String, Object>();
		try {
			logbookInfo = logbookService.selectLogbookConfirm(map);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if (logbookInfo == null) {
			try {
				int result = logbookService.insertLogbook(map);
				mav.addObject("messageCd", "1");
				mav.addObject("message", "업무일지 등록에 성공하였습니다.");
				
			} catch (Exception e) {
				mav.addObject("messageCd", "2");
				e.printStackTrace();
			}
		} else {
			mav.addObject("message", "금일 업무일지는 이미 작성하였습니다.");
		}
		mav.setViewName("jsonView");	
	    return mav;
	}

}
