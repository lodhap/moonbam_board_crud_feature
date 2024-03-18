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
  /* .ck-editor__editable p {margin: 0} */
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
    $(document).ready(function () {
	// 어댑터를 CKEditor에 추가
        function MyCustomUploadAdapterPlugin(editor) {
            editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
                return new MyUploadAdapter(loader);
            };
        }

	// 에디터 설정에 플러그인 추가
	ClassicEditor
  	  /* .create(document.querySelector('#description'), {
  		language: "ko",
  	      extraPlugins: [MyCustomUploadAdapterPlugin],
 	       toolbar: ['undo', 'redo', '|', 'bold', 'italic', '|', 'link', 'bulletedList', 'numberedList', 'blockQuote'],
   	     // 다른 설정...
  	  }) */
  	.create(document.querySelector('#description'), {
  		language: "ko",
  	      extraPlugins: [MyCustomUploadAdapterPlugin]
   	     // 다른 설정...
  	  })
 	   .catch(error => {
  	      console.error(error);
	    });
			
	//응답형 이미지 처리

	/*
	function MyUploadAdapter(loader) {
   	 // 업로더 초기화 코드...
 	   this.loader = loader;
  	  // 이미지를 업로드하고, 서버로부터 응답 받은 후 응답형 이미지 처리를 위한 로직 구현...
	}
	*/


    });
</script>
</head>
<body>
	
	<form enctype="multipart/form-data" action="/post" method="post"> <!-- // 파일 첨부 기능 넣을거면 enctype -->
		<input type="text" placeholder="제목을 입력하세요."><br>
	     <textarea name="text" id="description"></textarea> <!-- // 본문 내용  -->
		<!-- // .. input으로 필요한 제목 등등 추가 가능 -->
		<br>
		<button>완료</button>
	</form>
</body>


</html>