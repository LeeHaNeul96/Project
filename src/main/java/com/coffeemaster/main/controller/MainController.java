package com.coffeemaster.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.POST;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffeemaster.cart.service.CartService;
import com.coffeemaster.main.service.LoginService;
import com.coffeemaster.main.vo.LoginVO;
import com.coffeemaster.menu.service.MenuService;
import com.coffeemaster.menu.vo.MenuPropertyVO;
import com.coffeemaster.menu.vo.MenuVO;

import lombok.Data;

@Controller
@RequestMapping("/main")
@Data
public class MainController {
	
	@Autowired
	private LoginService loginService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private CartService cartService;
	
	@GetMapping("/loginPage")
	public String loginPage(Model model) {
		System.out.println("LoginPage - 실행");
		
		
		return "loginPage";
	}
	
	@PostMapping("/login")
	public String login(LoginVO vo , HttpSession session) {
		System.out.println("main - 실행 vo = " + vo);
		LoginVO loginVO = loginService.login(vo);
		
//		아이디 패스워드 확인 
		if(loginVO ==null) {
			session.setAttribute("loginFail", "loginFail");
			return "redirect:/main/loginPage";
		}
		session.removeAttribute("loginFail");
		session.setAttribute("login", loginVO);
		
		return "redirect:/main/main";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("LogOut -  실행");
		session.removeAttribute("login");
		return "loginPage";
	}

	@GetMapping("/main")
	public String main(HttpSession session, Model model , LoginVO vo) {
		
		
//      메뉴불러오기
		List<MenuVO> menuVO = menuService.menuList();
		model.addAttribute("menu", menuVO);
		
//카트불러오기
		List<MenuPropertyVO> cartListVO = cartService.cartList();
		System.out.println( "카트 리스트 ---- : " + cartListVO);
		model.addAttribute("cartList", cartListVO);
		
		

		return "main";
	}
	
	

	
	@GetMapping("/menuProperty")
	@ResponseBody
	public Map<String, Object> menuProperty(Long menuNo, Model model) {
		
	    Map<String, Object> responseData = new HashMap<>();
	    
	    MenuVO menuVO = menuService.menu(menuNo);
	    responseData.put("menu", menuVO);
	    System.out.println("????????????????" + menuVO);
	    
	    
	    List<MenuPropertyVO> menuTemVO = menuService.menuTem(menuNo);
	    responseData.put("menuTem", menuTemVO);
	    System.out.println("menuTem : --------"+menuTemVO);

	    List<MenuPropertyVO>  menuBeanVO = menuService.menuBean(menuNo);
	    responseData.put("menuBean", menuBeanVO);
	    System.out.println("menuBean : --------"+menuBeanVO); 
	    
	    List<MenuPropertyVO>  menuSizeVO = menuService.menuSize(menuNo);
	    responseData.put("menuSize", menuSizeVO);
	    System.out.println("menuSize : --------"+menuSizeVO);
	    
	    List<MenuPropertyVO>  menuImageVO = menuService.menuImage(menuNo);
	    responseData.put("menuImage", menuImageVO);
	    System.out.println("menuImage : ------" + menuImageVO);

	    
	    

		
		

	    return responseData;
	}


}
