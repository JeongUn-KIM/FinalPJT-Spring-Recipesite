package mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.AdminService;


@Controller
public class MypageController {
	
	@Autowired
	MypageService mypage;
	
	@RequestMapping("/myzzimrecipelist")
	public ModelAndView myzzimrecipeList(HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.setAttribute("user_no", 1);
		
		
		ModelAndView mv = new ModelAndView();
		int user_no = (Integer)session.getAttribute("user_no");
		List<MyrecipeVO> myzzimrecipelist = mypage.getMyZzimRecipeList(user_no);
		
		mv.addObject("myzzimrecipelist", myzzimrecipelist);
		mv.setViewName("/mypage/myzzimrecipelist");
		
		return mv;
	}
	
	@RequestMapping(value ="/myzzimdesc", method=RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public List<MyrecipeVO> myzzimdesc(String recipe_desc, HttpServletRequest request) {
		
		List<MyrecipeVO> myzzimdesc;
		
		HttpSession session = request.getSession();
		int user_no = (Integer)session.getAttribute("user_no");
		
		if(recipe_desc.equals("전체")) {
			myzzimdesc = mypage.getMyZzimRecipeList(user_no);
		}else {
			myzzimdesc = mypage.getMyZzimRecipeListDesc(user_no, recipe_desc);
		}

		return myzzimdesc;
	}
	
	@RequestMapping("/myzzimdelete")
	public String userdelete(int recipe_no, HttpServletRequest request) {
		

		HttpSession session = request.getSession();
		int user_no = (Integer)session.getAttribute("user_no");
		
		mypage.deleteZzimRecipeOne(recipe_no, user_no);
		
		return "redirect:myzzimrecipelist";
	}
	
	@RequestMapping("/myrecipelist")
	public ModelAndView myrecipeList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.setAttribute("user_no", 1);
		
		ModelAndView mv = new ModelAndView();
		int user_no = (Integer)session.getAttribute("user_no");
		List<MyrecipeVO> myrecipelist = mypage.getMyRecipeList(user_no);
		
		mv.addObject("myrecipelist", myrecipelist);
		mv.setViewName("/mypage/myrecipelist");
		
		return mv;
	}
	
	@RequestMapping(value ="/myrecipedesc", method=RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public List<MyrecipeVO> myreceipedesc(String recipe_desc, HttpServletRequest request) {
		
		List<MyrecipeVO> myrecipedesc;
		
		HttpSession session = request.getSession();
		int user_no = (Integer)session.getAttribute("user_no");
		
		if(recipe_desc.equals("전체")) {
			myrecipedesc = mypage.getMyRecipeList(user_no);
		}else {
			myrecipedesc = mypage.getMyRecipeListDesc(user_no, recipe_desc);
		}

		return myrecipedesc;
	}
	
	
	
	
}
