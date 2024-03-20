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
	<h1>게시글 목록</h1>
	<table border=1>
		<tr>
			<th>게시판</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
	
		<c:forEach var="post" items="${posts}">
			<tr>
				<td>${post.postBoard }</td>
				<td><a href="post?postId=${post.postId }">${post.postTitle }</a></td>
				<td>${post.nickname }</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="/app">메인으로</a>
	
	
	<%-- ${posts } --%>
</body>
</html>