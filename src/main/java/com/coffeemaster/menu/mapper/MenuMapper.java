package com.coffeemaster.menu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.coffeemaster.menu.vo.MenuPropertyVO;
import com.coffeemaster.menu.vo.MenuVO;

@Mapper
@Repository
public interface MenuMapper {
	
	public List<MenuVO> menuList();
	
	public MenuVO menu(Long menuNo);
	
	public List<MenuPropertyVO> menuTem(Long menuNo);

	public List<MenuPropertyVO> menuBean(Long menuNo);
	
	public List<MenuPropertyVO> menuSize(Long menuNo);

	public List<MenuPropertyVO> menuImage(Long menuNo);

	
	

}
