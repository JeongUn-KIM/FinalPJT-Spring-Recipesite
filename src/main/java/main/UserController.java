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
	
	
	//회원가입 사이트
	@RequestMapping("/join")
	public String joinPage(){
		
		return "/join/join";
	}
	
	
	//회원가입 과정 및 결과사이트
	@RequestMapping(value = "/joinresult", method = RequestMethod.POST)
	public String insertUser(UserVO vo) {
		
		service.insertUser(vo);
		
		
		return "/join/joinresult";
	}
	
	//회원탈퇴 사이트
	@RequestMapping("/delete")
	public String deletePage() {
		return "/delete/delete";
	}
	
	
	//회원탈퇴 과정 및 결과 사이트
	@RequestMapping("/deleteresult")
	public String deleteUser(String user_email, String user_pw) {
		service.deleteUser(user_email, user_pw);
		return "/delete/deleteresult";
	}
	
	
}
