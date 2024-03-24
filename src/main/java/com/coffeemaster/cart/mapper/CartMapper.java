package com.coffeemaster.cart.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.coffeemaster.menu.vo.MenuPropertyVO;



@Mapper
@Repository
public interface CartMapper {
	
	public List<MenuPropertyVO> cartList();

	public Integer cartInsert(MenuPropertyVO vo);

	public Integer cartReset();
	
	public Integer cartQuantityMinus(Long cartNo);

	public Integer cartQuantityPlus(Long cartNo);

	public Integer cartDelete(Long cartNo);

}
