<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/bdList/bdListmanagement -->

<style>
#board1{
	float: left;
	width: 49.5%;
}
#board2{
	float: right;
	width: 49.5%;
}
#board3{
	float: right;
	width: 49.5%;
}

#bdsubmitDiv{
	font-size: 0.7em;
}
</style>
<!-- javaScript영역 -->
<script type="text/javascript">
	function boardList(curPage) {
		$('#currentPage').val(curPage);
		$('form[name=frmPage]').submit();
	}

	$(function () {
		$('#bdWrite').click(function () {
			if($('input[name=bdlistName]').val().length<1){
				alert('게시판 이름을 입력하세요');
				$('#bdWrite').focus();
				event.preventDefault();
			}else if($('form[name=frmPage2] select[name=ranksNo]').val()=='etc'){
				alert('게시판 권한을 설정하세요');
				$('#inlineFormCustomSelect').focus();
				event.preventDefault();
			}

		});

		$('#bdEdit').click(function () {
			if($('select[name=bdlistNo]').val()=='etc'){
				alert('게시판을 선택 하세요');
				$('select[name=bdlistNo]').focus();
				event.preventDefault();
			}else if($('form[name=frmPage3] select[name=ranksNo]').val()=='etc'){
				alert('게시판 권한을 설정하세요');
				$('select[name=ranksNo]').focus();
				event.preventDefault();
			}
		});
	});

