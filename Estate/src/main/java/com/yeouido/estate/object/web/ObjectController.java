package com.yeouido.estate.object.web;

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
	
	//object insert 
	@RequestMapping(value= "/insertObject.do", method=RequestMethod.POST)
	public ModelAndView insertObject(@RequestParam Map<String,Object> map)  {  
		
		try {
			//logger.debug("hhihih");
			int result = objectService.insertObject(map);
			logger.debug("result : "+  result );
		} catch (Exception e) {
			logger.error("insert error");
			e.printStackTrace();
		}
		ModelAndView mav= new ModelAndView();
		mav.setViewName("jsonView");	
	    return mav;
	}
	

	@RequestMapping(value= "/selectObjectCnt.do", method=RequestMethod.POST)
	public ModelAndView selectObjectCnt( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		 List<Object> objCntList = new ArrayList<Object>();
			try {
				objCntList = objectService.selectObjectCnt(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    mav.addObject("objCntList",objCntList);
		    mav.setViewName("jsonView");
	    return mav;
	}

	
	@RequestMapping(value= "/selectObjectList.do", method=RequestMethod.POST)
	public ModelAndView selectObjectList( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		 List<Object> objtList = new ArrayList<Object>();
			try {
				objtList = objectService.selectObjectList(map);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    mav.addObject("objtList",objtList);
		    mav.setViewName("jsonView");
	    return mav;
	}
	
	@RequestMapping(value= "/selectObjectDtl.do", method=RequestMethod.POST)
	public ModelAndView selectObjectDtl(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = objectService.selectObjectInfo(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("objtInfo",result);
	    mav.setViewName("jsonView");
	    return mav;
	}	
	
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
	
	@RequestMapping(value= "/modifyObject.do", method=RequestMethod.POST)
	public ModelAndView modifyObject(@RequestParam Map<String,Object> map)  {  
		
		try {
			//logger.debug("hhihih");
			int result = objectService.modifyObject(map);
			logger.debug("result : "+  result );
		} catch (Exception e) {
			logger.error("update error");
			e.printStackTrace();
		}
		ModelAndView mav= new ModelAndView();
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	@RequestMapping(value="/deleteObject.do",method = RequestMethod.POST)
	public String deleteObject(HttpServletRequest request,Model model){
		ListController listView = new ListController();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("objtTp", request.getParameter("objtTp"));
		map.put("objtNo", request.getParameter("objtNo"));
		try {
			int result = objectService.deleteObject(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
		
		return "/list/commObList";	
	}
	
	
	
	
}
