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
        			
		List<Map<String,Object>> caList = new ArrayList<Map<String,Object>>();
		try {
			int currentPage = Integer.parseInt(map.get("currentPage").toString());
			int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
			map.put("rowNum", (currentPage-1)*pagePerRow);
			map.put("pagePerRow", pagePerRow);
			
			caList = buildingService.selectBuildingList(map);
			if (!caList.isEmpty()) {
				// ("").equals(map.get("pagePerRow"))) ? 10 : map.get("pagePerRow").toString() 
						
				int totalCount = Integer.parseInt(caList.get(0).get("totalCnt").toString());
				int pageSize = Integer.parseInt(map.get("pageSize").toString());
				Map<String, Object> pagingMap = paging.pagingMethod( currentPage, totalCount, pagePerRow, pageSize);
				mav.addAllObjects(pagingMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("caList",caList);
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
		mav.addObject("caInfo",result);
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
	@RequestMapping(value= "/deletebuilding.do", method=RequestMethod.POST)
	public ModelAndView deletebuilding( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		 List<Object> estateList = new ArrayList<Object>();
		 try {
			int result = buildingService.deleteBuilding(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "삭제 완료 되었습니다.");
		 } catch (Exception e) {
			mav.addObject("messageCd", "2");
			mav.addObject("message", "삭제 중 오류가 발생하였습니다.");
			e.printStackTrace();
		 }
	 
	    mav.setViewName("jsonView");
	    return mav;
	}	
	
	
	/*
	 * 물건 콤보
	 */	
	@RequestMapping(value="/selectBuildingCombo.go",method = RequestMethod.POST)
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
	 * 물건리스트페이지
	 */	
	@RequestMapping(value="/categoryList.do",method = RequestMethod.GET)
	public String modifyBuildingInfo(@RequestParam Map<String,Object> map, Model model){
		model.addAllAttributes(map);
		return "/admin/categoryList" ;	
	}
	
	
	
}
