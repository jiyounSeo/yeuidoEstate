package com.yeouido.estate;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;

public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);
/*	
	@Autowired
	private SqlSessionTemplate sqlSession;
	 public void setSqlSession(SqlSession sqlSession) {
		    this.sqlSession = (SqlSessionTemplate) sqlSession;
		  }*/
	 private SqlSession sqlSession;
	 
	 @Resource(name="sqlSession")
	 public void setSqlSession(SqlSession sqlSession){
		 this.sqlSession = sqlSession;
	 }
	  
	protected void printQueryMap(Map queryId) {
		if(log.isDebugEnabled()){
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}
	
	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()){
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}
	/*
	public Object insert(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}*/
	public int insert(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	
	public int update(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	
	public int delete(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}
	
	public Object selectOne(String queryId){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}
	
	public int selectOne(String queryId, Object params){
		printQueryId(queryId);
		int result = sqlSession.selectOne(queryId, params);
		return result;
	}
	
	public Map selectMap(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId){
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
}
