package kr.ac.cropfit.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.cropfit.model.Member;

public class MemberInterceptor extends HandlerInterceptorAdapter {

	   @Override
	   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		   
	   HttpSession session = request.getSession();
	      
	      Member user = (Member) session.getAttribute("loginMember");

	      if(user == null) {         
		      response.setCharacterEncoding("UTF-8"); 
		      response.setContentType("text/html; charset=UTF-8");
	         	PrintWriter writer = response.getWriter();
	            writer.println("<script>alert('로그인 시 이용가능합니다'); location.href='/';</script>");
	         
	      }
	      else if(!(user.getUser_GRADE().equals("B")||user.getUser_GRADE().equals("C")||user.getUser_GRADE().equals("A")||user.getUser_GRADE().equals("C"))) {
		      response.setCharacterEncoding("UTF-8"); 
		      response.setContentType("text/html; charset=UTF-8");
	    	  PrintWriter writer = response.getWriter();  
	    	  writer.println("<script>alert('해당 메뉴를 이용할 수 없는 회원입니다.'); location.href='/';</script>");
	         response.sendRedirect("/");
	      }
	      else {
	         return true;
	      }
	      return false;
	   }
	   
	   
	   

	}
