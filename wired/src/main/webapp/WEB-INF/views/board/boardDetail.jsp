<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/default/defaultPage -->

<!-- javaScript영역 -->
<!-- 네이버 스마트에디터  -->
<!-- <head> 안에 추가 -->
<script type="text/javascript" src="/libs/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
<!-- head 안에 추가 -->

	function save(){
		oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
	    		//스마트 에디터 값을 텍스트컨텐츠로 전달
		var content = document.getElementById("smartEditor").value;
		alert(document.getElementById("txtContent").value); 
	    		// 값을 불러올 땐 document.get으로 받아오기
		return; 
	}

</script>

               <!-- defaultPage -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Page Heading</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- title1 -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">게시글 제목</h6>
                            
                            <!-- 작성자만 볼수있게 버튼if 처리 세션에서 아이디 가져와 셀렉트-->
                            <div class="f-right bdDetailBtDiv">
	                            <button type="button" class="btn btn-primary f-left detailbt">글수정</button>
								<button type="button" class="btn btn-danger f-left detailbt">글삭제</button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<p>스마트 에디터</p>
								               
                            </div>
                        </div>
                    </div>
                    <!-- 데이터 전송버튼 -->

                    <!-- title2 여러개필요시사용 -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">댓글</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            
                            	<label class="replylabel">회원아이디wired123</label>&nbsp;&nbsp;<span>샬라샬라샷ㄹ샬사라</span>
                            	<hr style="margin: 3px 0">
                            	<i class="bi bi-arrow-return-right"></i><label class="replylabel">김방방</label>&nbsp;&nbsp;<span>샬라샬라샷ㄹ샬사라</span>
                            	<hr style="margin: 3px 0">
                            	<label class="replylabel">박진호</label>&nbsp;&nbsp;<span>샬라샬라샷ㄹ샬사라</span>
                            	<hr style="margin: 3px 0">
                            	<label class="replylabel">김방방</label>&nbsp;&nbsp;<span>샬라샬라샷ㄹ샬사라</span>
                            	<hr style="margin: 3px 0">
                            	<label class="replylabel">박진호</label>&nbsp;&nbsp;<span>샬라샬라샷ㄹ샬사라</span>
                            
                            	<!-- 마지막줄은 hr안함 -->
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            <!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp" %>
			