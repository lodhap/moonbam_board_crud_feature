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
<script>
	$(document).ready(function(){
		
		$("#deletePost").on("click", deletePost);
	})
	
	function deletePost(e){
		var postId = $(this).attr("data-postId")
		var userId = $(this).attr("data-userId")
		$.ajax(
			{
				type: "delete",
				url:"post",
				data: {
					"postId": postId,
					"userId": userId
				},
				success: function(data, status, xhr){
					alert(data);
					window.location.href = "boardlist"
				},
				error: function(xhr, status, e){
					alert("삭제 중 오류가 발생했습니다.");
				}
			}//json	
		);//ajax
	}
</script>
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
	
	<br><br>
	<c:if test="${postPage.nickname==sessionScope.loginUser.nickname}">
		<form action="postEditor">
			<input type="hidden" value="${postPage.postId }" name="postId">
			<input type="hidden" value="${postPage.postBoard }" name="postBoard">
			<input type="hidden" value="${postPage.postTitle }" name="postTitle">
			<input type="hidden" value="${postPage.postText }" name="postText">
			<button>수정</button>
		</form>
		
		<button id="deletePost" data-postId="${postPage.postId }" data-userId="${postPage.userId }">삭제</button><br><br>
	</c:if>
	
	<a href="boardlist">글목록</a>
</body>
</html>