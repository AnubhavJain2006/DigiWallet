package com.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@ControllerAdvice
public class ErrorController {
//	@RequestMapping(value="error",method = RequestMethod.GET)
	@ExceptionHandler(Exception.class)
	public String renderErrorPage() {
		System.out.println("Hello");
		return "404";
	}

}
