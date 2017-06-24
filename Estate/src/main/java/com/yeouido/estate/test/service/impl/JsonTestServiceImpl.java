package com.yeouido.estate.test.service.impl;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.test.service.JsonTestService;

@Service("jsonTestService")
public class JsonTestServiceImpl  implements JsonTestService
{
   @Resource(name = "jsonTestDAO")
   private JsonTestDAO jsonTestDAO;

   public ArrayList<Map<String,Object>> testList() throws Exception {
	   ArrayList<Map<String,Object>> list = jsonTestDAO.selectBoardList();
	   return list;
   }
}