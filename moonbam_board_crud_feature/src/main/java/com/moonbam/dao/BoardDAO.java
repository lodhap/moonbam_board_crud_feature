package com.moonbam.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moonbam.dto.PostDTO;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate session;

	public List<PostDTO> posts() {
		return session.selectList("getPosts");
	}

	public PostDTO getPost(String postId) {
		return session.selectOne("getPost", postId);
	}

}
