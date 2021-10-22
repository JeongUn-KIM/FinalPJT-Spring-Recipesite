package main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {

	//메인 뷰
	@RequestMapping(value = "/main", method=RequestMethod.GET)
	public String main_view() {
		return "main/main";
	}
	
}
