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
#btUpload, #btMultiDown, #btDown{
	font-size: 0.7em;
	margin-left: 2px;
}


</style>
<!-- javaScript영역 -->
<script type="text/javascript">
	function boardList(curPage) {
		$('#currentPage').val(curPage);
		$('form[name=frmPage]').submit();
	}

	$(function () {
// 		$('#btWrite').click(function () {
// 			location.href="<c:url value='/board/boardWrite?bdlistNo=${param.bdlistNo}'/>";
// 		});

		$('input[name=chkAll]').click(function(){
			$('tbody input[type=checkbox]').prop('checked', this.checked);
		});

		$('#btMultiDel').click(function(){
			var count=$('tbody input[type=checkbox]:checked').length;
			if(count>0){
				$('form[name=frmList]')
					.prop('action',"<c:url value='/webHard/deleteMulti'/>")
				$('form[name=frmList]').submit();
			}else{
				alert('삭제하고 싶은 게시글을 먼저 체크하세요');
			}
		});
		$('#btMultiDown').click(function(){
			var count=$('tbody input[type=checkbox]:checked').length;
			if(count>0){
				$('form[name=frmList]')
					.prop('action',"<c:url value='/webHard/downMulti'/>")
				$('form[name=frmList]').submit();
			}else{
				alert('삭제하고 싶은 파일을 먼저 체크하세요');
			}
		});
		$('#btMultiDown').click(function(){
			var count=$('tbody input[type=checkbox]:checked').length;
			if(count>0){
				$('form[name=frmList]')
					.prop('action',"<c:url value='/webHard/downMulti'/>")
				$('form[name=frmList]').submit();
			}else{
				alert('다운하고 싶은 파일을 먼저 체크하세요');
			}
		});
	});
</script>

	<!-- 페이징 처리를 위한 form 시작-->
	<form name="frmPage" method="post" action="<c:url value='/webHard/webHardComList'/>">
		<input type="hidden" name="currentPage" id="currentPage">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
	</form>
	<!-- 페이징 처리를 위한 form 끝-->


    <form name="frmList" method="post" action="<c:url value='/webHard/webHardComList'/>">
   	<!-- defaultPage -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">사내 웹하드</h1>
		<p class="mb-4">Company WebHard.</p>

		<!-- 게시판 검색 -->
		<div id='boardListSc'>
			<input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search" name="searchKeyword">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</div>
        <!-- title1 -->
        <div class="card shadow mb-4">


           <!-- DataTales Example -->
           <div class="card shadow mb-4">
               <div class="card-header py-3">
                   <h6 class="m-0 font-weight-bold text-primary f-left" >사내 웹하드</h6><!-- 게시판 이름 -->
					<div class="f-right">
						<button type="button" class="btn btn-primary f-left istAdd" data-toggle="modal" data-target="#exampleList" id="btUpload">업로드</button>

						<button type="button" class="btn btn-primary f-left" id="btMultiDown">다운로드</button>
						<c:if test="${sessionScope.ranksNo==3}">
						<button type="button" id="btMultiDel" class="btn btn-danger f-left detailbt">파일삭제</button>
						</c:if>
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
                                   <c:if test="${sessionScope.ranksNo==3}">
                               	  	 <th style="width:50px"><input type="checkbox" name="chkAll" class="form-check-input" id="exampleCheck1 chkAll"></th>
                           			</c:if>
                                   <th style="width: 151px">작성자</th>
                                   <th>파일명</th>
                                   <th style="width: 140px">등록일</th>
                                   <th style="width: 80px">다운수</th>
                                  <!-- 관리자 모드일때만 보이게 if처리 -->
