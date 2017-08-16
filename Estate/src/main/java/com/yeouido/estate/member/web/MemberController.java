package com.yeouido.estate.member.web;

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

import com.yeouido.estate.member.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Resource(name="memberService")
	protected MemberService memberService;

	@RequestMapping(value= "/joinMemberView.do", method=RequestMethod.POST)
	public ModelAndView joinMemberView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/mbr/joinMember");
		 return mv;
	}
	
	@RequestMapping(value= "/memberListView.do", method=RequestMethod.POST)
	public ModelAndView memberListView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/mbr/memberList");
		 return mv;
	}
	
	@RequestMapping(value= "/loginView.do")
	public ModelAndView loginView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/mbr/login");
		 return mv;
	}
	
	@RequestMapping(value= "/regView.do")
	public ModelAndView regView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/mbr/joinMember");
		 return mv;
	}
	
	@RequestMapping(value= "/adminMainView.do")
	public ModelAndView adminMainView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/adminMain");
		 return mv;
	}
	
	//member insert 
	@RequestMapping(value= "/joinMember.do", method=RequestMethod.POST)
	public ModelAndView joinMember(@RequestParam Map<String,Object> map)  {  
		try {
			memberService.insertMemberList(map);
		} catch (Exception e) {
			logger.error("insert error");
			e.printStackTrace();
		}
		ModelAndView mav= new ModelAndView();
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	@RequestMapping(value= "/memberList.do", method=RequestMethod.POST)
	public ModelAndView memberList( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		 List<Object> mbrList = new ArrayList<Object>();
			try {
				mbrList = memberService.selectMemberList(map);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    mav.addObject("mbrList",mbrList);
		    mav.setViewName("jsonView");
	    return mav;
	}
	
	
	
	
}
