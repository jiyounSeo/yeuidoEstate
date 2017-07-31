package com.yeouido.estate.object.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yeouido.estate.object.service.ObjectService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ObjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ObjectController.class);
	
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
	public ModelAndView memberList( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		 List<Object> mbrList = new ArrayList<Object>();
			try {
				mbrList = objectService.selectObjectList(map);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    mav.addObject("mbrList",mbrList);
		    mav.setViewName("jsonView");
	    return mav;
	}
	
	
	
	
}
