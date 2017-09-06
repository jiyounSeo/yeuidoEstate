package com.yeouido.estate.member.service;

import java.util.List;
import java.util.Map;
public interface MemberService
{
	public int insertMemberList(Map map) throws Exception;
	public List<Map<String,Object>> selectMemberList(Map map) throws Exception;
	public Map selectOneMember(Map map)throws Exception;
	public List<Object> selectEstate(Map map) throws Exception;
	public int updateMemberAccept(Map map) throws Exception;
	public int deleteMember(Map map) throws Exception;
	
}
