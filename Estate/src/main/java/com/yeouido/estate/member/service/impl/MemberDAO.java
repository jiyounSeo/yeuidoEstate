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
   public List<Object> selectMemberList(Map map) throws Exception{
       return selectList("memberDAO.selectMemberList", map);
   }
   
   public int insertMember(Map<String, Object> map) throws Exception{
       return selectOne("memberDAO.insertMember",map);
   }

}
