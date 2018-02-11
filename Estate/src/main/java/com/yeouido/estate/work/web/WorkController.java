package com.yeouido.estate.work.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yeouido.estate.Paging;
import com.yeouido.estate.work.service.WorkService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class WorkController {
	
	private static final Logger logger = LoggerFactory.getLogger(WorkController.class);
	
	@Resource(name="workService")
	protected WorkService workService;
	
	/*
	 * 등록 
	 */
	@RequestMapping(value= "/insertWork.do", method=RequestMethod.POST)
	public ModelAndView insertWork(@RequestParam Map<String,Object> map, HttpSession session)  {   // 1. session 값 sql 가져가기 (, HttpSession session) 추가
		ModelAndView mav= new ModelAndView();
		try {
			logger.error("insertTest : ",map);
			map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
			int result = workService.insertWork(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "작업내역 등록에 성공하였습니다.");
			
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	/* 
	 * 목록조회
	 */
	@RequestMapping(value= "/selectWorkList.do", method=RequestMethod.POST)
	public ModelAndView selectWorkList( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			Paging paging = new Paging();
	        			
			List<Map<String,Object>> workList = new ArrayList<Map<String,Object>>();
			try {
				map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
				workList = workService.selectWorkList(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("workList",workList);
		    mav.setViewName("jsonView");
		    return mav;
	}
	
	/*
	 *  수정 등록
	 */		
	@RequestMapping(value= "/modifyWork.do", method=RequestMethod.POST)
	public ModelAndView modifyWork(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		try {
			map.put("user",  session.getAttribute("user"));
			int result = workService.modifyWork(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "작업내역 수정에 성공하였습니다.");
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	/*
	 *  삭제
	 */		
	@RequestMapping(value= "/deleteWork.do", method=RequestMethod.POST)
	public ModelAndView deleteWork(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		
		try {
			int result = workService.deleteWork(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "작업내역이 삭제되었습니다.");
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}

	/* 
	 * 물건검색
	 */
	@RequestMapping(value= "/searchObjtList.do", method=RequestMethod.POST)
	public ModelAndView searchObjtList( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			List<Map<String,Object>> srchObjt = new ArrayList<Map<String,Object>>();
			try {
				map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
				srchObjt = workService.searchObjtList(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("srchObjt",srchObjt);
		    mav.setViewName("jsonView");
		    return mav;
	}
	
	/* 
	 * 관심물건등록
	 */
	@RequestMapping(value= "/insertInterObject.do", method=RequestMethod.POST)
	public ModelAndView insertInterObject( @RequestParam Map<String,Object> map, HttpSession session)   {  
		ModelAndView mav= new ModelAndView();
		try {
			map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
			int result = workService.insertInterObject(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "관심 물건으로 등록에 성공하였습니다.");
			
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	/* 
	 * 관심물건조회
	 */
	@RequestMapping(value= "/selectInterObject.do", method=RequestMethod.POST)
	public ModelAndView selectInterObject( @RequestParam Map<String,Object> map, HttpSession session)   {  
		ModelAndView mav= new ModelAndView();
        			
		List<Map<String,Object>> interList = new ArrayList<Map<String,Object>>();
		try {
			map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
			interList = workService.selectInterObject(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("interList",interList);
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	/* 
	 * 관심물건삭제
	 */
	@RequestMapping(value= "/deleteInterObject.do", method=RequestMethod.POST)
	public ModelAndView deleteInterObject( @RequestParam Map<String,Object> map, HttpSession session)   {  

		ModelAndView mav= new ModelAndView();
		try {
			int result = workService.deleteInterObject(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "관심물건이 삭제되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	
	/* 
	 * 선택한 날짜에 작업한 작업목록조회
	 */
	@RequestMapping(value= "/selectWorkListAtDate.do", method=RequestMethod.POST)
	public ModelAndView selectWorkListAtDate( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			Paging paging = new Paging();
	        			
			List<Map<String,Object>> workList = new ArrayList<Map<String,Object>>();
			try {
				map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
				workList = workService.selectWorkListAtDate(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("workList",workList);
		    mav.setViewName("jsonView");
		    return mav;
	}
	
	/* 
	 * 선택된 달의 작업리스트
	 */
	@RequestMapping(value= "/selectWorkListAtMonth.do", method=RequestMethod.POST)
	public ModelAndView selectWorkListAtMonth( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			Paging paging = new Paging();
	        			
			List<Map<String,Object>> workListAtMonth = new ArrayList<Map<String,Object>>();
			try {
				map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
				workListAtMonth = workService.selectWorkListAtMonth(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("workListAtMonth",workListAtMonth);
		    mav.setViewName("jsonView");
		    return mav;
	}	
	
	/* 
	 * 종료일이 남은 작업내역 리스트
	 */
	@RequestMapping(value= "/selectWorkListWithEndDate.do", method=RequestMethod.POST)
	public ModelAndView selectWorkListWithEndDate( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			Paging paging = new Paging();
	        			
			List<Map<String,Object>> workListEndDt = new ArrayList<Map<String,Object>>();
			try {
				map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
				workListEndDt = workService.selectWorkListWithEndDate(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("workListEndDt",workListEndDt);
		    mav.setViewName("jsonView");
		    return mav;
	}		
	/*
	 *  상세 조회
	 */	
	@RequestMapping(value= "/selectWorkItem.do", method=RequestMethod.POST)
	public ModelAndView selectWorkItem(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = workService.selectWorkItem(map);
			mav.addObject("messageCd", "1");

		} catch (Exception e) {
			mav.addObject("messageCd", "2");

			e.printStackTrace();
		}
		mav.addObject("workItem",result);
	    mav.setViewName("jsonView");
	    return mav;
	}
}
