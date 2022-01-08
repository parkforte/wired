<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/board/boardList -->
<style>
/* 제목 */
p.mb-4 {
    float: left;
}

/* 서치바 */
div#boardListSc {
    float: right;
}
input.form-control.mr-2 {
    float: left;
    width: 188px;
}
button.btn.btn-outline-success {
    float: left;
}

/* 게시판 */
.card.shadow.mb-4 {
    clear: both;
}

/* 체크박스 */
input#exampleCheck1\ chkAll {
    position: relative;
    margin-left: 7px;
}

input#exampleCheck1\ chkbox {
    margin-left: 7px;
    margin-top: 10px;
}
</style>
<!-- javaScript영역 -->
<script type="text/javascript">
	function boardList(curPage) {
		$('#currentPage').val(curPage);
		$('form[name=frmPage]').submit();
	}

	$(function () {
		$('#btWrite').click(function () {
			location.href="<c:url value='/board/boardWrite?bdlistNo=${param.bdlistNo}'/>";
		});
	});
</script>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">관리자 글삭제</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        게시글을 정말 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">

	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 페이징 처리를 위한 form 시작-->
	<form name="frmPage" method="post" action="<c:url value='/bdList/bdListmanagement'/>">
		<input type="text" name="currentPage" id="currentPage">
		<input type="text" name="searchKeyword" value="${param.searchKeyword }">
	</form>
	<!-- 페이징 처리를 위한 form 끝-->


    <form name="frmList" method="post" action="<c:url value=''/>">
   	<!-- defaultPage -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">게시판</h1>
		<p class="mb-4">Company bulletin board list.</p>

		<!-- 게시판 검색 -->
		<div id='boardListSc'>
			<input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</div>
        <!-- title1 -->
        <div class="card shadow mb-4">


           <!-- DataTales Example -->
           <div class="card shadow mb-4">
               <div class="card-header py-3">
                   <h6 class="m-0 font-weight-bold text-primary f-left" >게시판이름</h6><!-- 게시판 이름 -->
					<div class="f-right">
						<button type="button" class="btn btn-primary f-left" id="btWrite">글쓰기</button>
					</div>





               </div>
               <div class="card-body">

                   <div class="table-responsive">
                   <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                   <div class="row" style="text-align: right">

                   <!-- 이거안함 -->
                   		<div class="col-sm-12 col-md-6">

                   		</div>
                   		<div class="col-sm-12 col-md-6" align="right">
                   			<div id="dataTable_filter" class="dataTables_filter">


                   			</div>
                   		</div>
                  	 	</div>






              		<div class="row">


                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                           <thead>
                               <tr>
                               	   <th style="width:50px"><input type="checkbox" class="form-check-input" id="exampleCheck1 chkAll"></th>
                                   <th style="width: 151px">Name</th>
                                   <th>title</th>
                                   <th style="width: 140px">등록일</th>
                                   <th style="width: 80px">조회수</th>
                                   <th style="width: 100px">추천</th>
                                  <!-- 관리자 모드일때만 보이게 if처리 -->
                                   <c:if test="${sessionScope.ranksNo==3}">
	                                   <th style="width: 100px">관리</th>
                           			</c:if>
                           			<input type="text" value="${sessionScope.ranksNo}">
                               </tr>
                           </thead>
                           <tbody>

						<c:if test="${empty list }">
                          	   <tr>
                          	   	 <td colspan="7">
                          	   	 		게시글이 존제하지 않습니다.
                          	   	 </td>
                          	   </tr>
						</c:if>
						<c:if test="${!empty list }">
                        <!-- 반복문 시작 -->

                           <c:forEach var="map" items="${list }">
	                               <tr>
	                                   <td>
	                                   		<input type="checkbox" class="form-check-input" id="exampleCheck1 chkbox">
	                                   </td>
	                                   <td>${map['MEM_NAME'] }</td>
	                                   <td>
											<c:if test="${!empty map['BOARD_FILENAME'] }">
	                                   			<i class="bi bi-folder"></i><!-- 첨부파일 있는 게시물의 경우if처리 -->
											</c:if>
											<a href='<c:url value="/board/readCount?boardNo=${map['BOARD_NO'] }&bdlistNo=${param.bdlistNo}"/>'>
	                                   			${map['BOARD_TITLE'] }
	                                   			<input type="hidden" value="${param.bdlistNo}">
											</a>
	                                   </td>
	                                   <td>
	                                   		<fmt:formatDate value="${map['BOARD_REGDATE'] }" pattern="yyyy-MM-dd"/>
	                                   </td>
	                                   <td>${map['BOARD_READCOUNT'] }</td>
	                                   <td>${map['BOARD_RECOMMEND'] }</td>
	                                   	<!-- 관리자 모드일때만 보이게 if처리 게시글 번호로 수정 페이지이동, 삭제 메시지이용-->
	                                   <c:if test="${sessionScope.ranksNo==3}">
		                                   <td>
		                                   		<div class="bdListBtDiv">
<!-- 						                            <button type="button" class="btn btn-primary f-left detailbt" -->
<%-- 						                            	onclick="location.href=<c:url value='/board/boardDetail&boardNo=${map["BOARD_NO"] }'/>">글수정</button> --%>
													<button type="button" class="btn btn-danger f-left detailbt" data-toggle="modal" data-target="#exampleModal"
														onclick="location.href=<c:url value='/board/boardDetail&boardNo=${map["BOARD_NO"] }'/>">글삭제</button>
					                            </div>
		                                   </td>
	                                   </c:if>
	                               </tr>
                           </c:forEach>
                           <!-- 반복 끝 -->
						</c:if>

                           </tbody>
                       </table>
              		</div>
              		<div class="row">
              			<div class="col-sm-12 col-md-5">
              				<div class="dataTables_info" id="dataTables_info" role="status">
              					Showing ${pagingInfo.firstPage } to ${pagingInfo.lastPage } of ${pagingInfo.totalPage } entries
              				</div>

              			</div>

              			<!-- 페이징 1,2,3,4,5, -->
              			<div class="col-sm-12 col-md-7">
              				<nav class="f-right" aria-label="...">
	                       		<!-- 페이지 번호추가 -->
								<ul class="pagination">
									<li class="page-item disabled"><a class="page-link" href="#" onclick="boardList(${pagingInfo.firstPage-1})">Previous</a></li>

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

									<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
										<li class="page-item"><a class="page-link" href="#" onclick="boardList(${pagingInfo.lastPage+1})">Next</a></li>
									</c:if>
									<!-- 페이지 번호끝 -->
								</ul>
							</nav>
              			</div>

              		</div>
                       </div>
                   </div>

               </div>
            </div>
	    </div>
	    <!-- /.container-fluid -->
     </div>
      </form>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

<%@ include file="../inc/bottom.jsp" %>