</script>



               <!-- defaultPage -->
                <div class="container-fluid" >

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">게시판 관리</h1>
                    <p class="mb-4">Company bulletin board management.</a>.</p>

					<!-- 페이징 처리를 위한 form 시작-->
					<form name="frmPage" method="post" action="<c:url value='/bdList/bdListmanagement'/>">
						<input type="hidden" name="currentPage" id="currentPage">
						<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
					</form>
					<!-- 페이징 처리를 위한 form 끝-->

                    <!-- title1 -->
                    <div class="card shadow mb-4" id="board1">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">게시판 리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">

			                    <!-- 테이블 -->
			                   	<div class="row">
			                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			                           <thead>
			                               <tr>
			                                   <th>게시판 이름</th>
			                                   <th style="width: 130px">게시판 권한</th>
			                                   <th style="width: 90px">관리</th>
			                               </tr>
			                           </thead>

			                           <tbody>
				                           <c:if test="${empty bdList }">
				                           		<tr>
				                           			<td colspan="3">게시판이 존제하지 않습니다.</td>
				                           		</tr>
				                           </c:if>
				                      		<!-- 반복시작 -->
				                           <c:forEach var="map" items="${bdList }">

				                               <tr>
				                                   <td>${map['BDLIST_NAME'] }</td>
				                                   <td>${map['RANKS_NAME'] }</td>
				                                   <td>
				                                   		<button type="button" class="btn btn-danger f-left detailbt" data-toggle="modal" data-target="#exampleModal"><i class="bi bi-trash"></i>삭제</button>
				                                   </td>
				                                   <!-- Modal -->
													<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLabel">게시판 삭제</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													       	${map['BDLIST_NAME'] }게시판을 삭제 하시겠습니까?
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
													        <button type="button" class="btn btn-danger"
													        	onclick="location.href='<c:url value="/bdList/bdListmanagement?bdlistNo=${map['BDLIST_NO'] }"/>'">Delete</button>
													      </div>
													    </div>
													  </div>
													</div>
				                               </tr>
				                           </c:forEach>
											<!-- 반복 끝 -->

			                           </tbody>
			                       </table>
			                       <nav class="f-right" aria-label="...">
			                       		<!-- 페이지 번호추가 -->
										<ul class="pagination">

											<li class="page-item
											<c:if test="${pagingInfo.firstPage==1 }">
												disabled
											</c:if>
											"><a class="page-link" href="#" onclick="boardList(${pagingInfo.firstPage-1})">Previous</a></li>

											<!-- [1][2][3][4][5][6][7][8][9][10] -->
											<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">


												<li
													<c:if test="${i==pagingInfo.currentPage }">
														class="page-item active" aria-current="page"
													</c:if>
													<c:if test="${i!=pagingInfo.currentPage }">
														class="page-item"
													</c:if>
												><a class="page-link" href="#" onclick="boardList(${i })">${i }</a></li>

											</c:forEach>


												<li class="page-item
												<c:if test="${pagingInfo.lastPage==pagingInfo.totalPage }">
													disabled
												</c:if>
												"><a class="page-link" href="#" onclick="boardList(${pagingInfo.lastPage+1})">Next</a></li>
											<!-- 페이지 번호끝 -->
										</ul>
									</nav>
			              		</div>
			              		<input type="hidden" value="${pagingInfo.lastPage }"/>
                            </div>
                        </div>
                    </div>


                    <!-- 게시판 등록 -->
                    <div class="card shadow mb-4" id="board2">
		                       <div class="card-header py-3">
		                       <h6 class="m-0 font-weight-bold text-primary">관리자 게시판 등록</h6>
		                   </div>
		                   <div class="card-body">
		                       <div class="table-responsive">

		                       	 <!-- 테이블 -->
		                    <form name="frmPage2" method="post" action="<c:url value='/bdList/bdListmanagement2'/>">
		                    <input type="hidden" value="1" name="frmNum">
		                  	<div class="row">
		                      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		                          <tbody>

		                              <tr>
		                                  <td style="width: 180px">게시판 이름</td>
		                                  <td><input type="text" name="bdlistName" class="form-control" placeholder="Board name" aria-label="Board name" aria-describedby="basic-addon1"></td>
		                              </tr>
		                              <tr>
		                                  <td>댓글 유무</td>
		                                  <td>
		                                  		<div class="custom-control custom-switch">
											  <input type="checkbox" name="bdlistRe" class="custom-control-input" id="customSwitch1" checked="checked" value='Y'>
											  <label class="custom-control-label" for="customSwitch1">선택 해주세요</label>
											</div>
		                                  </td>
		                              </tr>
		                              <tr>
		                                  <td>파일 업로드 유무</td>
		                                  <td>
		                                  		<div class="custom-control custom-switch">
											  <input type="checkbox" name="bdlistUp" class="custom-control-input" id="customSwitch2" checked="checked" value='Y'>
											  <label class="custom-control-label" for="customSwitch2">선택 해주세요</label>
											</div>
		                                  </td>
		                              </tr>

		                              <tr>
		                                  <td>추천 유무</td>
		                                  <td>
		                                  		<div class="custom-control custom-switch">
											  <input type="checkbox" name="bdlistRc" class="custom-control-input" id="customSwitch3" checked="checked" value='Y'>
											  <label class="custom-control-label" for="customSwitch3">선택 해주세요</label>
											</div>
		                                  </td>
		                              </tr>
		                              <tr>
		                                  <td>게시판 권한 설정</td>
		                                  <td>
		                                  		<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
											    <select class="custom-select mr-sm-2" name="ranksNo" id="inlineFormCustomSelect">
											        <option selected value="etc">권한 선택</option>
											        <c:forEach var="map" items="${ranksList }">
											        	<option value="${map['RANKS_NO'] }">${map['RANKS_NAME'] }</option>
											        </c:forEach>
											    </select>
		                                  </td>
		                              </tr>
		                              <tr>
		                                  <td>등록</td>
		                                  <td>
		                                  		<div id="bdsubmitDiv" style="margin:5px 0;">
						                    	<button type="submit" class="btn btn-primary" id="bdWrite">게시판 등록</button>
											</div>
		                                  </td>
		                              </tr>
		                          </tbody>
		                      </table>
		             		</div>

		                       	 </form>

		                       </div>
		                   </div>
                    </div>

                    <!-- title3 여러개필요시사용 -->
                    <div class="card shadow mb-4" id="board3">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">관리자 게시판 수정</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">

                            	 <!-- 테이블 -->
                            	  <form name="frmPage3" method="post" action="<c:url value='/bdList/bdListmanagement2'/>">
                            	  <input type="hidden" value="2" name="frmNum">
				                   	<div class="row">
				                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				                           <tbody>
				                               <tr>
				                                   <td style="width: 180px">게시판 이름</td>
				                                   <td>
				                                   		 <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
														    <select class="custom-select mr-sm-2" name="bdlistNo" id="inlineFormCustomSelect">
														        <option selected value="etc">게시판 선택</option>
														        <c:forEach var="vo" items="${eList }">
														        	<option value="${vo.bdlistNo }">${vo.bdlistName }</option>
														        </c:forEach>
														    </select>
				                                   </td>
				                               </tr>
				                               <tr>
				                                   <td>댓글 유무</td>
				                                   <td>
				                                   		<div class="custom-control custom-switch">
														  <input type="checkbox" name="bdlistRe" class="custom-control-input" id="customSwitch4" checked="checked" value='Y'>
														  <label class="custom-control-label" for="customSwitch4">선택 해주세요</label>
														</div>
				                                   </td>
				                               </tr>
				                               <tr>
				                                   <td>파일 업로드 유무</td>
				                                   <td>
				                                   		<div class="custom-control custom-switch">
														  <input type="checkbox" name="bdlistUp" class="custom-control-input" id="customSwitch5" checked="checked" value='Y'>
														  <label class="custom-control-label" for="customSwitch5">선택 해주세요</label>
														</div>
				                                   </td>
				                               </tr>

				                               <tr>
				                                   <td>추천 유무</td>
				                                   <td>
				                                   		<div class="custom-control custom-switch">
														  <input type="checkbox" name="bdlistRc" class="custom-control-input" id="customSwitch6" checked="checked" value='Y'>
														  <label class="custom-control-label" for="customSwitch6">선택 해주세요</label>
														</div>
				                                   </td>
				                               </tr>
				                               <tr>
				                                   <td>게시판 권한 설정</td>
				                                  <td>
				                                  		<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
													    <select class="custom-select mr-sm-2" name="ranksNo" id="inlineFormCustomSelect">
													        <option selected value="etc">권한 선택</option>
													        <c:forEach var="map" items="${ranksList }">
													        	<option value="${map['RANKS_NO'] }">${map['RANKS_NAME'] }</option>
													        </c:forEach>
													    </select>
				                                  </td>
				                               </tr>
				                               <tr>
				                                   <td>등록</td>
				                                   <td>
				                                   		<div id="bdsubmitDiv" style="margin:5px 0;">
									                    	<button type="submit" class="btn btn-primary" id="bdEdit">게시판 수정</button>
														</div>
				                                   </td>
				                               </tr>

				                           </tbody>
				                       </table>
				              		</div>
                            	 </form>

                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->


<%@ include file="../inc/bottom.jsp" %>

