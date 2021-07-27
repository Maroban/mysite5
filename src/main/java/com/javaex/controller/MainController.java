package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	// 필드

	// 생성자

	// 메소드 - GS

	// 메소드 - 일반

	/*** Main ***/
	@RequestMapping(value = "/main", method = { RequestMethod.GET, RequestMethod.POST })
	public String main() {

		System.out.println("[현재 위치: MainController.main]");

		return "main/index";
	}

}