<!-- 	                                   <th style="width: 100px">관리</th> -->
                           			<input type="hidden" value="${sessionScope.memNo}">
                               </tr>
                           </thead>
                           <tbody>

						<c:if test="${empty fList }">
                          	   <tr>
                          	   	 <td colspan="7">
                          	   	 		게시글이 존제하지 않습니다.
                          	   	 </td>
                          	   </tr>
						</c:if>
						<c:if test="${!empty fList }">
                        <!-- 반복문 시작 -->
						<c:set var="idx" value="0"/>
                           <c:forEach var="vo" items="${fList }">
	                               <tr>
	                               		<c:if test="${sessionScope.ranksNo==3}">
	                                   <td>
		                                   	<script type="text/javascript">
												$()
		                                   	</script>
	                                   		<input type="checkbox"  class="form-check-input" id="exampleCheck1 chkbox" value="${vo.fileNo}" name="webHardItems[${idx}].fileNo">
		                                   	<input type="hidden"  value="${vo.fileName }" name="webHardItems[${idx}].fileName">
	                                   </td>
	                                   </c:if>
	                                   <td>${vo.memName }</td>
	                                   <td>
	                                   		<span>
												<a href
							='<c:url value="/webHard/download?fileNo=${vo.fileNo }&fileName=${vo.fileName }"/>'>
													<i class="bi bi-folder">&nbsp;</i>${vo.fileOriginalfilename }&nbsp;
													(<fmt:formatNumber value="${vo.fileFilesize / 1000}" pattern=".00"/>KB)
													</a>

											</span>

<!-- 											flOAT FSIZE = FILESIZE/1000F; -->
<!-- 											FSIZE=MATH.ROUND(fSize*10)/10f; -->

<%-- 											<a id="a-hover" href='<c:url value="/board/readCount?boardNo=${map['BOARD_NO'] }&bdlistNo=${param.bdlistNo}"/>'> --%>
<%-- 	                                   			${map['FILE_NAME'] } --%>
<%-- 	                                   			<input type="hidden" value="${map['FILE_NAME'] }"> --%>
<!-- 											</a> -->
	                                   </td>
	                                   <td>
	                                   		<fmt:formatDate value="${vo.fileRegdate }" pattern="yyyy-MM-dd"/>
	                                   </td>
	                                   <td>${vo.fileDowncount }</td>

	                               </tr>
	                               <c:set var="idx" value="${idx+1 }"/>
                           </c:forEach>
                           <!-- 반복 끝 -->

						</c:if>

                           </tbody>
                       </table>
              		</div>

              		<!-- 페이징 -->
              		<div class="row">
              			<div class="col-sm-12 col-md-5">
	              			<c:if test="${!empty flist }">
	              				<div class="dataTables_info" id="dataTables_info" role="status">
	              					Showing ${pagingInfo.firstPage } to ${pagingInfo.currentPage } of ${pagingInfo.totalPage } entries
	              				</div>
							</c:if>
              			</div>

              			<!-- 페이징 1,2,3,4,5, -->
              			<div class="col-sm-12 col-md-7">
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
              		<!-- 페이징 -->
                       </div>
                   </div>

               </div>
            </div>
	    </div>
	    <!-- /.container-fluid -->
     </div>
      </form>
      	<!-- 파일 업로드 Modal -->
                <div class="modal fade" id="exampleList" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header m-list">
			      	<h5 class="modal-title" id="exampleModalLabel">Company Webhard</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			        <form name="frm1"  method="post" enctype="multipart/form-data" action="<c:url value='/webHard/webHardComWrite'/>">
			      <div class="modal-body">
					  <div>
					  	첨부할 파일을 선택하세요.
					  </div><br>
					  <div>
				            <label for="upfile">첨부파일</label>
					        <input type="file" name="upfile" id="upfile" multiple="multiple">(최대 5M)
					        <input type="hidden" name="memNo" value="${sessionScope.memNo }">
				        </div>
			      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal" >닫기</button>
				        <button type="submit" class="btn btn-success" id="list-add">등록</button>
				      </div>
					</form>
				    </div>
				  </div>
				</div>
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