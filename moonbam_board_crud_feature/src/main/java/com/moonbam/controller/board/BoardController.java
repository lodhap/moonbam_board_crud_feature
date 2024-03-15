package com.moonbam.controller.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.moonbam.dto.PostDTO;
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
	public String getPost(HttpServletRequest request, String postId) {
		System.out.println("postid: " + postId);
		PostDTO post= service.getPost(postId);
		request.setAttribute("post", post);
		return "postViewer";
	}
	
}
