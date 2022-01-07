<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/default/defaultPage -->

<!-- javaScript영역 -->
<!-- 네이버 스마트에디터  -->
<!-- <head> 안에 추가 -->
<style>
hr{
	margin: 4px 0;
}

button.btn.btn-primary.f-right {
    margin: 3px;
}

button.btn.btn-outline-primary {
    font-size: 0.3em;
    float: right;
    margin-left: 2px;
    height: 30px;
}
button.btn.btn-outline-secondary {
    float: right;
    font-size: 0.4em;
    margin-top: -2.5px;
}
textarea{
	resize: none;
}

button.btn.btn-primary.f-right {
    font-size: 0.6em;
}

/* .replyWrite{ */
/* 	display: none; */
/* } */
div#comment {
    margin-bottom: 29px;
}
</style>
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

	$(function () {
		$('.replyWrite').hide();
		$('.btn-outline-secondary').click(function () {
			$('.replyWrite').show();
		});

		$('#btList').click(function(){
			location.href="<c:url value='/board/boardList?bdlistNo=${boardVo["BDLIST_NO"]}'/>";
		});
		$('#btUpdate').click(function(){
			location.href="<c:url value='/board/boardUpdate?boardNo=${param.boardNo}'/>";
		});
		$('#recommend').click(function(){
			location.href="<c:url value='/board/recommend?boardNo=${param.boardNo}'/>";
		});



	});




</script>

               <!-- defaultPage -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">게시판</h1>
                    <p class="mb-4">Company bulletin board.</p>

                    <!-- title1 -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">${boardVo['BOARD_TITLE']}</h6>

                            <!-- 작성자만 볼수있게 버튼if 처리 세션에서 아이디 가져와 셀렉트-->
                            <div class="f-right bdDetailBtDiv">
                            	<button type="button" class="btn btn-primary detailbt f-left" style="font-size: 0.7em" id="recommend">
                           			${boardVo['BOARD_RECOMMEND']} 추천
                          		</button>
                          		<c:if test="${sessionScope.memNo }==${$map['MEM_NO'] }">
		                            <button type="button" class="btn btn-primary f-left detailbt" id="btList" >글목록</button>
		                            <button type="button" class="btn btn-primary f-left detailbt" id="btUpdate">글수정</button>
                          		</c:if>

	                            <!-- 삭제버튼 클릭하면 모달창 생성후 삭제하겠습니다 라는 입력받아서 같으면 처리해보기-->
								<button type="button" class="btn btn-danger f-left detailbt" id="deleteBt" data-toggle="modal" data-target="#exampleModal">글삭제</button>

								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body">
								        ...
								      </div>
								      <div class="modal-footer">

								        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								        <button type="button" class="btn btn-primary">Save changes</button>
								      </div>
								    </div>
								  </div>
								</div>

                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<p>${boardVo['BOARD_CONTENT']}</p>

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
                            	<!-- 댓글창 -->
                            	<form name="frmDetail" method="post" action='<c:url value="/board/boardDetail"/>'>
                            	<div style="height:117px" id="comment">
                            		<input type="text" name="boardNo" value="${param.boardNo }">
                            		<textarea class="form-control" name="repContent" id="exampleFormControlTextarea1" rows="3" placeholder="바르말 고운말 사용"></textarea>
                            		<button type="submit" class="btn btn-primary f-right">등록</button>
                            	</div>
                            	</form>

                            	<hr>
								<c:forEach var="map" items="${reList }">
									<div>
		                           		<div class="f-left"><span>${map['MEM_NAME'] }</span></div>&nbsp;&nbsp;<span>${map['REP_CONTENT'] }</span><button type="button" class="btn btn-outline-secondary">댓글</button>
										<hr>
									<!-- 대댓글 쓰기창  *자신을 제외한 댓들 등록창은 hide* -->
										<div class="row replyWrite">
											<div class="f-left" style="width:7%"><span>${sessionScop.memId }</span></div>&nbsp;&nbsp;
											<div class="f-left" style="width:89%"><input type="text" class="form-control form-control-sm form-control-user c-size infobox f-right" id="title" placeholder="바르말 고운말 사용"></div><button type="button" class="btn btn-outline-primary">등록</button>
										</div>
									</div>

								</c:forEach>
								<hr>

                            	<!-- 대댓글 -->
                            	<i class="bi bi-arrow-return-right"></i><label class="replylabel">김방방</label>&nbsp;&nbsp;<span>샬라샬라샷ㄹ샬사라</span><button type="button" class="btn btn-outline-secondary">댓글</button>
                            	<hr style="">




                            	<!-- 마지막줄은 hr안함 -->
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            <!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp" %>
