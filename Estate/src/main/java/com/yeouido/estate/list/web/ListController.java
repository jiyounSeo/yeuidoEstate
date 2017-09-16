package com.yeouido.estate.list.web;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.yeouido.estate.object.service.ObjectService;

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
	
	@Resource(name="objectService")
	protected ObjectService objectService;
	
	/* ���� + �� ����Ʈ ȭ��*/
	@RequestMapping(value= "/totalList.do", method=RequestMethod.GET)
	public ModelAndView totalListView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/totalList");
		 return mv;
	}
	
	
	/* ���� + �� ����Ʈ ȭ��*/
	@RequestMapping(value="/totalListView.do",method = RequestMethod.GET)
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
		
		ArrayList<String> array = objtTpmappingCd (mainc, tab);
		model.addAttribute("objtTp", array.get(0));
		model.addAttribute("saleTp", array.get(1));
		
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
	
	
	/* ����(����Ʈ) ���,���� ȭ�� */
	@RequestMapping(value= "/newObApt.do", method=RequestMethod.GET)
	public ModelAndView newObAptView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObApt");
		 return mv;
	}	
	/* ����(��) ���,����  ȭ�� */
	@RequestMapping(value= "/newObStore.do", method=RequestMethod.GET)
	public ModelAndView newObStoreView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObStore");
		 return mv;
	}	
	/* ����(�繫��/����) ���,����  ȭ�� */
	@RequestMapping(value= "/newObOffice.do", method=RequestMethod.GET)
	public ModelAndView newObOfficeView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObOffice");
		 return mv;
	}	
	/* ����(���ǽ���) ���,����  ȭ�� */
	@RequestMapping(value= "/newObOps.do", method=RequestMethod.GET)
	public ModelAndView newObOpsView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObOps");
		 return mv;
	}	
	/* ����(�ֻ���) ���,����  ȭ�� */
	@RequestMapping(value= "/newObHrapt.do", method=RequestMethod.GET)
	public ModelAndView newObHraptView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObHrapt");
		 return mv;
	}	
	/* ����(�о��) ���,����  ȭ�� */
	@RequestMapping(value= "/newObTicket.do", method=RequestMethod.GET)
	public ModelAndView newObTicketView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObTicket");
		 return mv;
	}	
	/* ���� ��ϰǼ� ��ȸ ȭ�� */
	@RequestMapping(value="/addObject",method = RequestMethod.GET)
	public String goAddObject(HttpServletRequest request,Model model){
		return "/list/addObject";	
	}
	
	/* ���� ��ȸ ȭ�� */
	@RequestMapping(value="/commObListView.do",method = RequestMethod.GET)
	public ModelAndView goCommObList(@RequestParam Map<String,Object> map){
	    ModelAndView mv = new ModelAndView("/list/commObList");
	    mv.addAllObjects(map);
		//odel.addAllAttributes(request.getParameterMap());
		return mv;	
	}
	
	/*
	 * ���� ����ȸ ȭ�� 
	 */
	@RequestMapping(value="/objtDtlView.do",method = RequestMethod.POST)
	public String objtDtlView(@RequestParam Map<String,Object> map, Model model){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = objectService.selectObjectInfo(map);
			model.addAllAttributes(result);
			model.addAllAttributes(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String url = "";
		
		return "/listpage/" + map.get("viewUrl");
	}
	
	public void makeString(int type, int tab, String [] main_category_state, ArrayList<String> tab_category_state, String [] viewUrl)
	{
		switch(type) {
			case 1:{ // ����Ʈ
				main_category_state[mainCategory.APT.getIndex()] = mainCategory.APT.getIndex() + "_on"; 
				for(int i = 1; i <= mainCategory.APT.getNumOfTab(); i++) { tab_category_state.add(i+"_off"); }			
				tab_category_state.set(tab-1, tab+"_on");
				viewUrl[0] = "./viewObApt";
			} break;			
			case 2:{ // ����
				main_category_state[mainCategory.STORE.getIndex()] = mainCategory.STORE.getIndex() + "_on";
				tab_category_state.add("7_off");
				tab_category_state.add("8_off");
				tab_category_state.set(tab-1, (tab+6)+"_on");
				viewUrl[0] = "./viewObStore";
			} break;		
			case 3:{ // �繫��
				main_category_state[mainCategory.OFFICE.getIndex()] = mainCategory.OFFICE.getIndex() + "_on";	
				tab_category_state.add("7_off");
				tab_category_state.add("8_off");
				tab_category_state.set(tab-1, (tab+6)+"_on");
				viewUrl[0] = "./viewObOffice";
			} break;	
			case 4:{ // ���ǽ���
				main_category_state[mainCategory.OPS.getIndex()] = mainCategory.OPS.getIndex() + "_on";	
				for(int i = 1; i <= mainCategory.OPS.getNumOfTab(); i++) { tab_category_state.add(i+"_off"); }
				tab_category_state.set(tab-1, tab+"_on");
				viewUrl[0] = "./viewObOps";
			} break;		
			case 5:{ // �ֻ���
				main_category_state[mainCategory.HRAPT.getIndex()] = mainCategory.HRAPT.getIndex() + "_on";	
				for(int i = 1; i <= mainCategory.HRAPT.getNumOfTab(); i++) { tab_category_state.add(i+"_off"); }
				tab_category_state.set(tab-1, tab+"_on");
				viewUrl[0] = "./viewObHrapt";
			} break;		
			case 6:{ // �о��
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
	
	
	public ArrayList objtTpmappingCd (int mainc, int tab) {
		ArrayList<String> array = new ArrayList<String>();
		String objtTp = "";
		String saleTp = "";
		switch (mainc) {
			case 1 :
				objtTp = "OT001"; //����Ʈ
				if (tab == 1) {
					saleTp = "ST001";  // �Ÿ�
				} else if (tab == 2) {
					saleTp = "ST002";  // ����
				} else if (tab == 3) {
					saleTp = "ST003";  // ����
				} else if (tab == 4) {
					saleTp = "ST004";  // ��Ʈ
				}
				break;
			case 2 :
				objtTp = "OT002"; //��
				if (tab == 1) {
					saleTp = "ST001";  // �Ÿ�
				} else if (tab == 2) {
					saleTp = "ST005";  // �Ӵ�
				} 
				break;
			case 3 :
				objtTp = "OT003"; // �繫��/����
				if (tab == 1) {
					saleTp = "ST001";  // �Ÿ�
				} else if (tab == 2) {
					saleTp = "ST005";  // �Ӵ�
				} break;
			case 4 : 
				objtTp = "OT004"; // ���ǽ���
				if (tab == 1) {
					saleTp = "ST001";  // �Ÿ�
				} else if (tab == 2) {
					saleTp = "ST002";  // ����
				} else if (tab == 3) {
					saleTp = "ST003";  // ����
				} else if (tab == 4) {
					saleTp = "ST004";  // ��Ʈ
				}
				break;
			case 5 : 
				objtTp = "OT005"; // �ֻ���
				if (tab == 1) {
					saleTp = "ST001";  // �Ÿ�
				} else if (tab == 2) {
					saleTp = "ST002";  // ����
				} else if (tab == 3) {
					saleTp = "ST003";  // ����
				} else if (tab == 4) {
					saleTp = "ST004";  // ��Ʈ
				}
				break;
			case 6 : 
				objtTp = "OT006"; // �о��
				if (tab == 1) {
					saleTp = "ST006";  // �о��
				} else if (tab == 2) {
					saleTp = "ST007";  // ����
				}
				break;
		}
		array.add(0, objtTp);
		array.add(1, saleTp);
		
		return array;
		
	}
	
	public ArrayList mappingObjectTp (String objtTp, String saleTp) {
		ArrayList array = new ArrayList();
		int mainc = 1;
		int tab = 1;
		
		if ( ("OT001").equals(objtTp) ) {
			mainc = 1;
			if ( ("ST001").equals(saleTp)) {
				tab = 1;
			} else if ( ("ST002").equals(saleTp)) {
				tab = 2;
			} else if ( ("ST003").equals(saleTp)) {
				tab = 3;
			} else if ( ("ST004").equals(saleTp)) {
				tab = 4;
			}
		} else if ( ("OT002").equals(objtTp) ) {
			mainc = 2;
			if ( ("ST001").equals(saleTp)) {
				tab = 1;
			} else if ( ("ST005").equals(saleTp)) {
				tab = 2;
			} 
		} else if ( ("OT003").equals(objtTp) ) {
			mainc = 3;
			if ( ("ST001").equals(saleTp)) {
				tab = 1;
			} else if ( ("ST005").equals(saleTp)) {
				tab = 2;
			} 
		} else if ( ("OT004").equals(objtTp) ) {
			mainc = 4;
			if ( ("ST001").equals(saleTp)) {
				tab = 1;
			} else if ( ("ST002").equals(saleTp)) {
				tab = 2;
			} else if ( ("ST003").equals(saleTp)) {
				tab = 3;
			} else if ( ("ST004").equals(saleTp)) {
				tab = 4;
			}
		} else if ( ("OT005").equals(objtTp) ) {
			mainc = 5;
			if ( ("ST001").equals(saleTp)) {
				tab = 1;
			} else if ( ("ST002").equals(saleTp)) {
				tab = 2;
			} else if ( ("ST003").equals(saleTp)) {
				tab = 3;
			} else if ( ("ST004").equals(saleTp)) {
				tab = 4;
			}
		} else if ( ("OT006").equals(objtTp) ) {
			mainc = 6;
			if ( ("ST006").equals(saleTp)) {
				tab = 1;
			} else if ( ("ST007").equals(saleTp)) {
				tab = 2;
			}
		}    
		
		array.add(0, mainc);
		array.add(1, tab);
		
		return array;
		
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
			case 1:{ // ����List
				title_img = "title_ob_list.jpg";
				list_url = "./totalList";
			} break;			
			case 2:{ // ��������List
				title_img = "title_comm_ob_list.jpg";
				list_url = "./commObList";
			} break;		
			case 3:{ // Ȱ������List
				title_img = "title_ob_active.jpg";
				list_url = null;
			} break;	
			case 4:{ // ��������List
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
	/*
	@RequestMapping(value= "/viewObApt.do", method=RequestMethod.GET)
	public ModelAndView newViewObAptView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/listpage/viewObApt");
		 return mv;
	}	
	
	@RequestMapping(value="/viewObApt.do",method = RequestMethod.GET)
	public String goViewObAptView(@RequestParam Map<String,Object> map, Model model){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = objectService.selectObjectInfo(map);
			model.addAllAttributes(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//ModelAndView mv = new ModelAndView();
		return "/listpage/viewObApt";
	
	}

	@RequestMapping(value= "/viewObHrapt.do", method=RequestMethod.GET)
	public String newViewObHraptView(@RequestParam Map<String,Object> map, Model model)  {  
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = objectService.selectObjectInfo(map);
			model.addAllAttributes(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/listpage/viewObHrapt";
	}	

	@RequestMapping(value="/viewObOffice.do",method = RequestMethod.GET)
	public String goViewObOfficeView(@RequestParam Map<String,Object> map, Model model){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = objectService.selectObjectInfo(map);
			model.addAllAttributes(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/listpage/viewObOffice";	
	}
	
	@RequestMapping(value="/viewObOps.do",method = RequestMethod.GET)
	public String goViewObOpsView(@RequestParam Map<String,Object> map, Model model){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = objectService.selectObjectInfo(map);
			model.addAllAttributes(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/listpage/viewObOps";	
	}

	@RequestMapping(value="/viewObStore.do",method = RequestMethod.GET)
	public String goViewObStoreView(@RequestParam Map<String,Object> map, Model model){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = objectService.selectObjectInfo(map);
			model.addAllAttributes(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/listpage/viewObStore";	
	}

	@RequestMapping(value="/viewObTicket.do",method = RequestMethod.GET)
	public String goViewObTicketView(@RequestParam Map<String,Object> map, Model model){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = objectService.selectObjectInfo(map);
			model.addAllAttributes(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/listpage/viewObTicket";	
	}*/
	
	@RequestMapping(value= "/viewResClCardView.do", method=RequestMethod.GET)
	public ModelAndView viewResClCard(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/card/viewResClCard");
		 return mv;
	}
	
	@RequestMapping(value= "/viewActClCardView.do", method=RequestMethod.GET)
	public ModelAndView viewActClCard(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/card/editActClCard");
		 return mv;
	}
	
	
}
