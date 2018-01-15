package com.yeouido.estate;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//return "/adminMain";
		//return "/index";
		return "index_new";
	}
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		
		//return "/adminMain";
		return "/index";
	}
	
	
	// �������Ͼ��ε�
	  @RequestMapping(value = "/file_uploader_html5.do",
	                  method = RequestMethod.POST)
	  @ResponseBody
	  public String multiplePhotoUpload(HttpServletRequest request) {
	    // ��������
	    StringBuffer sb = new StringBuffer();
	    try {
	      // ���ϸ��� �޴´� - �Ϲ� �������ϸ�
	      String oldName = request.getHeader("file-name");
	      // ���� �⺻��� _ �󼼰��
	      //String filePath = "D:/web/yeuidoEstate/src/main/webapp/resources/photoUpload/";
	      String filePath = "/home/user/greenwear/webapps/ROOT/resources/photoUpload/";
	      
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
	      // ���� ���
	      sb = new StringBuffer();
	      sb.append("&bNewLine=true")
	        .append("&sFileName=").append(oldName)
	        //.append("&sFileURL=").append("http://localhost:8080/resources/photoUpload/")
	        .append("&sFileURL=").append("/resources/photoUpload/")
	        .append(saveName);
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    return sb.toString();
	  }
}
