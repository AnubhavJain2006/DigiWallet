package com.aspect;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
@Component
@Aspect
public class MyAspect {

	@Before("execution(* com.controller.UserController.*(..))")
	public void preProcess() {
	System.out.println("PreProcess");
	}
	@After("execution(* com.controller.UserController.*(..))")
	public void postProcess() {
		System.out.println("PostProcess");
	}
	
}
