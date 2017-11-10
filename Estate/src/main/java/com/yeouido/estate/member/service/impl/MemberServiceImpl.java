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
   @Override
   public List<Map<String,Object>> selectMemberList(Map map) throws Exception {
	   List<Map<String,Object>> list = memberDAO.selectMemberList(map);
	   return list;
   }

	@Override
	public Map selectOneMember(Map map) throws Exception {
		return memberDAO.selectOneMember(map);
	}
	
	@Override
	public List selectEstate(Map map) throws Exception {
		return memberDAO.selectEstate(map);
	}
	@Override
	public int updateMemberAccept(Map map) throws Exception {
		return memberDAO.updateMemberAccept(map);
	}
	@Override
	public int updateMemberTp(Map map) throws Exception {
		return memberDAO.updateMemberTp(map);
	}
	@Override
	public int deleteMember(Map map) throws Exception {
		return memberDAO.deleteMember(map);
	}
	
	@Override
	public int updateMemberInfo(Map map) throws Exception {
		return memberDAO.updateMemberInfo(map);
	}
	
	@Override
	public Map selectMemberInfo(Map map)throws Exception {
		return memberDAO.selectMemberInfo(map);
	}
		
}