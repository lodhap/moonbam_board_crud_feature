package com.moonbam.controller.board;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.moonbam.config.photoUtil;
import com.moonbam.dto.MemberDTO;
import com.moonbam.dto.PostDTO;
import com.moonbam.dto.PostPageDTO;
import com.moonbam.service.BoardService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class BoardController {

	@Autowired
	BoardService service;
	
	
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	//임시 로그인세션 지급
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(HttpSession session) {
		session.setAttribute("loginUser", new MemberDTO("aaa1", "123456789", "aaa1", "111111", "2222222", "male",
				"bsj", "010", "2469", "6235", "bsj4387",
				"naver.com", "2024/01/22", "1"));
		System.out.println("loginUser session get");
		return "main";
	}
	//로그인세션 제거
		@RequestMapping(value="/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			session.invalidate();
			System.out.println("session invalidate");
			return "main";
		}
	
	// 글목록 
	@RequestMapping(value="/boardlist", method=RequestMethod.GET)
	public String boardlist(HttpServletRequest request) {
		List<PostDTO> posts = service.getPosts();
		System.out.println("글목록: "+posts);
		request.setAttribute("posts", posts) ;
		return "boardList";
	}
	
	// 글보기 페이지
	@RequestMapping(value="/post", method = RequestMethod.GET)
	public String getPost(HttpServletRequest request, String postId, HttpSession session) {
		System.out.println("postid: " + postId);
		
		// 글 페이지 정보 가져오기
		PostPageDTO postPage= service.getPostPage(postId);
		System.out.println("포스트 페이지 데이터 : " + postPage);
		
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		//로그인 정보 있을시 로그인 유저가 좋아요 눌렀는지 여부 가져오기
		if(loginUser != null) {
			Map<String, String> map = new HashMap<String, String>();
			
			String userId = loginUser.getUserId();
			//System.out.println("userId: "+ userId + postId);
			map.put("postId", postId);
			map.put("userId", userId);
			String isLike = service.getIsLike(map);
			request.setAttribute("isLike", isLike);
		}
		
		request.setAttribute("postPage", postPage);
		return "postViewer";
	}
	
	@RequestMapping(value="/postEditor", method = RequestMethod.GET)
	public String postEditor() {
		return "postEditor";
	}
	
	@RequestMapping(value="/post", method = RequestMethod.POST)
    public String postPost(PostDTO post, HttpSession session) {
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		// 로그인 정보 없을 경우 작성취소
		if(loginUser==null) {
			return "redirect:/boardlist";
		}
		
		post.setUserId(loginUser.getUserId());
		post.setNickname(loginUser.getNickname());
		System.out.println("글등록전: "+post);
		service.postPost(post);
		System.out.println("글등록: "+post);
		
		return "redirect:/post?postId="+post.getPostId();
	}
 
	@RequestMapping(value="/image/upload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> imageUpload(MultipartRequest request) throws Exception {
		System.out.println("/image/upload 호출");
        Map<String, Object> responseData = new HashMap<>();
        try {
        	
//            String url = service.imageUpload(request);
        	MultipartFile file = request.getFile("upload");
        	System.out.println("filename: "+ file.getOriginalFilename());

            String fileName = file.getOriginalFilename(); //파일이름
            String ext = fileName.substring(fileName.indexOf(".")); //확장자명을 얻는 구문

            // 같은 파일 이름으로 이미지를 계속 올릴 경우 이미지가 덮어쓰기가 되어버리므로
            // 고유한 개별 식별번호가 필요.
            // uuid 사용 (자바에서 지원)
            String uuidFileName = UUID.randomUUID() + ext; 
            String localPath = "C:\\Users\\acorn\\git\\repository3\\moonbam_board_crud_feature\\src\\main\\resources\\static\\images\\" + uuidFileName;

            File localFile = new File(localPath);
            file.transferTo(localFile);
            
            String url = "http://localhost:8090/app/resources/images/"+uuidFileName;
            System.out.println(url);

            responseData.put("uploaded", true);
            responseData.put("url", url);

            return responseData;

        } catch (IOException e) {

            responseData.put("uploaded", false);

            return responseData;
        }
    }
	
}
