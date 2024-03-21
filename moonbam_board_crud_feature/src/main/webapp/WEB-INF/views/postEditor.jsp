<%@page import="com.moonbam.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .ck-editor__editable { height: 400px; }
  .ck-editor__editable p {margin: 0}
  .ck-editor__editable p {margin: 0}
  .ck-content { font-size: 12px; }
  
  /*뷰 글 행간 마진 없애기  */
  .contentsArea p {margin:0}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script src="../common/UploadAdapter.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/41.0.0/classic/ckeditor.js"></script> <!-- ckeditor 사용을 위한 js -->
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
	$(document).ready(function(){
		$("#postForm").on("submit", checkData);
	})
	function checkData(e){

		// 로그인 세션 검사
		// 내용, 제목, 게시판 데이터 검사
		// 제목 최대길이 제한 검사
		e.preventDefault();
		
		if ("${loginUser}" == ""){
			e.preventDefault();
			alert("로그인 정보가 없습니다.")
		}
		
		var postBoard = $("#postBoard").val();
		if(postBoard==""){
			e.preventDefault();
			alert("게시판을 정해주세요.");
		}
		
		var postTitle = $("#postTitle").val();
		if(postTitle==""){
			e.preventDefault();
			alert("제목을 입력해주세요.");
		}
		
		var postText = $("#postText").text();
		if(postText==""){
			e.preventDefault();
			alert("내용을 입력해주세요.");
		}
		
		var postTitle = $("#postTitle").val();
		if(postTitle.length>50){
			e.preventDefault();
			alert("제목은 최대 50자까지 입력이 가능합니다.");
		}
	}
</script>
</head>
<body>
	<h1>Editor</h1>
	<form action="post" method="post" id="postForm">
		<select name="postBoard" id="postBoard">
			<option>자유게시판</option>
			<option>정보게시판</option>
		</select><br>
	    <input type="text" placeholder="제목" name="postTitle" id="postTitle"/><br>
	    <textarea id="content" name="postText" id="postText"></textarea><br>
	    <input type="submit" value="등록">
	</form>
</body>
<script>

    ClassicEditor.create( document.querySelector( '#content' ), {

        language: "ko",
		ckfinder : {
            uploadUrl: "/app/image/upload",
            withCredentials: true
        }
    });

</script>

</script>
</html>