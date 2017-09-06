package com.yeouido.estate.member.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yeouido.estate.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO
{
  
   @SuppressWarnings("unchecked")
   public List<Map<String,Object>> selectMemberList(Map map) throws Exception{
       return selectList("memberDAO.selectMemberList", map);
   }
   
   public int insertMember(Map<String, Object> map) throws Exception{
       return insert("memberDAO.insertMember",map);
   }
   
   @SuppressWarnings("unchecked")
   public Map selectOneMember(Map map) throws Exception{
	   return selectMap("memberDAO.selectOneMember", map);
   }
   
   @SuppressWarnings("unchecked")
   public List selectEstate(Map map) throws Exception{
	   return selectList("memberDAO.selectEstate", map);
   }
   public int updateMemberAccept(Map<String, Object> map) throws Exception{
       return update("memberDAO.updateMemberAccept",map);
   }
   
   public int deleteMember(Map<String, Object> map) throws Exception{
       return delete("memberDAO.deleteMember",map);
   }

}
