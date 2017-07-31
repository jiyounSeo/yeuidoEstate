package com.yeouido.estate.member.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yeouido.estate.member.service.MemberService;

@Service("memberService")
public class MemberServiceImpl  implements MemberService
{
   @Resource(name = "memberDAO")
   private MemberDAO memberDAO;
   public int insertMemberList(Map map) throws Exception {
	   return memberDAO.insertMember(map);
   }
   
   public List<Object> selectMemberList(Map map) throws Exception {
	   List<Object> list = memberDAO.selectMemberList(map);
	   return list;
   }
}