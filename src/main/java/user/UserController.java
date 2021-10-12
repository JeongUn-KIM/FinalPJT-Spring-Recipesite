package user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	@Autowired
	UserService service;
	
	@RequestMapping("/join")
	public String signupPage(){
		
		return "/join/join";
	}
	
	@RequestMapping(value = "/joinresult", method = RequestMethod.POST)
	public String signup(UserVO vo) {
		
		service.signup(vo);
		
		
		return "/join/joinresult";
	}
	
	@RequestMapping(value = "/update")
	public String update() {
		return "/join/update";
		
	}
	
	
	@RequestMapping(value = "/updateok", method = RequestMethod.POST)
	public String update(UserVO vo) {
		
		service.update(vo);
		
		
		return "/join/main";
	}
	
	@RequestMapping("/header")
	public String login() {
		return "/header";
	}
	
}

