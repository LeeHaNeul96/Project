package com.coffeemaster.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.coffeemaster.menu.mapper.MenuMapper;
import com.coffeemaster.menu.vo.MenuPropertyVO;
import com.coffeemaster.menu.vo.MenuVO;

@Service
public class MenuService {
	
	@Autowired
	private MenuMapper mapper;
	
	public List<MenuVO> menuList() {
		System.out.println("menuService - 실행");
		return mapper.menuList();
	}
	
	public MenuVO menu(Long menuNo) {
		return mapper.menu(menuNo);
		
	}
	
	public List<MenuPropertyVO> menuTem(Long menuNo) {
		return mapper.menuTem(menuNo);
	}
	
	public List<MenuPropertyVO> menuBean(Long menuNo) {
		return mapper.menuBean(menuNo);
	}
	
	public List<MenuPropertyVO> menuSize(Long menuNo) {
		return mapper.menuSize(menuNo);
	}

	public List<MenuPropertyVO> menuImage(Long menuNo) {
		// TODO Auto-generated method stub
		return mapper.menuImage(menuNo);
	}

}
