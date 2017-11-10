package com.yeouido.estate.object.web;

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
import com.yeouido.estate.list.web.ListController;
import com.yeouido.estate.object.service.ObjectService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ObjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ObjectController.class);
	final static int OBJECT_MAIN_CATEGORY_NUM = 6; 
	final static int OBJECT_TAB_CATEGORY_MAX = 4;
	
	@Resource(name="objectService")
	protected ObjectService objectService;
	
	@RequestMapping(value= "/indexObjectDtl.go", method=RequestMethod.GET)
	public ModelAndView joinMemberView(@RequestParam Map<String,Object> map)  {  
		Map resultMap = new HashMap<String, Object>();
		try {
			resultMap = objectService.selectObjectInfo(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView("/detailView");
		mv.addAllObjects(resultMap);
		return mv;
	}
	
	@RequestMapping(value= "/selectMainObjtList.go", method=RequestMethod.POST)
	public ModelAndView selectMainObjtList( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Paging paging = new Paging();
        			
		List<Map<String,Object>> objtList = new ArrayList<Map<String,Object>>();
		try {
			int currentPage = Integer.parseInt(map.get("currentPage").toString());
			int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
			map.put("rowNum", (currentPage-1)*pagePerRow);
			map.put("pagePerRow", pagePerRow);
			
			objtList = objectService.selectMainObjtList(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("objtList",objtList);
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	
	/* 
	 * 물건목록조회
	 */
	@RequestMapping(value= "/selectObjectList.do", method=RequestMethod.POST)
	public ModelAndView selectObjectList( @RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		Paging paging = new Paging();
        			
		List<Map<String,Object>> objtList = new ArrayList<Map<String,Object>>();
		try {
			int currentPage = Integer.parseInt(map.get("currentPage").toString());
			int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
			map.put("rowNum", (currentPage-1)*pagePerRow);
			map.put("pagePerRow", pagePerRow);
			map.put("user",  session.getAttribute("user"));
			
			objtList = objectService.selectObjectList(map);
			if (!objtList.isEmpty()) {
				// ("").equals(map.get("pagePerRow"))) ? 10 : map.get("pagePerRow").toString() 
				int totalCount = Integer.parseInt( objectService.selectObjectTotalCnt(map).get("totalCnt").toString());
				int pageSize = Integer.parseInt(map.get("pageSize").toString());
				Map<String, Object> pagingMap = paging.pagingMethod( currentPage, totalCount, pagePerRow, pageSize);
				mav.addAllObjects(pagingMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("objtList",objtList);
	    mav.setViewName("jsonView");
	    return mav;
	}
	//
	/* 
	 * 통합검색조회
	 */
	@RequestMapping(value= "/selectTotalSearch.do", method=RequestMethod.POST)
	public ModelAndView selectTotalSearch( @RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		Paging paging = new Paging();
        			
		List<Map<String,Object>> objtList = new ArrayList<Map<String,Object>>();
		try {
			int currentPage = Integer.parseInt(map.get("currentPage").toString());
			int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
			map.put("rowNum", (currentPage-1)*pagePerRow);
			map.put("pagePerRow", pagePerRow);
			map.put("user",  session.getAttribute("user"));
			
			objtList = objectService.selectTotalSearch(map);
			if (!objtList.isEmpty()) {
				// ("").equals(map.get("pagePerRow"))) ? 10 : map.get("pagePerRow").toString() 
				map.put ("notPage",null);
				int totalCount = objectService.selectTotalSearch(map).size();
				int pageSize = Integer.parseInt(map.get("pageSize").toString());
				Map<String, Object> pagingMap = paging.pagingMethod( currentPage, totalCount, pagePerRow, pageSize);
				mav.addAllObjects(pagingMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("objtList",objtList);
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	/*
	 * 물건등록 
	 */
	@RequestMapping(value= "/insertObject.do", method=RequestMethod.POST)
	public ModelAndView insertObject(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		try {
			map.put("user",  session.getAttribute("user"));
			Map result = objectService.insertObject(map);
			mav.addAllObjects(result);
			mav.addObject ("messageCd", 1);
			mav.addObject("message", "물건 등록에 성공했습니다.");
		} catch (Exception e) {
			mav.addObject ("messageCd", 2);
			mav.addObject("message", "물건 등록에 실패했습니다.");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	

	@RequestMapping(value= "/selectObjectCnt.do", method=RequestMethod.POST)
	public ModelAndView selectObjectCnt( @RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		 List<Object> objCntList = new ArrayList<Object>();
			try {
				map.put("user",  session.getAttribute("user"));
				objCntList = objectService.selectObjectCnt(map);
			} catch (Exception e) {
				mav.addObject("message", "물건 조회에 실패했습니다.");
				e.printStackTrace();
			}
		    mav.addObject("objCntList",objCntList);
		    mav.setViewName("jsonView");
	    return mav;
	}

	
	/*
	 * 물건 상세 조회
	 */	
	@RequestMapping(value= "/selectObjectDtl.do", method=RequestMethod.POST)
	public ModelAndView selectObjectDtl(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			map.put("user",  session.getAttribute("user"));
			result = objectService.selectObjectInfo(map);
		} catch (Exception e) {
			mav.addObject("message", "물건 상세 조회에 실패했습니다.");
			
			e.printStackTrace();
		}
		mav.addObject("objtInfo",result);
	    mav.setViewName("jsonView");
	    return mav;
	}	
	
	/*
	 * 물건 수정 조회
	 */		
	@RequestMapping(value= "/modifyObject.do", method=RequestMethod.POST)
	public ModelAndView modifyObject(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		try {
			map.put("user",  session.getAttribute("user"));
			Map result = objectService.modifyObject(map);
			mav.addAllObjects(result);
			mav.addObject ("messageCd", 1);
			mav.addObject("message", "물건 수정에 성공했습니다.");
			
			logger.debug("result : "+  result );
		} catch (Exception e) {
			mav.addObject("message", "물건 수정에 실패했습니다.");
			mav.addObject ("messageCd", 2);
			
			logger.error("update error");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}

	/*
	 * 물건 삭제
	 */	
	@RequestMapping(value="/deleteObject.do",method = RequestMethod.POST)
	public String deleteObject(HttpServletRequest request,Model model){
		ListController listView = new ListController();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("objtTp", request.getParameter("objtTp"));
		map.put("objtNo", request.getParameter("objtNo"));
		map.put("saleTp", request.getParameter("saleTp"));
		
		try {
			int result = objectService.deleteObject(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		List mappingArr = listView.mappingObjectTp(request.getParameter("objtTp"), request.getParameter("saleTp"));
		int mainc = Integer.parseInt(mappingArr.get(0).toString());
		int tab = Integer.parseInt(mappingArr.get(1).toString());
		String subc= request.getParameter("subc");
		String [] viewUrl = {""};
		int pageMark = 2;
		
		String [] main_category_state = new String[OBJECT_MAIN_CATEGORY_NUM+1];
		ArrayList<String> tab_category_state = new ArrayList<String>();
		
		for(int i = 1; i <=OBJECT_MAIN_CATEGORY_NUM; i++){	// Initialize
			main_category_state[i] = i+"_off";
		}
		
		listView.makeString(mainc, tab, main_category_state, tab_category_state, viewUrl);	
	
		int numOfTab = tab_category_state.size();
		int numOfRow = 15;
		
		model.addAttribute("main_category_state", main_category_state);
		model.addAttribute("mainc", mainc);
		model.addAttribute("tab_category_state", tab_category_state);
		model.addAttribute("numOfTab", numOfTab);
		model.addAttribute("tab", tab);
		model.addAttribute("subc", subc);
		model.addAttribute("numOfRow", numOfRow);
		model.addAttribute("viewUrl", viewUrl);
		model.addAttribute("pageMark", pageMark);
		*/
		return "/list/commObList";	
	}
	
	/*
	 * 물건 상세페이지에서 물건 선택 시 수정페이지로 이동 
	 * 물건 신규입력 = 수정 페이지가 같음
	 */	
	@RequestMapping(value="/modifyObjectInfo.do",method = RequestMethod.GET)
	public String goViewObAptView(@RequestParam Map<String,Object> map, Model model){
		model.addAllAttributes(map);
		String viewNm = "";
		String objtTp = map.get("objtTp").toString();
		
		if ( ("OT001").equals(objtTp)) {
			viewNm = "newObApt";
		} else if ( ("OT002").equals(objtTp)) {
			viewNm = "newObStore";
		} else if ( ("OT003").equals(objtTp)) {
			viewNm = "newObOffice";
		} else if ( ("OT004").equals(objtTp)) {
			viewNm = "newObOps";
		} else if ( ("OT005").equals(objtTp)) {
			viewNm = "newObHrapt";
		} else if ( ("OT006").equals(objtTp)) {
			viewNm = "newObTicket";
		}  
		return "/list/" + viewNm;
	
	}
	
	@RequestMapping(value= "/totalSearch.do")
	public String totalSearch(@RequestParam Map<String,Object> map)  {  
		return "/search/totalSearch";	
	}
	
	/* 
	 * 만기일 알람용 물건목록조회
	 */
	@RequestMapping(value= "/selectDueList.do", method=RequestMethod.POST)
	public ModelAndView selectDueList( @RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
        			
		List<Map<String,Object>> dueList = new ArrayList<Map<String,Object>>();
		try {
			map.put("user",  session.getAttribute("user"));
			dueList = objectService.selectDueList(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("dueList",dueList);
	    mav.setViewName("jsonView");
	    return mav;
	}
}
