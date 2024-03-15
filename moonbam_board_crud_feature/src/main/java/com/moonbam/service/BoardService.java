package com.moonbam.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonbam.dao.BoardDAO;
import com.moonbam.dto.PostDTO;

@Service
public class BoardService {

	@Autowired
	BoardDAO dao;
	public List<PostDTO> getPosts() {
		return dao.posts();
	}
	public PostDTO getPost(String postId) {
		// TODO Auto-generated method stub
		return dao.getPost(postId);
	}
}
