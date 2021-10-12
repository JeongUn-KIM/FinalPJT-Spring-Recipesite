package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@Autowired
	AdminService admin;
	
	@RequestMapping("/admin")
	public ModelAndView adminMain() {
		
		ModelAndView mv = new ModelAndView();
		
		List<AdminVO> userlist = admin.getUserList();
		
		mv.addObject("userlist", userlist);
		mv.setViewName("/admin/admin");
		
		return mv;
	}
	
	@RequestMapping("/userdelete")
	public String userdelete(int user_no) {
		
		admin.deleteInfo(user_no);
		
		return "redirect:admin";
	}
	
	@RequestMapping(value ="/usermodify", method=RequestMethod.GET)
	public String usermodify(AdminVO vo) {
		System.out.println(vo.user_phone);
		admin.modifyInfo(vo);
		
		return "redirect:admin";
	}
	
}
