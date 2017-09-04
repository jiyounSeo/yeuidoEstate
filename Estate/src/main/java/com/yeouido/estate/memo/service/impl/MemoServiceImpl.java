package com.yeouido.estate.memo.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.memo.service.MemoService;

@Service("memoService")
public class MemoServiceImpl  implements MemoService
{
   @Resource(name = "memoDAO")
   private MemoDAO memoDAO;

   public int insertMemo(Map map) throws Exception {
	   return memoDAO.insertMemo(map);
   }
   public int modifyMemo(Map map) throws Exception {
	   return memoDAO.modifyMemo(map);
   }
   public int deleteMemo(Map map) throws Exception {
	   return memoDAO.deleteMemo(map);
   }   
   public List<Map<String,Object>> selectMemoList(Map map) throws Exception {
	   return memoDAO.selectMemoList(map);
   }
   public Map selectMemoInfo(Map map) throws Exception {
	   return memoDAO.selectMemoInfo(map);
   }
}