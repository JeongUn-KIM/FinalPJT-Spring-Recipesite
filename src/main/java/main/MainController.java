package main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mypage.MypageService;
import mypage.MyrecipeVO;
import recipe.RecipeVO;


@Controller
public class MainController {

	@Autowired
	@Qualifier("userservice")
	UserService service;
	
	@Autowired
	@Qualifier("mypage")
	MypageService mypage;
	
	//메인 뷰
	@RequestMapping(value = "/main", method=RequestMethod.GET)
	public ModelAndView main_view() {
		
		List<MyrecipeVO> popularlist = mypage.getMainRecipePopular();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("popularlist", popularlist);
		mv.setViewName("main/main");
		
		return mv;
	}
	
	@RequestMapping(value = "/search", method=RequestMethod.GET)
	public ModelAndView search(String keyword) {
		
		List<MyrecipeVO> resultlist = mypage.getMainRecipeSearch(keyword);
		List<MyrecipeVO> popularlist = mypage.getMainRecipePopular();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("resultlist", resultlist);
		mv.addObject("keyword", keyword);
		mv.addObject("popularlist", popularlist);
		mv.setViewName("main/main");
		
		return mv;
	}

	
}
