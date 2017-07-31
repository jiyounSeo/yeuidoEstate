package com.yeouido.estate.member.service;

import java.util.List;
import java.util.Map;
public interface MemberService
{
	public int insertMemberList(Map map) throws Exception;
	public List<Object> selectMemberList(Map map) throws Exception;
}
