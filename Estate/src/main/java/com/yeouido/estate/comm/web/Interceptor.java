package com.yeouido.estate.comm.web;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class Interceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
            //admin�̶�� ����key�� ���� ������ ���ϰ�� �α����������� �̵�
        	HttpSession session = request.getSession();
        	
            if(session == null || session.getAttribute("user") == null ){
            	response.sendRedirect("/loginInterceptor.go");
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
	}
}
