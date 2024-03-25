package com.moonbam.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

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
	public void postPost(PostDTO post) {
		dao.postPost(post);
	}
	public int deletePost(String postId) {
		return dao.deletePost(postId);
	}
	public String getUseridFromPost(Long postId) {
		return dao.getUseridFromPost(postId);
	}
	public void updatePost(PostDTO post) {
		dao.updatePost(post);
		
	}
	
	
}
