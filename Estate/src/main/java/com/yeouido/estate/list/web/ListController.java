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
import javax.servlet.http.HttpSession;

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
	
	/* ���� + �� ����Ʈ ȭ��
	@RequestMapping(value= "/totalList.do", method=RequestMethod.GET)
	public ModelAndView totalListView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/totalList");
		 
		 return mv;
	}*/
	
	/* ���� + �� ����Ʈ ȭ��*/
	@RequestMapping(value="/totalListView.do",method = RequestMethod.GET)
	public ModelAndView goTotalList(@RequestParam Map<String,Object> map)  {  
		ModelAndView mv = new ModelAndView("/list/totalList");
		mv.addObject("pageNm", "total");
		mv.addAllObjects(map);
		
		return mv;	
	}
	
	
	/* ����(����Ʈ) ���,���� ȭ�� */
	@RequestMapping(value= "/newObApt.do", method=RequestMethod.GET)
	public ModelAndView newObAptView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObApt");
		 mv.addAllObjects(map);
		 return mv;
	}	
	/* ����(��) ���,����  ȭ�� */
	@RequestMapping(value= "/newObStore.do", method=RequestMethod.GET)
	public ModelAndView newObStoreView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObStore");
		 mv.addAllObjects(map);
		 return mv;
	}	
	/* ����(�繫��/����) ���,����  ȭ�� */
	@RequestMapping(value= "/newObOffice.do", method=RequestMethod.GET)
	public ModelAndView newObOfficeView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObOffice");
		 mv.addAllObjects(map);
		 return mv;
	}	
	/* ����(���ǽ���) ���,����  ȭ�� */
	@RequestMapping(value= "/newObOps.do", method=RequestMethod.GET)
	public ModelAndView newObOpsView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObOps");
		 mv.addAllObjects(map);
		 return mv;
	}	
	/* ����(�ֻ���) ���,����  ȭ�� */
	@RequestMapping(value= "/newObHrapt.do", method=RequestMethod.GET)
	public ModelAndView newObHraptView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObHrapt");
		 mv.addAllObjects(map);
		 return mv;
	}	
	/* ����(�о��) ���,����  ȭ�� */
	@RequestMapping(value= "/newObTicket.do", method=RequestMethod.GET)
	public ModelAndView newObTicketView(@RequestParam Map<String,Object> map)  {  
		 ModelAndView mv = new ModelAndView("/list/newObTicket");
		 mv.addAllObjects(map);
		 return mv;
	}	
	
	/* ���� ��ϰǼ� ��ȸ ȭ�� */
	@RequestMapping(value="/addObject.do",method = RequestMethod.POST)
	public ModelAndView addObject(@RequestParam Map<String,Object> map){
	    ModelAndView mv = new ModelAndView("/list/addObject");
	    mv.addAllObjects(map);
	    return mv;
	}
	
	@RequestMapping(value= "/addObject.do", method=RequestMethod.GET)
	public ModelAndView addObjectPage(@RequestParam Map<String,Object> map)  { 
		ModelAndView mv = new ModelAndView("/list/addObject");
	    mv.addAllObjects(map);
		 return mv;
	}	
	
	/* ���� ��ȸ ȭ�� */
	@RequestMapping(value="/commObListView.do",method = RequestMethod.GET)
	public ModelAndView goCommObList(@RequestParam Map<String,Object> map){
	    ModelAndView mv = new ModelAndView("/list/commObList");
	    mv.addAllObjects(map);
		return mv;	
	}
	
	/* ���� ��ȸ ȭ�� */
	@RequestMapping(value="/commObListPostView.do",method = RequestMethod.POST)
	public ModelAndView commObListPostView(@RequestParam Map<String,Object> map){
	    ModelAndView mv = new ModelAndView("/list/commObList");
	    mv.addAllObjects(map);
		return mv;	
	}
	
	/*
	 * ���� ����ȸ ȭ�� 
	 */
	@RequestMapping(value="/objtDtlView.do",method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ModelAndView objtDtlView(@RequestParam Map<String,Object> map, Model model, HttpSession session){
		Map<String, Object> result = new HashMap<String, Object>();
		model.addAttribute("activeTpChk", map.get("activeTp"));
		model.addAttribute("publicYnChk", map.get("publicYn"));
		model.addAttribute("objtTpChk",  map.get("objtTp"));
		model.addAttribute("saleTpChk", map.get("saleTp"));
		model.addAttribute("pageNm", map.get("pageNm"));
		
		ModelAndView mv = new ModelAndView("/listpage/" + map.get("viewUrl"));
		String url = map.get("viewUrl").toString();
		
		try {
			map.put("user", session.getAttribute("user"));
			result = objectService.selectObjectInfo(map);
			
			if(result == null || url.equals("")){
				String gourl = "/adminMainView.do";
				model.addAttribute("msg", "�ش� ����ī�尡 �������� �ʽ��ϴ�. �߸��� �����Դϴ�"); 
				model.addAttribute("url", gourl); 
				ModelAndView tmpMv = new ModelAndView("/comm/redirect");
				return tmpMv;
			}

			logger.error(result.get("objtNm").toString());
			
			//model.addAllAttributes(result);
			//model.addAllAttributes(map);
			
			mv.addAllObjects(map);
			mv.addAllObjects(result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//String url = "";		
		//return "/listpage/" + map.get("viewUrl");
		return mv;	
	}
	/*
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
	}*/
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
