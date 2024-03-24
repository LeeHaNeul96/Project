package com.coffeemaster.main.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.coffeemaster.main.vo.LoginVO;

@Mapper
@Repository
public interface LoginMapper {
	
	public LoginVO Login(LoginVO vo);
	

}
