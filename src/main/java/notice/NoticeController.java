package notice;

import java.io.File;
import java.io.IOError;
import java.io.IOException;
import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController{
	
	@Autowired
	@Qualifier("n")
	NoticeService noticeservice;
	
	// 공지사항 클릭시,
	@RequestMapping(value="/noticelist", method=RequestMethod.GET)
	public ModelAndView getNoticeList() {
		ModelAndView mv = new ModelAndView();
		List<NoticeVO> notice_list = noticeservice.getNoticeList();
		mv.addObject("notice_list", notice_list);
		mv.setViewName("/notice/noticelist");
		System.out.println(notice_list.get(0).getNotice_no());		
		return mv;
	}
	
	// 공지사항 상세보기
	@RequestMapping("/noticedetail")
	public ModelAndView getNoticeOne(String no) {
		ModelAndView mv = new ModelAndView();
		int number = Integer.parseInt(no);
		NoticeVO vo = noticeservice.getNoticeOne(number);
		noticeservice.clickNotice(number);
		mv.addObject("notice_one", vo);
		mv.setViewName("/notice/noticedetail");
		System.out.println(vo.getNotice_title());
		System.out.println("공지 자세히보기");
		return mv;
	}
	
	// 공지사항 수정 페이지 - 해당 게시물 불러오기
	@RequestMapping(value="/noticemodify", method=RequestMethod.GET)
	public ModelAndView modifyFoam(String no) {
		int number = Integer.parseInt(no);
		ModelAndView mv = new ModelAndView();
		NoticeVO vo = noticeservice.getNoticeOne(number);
		mv.addObject("modifynotice", vo);
		mv.setViewName("/notice/noticemodify");		
		return mv;
	}
	
	// 공지사항 수정 완료 ---> 상세페이지 이동
	@RequestMapping(value="/noticemodify", method=RequestMethod.POST)
	public ModelAndView modifyNotice(NoticeVO vo) {
		MultipartFile uploadfile = vo.getUploadfile();
		if(uploadfile.getOriginalFilename() != noticeservice.getNoticeOne(vo.getNotice_no()).getNotice_file()){
			
		}
		ModelAndView mv = new ModelAndView();
		String mod_no = String.valueOf(noticeservice.modifyNotice(vo));
		mv.addObject("no", mod_no);
		mv.setViewName("redirect:/noticedetail");
		System.out.println("공지 수정 완료");
		return mv;
	}
	
    // 공지사항 작성 폼
	@RequestMapping(value="/noticewrite", method=RequestMethod.GET)
	public String writeNoticeForm() {
		return "/notice/noticewrite";
	}
	
	// 공지사항 작성완료
	@RequestMapping(value="/noticewrite", method=RequestMethod.POST)
	public ModelAndView writeNotice(NoticeVO vo) throws IOException {
		if(vo.uploadfile != null) {
		// 파일 1개
		MultipartFile uploadfile = vo.getUploadfile();
		// 파일명
		String filename = uploadfile.getOriginalFilename();
		// 저장소
		String savePath = "c:/kdigital2/notice/";
		// 저장
		File file_result = new File(savePath + filename);
		uploadfile.transferTo(file_result);
		
		vo.setNotice_file(filename);
		}
		int new_notice = noticeservice.writeNoitce(vo); 
		ModelAndView mv = new ModelAndView();
		mv.addObject("no", new_notice);
		mv.setViewName("redirect:/noticedetail");
		System.out.println("공지 작성 완료");
		return mv;
	}
	
	// 공지사항 검색
	@RequestMapping(value="/noticelist", method=RequestMethod.POST)
	@ResponseBody
	public List<NoticeVO> searchNoticeList(String search) {
		List<NoticeVO> searchlist = noticeservice.searchNoticeList(search);
		System.out.println("검색");
		return searchlist;
	}
	
	@RequestMapping(value="/noticedelete", method=RequestMethod.GET)
	public ModelAndView deleteNotice(String no) {
		int number = Integer.parseInt(no);
		noticeservice.deleteNotice(number);
		System.out.println("공지 삭제 완료");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/noticelist");
		return mv;
	}
	

	
	// @ResponseBody ---> 보던 view에 데이터 전달
}
