package main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import recipe.RecipeDescService;
import recipe.RecipeImgService;
import recipe.RecipeService;
import recipe.RecipeVO;


@Controller
public class MainController {
	
	@Autowired
	@Qualifier("recipeservice")
	RecipeService service;
	
	@Autowired
	RecipeDescService descservice;
	@Autowired
	RecipeImgService imgservice;
	
	//메인 뷰
	@RequestMapping(value = "/main", method=RequestMethod.GET)
	public String main_view() {
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		
		return "main/main";
	}
	@RequestMapping(value = "/find", method=RequestMethod.GET)
	public ModelAndView main_findRecipe(RecipeVO vo, String ingred) {
		System.out.println(vo.getRecipe_cate());
		System.out.println(vo.getRecipe_nation());
		System.out.println(ingred);
		System.out.println(vo.getRecipe_emotion());
		List<RecipeVO> findList = service.findRecipe(vo);
		System.out.println(findList);
		
		if(ingred.contains("땅콩")) {
			for(int i = findList.size() ; i >= 0 ; i--){
				String ingredient = findList.get(i).getRecipe_ingredient();
				if(ingredient.contains("땅콩")){
					findList.remove(i);
				}
			}
		}
		if(ingred.contains("대두")) {
			for(int i = findList.size() ; i >= 0 ; i--){
				String ingredient = findList.get(i).getRecipe_ingredient();
				if(ingredient.contains("된장") || ingredient.contains("미소") || ingredient.contains("간장")){
					findList.remove(i);
				}
			}
		}
		if(ingred.contains("유제품")) {
			for(int i = findList.size() ; i >= 0 ; i--){
				String ingredient = findList.get(i).getRecipe_ingredient();
				if(ingredient.contains("우유") || ingredient.contains("치즈") || ingredient.contains("버터")){
					findList.remove(i);
				}
			}
		}
		if(ingred.contains("갑각류조개류")) {
			for(int i = findList.size() ; i >= 0 ; i--){
				String ingredient = findList.get(i).getRecipe_ingredient();
				if(ingredient.contains("홍합") || ingredient.contains("굴") || ingredient.contains("전복") || ingredient.contains("오징어") || ingredient.contains("새우") || ingredient.contains("게") || ingredient.contains("조개")){
					findList.remove(i);
				}
			}
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("findList", findList);
		mv.setViewName("/main/main");
		return mv;
	}
}
