package com.yeouido.estate.direction.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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
import com.yeouido.estate.direction.service.DirectionService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DirectionController {
	
	private static final Logger logger = LoggerFactory.getLogger(DirectionController.class);
	
	@Resource(name="directionService")
	protected DirectionService directionService;
	
	/*
	 * 등록 
	 */
	@RequestMapping(value= "/insertDirection.do", method=RequestMethod.POST)
	public ModelAndView insertDirection(@RequestParam Map<String,Object> map, HttpSession session)  {   // 1. session 값 sql 가져가기 (, HttpSession session) 추가
		ModelAndView mav= new ModelAndView();
		try {
			logger.error("insertTest : ",map);
			map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
			int result = directionService.insertDirection(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "지시사항 등록에 성공하였습니다.");
			
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	/*
	 *  수정 등록
	 */		
	@RequestMapping(value= "/modifyDirection.do", method=RequestMethod.POST)
	public ModelAndView modifyDirection(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		try {
			map.put("user",  session.getAttribute("user"));
			int result = directionService.modifyDirection(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "지시사항 수정에 성공하였습니다.");
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
	@RequestMapping(value= "/deleteDirection.do", method=RequestMethod.POST)
	public ModelAndView deleteDirection(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		
		try {
			int result = directionService.deleteDirection(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "지시사항이 삭제되었습니다.");
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}

	/* 
	 * 내가 등록한 지시사항 리스트(관리자)
	 */
	@RequestMapping(value= "/selectALLRegDirList.do", method=RequestMethod.POST)
	public ModelAndView selectALLRegDirList( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			Paging paging = new Paging();
	        			
			List<Map<String,Object>> dirList = new ArrayList<Map<String,Object>>();
			try {
				int currentPage = Integer.parseInt(map.get("currentPage").toString());
				int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
				map.put("rowNum", (currentPage-1)*pagePerRow);
				map.put("pagePerRow", pagePerRow);
				map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
				dirList = directionService.selectALLRegDirList(map);
				
				if (!dirList.isEmpty()) {
					
					int totalCount = Integer.parseInt(dirList.get(0).get("totalCnt").toString());
					int pageSize = Integer.parseInt(map.get("pageSize").toString());
					Map<String, Object> pagingMap = paging.pagingMethod( currentPage, totalCount, pagePerRow, pageSize);
					mav.addAllObjects(pagingMap);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("dirList",dirList);
		    mav.setViewName("jsonView");
		    return mav;
	}
	
	/* 
	 * 수행해야하는 지시사항 리스트(회원)
	 */
	@RequestMapping(value= "/selectALLDirList.do", method=RequestMethod.POST)
	public ModelAndView selectALLDirList( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			Paging paging = new Paging();
	        			
			List<Map<String,Object>> dirList = new ArrayList<Map<String,Object>>();
			try {
				int currentPage = Integer.parseInt(map.get("currentPage").toString());
				int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
				map.put("rowNum", (currentPage-1)*pagePerRow);
				map.put("pagePerRow", pagePerRow);
				map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
				dirList = directionService.selectALLDirList(map);
				
				if (!dirList.isEmpty()) {
					
					int totalCount = Integer.parseInt(dirList.get(0).get("totalCnt").toString());
					int pageSize = Integer.parseInt(map.get("pageSize").toString());
					Map<String, Object> pagingMap = paging.pagingMethod( currentPage, totalCount, pagePerRow, pageSize);
					mav.addAllObjects(pagingMap);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("dirList",dirList);
		    mav.setViewName("jsonView");
		    return mav;
	}
	
	/* 
	 * 완료한 지시사항 리스트(회원)
	 */
	@RequestMapping(value= "/selectDoneDirList.do", method=RequestMethod.POST)
	public ModelAndView selectDoneDirList( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			Paging paging = new Paging();
	        			
			List<Map<String,Object>> dirList = new ArrayList<Map<String,Object>>();
			try {
				map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
				dirList = directionService.selectDoneDirList(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("dirList",dirList);
		    mav.setViewName("jsonView");
		    return mav;
	}
	
	/* 
	 * 미완료한 지시사항 리스트(회원)
	 */
	@RequestMapping(value= "/selectNotDoneDirList.do", method=RequestMethod.POST)
	public ModelAndView selectNotDoneDirList( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			Paging paging = new Paging();
	        			
			List<Map<String,Object>> dirList = new ArrayList<Map<String,Object>>();
			try {
				map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
				dirList = directionService.selectNotDoneDirList(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("dirList",dirList);
		    mav.setViewName("jsonView");
		    return mav;
	}
	
	/* 
	 * 선택한 작업의 지시사항 리스트
	 */
	@RequestMapping(value= "/selectDirListAtWork.do", method=RequestMethod.POST)
	public ModelAndView selectDirListAtWork( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			Paging paging = new Paging();
	        			
			List<Map<String,Object>> dirList = new ArrayList<Map<String,Object>>();
			try {
				map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
				dirList = directionService.selectDirListAtWork(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("dirList",dirList);
		    mav.setViewName("jsonView");
		    return mav;
	}
	
	
	/* 
	 * 지시사항 리스트 -- page이동
	 */
	@RequestMapping(value= "/selectALLDirListPage.do")
	public String selectALLDirListPage(@RequestParam Map<String,Object> map)  {  
		return "/admin/allDirectionList";	
	}
	
}
