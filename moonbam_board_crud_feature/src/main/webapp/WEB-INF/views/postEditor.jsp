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
</head>
<body>
	<h1>Editor</h1>
	<form action="post" method="post">
		<select name="postBoard">
			<option>자유게시판</option>
			<option>정보게시판</option>
		</select><br>
	    <input type="text" placeholder="제목" name="postTitle"/><br>
	    <textarea id="content" name="postText"></textarea><br>
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