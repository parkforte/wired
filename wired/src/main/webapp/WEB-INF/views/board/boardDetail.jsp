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
                            <h6 class="m-0 font-weight-bold text-primary">${boardVo.boardTitle }</h6>

                            <!-- 작성자만 볼수있게 버튼if 처리 세션에서 아이디 가져와 셀렉트-->
                            <div class="f-right bdDetailBtDiv">
                            	<button type="button" class="btn btn-primary detailbt f-left" style="font-size: 0.7em","margin" >
                           			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
									<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
									</svg>
                           			추천
                          		</button>
	                            <button type="button" class="btn btn-primary f-left detailbt">글수정</button>

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
                            	<p>${boardVo.boardContent }</p>

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
                            	<form name="frmDetail" method="post" action="/board/boardDetail2">
                            	<div style="height:117px">
                            		<input type="hidden" name="boardNo" value="${param.boardNo }">
                            		<textarea class="form-control" name="boardContent" id="exampleFormControlTextarea1" rows="3" placeholder="바르말 고운말 사용"></textarea>
                            		<button type="button" class="btn btn-primary f-right">등록</button>
                            	</div>
                            	</form>

                            	<hr>
								<c:forEach var="map" items="${reList }">
                            		<div class="f-left"><span>${map['MEM_NAME'] }</span></div>&nbsp;&nbsp;<span>${map['REP_CONTENT'] }</span><button type="button" class="btn btn-outline-secondary">댓글</button>
								</c:forEach>
								<hr>
                            	<!-- 대댓글 -->
                            	<i class="bi bi-arrow-return-right"></i><label class="replylabel">김방방</label>&nbsp;&nbsp;<span>샬라샬라샷ㄹ샬사라</span><button type="button" class="btn btn-outline-secondary">댓글</button>
                            	<hr style="">

								<!-- 대댓글 쓰기창  *자신을 제외한 댓들 등록창은 hide* -->
								<div class="row replyWrite">
									<div class="f-left" style="width:7%"><span>${map['MEM_NAME'] }</span></div>&nbsp;&nbsp;
									<div class="f-left" style="width:89%"><input type="text" class="form-control form-control-sm form-control-user c-size infobox f-right" id="title" placeholder="바르말 고운말 사용"></div><button type="button" class="btn btn-outline-primary">등록</button>
									<hr>
								</div>

                            	<div class="f-left"><span>회원아이디</span></div>&nbsp;&nbsp;<span>샬라샬라샷ㄹ샬사라</span>
                            	<hr>
                            	<div class="f-left"><span>회원아이디</span></div>&nbsp;&nbsp;<span>샬라샬라샷ㄹ샬사라</span>
                            	<hr>
                            	<div class="f-left"><span>회원아이디</span></div>&nbsp;&nbsp;<span>샬라샬라샷ㄹ샬사라</span>

                            	<!-- 마지막줄은 hr안함 -->
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            <!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp" %>
