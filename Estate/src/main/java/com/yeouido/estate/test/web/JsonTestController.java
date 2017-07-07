package com.yeouido.estate.test.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yeouido.estate.test.service.JsonTestService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class JsonTestController {
	
	private static final Logger logger = LoggerFactory.getLogger(JsonTestController.class);
	
	@Resource(name="jsonTestService")
	protected JsonTestService jsonTestService;
	
	//Controller
	@RequestMapping(value= "/joinMember.do", method=RequestMethod.POST)
	public ModelAndView jsonTest(@RequestParam Map<String,Object> map)  {  
		logger.info(map.get("name").toString());
	    
		ModelAndView mav= new ModelAndView();
//
//	    Map<String, Object> map = new HashMap<String,Object>();
//	    map.put("id", "abc");
//	    map.put("name", "홍길동");
//	    map.put("age", 28);

	    
	    mav.addObject("person",map);
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	@RequestMapping(value= "/jsonTestList.do", method=RequestMethod.POST)
	public ModelAndView testJs( @RequestParam("id") String id)  {  
		ModelAndView mav= new ModelAndView();

	    ArrayList<Map<String, Object>> listMap = new ArrayList<Map<String,Object>>();
		try {
			listMap = jsonTestService.testList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    logger.info(listMap.get(0).get("id").toString());
	    logger.info(listMap.get(0).get("name").toString());
	    
	    
	    mav.addObject("person",listMap);
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	
	
}
