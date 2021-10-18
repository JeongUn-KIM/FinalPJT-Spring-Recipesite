package main;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

	@Autowired
	@Qualifier("userservice")
	UserService service;
	
	//헤더 뷰
	@RequestMapping(value = "/header", method=RequestMethod.GET)
	public String main_view() {
		return "main/header";
	}
	
	//헤더에서 로그인
	@RequestMapping(value = "/header", method=RequestMethod.POST)
	@ResponseBody
	public String header_login(String email, String pw, HttpSession session) {
		//아이디 비밀번호 일치하는지 DB 요청
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("email", email);
		map.put("pw", pw);
		UserVO vo = service.getUserOne(map);
		
		//일치하는 회원 정보가 있다면 세션에 담기
		session.setAttribute("login_info", vo);
		
		//일치하는 회원 정보가 있으면 ajax 데이터 값 true
		if(vo == null) {
			return "false";
		}
		else {
			return "true";
		}
	}
	//로그아웃(세션 제거하기)
	@RequestMapping("/logout")
	@ResponseBody
	public void header_logout(HttpSession session) {
		session.removeAttribute("login_info");
	}
	
	
}
