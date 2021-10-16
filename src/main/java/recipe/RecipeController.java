package recipe;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class RecipeController {
	
	@Autowired
	@Qualifier("recipeservice")
	RecipeService service;
	
	@Autowired
	IngredientService ingredservice;
	
	//레시피 게시판 뷰
	@RequestMapping(value = "/recipelist", method=RequestMethod.GET)
	public ModelAndView recipelist(String email, String emotion, String ingred, String type, String search){
		
		List<RecipeVO> recipelist = service.getRecipeList();
		
		List<RecipeVO> recipelist_search = null;
		if(type==null) {
			recipelist_search = null;
		}
		else if(type.equals("recipe_title")) {
			recipelist_search = service.SearchTitle(search);
		}
		else if(type.equals("recipe_desc")) {
			recipelist_search = service.SearchDesc(search);
		}
		else if(type.equals("recipe_title or recipe_desc")) {
			recipelist_search = service.SearchTitleDesc(search);
		}

		System.out.println(recipelist_search);
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("recipelist", recipelist);
		mv.addObject("emotion", emotion);
		mv.addObject("ingred", ingred);
		mv.addObject("recipelist_search", recipelist_search);
		mv.setViewName("/recipe/recipelist");
		return mv;
	}
	@RequestMapping(value="/recipelist", method=RequestMethod.POST )
	@ResponseBody
	public List<RecipeVO> morerecipelist(int number) {
		number += 6;
		List<RecipeVO> recipelist = service.moreRecipeList(number);
		//System.out.println(recipelist);
		return recipelist;
	}
	@RequestMapping(value="/recipewrite", method=RequestMethod.GET)
	public ModelAndView recipewriteview() {
		//디비 칼럼 이름들 가져오기
		List<String> list = ingredservice.getColumn_nameList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("column_namelist",list);
		
		mv.setViewName("/recipe/recipewrite");
		return mv;
	}
	@RequestMapping(value="/recipewrite", method=RequestMethod.POST)
	public String recipewrite(int user_no, String recipe_title, String recipe_name, MultipartFile recipe_img1, MultipartFile recipe_img2 ,MultipartFile recipe_img3 ,MultipartFile recipe_img4 ,MultipartFile recipe_img5 ,MultipartFile recipe_img6 ,MultipartFile recipe_img7 ,MultipartFile recipe_img8,MultipartFile recipe_img9 ,MultipartFile recipe_img10,
			String recipe_desc, String recipe_cate, String recipe_emotion, int fork, int beef, int chicken, int bean, int apple ) throws IOException  {
		//파일명 추출
		List<String> filename = new ArrayList<String>();
		//서버 c:/kdigital2/upload 폴더에 사진 저장
		String savePath = "c:/kdigital2/upload/";
		List<String> ext = new ArrayList<String>();
		List<File> file = new ArrayList<File>();
		List<MultipartFile> recipe_imgs = new ArrayList<MultipartFile>();
		
		if(!recipe_img1.isEmpty()) {
			recipe_imgs.add(recipe_img1);
		}
		if(!recipe_img2.isEmpty()) {
			recipe_imgs.add(recipe_img2);
		}
		if(!recipe_img3.isEmpty()) {
			recipe_imgs.add(recipe_img3);
		}
		if(!recipe_img4.isEmpty()) {
			recipe_imgs.add(recipe_img4);
		}
		if(!recipe_img5.isEmpty()) {
			recipe_imgs.add(recipe_img5);
		}
		if(!recipe_img6.isEmpty()) {
			recipe_imgs.add(recipe_img6);
		}
		if(!recipe_img7.isEmpty()) {
			recipe_imgs.add(recipe_img7);
		}
		if(!recipe_img8.isEmpty()) {
			recipe_imgs.add(recipe_img8);
		}
		if(!recipe_img9.isEmpty()) {
			recipe_imgs.add(recipe_img9);
		}
		if(!recipe_img10.isEmpty()) {
			recipe_imgs.add(recipe_img10);
		}
		
		for(int i = 0 ; i < recipe_imgs.size() ; i++){
			filename.add(recipe_imgs.get(i).getOriginalFilename());
			//확장자
			System.out.println(recipe_imgs.size());
			System.out.println(filename.get(i).substring(filename.get(i).lastIndexOf(".")));
			ext.add(filename.get(i).substring(filename.get(i).lastIndexOf(".")));
			//파일명
			filename.set(i, filename.get(i).substring(0, filename.get(i).lastIndexOf("."))+getUuid()+ext.get(i));
			//파일 저장
			file.add(new File(savePath + filename.get(i)));
			//저장
			recipe_imgs.get(i).transferTo(file.get(i));
		}
		
		//레시피 내용 db저장 현재 recipe_no 시퀀스 없음
		RecipeVO recipeVO = new RecipeVO();
		recipeVO.setRecipe_no(1);
		//세션으로 유저넘버 받기 user_no
		recipeVO.setUser_no(user_no);
		recipeVO.setRecipe_title(recipe_title);
		recipeVO.setRecipe_name(recipe_name);
		recipeVO.setRecipe_emotion(recipe_emotion);
		recipeVO.setRecipe_desc(recipe_desc);

		if(!recipe_img1.isEmpty()) {
			recipeVO.setRecipe_img1(filename.get(0));
		}
		if(!recipe_img2.isEmpty()) {
			recipeVO.setRecipe_img1(filename.get(1));
		}
		if(!recipe_img3.isEmpty()) {
			recipeVO.setRecipe_img1(filename.get(2));
		}
		if(!recipe_img4.isEmpty()) {
			recipeVO.setRecipe_img1(filename.get(3));
		}
		if(!recipe_img5.isEmpty()) {
			recipeVO.setRecipe_img1(filename.get(4));
		}
		if(!recipe_img6.isEmpty()) {
			recipeVO.setRecipe_img1(filename.get(5));
		}
		if(!recipe_img7.isEmpty()) {
			recipeVO.setRecipe_img1(filename.get(6));
		}
		if(!recipe_img8.isEmpty()) {
			recipeVO.setRecipe_img1(filename.get(7));
		}
		if(!recipe_img9.isEmpty()) {
			recipeVO.setRecipe_img1(filename.get(8));
		}
		if(!recipe_img10.isEmpty()) {
			recipeVO.setRecipe_img1(filename.get(9));
		}
		recipeVO.setRecipe_cate(recipe_cate);
		service.addRecipe(recipeVO);
		
		//재료 내용 db 저장 현재 recipe_no 시퀀스 없음
		IngredientVO ingredVO = new IngredientVO();
		ingredVO.setRecipe_no(1);
		ingredVO.setUser_no(user_no);
		ingredVO.setFork(fork);
		ingredVO.setBeef(beef);
		ingredVO.setChicken(chicken);
		ingredVO.setBean(bean);
		ingredVO.setApple(apple);
		ingredservice.addIngredient(ingredVO);

		return "redirect:recipelist";
	}
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);
	}
}