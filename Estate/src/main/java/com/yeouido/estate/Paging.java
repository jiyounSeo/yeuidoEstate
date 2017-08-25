package com.yeouido.estate;

import java.util.HashMap;
import java.util.Map;

public class Paging {

	public Map<String, Object> pagingMethod(int currentPage, int totalCount, int pagePerRow, int pageSize){
		Map<String, Object> map = new HashMap<String, Object>();
      // int pageSize = 10; 
        int beginRow = (currentPage-1)*pagePerRow; //페이지의 처음 시작 index
        
        //한싸이클의 시작페이지번호     
        int startPage =((currentPage-1)/pageSize)*pageSize+1; 
        //한싸이클의 마지막페이지번호
        int endPage = startPage + pageSize -1;
        //총 페이지숫자의 마지막번호
        int lastPage = totalCount/pagePerRow;
        if(totalCount%pagePerRow!=0){
            lastPage++;
        }
        if(endPage > lastPage){
            endPage = lastPage;
        }
        
        map.put("beginRow", beginRow);
        map.put("pagePerRow", pagePerRow);
        map.put("startPage", startPage);
        map.put("pageSize", pageSize);
        map.put("endPage", endPage);
        map.put("lastPage", lastPage);
	
		return map;
	}


}
