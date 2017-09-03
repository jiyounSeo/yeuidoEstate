package com.yeouido.estate.building.web;

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
import com.yeouido.estate.building.service.BuildingService;
import com.yeouido.estate.list.web.ListController;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BuildingController {
	
	private static final Logger logger = LoggerFactory.getLogger(BuildingController.class);
	final static int OBJECT_MAIN_CATEGORY_NUM = 6; 
	final static int OBJECT_TAB_CATEGORY_MAX = 4;
	
	@Resource(name="buildingService")
	protected BuildingService buildingService;
	
	/* 
	 * 물건목록조회
	 */
	@RequestMapping(value= "/selectBuildingList.do", method=RequestMethod.POST)
	public ModelAndView selectBuildingList( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Paging paging = new Paging();
        			
		List<Map<String,Object>> custList = new ArrayList<Map<String,Object>>();
		try {
			int currentPage = Integer.parseInt(map.get("currentPage").toString());
			int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
			map.put("rowNum", (currentPage-1)*pagePerRow);
			map.put("pagePerRow", pagePerRow);
			
			custList = buildingService.selectBuildingList(map);
			if (!custList.isEmpty()) {
				// ("").equals(map.get("pagePerRow"))) ? 10 : map.get("pagePerRow").toString() 
						
				int totalCount = Integer.parseInt(custList.get(0).get("totalCnt").toString());
				int pageSize = Integer.parseInt(map.get("pageSize").toString());
				Map<String, Object> pagingMap = paging.pagingMethod( currentPage, totalCount, pagePerRow, pageSize);
				mav.addAllObjects(pagingMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("custList",custList);
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	/*
	 * 물건등록 
	 */
	@RequestMapping(value= "/insertBuilding.do", method=RequestMethod.POST)
	public ModelAndView inserBuilding(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		
			try {
				int result = buildingService.insertBuilding(map);
				mav.addObject("messageCd", "1");
				mav.addObject("message", "물건 등록에 성공하였습니다.");
				
			} catch (Exception e) {
				mav.addObject("messageCd", "2");
				mav.addObject("message", "물건 등록에 실패하였습니다.");
				e.printStackTrace();
			}
		mav.setViewName("jsonView");	
	    return mav;
	}

	
	/*
	 * 물건 상세 조회
	 */	
	@RequestMapping(value= "/selectBuildingDtl.do", method=RequestMethod.POST)
	public ModelAndView selectBuildingDtl(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = buildingService.selectBuildingInfo(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "물건 조회에 성공하였습니다.");
			
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			mav.addObject("message", "물건 조회에 실패하였습니다.");
			e.printStackTrace();
		}
		mav.addObject("custInfo",result);
	    mav.setViewName("jsonView");
	    return mav;
	}	
	
	/*
	 * 물건 수정 조회
	 */		
	@RequestMapping(value= "/modifyBuilding.do", method=RequestMethod.POST)
	public ModelAndView modifyBuilding(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		
		try {
			int result = buildingService.modifyBuilding(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "물건 수정에 성공하였습니다.");
			
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			mav.addObject("message", "물건 수정에 실패하였습니다.");
			
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}

	/*
	 * 물건 삭제
	 */	
	@RequestMapping(value="/deletebuilding.do",method = RequestMethod.POST)
	public String deletebuilding(HttpServletRequest request,Model model){
		ListController listView = new ListController();
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			int result = buildingService.deleteBuilding(map);
			model.addAttribute("messageCd", "1");
			//model.addObject("message", "물건 삭제에 실패하였습니다.");
			
		} catch (Exception e) {
			model.addAttribute("messageCd", "2");
			e.printStackTrace();
		}
		return "/list/newBuilding";	
	}
	
	/*
	 * 물건 콤보
	 */	
	@RequestMapping(value="/selectBuildingCombo.do",method = RequestMethod.POST)
	public ModelAndView selectBuildingCombo(@RequestParam Map<String,Object> map)  {  
			ModelAndView mav= new ModelAndView();
		try {
			mav.addObject("buildCombo", buildingService.selectBuildingCombo(map));
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	/*
	 * 물건 상세페이지에서 물건 선택 시 수정페이지로 이동 
	 * 물건 신규입력 = 수정 페이지가 같음
	 */	
	@RequestMapping(value="/modifyBuildingInfo.do",method = RequestMethod.GET)
	public String modifyBuildingInfo(@RequestParam Map<String,Object> map, Model model){
		model.addAllAttributes(map);
		return "/listpage/newBuilding" ;
	
	}
	
	
	
}
