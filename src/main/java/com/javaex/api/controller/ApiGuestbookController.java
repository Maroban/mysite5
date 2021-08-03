package com.javaex.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.GuestService;
import com.javaex.vo.GuestbookVo;

@Controller
public class ApiGuestbookController {

  // 필드
  @Autowired
  private GuestService guestService;

  // 생성자

  // 메소드 - GS

  // 메소드 - 일반

  /*** ajax 리스트 가져오기 ***/
  @ResponseBody // 자바 객체를 HTTP 응답 본문의 객체로 변환하여 클라이언트로 전송시키는 역할
  @RequestMapping(value = "/api/guestbook/list", method = {RequestMethod.GET, RequestMethod.POST})
  public List<GuestbookVo> list() {
    System.out.println("[현재 위치: ApiGuestController.List]");

    List<GuestbookVo> guestbookList = guestService.getGuestbookList();

    return guestbookList;
  }

  /*** ajax 방명록 write ***/
  @ResponseBody
  @RequestMapping(value = "/api/guestbook/write", method = {RequestMethod.GET, RequestMethod.POST})
  public GuestbookVo write(@ModelAttribute GuestbookVo guestbookVo) {
    System.out.println("[현재 위치: ApiGuestController.write]");

    return guestService.insertKey(guestbookVo);
  }



}
