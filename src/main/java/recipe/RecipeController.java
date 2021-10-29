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
	RecipeDescService descservice;
	@Autowired
	RecipeImgService imgservice;
	
	//레시피 게시판 뷰
	@RequestMapping(value = "/recipelist", method=RequestMethod.GET)
	public ModelAndView recipelist(String email, String emotion, String ingred, String type, String search){
		
		List<RecipeVO> recipelist = service.getRecipeList();
		
		//@@@@@@@@@@@@@@@@@@@@@@@검색 부분 동호님 여기부터
		List<RecipeVO> recipelist_search = new ArrayList<RecipeVO>();
		
		if(type==null) {
			recipelist_search = null;
		}
		else if(type.equals("recipe_title")) {
			recipelist_search = service.SearchTitle(search);
		}
		else if(type.equals("recipe_desc")) {
			List<Integer> recipe_no = descservice.SearchDesc(search);
			for(int i = 0 ; i < recipe_no.size() ; i++) {
				recipelist_search.add(service.getRecipeDetail(recipe_no.get(i)));				
			}
		}
		else if(type.equals("recipe_name")) {
			recipelist_search = service.SearchName(search);
		}
		else if(type.equals("recipe_ingredient")) {
			recipelist_search = service.SearchIngredient(search);
		}
		else if(type.equals("recipe_nation")) {
			recipelist_search = service.SearchNation(search);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("recipelist_search", recipelist_search);
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@여기까지 가져가여
		mv.addObject("recipelist", recipelist);
		mv.addObject("emotion", emotion);
		mv.addObject("ingred", ingred);
		mv.setViewName("/recipe/recipelist");
		return mv;
	}
	//레시피 게시판에서 더보기 버튼, 찜하기 버튼 구현
	@RequestMapping(value="/recipelist", method=RequestMethod.POST )
	@ResponseBody
	public List<RecipeVO> morerecipelist(int number) {
		number += 6;
		List<RecipeVO> recipelist = service.moreRecipeList(number);
		//System.out.println(recipelist);
		return recipelist;
	}
	
	//레시피 글쓰기 뷰
	@RequestMapping(value="/recipewrite", method=RequestMethod.GET)
	public String recipewriteview() {
		return "/recipe/recipewrite";
	}
	//레시피 글 내용 저장
	@RequestMapping(value="/recipewrite", method=RequestMethod.POST)
	public String recipewrite(int user_no, String recipe_title, String recipe_name, MultipartFile[] recipe_img,
			String recipe_desc, String recipe_cate, String recipe_emotion, String ingredient, String recipe_nation ) throws IOException  {

		//파일명 추출
		List<String> filename = new ArrayList<String>();
		//서버 c:/kdigital2/upload 폴더에 사진 저장
		String savePath = "c:/kdigital2/upload/";
		List<String> ext = new ArrayList<String>();
		List<File> file = new ArrayList<File>();
		
		for(int i=0 ; i < recipe_img.length ; i++) {
			if(!recipe_img[i].isEmpty()) {
				filename.add(recipe_img[i].getOriginalFilename());
				//확장자
				ext.add(filename.get(i).substring(filename.get(i).lastIndexOf(".")));
				//파일명
				filename.set(i, filename.get(i).substring(0, filename.get(i).lastIndexOf("."))+getUuid()+ext.get(i));
				//파일 저장
				file.add(new File(savePath + filename.get(i)));
				//저장
				recipe_img[i].transferTo(file.get(i));
			}
		}
		
		//레시피 내용 db저장
		RecipeVO recipeVO = new RecipeVO();
		RecipeDescVO descVO = new RecipeDescVO();
		RecipeImgVO imgVO = new RecipeImgVO();
		//레시피 번호 저장 현재 recipe_no 시퀀스 없음
		recipeVO.setRecipe_no(1);
		imgVO.setRecipe_no(1);
		descVO.setRecipe_no(1);
		//세션으로 유저넘버 받기 user_no
		recipeVO.setUser_no(user_no);
		recipeVO.setRecipe_title(recipe_title);
		recipeVO.setRecipe_name(recipe_name);
		recipeVO.setRecipe_emotion(recipe_emotion);
		
		//name=recipe_desc가 11개 있어서 분리
		String[] desc = recipe_desc.split(",");
		
		//음식 설명 vo에 저장
		descVO.setRecipe_desc(desc[0]);
		//재료, 카테고리, 음식종류 vo저장 현재 recipe_no 시퀀스 없음
		recipeVO.setRecipe_ingredient(ingredient);
		recipeVO.setRecipe_cate(recipe_cate);
		recipeVO.setRecipe_nation(recipe_nation);
		
		//레시피 사진, 레시피 내용 10개 저장
		if(!recipe_img[0].isEmpty() && !desc[1].isEmpty()) {
			//대표사진 저장
			recipeVO.setRecipe_img1(filename.get(0));
			imgVO.setRecipe_img1(filename.get(0));
			descVO.setRecipe_desc1(desc[1]);
		}
		if(!recipe_img[1].isEmpty() && !desc[2].isEmpty()) {
			imgVO.setRecipe_img2(filename.get(1));
			descVO.setRecipe_desc2(desc[2]);
		}
		if(!recipe_img[2].isEmpty() && !desc[3].isEmpty()) {
			imgVO.setRecipe_img3(filename.get(2));
			descVO.setRecipe_desc3(desc[3]);
		}
		if(!recipe_img[3].isEmpty() && !desc[4].isEmpty()) {
			imgVO.setRecipe_img4(filename.get(3));
			descVO.setRecipe_desc4(desc[4]);
		}
		if(!recipe_img[4].isEmpty() && !desc[5].isEmpty()) {
			imgVO.setRecipe_img5(filename.get(4));
			descVO.setRecipe_desc5(desc[5]);
		}
		if(!recipe_img[5].isEmpty() && !desc[6].isEmpty()) {
			imgVO.setRecipe_img6(filename.get(5));
			descVO.setRecipe_desc6(desc[6]);
		}
		if(!recipe_img[6].isEmpty() && !desc[7].isEmpty()) {
			imgVO.setRecipe_img7(filename.get(6));
			descVO.setRecipe_desc7(desc[7]);
		}
		if(!recipe_img[7].isEmpty() && !desc[8].isEmpty()) {
			imgVO.setRecipe_img8(filename.get(7));
			descVO.setRecipe_desc8(desc[8]);
		}
		if(!recipe_img[8].isEmpty() && !desc[9].isEmpty()) {
			imgVO.setRecipe_img9(filename.get(8));
			descVO.setRecipe_desc9(desc[9]);
		}
		if(!recipe_img[9].isEmpty() && !desc[10].isEmpty()) {
			imgVO.setRecipe_img10(filename.get(9));
			descVO.setRecipe_desc10(desc[10]);
		}
		service.addRecipe(recipeVO);
		descservice.addDesc(descVO);
		imgservice.addImg(imgVO);
		return "redirect:recipelist";
	}
	@RequestMapping("/recipedetail")
	public ModelAndView recipedetailview(int no) {
		RecipeImgVO img = imgservice.getImgOne(no);
		RecipeDescVO desc= descservice.getDescOne(no);
		RecipeVO recipe= service.getRecipeDetail(no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("img", img);
		mv.addObject("desc", desc);
		mv.addObject("recipe", recipe);
		mv.setViewName("/recipe/recipedetail");
		return mv;
	}
	@RequestMapping("/recipedelete")
	public String recipedelete(int recipe_no) {
		service.deleteRecipe(recipe_no);
		descservice.deleteDesc(recipe_no);
		imgservice.deleteImg(recipe_no);
		return "/recipelist";
	}
	@RequestMapping(value="/recipemodify", method=RequestMethod.GET )
	public ModelAndView recipemodifyview(int recipe_no) {
		RecipeImgVO img = imgservice.getImgOne(recipe_no);
		RecipeDescVO desc= descservice.getDescOne(recipe_no);
		RecipeVO recipe= service.getRecipeDetail(recipe_no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("img", img);
		mv.addObject("desc", desc);
		mv.addObject("recipe", recipe);
		mv.setViewName("/recipe/recipemodify");
		return mv;
	}
	@RequestMapping(value="/recipemodify", method=RequestMethod.POST )
	public String recipemodify(int user_no, int recipe_no, String recipe_title, String recipe_name, MultipartFile[] recipe_img,
			String recipe_desc, String recipe_cate, String recipe_emotion, String ingredient, String recipe_nation ) throws IOException  {

		//파일명 추출
		List<String> filename = new ArrayList<String>();
		//서버 c:/kdigital2/upload 폴더에 사진 저장
		String savePath = "c:/kdigital2/upload/";
		List<String> ext = new ArrayList<String>();
		List<File> file = new ArrayList<File>();
		
		for(int i=0 ; i < recipe_img.length ; i++) {
			if(!recipe_img[i].isEmpty()) {
				filename.add(recipe_img[i].getOriginalFilename());
				//확장자
				ext.add(filename.get(i).substring(filename.get(i).lastIndexOf(".")));
				//파일명
				filename.set(i, filename.get(i).substring(0, filename.get(i).lastIndexOf("."))+getUuid()+ext.get(i));
				//파일 저장
				file.add(new File(savePath + filename.get(i)));
				//저장
				recipe_img[i].transferTo(file.get(i));
			}
		}
		
		//레시피 내용 db저장
		RecipeVO recipeVO = new RecipeVO();
		RecipeDescVO descVO = new RecipeDescVO();
		RecipeImgVO imgVO = new RecipeImgVO();
		//레시피 번호 저장 현재 recipe_no 시퀀스 없음
		recipeVO.setRecipe_no(1);
		imgVO.setRecipe_no(1);
		descVO.setRecipe_no(1);
		//세션으로 유저넘버 받기 user_no
		recipeVO.setUser_no(user_no);
		recipeVO.setRecipe_title(recipe_title);
		recipeVO.setRecipe_name(recipe_name);
		recipeVO.setRecipe_emotion(recipe_emotion);
		
		//name=recipe_desc가 11개 있어서 분리
		String[] desc = recipe_desc.split(",");
		
		//음식 설명 vo에 저장
		descVO.setRecipe_desc(desc[0]);
		//재료, 카테고리, 음식종류 vo저장 현재 recipe_no 시퀀스 없음
		recipeVO.setRecipe_ingredient(ingredient);
		recipeVO.setRecipe_cate(recipe_cate);
		recipeVO.setRecipe_nation(recipe_nation);
		
		//레시피 사진, 레시피 내용 10개 저장
		if(!recipe_img[0].isEmpty() && !desc[1].isEmpty()) {
			//대표사진 저장
			recipeVO.setRecipe_img1(filename.get(0));
			imgVO.setRecipe_img1(filename.get(0));
			descVO.setRecipe_desc1(desc[1]);
		}
		if(!recipe_img[1].isEmpty() && !desc[2].isEmpty()) {
			imgVO.setRecipe_img2(filename.get(1));
			descVO.setRecipe_desc2(desc[2]);
		}
		if(!recipe_img[2].isEmpty() && !desc[3].isEmpty()) {
			imgVO.setRecipe_img3(filename.get(2));
			descVO.setRecipe_desc3(desc[3]);
		}
		if(!recipe_img[3].isEmpty() && !desc[4].isEmpty()) {
			imgVO.setRecipe_img4(filename.get(3));
			descVO.setRecipe_desc4(desc[4]);
		}
		if(!recipe_img[4].isEmpty() && !desc[5].isEmpty()) {
			imgVO.setRecipe_img5(filename.get(4));
			descVO.setRecipe_desc5(desc[5]);
		}
		if(!recipe_img[5].isEmpty() && !desc[6].isEmpty()) {
			imgVO.setRecipe_img6(filename.get(5));
			descVO.setRecipe_desc6(desc[6]);
		}
		if(!recipe_img[6].isEmpty() && !desc[7].isEmpty()) {
			imgVO.setRecipe_img7(filename.get(6));
			descVO.setRecipe_desc7(desc[7]);
		}
		if(!recipe_img[7].isEmpty() && !desc[8].isEmpty()) {
			imgVO.setRecipe_img8(filename.get(7));
			descVO.setRecipe_desc8(desc[8]);
		}
		if(!recipe_img[8].isEmpty() && !desc[9].isEmpty()) {
			imgVO.setRecipe_img9(filename.get(8));
			descVO.setRecipe_desc9(desc[9]);
		}
		if(!recipe_img[9].isEmpty() && !desc[10].isEmpty()) {
			imgVO.setRecipe_img10(filename.get(9));
			descVO.setRecipe_desc10(desc[10]);
		}
		service.addRecipe(recipeVO);
		descservice.addDesc(descVO);
		imgservice.addImg(imgVO);
		return "/recipe/recipemodify";
	}
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);
	}
}