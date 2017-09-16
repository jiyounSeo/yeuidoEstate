package com.yeouido.estate.report.web;

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
import com.yeouido.estate.comm.web.Interceptor;
import com.yeouido.estate.list.web.ListController;
import com.yeouido.estate.report.service.ReportService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReportController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Resource(name="reportService")
	protected ReportService reportService;
	
	@RequestMapping(value= "/selectReportList.do", method=RequestMethod.POST)
	public ModelAndView selectReportList( @RequestParam Map<String,Object> map, HttpSession session)   {  
		ModelAndView mav= new ModelAndView();
		Paging paging = new Paging();
        			
		List<Map<String,Object>> reportList = new ArrayList<Map<String,Object>>();
		try {
			int currentPage = Integer.parseInt(map.get("currentPage").toString());
			int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
			map.put("rowNum", (currentPage-1) * pagePerRow);
			map.put("pagePerRow", pagePerRow);
			
			map.put("user",  session.getAttribute("user"));
			reportList = reportService.selectReportList(map);
			if (!reportList.isEmpty()) {
				int totalCount = Integer.parseInt(reportList.get(0).get("totalCnt").toString());
				int pageSize = Integer.parseInt(map.get("pageSize").toString());
				Map<String, Object> pagingMap = paging.pagingMethod(currentPage, totalCount, pagePerRow, pageSize);
				mav.addAllObjects(pagingMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("reportList", reportList);
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	@RequestMapping(value="/commRepList.do", method = RequestMethod.GET)
	public String goCommRepList(HttpServletRequest request,Model model){
		
		return "/report/reportList";
	}
	
	@RequestMapping(value="/newReport.do", method = RequestMethod.GET)
	public String goCommNewReport(HttpServletRequest request,Model model){
		
		return "/report/newReport";
	}
	
	@RequestMapping(value="/viewReport.do", method = RequestMethod.GET)
	public String goCommViewReport(HttpServletRequest request,Model model){
		Map<String,Object> map = new HashMap<String, Object>(); 
		map.put("contractId", request.getParameter("contractId"));
		
		Map<String, Object> result = new HashMap<String, Object>();
		try
		{
			result = reportService.selectReportInfo(map);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		model.addAttribute("result", result);
		
		return "/report/viewReport";
	}
	
	@RequestMapping(value="/editReport", method = RequestMethod.GET)
	public String goCommEditReport(HttpServletRequest request,Model model){
		Map<String,Object> map = new HashMap<String, Object>(); 
		map.put("contractId", request.getParameter("contractId"));
		
		Map<String, Object> result = new HashMap<String, Object>();
		try
		{
			result = reportService.selectReportInfo(map);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		model.addAttribute("result", result);
		
		return "/report/editReport";
	}
	
	@RequestMapping(value= "/insertReport.do", method=RequestMethod.POST)
	public ModelAndView insertReport(@RequestParam Map<String,Object> map, HttpSession session) 
	{  
		try {
			map.put("user",  session.getAttribute("user"));
			int result = reportService.insertReport(map);
			logger.debug("result : "+  result );
		} catch (Exception e) {
			logger.error("insert error");
			e.printStackTrace();
		}
		ModelAndView mav= new ModelAndView();
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	@RequestMapping(value= "/modifyReport.do", method=RequestMethod.POST)
	public ModelAndView modifyReport(@RequestParam Map<String,Object> map)  {  
		
		try {
			int result = reportService.modifyReport(map);
			logger.debug("result : "+  result );
		} catch (Exception e) {
			logger.error("update error");
			e.printStackTrace();
		}
		ModelAndView mav= new ModelAndView();
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	@RequestMapping(value= "/deleteReport.do", method=RequestMethod.POST)
	public ModelAndView deleteReport(@RequestParam Map<String,Object> map)  {  
		
		try {
			int result = reportService.deleteReport(map);
			logger.debug("result : "+  result );
		} catch (Exception e) {
			logger.error("update error");
			e.printStackTrace();
		}
		ModelAndView mav= new ModelAndView();
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	@RequestMapping(value= "/bossListReport.do", method=RequestMethod.POST)
	public ModelAndView selectBossListReport( @RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
        			
		List<Map<String,Object>> reportList = new ArrayList<Map<String,Object>>();
		try {
			map.put("user",  session.getAttribute("user"));
			reportList = reportService.selectBossList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("reportList", reportList);
	    mav.setViewName("jsonView");
	    return mav;
	}

	@RequestMapping(value= "/managerListReport.do", method=RequestMethod.POST)
	public ModelAndView selectManagerListReport( @RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
        			
		List<Map<String,Object>> managerList = new ArrayList<Map<String,Object>>();
		try {
			map.put("user",  session.getAttribute("user"));
			managerList = reportService.selectManagerList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("managerList", managerList);
	    mav.setViewName("jsonView");
	    return mav;
	}	
	
	/*@RequestMapping(value="/chatPage")
	public String viewChatPage(){
		return "/report/chatPage";
	}*/
}
