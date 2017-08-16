package com.yeouido.estate.list.web;

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
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import com.yeouido.estate.list.service.ListService;

@Controller
public class ListController {

	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	final static int OBJECT_MAIN_CATEGORY_NUM = 6; 
	final static int OBJECT_TAB_CATEGORY_MAX = 4;
	
	public enum mainCategory {
		APT(1, 4, 1), 
		STORE(2, 2, 1), 
		OFFICE(3, 2, 1),
		OPS(4, 4, 1), 
		HRAPT(5, 4, 1),
		TICKET(6, 4, 1);
		
		private int idx;
		private int num_of_tab;
		private int selected_tab;
		
		mainCategory(int idx, int num_of_tab, int selected_tab){
			this.idx = idx;
			this.num_of_tab = num_of_tab;
			this.selected_tab = selected_tab;
		}
		
		public int getIndex(){	return idx; }
		public int getSelectedTabIndex(){ return selected_tab; }
		public int getNumOfTab() { return num_of_tab; }
	}
	
	@Resource(name="listService")
	protected ListService listService;

	@RequestMapping(value= "/totalList.do", method=RequestMethod.GET)
	public ModelAndView totalListView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/totalList");
		 return mv;
	}
	
	@RequestMapping(value= "/commClList.do", method=RequestMethod.GET)
	public ModelAndView commClListView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/commClList");
		 return mv;
	}	
	
	@RequestMapping(value= "/newObApt.do", method=RequestMethod.GET)
	public ModelAndView newObAptView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObApt");
		 return mv;
	}	
	
	@RequestMapping(value= "/newObStore.do", method=RequestMethod.GET)
	public ModelAndView newObStoreView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObStore");
		 return mv;
	}	
	
	@RequestMapping(value= "/newObOffice.do", method=RequestMethod.GET)
	public ModelAndView newObOfficeView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObOffice");
		 return mv;
	}	
	
	@RequestMapping(value= "/newObOps.do", method=RequestMethod.GET)
	public ModelAndView newObOpsView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObOps");
		 return mv;
	}	
	
	@RequestMapping(value= "/newObHrapt.do", method=RequestMethod.GET)
	public ModelAndView newObHraptView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObHrapt");
		 return mv;
	}	
	
	@RequestMapping(value= "/newObTicket.do", method=RequestMethod.GET)
	public ModelAndView newObTicketView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObTicket");
		 return mv;
	}	
	
	@RequestMapping(value= "/newClient.do", method=RequestMethod.GET)
	public ModelAndView newClientView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/listpage/newClient");
		 return mv;
	}	

	@RequestMapping(value="/commClList",method = RequestMethod.GET)
	public String goCommClList(HttpServletRequest request,Model model){

		return "/list/commClList";	
	}

	@RequestMapping(value="/addObject",method = RequestMethod.GET)
	public String goAddObject(HttpServletRequest request,Model model){

		return "/list/addObject";	
	}
	
	public void makeString(int type, int tab, String [] main_category_state, ArrayList<String> tab_category_state, String [] viewUrl)
	{
		switch(type) {
			case 1:{ // 아파트
				main_category_state[mainCategory.APT.getIndex()] = mainCategory.APT.getIndex() + "_on"; 
				for(int i = 1; i <= mainCategory.APT.getNumOfTab(); i++) { tab_category_state.add(i+"_off"); }			
				tab_category_state.set(tab-1, tab+"_on");
				viewUrl[0] = "./viewObApt";
			} break;			
			case 2:{ // 상점
				main_category_state[mainCategory.STORE.getIndex()] = mainCategory.STORE.getIndex() + "_on";
				tab_category_state.add("7_off");
				tab_category_state.add("8_off");
				tab_category_state.set(tab-1, (tab+6)+"_on");
				viewUrl[0] = "./viewObStore";
			} break;		
			case 3:{ // 사무실
				main_category_state[mainCategory.OFFICE.getIndex()] = mainCategory.OFFICE.getIndex() + "_on";	
				tab_category_state.add("7_off");
				tab_category_state.add("8_off");
				tab_category_state.set(tab-1, (tab+6)+"_on");
				viewUrl[0] = "./viewObOffice";
			} break;	
			case 4:{ // 오피스텔
				main_category_state[mainCategory.OPS.getIndex()] = mainCategory.OPS.getIndex() + "_on";	
				for(int i = 1; i <= mainCategory.OPS.getNumOfTab(); i++) { tab_category_state.add(i+"_off"); }
				tab_category_state.set(tab-1, tab+"_on");
				viewUrl[0] = "./viewObOps";
			} break;		
			case 5:{ // 주상복합
				main_category_state[mainCategory.HRAPT.getIndex()] = mainCategory.HRAPT.getIndex() + "_on";	
				for(int i = 1; i <= mainCategory.HRAPT.getNumOfTab(); i++) { tab_category_state.add(i+"_off"); }
				tab_category_state.set(tab-1, tab+"_on");
				viewUrl[0] = "./viewObHrapt";
			} break;		
			case 6:{ // 분양권
				main_category_state[mainCategory.TICKET.getIndex()] = mainCategory.TICKET.getIndex() + "_on";	
				tab_category_state.add("5_off");
				tab_category_state.add("6_off");
				tab_category_state.set(tab-1, (tab+4)+"_on");
				viewUrl[0] = "./viewObTicket";
			} break;	
			default:{ 
				main_category_state[mainCategory.APT.getIndex()] = mainCategory.APT.getIndex() + "_on"; 
				for(int i = 1; i <= mainCategory.APT.getNumOfTab(); i++) { tab_category_state.add(i+"_off"); }
				tab_category_state.set(tab-1, tab+"_on");
				viewUrl[0] = "./viewObApt";
			}
		}			
		return;
	}
	
	@RequestMapping(value="/commObList",method = RequestMethod.GET)
	public String goCommObList(HttpServletRequest request,Model model){
		
		int mainc = 1;
		int tab = 1;
		String subc= request.getParameter("subc");
		String [] viewUrl = {""};
		int pageMark = 2;
		
		if(request.getParameter("mainc") != null){
			mainc = Integer.parseInt(request.getParameter("mainc"));
		}
		if(request.getParameter("tab") != null){
			tab = Integer.parseInt(request.getParameter("tab"));			
		}
		
		String [] main_category_state = new String[OBJECT_MAIN_CATEGORY_NUM+1];
		ArrayList<String> tab_category_state = new ArrayList<String>();
		
		for(int i = 1; i <=OBJECT_MAIN_CATEGORY_NUM; i++){	// Initialize
			main_category_state[i] = i+"_off";
		}
		
		makeString(mainc, tab, main_category_state, tab_category_state, viewUrl);	
	
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
	
	@RequestMapping(value="/totalList",method = RequestMethod.GET)
	public String goTotalList(HttpServletRequest request,Model model){
		
		int mainc = 1;
		int tab = 1;
		int vm = 1;			// viewMode : 1 - default / 2 (object only) / 3 (client only)
		String subc= request.getParameter("subc");
		String [] viewUrl = {""};
		int pageMark = 1;
				
		if(request.getParameter("mainc") != null){
			mainc = Integer.parseInt(request.getParameter("mainc"));
		}
		if(request.getParameter("tab") != null){
			tab = Integer.parseInt(request.getParameter("tab"));			
		}
		if(request.getParameter("vm") != null){
			vm = Integer.parseInt(request.getParameter("vm"));			
		}
		
		String [] main_category_state = new String[OBJECT_MAIN_CATEGORY_NUM+1];
		ArrayList<String> tab_category_state = new ArrayList<String>();
		
		for(int i = 1; i <=OBJECT_MAIN_CATEGORY_NUM; i++){	// Initialize
			main_category_state[i] = i+"_off";
		}

		makeString(mainc, tab, main_category_state, tab_category_state, viewUrl);	

		int numOfTab = tab_category_state.size();
		int numOfRow = 6;
		
		if(vm != 1){
			numOfRow = 15;
		}
		
		ArrayList<String> viewMode_btn_state = new ArrayList<String>();
		for(int i = 1; i <=3; i++){
			viewMode_btn_state.add(i+"_off");
		}
		viewMode_btn_state.set(vm-1, vm+"_on");
		
		model.addAttribute("main_category_state", main_category_state);
		model.addAttribute("mainc", mainc);
		model.addAttribute("tab_category_state", tab_category_state);
		model.addAttribute("numOfTab", numOfTab);
		model.addAttribute("tab", tab);
		model.addAttribute("subc", subc);
		model.addAttribute("viewMode", vm);
		model.addAttribute("numOfRow", numOfRow);
		model.addAttribute("viewMode_btn_state", viewMode_btn_state);
		model.addAttribute("viewUrl", viewUrl);
		model.addAttribute("pageMark", pageMark);
		
		return "/list/totalList";	
	}
	
	
	public Model goView(HttpServletRequest request,Model model)
	{
		int pageMark = 1;
		String title_img = "title_ob_list.jpg";
		String list_url = "./commObList";
		if(request.getParameter("pm") != null){
			pageMark = Integer.parseInt(request.getParameter("pm"));
		}
		
		switch(pageMark) {
			case 1:{ // 물건List
				title_img = "title_ob_list.jpg";
				list_url = "./totalList";
			} break;			
			case 2:{ // 공동물건List
				title_img = "title_comm_ob_list.jpg";
				list_url = "./commObList";
			} break;		
			case 3:{ // 활성물건List
				title_img = "title_ob_active.jpg";
				list_url = null;
			} break;	
			case 4:{ // 보류물건List
				title_img = "title_ob_reserve.jpg";
				list_url = null;
			} break;				
			default:{ 
				title_img = "title_ob_list.jpg";
				list_url = "./commObList";
			}
		}				
	
	
		model.addAttribute("title_img", title_img);
		model.addAttribute("list_url", list_url);
		
		return model;
	}
	
	@RequestMapping(value= "/viewObApt.do", method=RequestMethod.GET)
	public ModelAndView newViewObAptView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/listpage/viewObApt");
		 return mv;
	}	

	@RequestMapping(value="/viewObApt",method = RequestMethod.GET)
	public String goViewObAptView(HttpServletRequest request,Model model){
		
		model = goView(request, model);
		return "/listpage/viewObApt";	
	}

	@RequestMapping(value= "/viewObHrapt.do", method=RequestMethod.GET)
	public ModelAndView newViewObHraptView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/listpage/viewObHrapt");
		 return mv;
	}	

	@RequestMapping(value="/viewObHrapt",method = RequestMethod.GET)
	public String goViewObHraptView(HttpServletRequest request,Model model){
		
		model = goView(request, model);
		return "/listpage/viewObHrapt";	
	}
	
	@RequestMapping(value= "/viewObOffice.do", method=RequestMethod.GET)
	public ModelAndView newViewObOfficeView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/listpage/viewObOffice");
		 return mv;
	}	

	@RequestMapping(value="/viewObOffice",method = RequestMethod.GET)
	public String goViewObOfficeView(HttpServletRequest request,Model model){
		
		model = goView(request, model);
		return "/listpage/viewObOffice";	
	}
	
	@RequestMapping(value= "/viewObOps.do", method=RequestMethod.GET)
	public ModelAndView newViewObOpsView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/listpage/viewObOps");
		 return mv;
	}	

	@RequestMapping(value="/viewObOps",method = RequestMethod.GET)
	public String goViewObOpsView(HttpServletRequest request,Model model){
		
		model = goView(request, model);
		return "/listpage/viewObOps";	
	}

	@RequestMapping(value= "/viewObStore.do", method=RequestMethod.GET)
	public ModelAndView newViewObStoreView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/listpage/viewObStore");
		 return mv;
	}	

	@RequestMapping(value="/viewObStore",method = RequestMethod.GET)
	public String goViewObStoreView(HttpServletRequest request,Model model){
		
		model = goView(request, model);
		return "/listpage/viewObStore";	
	}
	
	@RequestMapping(value= "/viewObTicket.do", method=RequestMethod.GET)
	public ModelAndView newViewObTicketView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/listpage/viewObTicket");
		 return mv;
	}	

	@RequestMapping(value="/viewObTicket",method = RequestMethod.GET)
	public String goViewObTicketView(HttpServletRequest request,Model model){
		
		model = goView(request, model);
		return "/listpage/viewObTicket";	
	}
	
	@RequestMapping(value= "/viewClient.do", method=RequestMethod.GET)
	public ModelAndView viewClientView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/listpage/viewClient");
		 return mv;
	}	
	
	@RequestMapping(value="/viewClient",method = RequestMethod.GET)
	public String goViewClientView(HttpServletRequest request,Model model){
		
		model = goView(request, model);
		return "/listpage/viewClient";	
	}
	
}
