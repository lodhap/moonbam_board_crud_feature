package com.moonbam.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moonbam.dto.PostDTO;
import com.moonbam.dto.PostPageDTO;

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

	public String getViewNum(String postId) {
		return session.selectOne("getViewNum", postId);
	}

	public PostPageDTO getPostPage(String postId) {
		return session.selectOne("getPostPage", postId);
	}

	public String getIsLike(Map<String, String> map) {
		System.out.println("dao: " + map);
		return session.selectOne("getIsLike", map);
	}

	public void postPost(PostDTO post) {
		session.insert("postPost", post);
		post.getPostId();
	}

}
