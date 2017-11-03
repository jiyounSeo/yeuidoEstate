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
	 * ��� 
	 */
	@RequestMapping(value= "/insertDirection.do", method=RequestMethod.POST)
	public ModelAndView insertDirection(@RequestParam Map<String,Object> map, HttpSession session)  {   // 1. session �� sql �������� (, HttpSession session) �߰�
		ModelAndView mav= new ModelAndView();
		try {
			logger.error("insertTest : ",map);
			map.put("user",  session.getAttribute("user")); // map�� ��� �ش������� #{user.mbrId} �̷��� ���ֱ�
			int result = directionService.insertDirection(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "���û��� ��Ͽ� �����Ͽ����ϴ�.");
			
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
	@RequestMapping(value= "/modifyDirection.do", method=RequestMethod.POST)
	public ModelAndView modifyDirection(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		try {
			map.put("user",  session.getAttribute("user"));
			int result = directionService.modifyDirection(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "���û��� ������ �����Ͽ����ϴ�.");
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	/*
	 *  ����
	 */		
	@RequestMapping(value= "/deleteDirection.do", method=RequestMethod.POST)
	public ModelAndView deleteDirection(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		
		try {
			int result = directionService.deleteDirection(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "���û����� �����Ǿ����ϴ�.");
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}

	/* 
	 * ���� ����� ���û��� ����Ʈ(������)
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
				map.put("user",  session.getAttribute("user")); // map�� ��� �ش������� #{user.mbrId} �̷��� ���ֱ�
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
	 * �����ؾ��ϴ� ���û��� ����Ʈ(ȸ��)
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
				map.put("user",  session.getAttribute("user")); // map�� ��� �ش������� #{user.mbrId} �̷��� ���ֱ�
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
	 * �Ϸ��� ���û��� ����Ʈ(ȸ��)
	 */
	@RequestMapping(value= "/selectDoneDirList.do", method=RequestMethod.POST)
	public ModelAndView selectDoneDirList( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			Paging paging = new Paging();
	        			
			List<Map<String,Object>> dirList = new ArrayList<Map<String,Object>>();
			try {
				map.put("user",  session.getAttribute("user")); // map�� ��� �ش������� #{user.mbrId} �̷��� ���ֱ�
				dirList = directionService.selectDoneDirList(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("dirList",dirList);
		    mav.setViewName("jsonView");
		    return mav;
	}
	
	/* 
	 * �̿Ϸ��� ���û��� ����Ʈ(ȸ��)
	 */
	@RequestMapping(value= "/selectNotDoneDirList.do", method=RequestMethod.POST)
	public ModelAndView selectNotDoneDirList( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			Paging paging = new Paging();
	        			
			List<Map<String,Object>> dirList = new ArrayList<Map<String,Object>>();
			try {
				map.put("user",  session.getAttribute("user")); // map�� ��� �ش������� #{user.mbrId} �̷��� ���ֱ�
				dirList = directionService.selectNotDoneDirList(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("dirList",dirList);
		    mav.setViewName("jsonView");
		    return mav;
	}
	
	/* 
	 * ������ �۾��� ���û��� ����Ʈ
	 */
	@RequestMapping(value= "/selectDirListAtWork.do", method=RequestMethod.POST)
	public ModelAndView selectDirListAtWork( @RequestParam Map<String,Object> map, HttpSession session)   {  
		
			ModelAndView mav= new ModelAndView();
			Paging paging = new Paging();
	        			
			List<Map<String,Object>> dirList = new ArrayList<Map<String,Object>>();
			try {
				map.put("user",  session.getAttribute("user")); // map�� ��� �ش������� #{user.mbrId} �̷��� ���ֱ�
				dirList = directionService.selectDirListAtWork(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("dirList",dirList);
		    mav.setViewName("jsonView");
		    return mav;
	}
	
	
	/* 
	 * ���û��� ����Ʈ -- page�̵�
	 */
	@RequestMapping(value= "/selectALLDirListPage.do")
	public String selectALLDirListPage(@RequestParam Map<String,Object> map)  {  
		return "/admin/allDirectionList";	
	}
	
}
