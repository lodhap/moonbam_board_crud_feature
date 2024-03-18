package com.moonbam.controller.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.moonbam.dto.MemberDTO;
import com.moonbam.dto.PostDTO;
import com.moonbam.dto.PostPageDTO;
import com.moonbam.service.BoardService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BoardController {

	@Autowired
	BoardService service;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String main() {
		return "main";
	}
	@RequestMapping(value="/boardlist", method=RequestMethod.GET)
	public String boardlist(HttpServletRequest request) {
		List<PostDTO> posts = service.getPosts();
		System.out.println(posts);
		request.setAttribute("posts", posts) ;
		return "boardList";
	}
	
	@RequestMapping(value="/post", method = RequestMethod.GET)
	public String getPost(HttpServletRequest request, String postId, HttpSession session) {
//		System.out.println("postid: " + postId);
		
		// 글 페이지 정보 가져오기
		PostPageDTO postPage= service.getPostPage(postId);
		System.out.println("포스트 페이지 데이터 : " + postPage);
		
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		//로그인 정보 있을시 로그인 유저가 좋아요 눌렀는지 여부 가져오기
		if(loginUser != null) {
			Map<String, String> map = new HashMap<String, String>();
			map.put(postId, loginUser.getUserId());
			String isLike = service.getIsLike(map);
			request.setAttribute("isLike", isLike);
		}
		
		request.setAttribute("postPage", postPage);
		return "postViewer";
	}
	
//	임시로그인세션 지급구문
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String getPost(HttpSession session) {
		session.setAttribute("loginUser", new MemberDTO("1", "123456789", "aaa1", "111111", "2222222", "male",
				"bsj", "010", "2469", "6235", "bsj4387",
				"naver.com", "2024/01/22", "1"));
		System.out.println("loginUser session get");
		return "main";
	}
	
}
