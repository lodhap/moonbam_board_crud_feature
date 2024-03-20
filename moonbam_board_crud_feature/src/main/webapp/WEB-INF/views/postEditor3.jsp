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
<!-- //ckeditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
<!-- //이미지 업로드 어댑터 -->
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
</head>
<body>
	editor
	<form action="/" method="POST">
	    <input name="title" type="text" placeholder="제목"/><br>
	    <textarea name="content" id=editor></textarea><br>
	    <input type="submit" value="등록">
	</form>
</body>
<script>

    let myEditor;

    ClassicEditor
        .create(document.querySelector('#editor'), {
            ckfinder: {
                uploadUrl : '/app/image/upload'
            }
        })
        .then(editor => {
            myEditor = editor;
            console.log('Editor was initialized');
        })
        .catch(error => {
            console.error(error);
        });
</script>

</script>
</html>