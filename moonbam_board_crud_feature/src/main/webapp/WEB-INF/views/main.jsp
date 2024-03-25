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
		$("#postEditor").on("click", checkLogin)
	});
	function checkLogin(){
		if("${loginUser}"==""){
			alert("로그인이 필요합니다.");
		} else{
			window.location.href = "postEditor";
		}
		
	}
</script>
</head>
<body>
	<h1>메인</h1>
	<a href="login">로그인 세션 얻기</a><br>
	<a href="logout">로그인 세션 제거</a><br>
	<hr>
	<a href="boardlist">글목록</a><br><br>
	<a id="postEditor">글작성</a><br><br>
	
</body>
</html>