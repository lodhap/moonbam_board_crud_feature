<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h1>글보기 페이지</h1>
	글 제목 : ${postPage.postTitle }<br>
	글 내용 : ${postPage.postText }<br>
	작성자 : ${postPage.nickname}<br>
	조회수 : ${postPage.viewNum}<br>
	추천수 : ${postPage.likeNum}<br>
	로그인 유저 아이디 : ${sessionScope.loginUser.nickname == null ? "없음": sessionScope.loginUser.nickname}<br>
	좋아요 누름 여부 : ${isLike}
	
	<c:if test="${postPage.nickname==sessionScope.loginUser.nickname}">
		<button>수정</button>
		<button>삭제</button>
	</c:if>
</body>
</html>