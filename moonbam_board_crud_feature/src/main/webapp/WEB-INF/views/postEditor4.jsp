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

<script src="https://cdn.ckeditor.com/ckeditor5/41.0.0/classic/ckeditor.js"></script> 
</head>
<body>
	editor
	<form action="/" method="POST" enctype="multipart/form-data">
	    <input name="title" type="text" placeholder="제목"/><br>
	    <textarea name="content" id="description"></textarea><br>
	    <input type="submit" value="등록">
	</form>
</body>
<script>
	
/*     ClassicEditor.create( document.querySelector( '#content' ), {

        language: "ko",
		ckfinder : {
            uploadUrl: "/app/image/upload",
            withCredentials: true
        }
    }); */
	
</script>
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
  	  .create(document.querySelector('#description'), {
  	      extraPlugins: [MyCustomUploadAdapterPlugin]
   	     // 다른 설정...
  	  })
 	   .catch(error => {
  	      console.error(error);
	    });
			
	//응답형 이미지 처리

	function MyUploadAdapter(loader) {
   	 // 업로더 초기화 코드...
 	   this.loader = loader;
  	  // 이미지를 업로드하고, 서버로부터 응답 받은 후 응답형 이미지 처리를 위한 로직 구현...
	}


    });
</script>

</script>
</html>