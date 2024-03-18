package com.moonbam.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonbam.dao.BoardDAO;
import com.moonbam.dto.PostDTO;
import com.moonbam.dto.PostPageDTO;

@Service
public class BoardService {

	@Autowired
	BoardDAO dao;
	
	public List<PostDTO> getPosts() {
		return dao.posts();
	}
	public PostDTO getPost(String postId) {
		return dao.getPost(postId);
	}
	public PostPageDTO getPostPage(String postId) {
		return dao.getPostPage(postId);
	}
	public String getIsLike(Map<String, String> map) {
		return dao.getIsLike(map);
	}
}
