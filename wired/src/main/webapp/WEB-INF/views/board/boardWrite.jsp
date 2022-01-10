<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/default/defaultPage -->
<link rel="stylesheet" href='<c:url value="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>'>
<link rel='stylesheet' href='<c:url value="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css"/>'>
<link rel='stylesheet' href='<c:url value="https://unpkg.com/filepond/dist/filepond.min.css"/>'><link rel="stylesheet" href='<c:url value="/resources/css/style.css"/>'>
<style>
label {
    float: left;
    margin-top: 6px;
    margin-right: 6px;
    margin-left: 4px;
}
input#title {
    float: left;
    margin-bottom: 10px;
}

.btn-primary{
	font-size: 0.7em;
}

h6.m-0.font-weight-bold.text-primary {
    float: left;
}
.card-header.py-3 {
    height: 54px;
}

</style>
<!-- javaScript영역 -->
<!-- 네이버 스마트에디터  -->
<!-- <head> 안에 추가 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/api/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src='<c:url value="//code.jquery.com/jquery-1.11.0.min.js"/>'></script>

<script type="text/javascript">
<!-- head 안에 추가 -->
	$(function(){
		$('#btList').click(function () {
			location.href="<c:url value='/board/boardList?bdlistNo=${param.bdlistNo}'/>";
		});
	});

</script>

<!-- defaultPage -->
<div class="container-fluid">

    <!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">게시글 작성</h1>
	<p class="mb-4">Company bulletin board write.</p>

	<!-- title1 -->
	<div class="card shadow mb-4">
   		<form class="frmWrite" method="post" enctype="multipart/form-data" action='<c:url value="/board/boardWrite"/>'>
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">게시판 이름</h6>
			<div id="se2_sample"  class="f-right">
				<button type="button" class="btn btn-primary f-left"  id="submitbt">글쓰기</button>
	    	</div>
	    </div>

		<div class="card-body">
        	<div class="table-responsive">
        		<!-- frm -->

		      		<!-- 누가 작성했는지 알기위해 세션에서 작성자 ID 받아올것 -->
		      		<!-- 제목 -->
			       	<label>제목</label>
			  		<input type="text" class="form-control form-control-user c-size infobox f-left" id="title" name="boardTitle" placeholder="" style="width: 95%">

			       	<!-- 데이터 전송버튼 -->


					<!-- 스마트에디터 -->
					<textarea id="txtContent" name="boardContent" rows="10" cols="100" style="width: 100%;" class="infobox" ></textarea>
					<!-- textarea 밑에 script 작성하기 -->
					<script id="smartEditor" type="text/javascript">
						$(function () {

							var oEditors = [];
							nhn.husky.EZCreator.createInIFrame({
							    oAppRef: oEditors,
							    elPlaceHolder: "txtContent",  //textarea ID 입력
							    sSkinURI: "<c:url value='/resources/api/smarteditor/SmartEditor2Skin.html'/>",  //martEditor2Skin.html 경로 입력
							    fCreator: "createSEditor2",
							    htParams : {
							    	// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							        bUseToolbar : true,
								// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
								bUseVerticalResizer : false,
								// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
								bUseModeChanger : false
							    }
							});

							$("#submitbt").click(function(){
								oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);
								if($('#title').val().length<1){
									if($('#title').val().length<1){
										alert('제목을 입력하세요');
										$('#title').focus();
										event.preventDefault();
									}
								}else{
									$('.frmWrite').submit();
								}
							});
						});
					</script>
					<!-- 파일첨부 -->
					<!-- 파일첨부 인풋 -->
<!-- 					<div> -->
<!-- 					<input type="file" -->
<!-- 					       class="filepond" -->
<!--       					   name="filepond upfile" -->
<!-- 					       id="upfile" -->
<!-- 					       data-max-file-size="3MB" -->
<!-- 					       data-max-files="3" /> -->
<!-- 					</div> -->

					<div class="f-right">
			            <label for="upfile">첨부파일</label>
				        <input type="file" name="upfile" id="upfile" multiple="multiple">(최대 5M)
			        </div>


					<!-- 공백 -->
					<div class="form-group f-right">

					</div>
					<div>
						<button type="button" class="btn btn-primary f-left" id="btList">글목록</button>
						<input type="text" name="bdlistNo" value="${param.bdlistNo } ">
					</div>
	        	</div>
	   		</div>
		</form>
	</div>
</div>
<!-- 파일첨부 스크립트 -->
<%-- <script src='<c:url value="https://unpkg.com/filepond-plugin-file-encode/dist/filepond-plugin-file-encode.min.js"/>'></script> --%>
<%-- <script src='<c:url value="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.min.js"/>'></script> --%>
<%-- <script src='<c:url value="https://unpkg.com/filepond-plugin-image-exif-orientation/dist/filepond-plugin-image-exif-orientation.min.js"/>'></script> --%>
<%-- <script src='<c:url value="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.js"/>'></script> --%>
<%-- <script src='<c:url value="https://unpkg.com/filepond/dist/filepond.min.js"/>'></script><script  src='<c:url value="/resources/js/script.js"/>'></script> --%>



<%@ include file="../inc/bottom.jsp" %>