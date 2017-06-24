package com.yeouido.estate.test.service.impl;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("jsonTestDAO")
public class JsonTestDAO extends AbstractDAO
{
   
   @SuppressWarnings("unchecked")
   public ArrayList<Map<String, Object>> selectBoardList() throws Exception{
       return (ArrayList<Map<String, Object>>) selectList("jsonTestDAO.testList");
   }

}
