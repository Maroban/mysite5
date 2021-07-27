package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	/*** 유저 정보 조회(Login) ***/
	public UserVo getUser(UserVo userVo) {

		return userDao.selectUser(userVo);
	}

	/*** 회원가입 ***/
	public void insert(UserVo userVo) {

		userDao.insert(userVo);
	}

	/*** 회원 정보 수정 ***/
	public void modify(UserVo userVo) {

		userDao.modify(userVo);
	}

}
