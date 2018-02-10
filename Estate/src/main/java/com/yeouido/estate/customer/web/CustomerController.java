package com.yeouido.estate.customer.web;

import java.io.UnsupportedEncodingException;
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
import com.yeouido.estate.customer.service.CustomerService;
import com.yeouido.estate.list.web.ListController;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	final static int OBJECT_MAIN_CATEGORY_NUM = 6; 
	final static int OBJECT_TAB_CATEGORY_MAX = 4;
	
	@Resource(name="customerService")
	protected CustomerService customerService;
	
	/* 
	 * �������ȸ
	 */
	@RequestMapping(value= "/selectCustomerList.do", method=RequestMethod.POST)
	public ModelAndView selectCustomerList( @RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		Paging paging = new Paging();
		map.put("user",  session.getAttribute("user"));
		
		List<Map<String,Object>> custList = new ArrayList<Map<String,Object>>();
		try {
			int currentPage = Integer.parseInt(map.get("currentPage").toString());
			int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
			map.put("rowNum", (currentPage-1)*pagePerRow);
			map.put("pagePerRow", pagePerRow);
			custList = customerService.selectCustomerList(map);
			if (!custList.isEmpty()) {
				int totalCount = Integer.parseInt(customerService.selectCustomerTotalCnt(map).get("totalCnt").toString());
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
	 * ����ϰ˻� -- �̸�
	 */
	@RequestMapping(value= "/custSearchName.do", method=RequestMethod.POST)
	public ModelAndView custSearchName( @RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		Paging paging = new Paging();
		map.put("user",  session.getAttribute("user"));
		
		List<Map<String,Object>> custList = new ArrayList<Map<String,Object>>();
		try {
			int currentPage = Integer.parseInt(map.get("currentPage").toString());
			int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
			map.put("rowNum", (currentPage-1)*pagePerRow);
			map.put("pagePerRow", pagePerRow);
			custList = customerService.custSearchName(map);
			if (!custList.isEmpty()) {
				int totalCount = custList.size();
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
	

	@RequestMapping(value="/custSearchNamePage.do", method = RequestMethod. POST)
	public ModelAndView custSearchNamePage(@RequestParam Map<String,Object> map){
		
		ModelAndView mv = new ModelAndView("/search/custSearch");
		logger.error(map.get("keyword").toString());
	    mv.addAllObjects(map);
		return mv;	
	}
	
	/*
	 * ����� 
	 */
	@RequestMapping(value= "/insertCustomer.do", method=RequestMethod.POST)
	public ModelAndView insertCustomer(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		Map custInfo = new HashMap<String, Object>();
		map.put("user",  session.getAttribute("user"));
		
		try {
			
			custInfo = customerService.selectCustomerConfirm(map);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if (("").equals(custInfo.get("custId")) || custInfo.get("custId") == null) {
			try {
				int result = customerService.insertCustomer(map);
				mav.addObject("messageCd", "1");
				mav.addObject("message", "�� ��Ͽ� �����Ͽ����ϴ�.");
				
			} catch (Exception e) {
				mav.addObject("messageCd", "2");
				e.printStackTrace();
			}
		} else {
			mav.addObject("message", "�̹� ��ϵ� ���Դϴ�.");
		}
		mav.setViewName("jsonView");	
	    return mav;
	}

	
	/*
	 * �� �� ��ȸ
	 */	
	@RequestMapping(value= "/selectCustomerDtl.do", method=RequestMethod.POST)
	public ModelAndView selectCustomerDtl(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		Map<String, Object> result = new HashMap<String, Object>();
		map.put("user",  session.getAttribute("user"));
		
		try {
			result = customerService.selectCustomerInfo(map);
			mav.addObject("messageCd", "1");

		} catch (Exception e) {
			mav.addObject("messageCd", "2");

			e.printStackTrace();
		}
		mav.addObject("custInfo",result);
	    mav.setViewName("jsonView");
	    return mav;
	}	
	
	/*
	 * �� ���� ��ȸ
	 */		
	@RequestMapping(value= "/modifyCustomer.do", method=RequestMethod.POST)
	public ModelAndView modifyCustomer(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		map.put("user",  session.getAttribute("user"));
		
		try {
			int result = customerService.modifyCustomer(map);
			mav.addObject("messageCd", "1");
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}

	/*
	 * �� ����
	 */	
	@RequestMapping(value="/deleteCustomer.do",method = RequestMethod.POST)
	public String deleteCustomer(HttpServletRequest request,Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("custId", request.getParameter("custId"));
		map.put("publicYn", request.getParameter("publicYn"));
		map.put("activeTp", request.getParameter("activeTp"));
		map.put("pageNm", request.getParameter("pageNm"));
		try {
			int result = customerService.deleteCustomer(map);
			model.addAttribute("messageCd", "1");
			
		} catch (Exception e) {
			model.addAttribute("messageCd", "2");
			e.printStackTrace();
		}
		model.addAllAttributes(map);
		return "/list/commClList";	
	}
	
	@RequestMapping(value="/viewClient.do",method = RequestMethod.POST)
	public String viewClient(@RequestParam Map<String,Object> map, Model model, HttpSession session){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			model.addAllAttributes(map);
			map.put("user",  session.getAttribute("user"));
			result = customerService.selectCustomerInfo(map);
					
			if(result == null){				
				String url = "/adminMainView.do";
				model.addAttribute("msg", "�ش� ��ī�尡 �������� �ʽ��ϴ�. �߸��� �����Դϴ�"); 
				model.addAttribute("url", url); 
				return "/comm/redirect";
			}
			
			model.addAllAttributes(result);
			model.addAttribute("messageCd", "1");
		} catch (Exception e) {
			model.addAttribute("messageCd", "2");
			e.printStackTrace();
		}
		String url = "";
		if ("Y".equals(result.get("workListYn"))) {
			url = "/listpage/viewClientWork"; 
		} else {
			url = "/listpage/viewClient"; 
		}
		return url;
	
	}
	
	@RequestMapping(value="/commClListView.do",method = RequestMethod.GET)
	public ModelAndView goCommClList(@RequestParam Map<String,Object> map){
		ModelAndView mv = new ModelAndView("/list/commClList");
	    mv.addAllObjects(map);
		return mv;	
	}
	
	@RequestMapping(value="/commClListPostView.do",method = RequestMethod.POST)
	public ModelAndView commObListPostView(@RequestParam Map<String,Object> map){
	    ModelAndView mv = new ModelAndView("/list/commClList");
	    mv.addAllObjects(map);
		return mv;	
	}
	
	
	@RequestMapping(value= "/newClient.do", method=RequestMethod.GET)
	public ModelAndView newClientView(@RequestParam Map<String,Object> map)  { 
		 ModelAndView mv = new ModelAndView("/listpage/newClient");
		 return mv;
	}	
	
	/*
	 * �� ������������ �� ���� �� ������������ �̵� 
	 * �� �ű��Է� = ���� �������� ����
	 */	
	@RequestMapping(value="/modifyCustomerInfo.do",method = RequestMethod.GET)
	public String modifyCustomerInfo(@RequestParam Map<String,Object> map, Model model){
		model.addAllAttributes(map);
		return "/listpage/newClient" ;
	}
	
	
}
