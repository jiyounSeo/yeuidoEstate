package com.yeouido.estate.notice.web;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yeouido.estate.Paging;
import com.yeouido.estate.notice.service.NoticeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Resource(name="noticeService")
	protected NoticeService noticeService;
	
	@RequestMapping(value="/noticeList.do", method=RequestMethod.GET)
	public String noticeList(){
		
		return "/notice/noticeList";
	}

	@RequestMapping(value= "/newNoticeView.do", method=RequestMethod.GET)
	public String newLogbookView(@RequestParam Map<String,Object> map)  {  
		return "/notice/newNotice";	
	}

	/* 
	 * 수정 페이지 조회
	 */
	@RequestMapping(value="/modifyNoticeInfo.do",method = RequestMethod.GET)
	public String modifyNoticeInfo(@RequestParam Map<String,Object> map, Model model){
		model.addAllAttributes(map);
		return "/notice/newNotice" ;
	}
	/*
	 * 등록 
	 */
	@RequestMapping(value= "/insertNotice.do", method=RequestMethod.POST)
	public ModelAndView insertNotice(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		try {
			logger.error("insertTest : ",map);
			map.put("user",  session.getAttribute("user")); // map에 담기 해당쿼리에 #{user.mbrId} 이렇게 써주기
			int result = noticeService.insertNotice(map);
			mav.addObject("messageCd", "1");
			mav.addObject("message", "공지사항 등록에 성공하였습니다.");
			
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	/* 
	 * 목록조회
	 */
	@RequestMapping(value= "/selectNoticeList.do", method=RequestMethod.POST)
	public ModelAndView selectNoticeList( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Paging paging = new Paging();
        			
		List<Map<String,Object>> ntList = new ArrayList<Map<String,Object>>();
		try {
			int currentPage = Integer.parseInt(map.get("currentPage").toString());
			int pagePerRow = Integer.parseInt(map.get("pagePerRow").toString() );
			map.put("rowNum", (currentPage-1)*pagePerRow);
			map.put("pagePerRow", pagePerRow);
			
			ntList = noticeService.selectNoticeList(map);
			if (!ntList.isEmpty()) {
						
				int totalCount = Integer.parseInt(ntList.get(0).get("totalCnt").toString());
				int pageSize = Integer.parseInt(map.get("pageSize").toString());
				Map<String, Object> pagingMap = paging.pagingMethod( currentPage, totalCount, pagePerRow, pageSize);
				mav.addAllObjects(pagingMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    mav.addObject("ntList",ntList);
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	/*
	 * 상세 조회
	 */	
	@RequestMapping(value="/viewNoticeItem.do")
	public ModelAndView viewNoticeItem(HttpServletRequest request, @RequestParam Map<String,Object> map){
		ModelAndView mav= new ModelAndView();		
		Map<String, Object> result = new HashMap<String, Object>();
		map.put("noticeId", request.getParameter("noticeId"));
		try {
			noticeService.increaseViewCount(map);
			result = noticeService.selectNoticeInfo(map);
			mav.addObject("messageCd", "1");
			
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.addObject("item", result);
		mav.setViewName("/notice/noticeView");
		return mav;	
	}
	/*
	 *  상세 조회 -- 수정용
	 */	
	@RequestMapping(value= "/selectNoticeDtl.do", method=RequestMethod.POST)
	public ModelAndView selectNoticeDtl(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = noticeService.selectNoticeInfo(map);
			mav.addObject("messageCd", "1");

		} catch (Exception e) {
			mav.addObject("messageCd", "2");

			e.printStackTrace();
		}
		mav.addObject("item",result);
	    mav.setViewName("jsonView");
	    return mav;
	}
	/*
	 *  삭제
	 */		
	@RequestMapping(value= "/deleteNotice.do", method=RequestMethod.POST)
	public ModelAndView deleteNotice(@RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		
		try {
			int result = noticeService.deleteNotice(map);
			mav.addObject("messageCd", "1");
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}

	/*
	 *  수정 등록
	 */		
	@RequestMapping(value= "/modifyNotice.do", method=RequestMethod.POST)
	public ModelAndView modifyNotice(@RequestParam Map<String,Object> map, HttpSession session)  {  
		ModelAndView mav= new ModelAndView();
		
		try {
			map.put("user",  session.getAttribute("user"));
			int result = noticeService.modifyNotice(map);
			mav.addObject("messageCd", "1");
		} catch (Exception e) {
			mav.addObject("messageCd", "2");
			e.printStackTrace();
		}
		mav.setViewName("jsonView");	
	    return mav;
	}
	
	/* 최근게시물 */
	@RequestMapping(value= "/selectLatestNoticeList.do", method=RequestMethod.POST)
	public ModelAndView selectLatestNoticeList( @RequestParam Map<String,Object> map)  {  
		ModelAndView mav= new ModelAndView();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			int endNum = Integer.parseInt(map.get("endNum").toString());
			map.put("endNum", endNum);
			
			list = noticeService.selectLatestNoticeList(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("리스트조회실패");
		}
	    mav.addObject("list",list);
	    mav.setViewName("jsonView");
	    return mav;
	}
	
	// 다중파일업로드
	  @RequestMapping(value = "/file_uploader_html5.do",
	                  method = RequestMethod.POST)
	  @ResponseBody
	  public String multiplePhotoUpload(HttpServletRequest request) {
	    // 파일정보
	    StringBuffer sb = new StringBuffer();
	    try {
	      // 파일명을 받는다 - 일반 원본파일명
	      String oldName = request.getHeader("file-name");
	      // 파일 기본경로 _ 상세경로
	      String filePath = "D:/web/yeuidoEstate/Estate/src/main/webapp/resources/photoUpload/";
	      String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
	                          .format(System.currentTimeMillis()))
	                          .append(UUID.randomUUID().toString())
	                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
	      InputStream is = request.getInputStream();
	      OutputStream os = new FileOutputStream(filePath + saveName);
	      int numRead;
	      byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	      while ((numRead = is.read(b, 0, b.length)) != -1) {
	        os.write(b, 0, numRead);
	      }
	      os.flush();
	      os.close();
	      // 정보 출력
	      sb = new StringBuffer();
	      sb.append("&bNewLine=true")
	        .append("&sFileName=").append(oldName)
	        .append("&sFileURL=").append("http://localhost:8080/estate/resources/photoUpload/")
	        .append(saveName);
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    return sb.toString();
	  }

}
