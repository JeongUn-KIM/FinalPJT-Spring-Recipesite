package user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class UserController {
	@Autowired
	UserService service;
	
	
	@RequestMapping("/userlist")
	//ResponseBody은 뷰로 넘어가지 않고 바로 보여줌
	//@ResponseBody
	public ModelAndView listUser() {
		List<UserVO> list = service.listUser(); // dao - sqlmapping - oracle
		ModelAndView mv = new ModelAndView();
		mv.addObject("userlist", list);
		mv.setViewName("userlist");
		
		return mv;
		
		}
	
	@RequestMapping("/join")
	public String joinPage(){
		
		return "/join/join";
	}
	
	@RequestMapping(value = "/joinresult", method = RequestMethod.POST)
	public String insertUser(UserVO vo) {
		
		service.insertUser(vo);
		
		
		return "/join/joinresult";
	}
	
	@RequestMapping("/myinform")
	public String updatePage() {
		return "/update/myinform";
		
	}
	
	@RequestMapping("/myinformresult")
	public String updateUser(UserVO vo) {
		
		service.updateUser(vo);
		
		return "/main";
	}
	
	
	@RequestMapping("/delete")
	public String deletePage() {
		return "/delete/delete";
	}
	
	@RequestMapping("/deleteresult")
	public String deleteUser(String user_email, String user_pw) {
		service.deleteUser(user_email, user_pw);
		return "/delete/deleteresult";
	}
	
	@RequestMapping("/login")
	public String loginPage() {
		
		return "/login";
		
	}
	
	@RequestMapping("/loginresult")
	public String login(UserVO vo) {
		
		
		service.login(vo);
		
		
		return "/loginresult";
	}
	
	
}

