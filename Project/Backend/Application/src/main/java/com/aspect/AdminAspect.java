//package com.aspect;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Before;
//import org.springframework.stereotype.Component;
//
//import com.bean.UserBean;
//
//@Aspect
//@Component
//public class AdminAspect {
//	
//	@Before("execution(* com.controller.AdminController.*(..))")
//	public void preProcess(HttpServletRequest req) {
////		HttpSession session=request.getSession(false);
//		System.out.println("Called AdminAspect");
////		UserBean user=(UserBean)session.getAttribute("user");
////		System.out.println(user.getUser_name());
//	}
//
//}
