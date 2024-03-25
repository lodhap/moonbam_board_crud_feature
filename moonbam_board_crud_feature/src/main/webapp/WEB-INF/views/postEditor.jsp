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
		var postBoard = $("#postBoard").val();
		var postTitle = $("#postTitle").val();
		var postText = $("#postText").text();
		var postTitle = $("#postTitle").val();
		var postId = $("#postId").val();
		
		if ("${loginUser}" == ""){
			alert("로그인 정보가 없습니다.")
		}
		else if(postBoard==""){
			alert("게시판을 정해주세요.");
		}
		else if(postTitle==""){
			alert("제목을 입력해주세요.");
		}
		else if(postText==""){
			alert("내용을 입력해주세요.");
		}
		else if(postTitle.length>50){
			alert("제목은 최대 50자까지 입력이 가능합니다.");
		}
		/* 페이지에 postId가 없으면 문제 발생 */
		else if(postId==""){
			alert("페이지에 문제가 발생하였습니다.");
		} else{
			$.ajax(
				{
					type: "put",
					url:"post",
 					dataType: "json",
					data: {
						"postId": postId,
						"postBoard": postBoard,
						"postTitle": postTitle,
						"postText": postText
					},
					success: function(data, status, xhr){
						//console.log(data);
 						if(data.msg=="성공"){
							window.location.href = "post?postId="+data.postId;
						} else{
							alert(data.msg);
						} 
					},
					error: function(xhr, status, e){
						alert("수정 중 오류가 발생하였습니다.");
					}
				}//json	
			);//ajax
		}
		

	}
</script>
</head>
<body>
	<h1>Editor</h1>
	<form action="post" method="post" id="postForm">
		<input type="hidden" name="postId" value="${post.postId}" id="postId">
		<select name="postBoard" id="postBoard" value="${post.postBoard}">
			<option>자유게시판</option>
			<option>정보게시판</option>
		</select><br>
	    <input type="text" placeholder="제목" name="postTitle" id="postTitle" value="${post.postTitle}"/><br>
	    <textarea name="postText" id="postText">${post.postText}</textarea><br>
	    <input type="submit" value="등록">
	</form>
</body>
<script>

    ClassicEditor.create( document.querySelector( '#postText' ), {

        language: "ko",
		ckfinder : {
            uploadUrl: "/app/image/upload",
            withCredentials: true
        }
    });

</script>

</script>
</html>