package com.coffeemaster.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coffeemaster.main.mapper.LoginMapper;
import com.coffeemaster.main.vo.LoginVO;

@Service
public class LoginService { 
	
	@Autowired
	private LoginMapper mapper;
	
	public LoginVO login(LoginVO vo) {
		System.out.println("LoginService - 실행");
		System.out.println(vo);
		
		return mapper.Login(vo);
	}
	

}
