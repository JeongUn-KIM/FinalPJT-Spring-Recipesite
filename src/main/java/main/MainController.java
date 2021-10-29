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
	
	/* 메인 키워드 검색 */
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
	
	/*
	@RequestMapping(value="/recipemodify", method=RequestMethod.GET )
	public ModelAndView recipemodifyview(int recipe_no, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		RecipeImgVO img = imgservice.getImgOne(recipe_no);
		RecipeDescVO desc= descservice.getDescOne(recipe_no);
		RecipeVO recipe= service.getRecipeDetail(recipe_no);
		
		//아이디 정보가 없으면 진입 불가
		UserVO vo = (UserVO)session.getAttribute("login_info");
		if(vo==null) {
			mv.setViewName("/recipe/usererror");
			return mv;
		}
		int user_no = vo.getUser_no();
		//아이디 정보가 있지만 관리자가 아니거나 다른 아이디확인 true면 수정페이지 진입 가능 false면 에러페이지로 이동
		if(user_no==1 || user_no==recipe.getUser_no()) {
		mv.addObject("img", img);
		mv.addObject("desc", desc);
		mv.addObject("recipe", recipe);
		mv.setViewName("/recipe/recipemodify");
		return mv;
		}
		mv.setViewName("/recipe/usernoerror");
		return mv;
	}
	*/

	
}
