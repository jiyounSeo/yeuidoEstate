package com.yeouido.estate.member.web;

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
	
	@RequestMapping(value= "/memberListView.do", method=RequestMethod.GET)
	public ModelAndView memberListView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/mbr/memberList");
		 return mv;
	}
	
	@RequestMapping(value= "/loginView.go")
	public ModelAndView loginView(@RequestParam Map<String,Object> map)  {  
		ModelAndView mv = new ModelAndView("/mbr/login");
		return mv;
	}

	@RequestMapping(value= "/logout.go")
	public ModelAndView logout(HttpSession session){  
		//ModelAndView mv = new ModelAndView("/mbr/login");
		session.setAttribute("user", null);
		ModelAndView mv = new ModelAndView("/index");
		return mv;
	}
	
	@RequestMapping(value= "/loginInterceptor.go")
	public ModelAndView loginInterceptor(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/mbr/loginInterceptor");
		 return mv;
	}
	@RequestMapping(value= "/regView.go")
	public ModelAndView regView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/mbr/joinMember");
		 return mv;
	}
	
	
	@RequestMapping(value= "/adminMainView.do")
	public ModelAndView adminMainView(HttpSession session, @RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/adminMain");
		 System.out.println(session.getAttribute("user").toString());
		 mv.addObject("user",session.getAttribute("user"));
		 return mv;
	}
	
	// memberModify
	@RequestMapping(value= "/modifyMemberView.do")
	public ModelAndView modifyMember(@RequestParam Map<String,Object> map, HttpSession session)  {  
		 
		 ModelAndView mv = new ModelAndView("/mbr/modifyMember");
		 map.put("user",  session.getAttribute("user"));
		 try {
			mv.addAllObjects( memberService.selectMemberInfo(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return mv;
	}
	
	/*
	 * 회원정보 수정 
	 */
	@RequestMapping(value= "/updateMemberInfo.do", method=RequestMethod.POST)
	public ModelAndView updateMemberInfo(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		try {
			map.put("user",  session.getAttribute("user"));
			int result = memberService.updateMemberInfo(map);
			mav.addObject ("messageCd", 1);
			session.setAttribute("user", null);
			mav.addObject("message", "회원정보 변경에 성공했습니다. 로그인을 다시 해주세요.");
		} catch (Exception e) {
			mav.addObject ("messageCd", 2);
			mav.addObject("message", "회원정보 변경에 실패했습니다.");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	
	
	//member insert 
	@RequestMapping(value= "/joinMember.go", method=RequestMethod.POST)
	public ModelAndView joinMember(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		try {
			int result = memberService.insertMemberList(map);
			if(result > 0)
				mav.addObject("message", "success");
			else
				mav.addObject("message", "fail");
		} catch (Exception e) {
			logger.error("insert error");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	@RequestMapping(value= "/memberList.do", method=RequestMethod.POST)
	public ModelAndView memberList( @RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		Paging paging = new Paging();
        
		List<Map<String,Object>> mbrList = new ArrayList<Map<String,Object>>();
		 
		try {
			map.put("user",  session.getAttribute("user"));
			
			int currentPage = Integer.parseInt(map.get("currentPage").toString());
			int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
			map.put("rowNum", (currentPage-1)*pagePerRow);
			map.put("pagePerRow", pagePerRow);
			
			mbrList = memberService.selectMemberList(map);
			if (!mbrList.isEmpty()) {
				int totalCount = Integer.parseInt(mbrList.get(0).get("totalCnt").toString());
				int pageSize = Integer.parseInt(map.get("pageSize").toString());
				Map<String, Object> pagingMap = paging.pagingMethod( currentPage, totalCount, pagePerRow, pageSize);
				mav.addAllObjects(pagingMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.addObject("mbrList",mbrList);
		mav.setViewName("jsonView");
	    return mav;
	}
	
	@RequestMapping(value="/loginMember.go", method=RequestMethod.POST)
	public ModelAndView loginMember(HttpSession session, @RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		try {
			Map<String, Object> result = memberService.selectOneMember(map);
			if(!result.get("result").toString().equals("0")) { 
				session.setAttribute("user", result);
				mav.addObject("user", result);
				mav.addObject("message", "success");
			}
			else {
				mav.addObject("message", "fail");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/loginIdDupChk.go")
	public ModelAndView loginIdDupChk(HttpSession session, @RequestParam Map<String, Object>map) {
		ModelAndView mav = new ModelAndView();
		
		try {
			Map<String, Object> result = new HashMap<String, Object>();
			result = memberService.selectOneMember(map);
			mav.addObject("count", result.get("result"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value= "/selectEstate.go", method=RequestMethod.POST)
	public ModelAndView selectEstate( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		 List<Object> estateList = new ArrayList<Object>();
		 
			try {
				estateList = memberService.selectEstate(map);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    mav.addObject("estateList",estateList);
		    mav.setViewName("jsonView");
	    return mav;
	}
	
	@RequestMapping(value= "/updateMemberAccept.do", method=RequestMethod.POST)
	public ModelAndView updateMemberAccept( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		List<Object> estateList = new ArrayList<Object>();

		try {
			int result = memberService.updateMemberAccept(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "승인처리가 완료 되었습니다.");
			
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			mav.addObject("message", "승인처리 중 오류가 발생하였습니다.");
			e.printStackTrace();
		}
		
		mav.setViewName("jsonView");
	    return mav;
	}
	@RequestMapping(value= "/updateMemberTp.do", method=RequestMethod.POST)
	public ModelAndView updateMemberTp( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		List<Object> estateList = new ArrayList<Object>();

		try {
			int result = memberService.updateMemberTp(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "등급변경이 완료 되었습니다.");
			
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			mav.addObject("message", "등급변경 중 오류가 발생하였습니다.");
			e.printStackTrace();
		}
		
		mav.setViewName("jsonView");
	    return mav;
	}
	
	@RequestMapping(value= "/deleteMember.do", method=RequestMethod.POST)
	public ModelAndView deleteMember( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		 List<Object> estateList = new ArrayList<Object>();
		 try {
			int result = memberService.deleteMember(map);
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
	
}
