<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>


<!-- http://localhost:9091/wired/employee/emplList -->

<!-- css영역 -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

.btn-waiting{
	background-color: #cccccc;
}
.c-both{
	clear: both;
}
.m-search{
	margin-bottom: 12px;
	margin-top: -12px;
}
.check-margin {
    margin-top: -17px;
    margin-left: 6px;
}
.check-margin2 {
    margin-top: 13px;
    margin-left: 6px;
}
#t-width {
    width: 3%;
}

</style>
<!-- javaScript영역 -->
<script type="text/javascript">
function boardList(curPage) {
	$('#currentPage').val(curPage);
	$('form[name=frmPage]').submit();
}

$(function() {
	$('.res_btn').each(function(index,item) {
		$(this).click(function() {
			var res=$(this).val();
			$('#m_btn').click(function(){
		        location.href="<c:url value='/employee/emplQuit?memNo='/>"+res;
		    });
		});

	});
});

</script>
<!-- 페이징 처리를 위한 form 시작-->
	<form name="frmPage" method="post" action="<c:url value='/employee/emplList'/>">
		<input type="hidden" name="currentPage" id="currentPage">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
	</form>
<!-- 페이징 처리를 위한 form 끝-->

	<form name="frmList" method="post" action="<c:url value='/employee/emplList'/>">
      <!-- defaultPage -->
    <div class="container-fluid font">
		<div id="topTitle">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800 h1-style">사원목록</h1>
        <p class="mb-4 f-left">Employee List</p>
		<!-- search -->
			<div id='boardListSc' class="d-flex f-right m-search">
				<input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search" name="searchKeyword">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</div>
		</div>
        <!-- title1 -->
         <div class="card shadow mb-4 c-both">

           <!-- DataTales Example -->
           <div class="card shadow mb-4">
               <div class="card-header py-3">

                   <!-- Dropdown - Messages -->
                   <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                       aria-labelledby="searchDropdown">
                       <form class="form-inline mr-auto w-100 navbar-search">
                           <div class="input-group">
                               <input type="text" class="form-control bg-light border-0 small"
                                   placeholder="Search for..." aria-label="Search"
                                   aria-describedby="basic-addon2">
                               <div class="input-group-append">
                                   <button class="btn btn-primary" type="button">
                                       <i class="fas fa-search fa-sm"></i>
                                   </button>
                               </div>
                           </div>
                       </form>
                   </div>
               </div>
               <div class="card-body">
                   <div class="table-responsive">
                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                           <thead>
                               <tr>
                               	   <th id="t-width"><input type="checkbox" class="form-check-input check-margin" id="exampleCheck1"></th>
                                   <th>사원번호</th>
                                   <th>이름</th>
                                   <th>부서</th>
                                   <th>직급</th>
                                   <th>연락처</th>
                                   <th>수정/삭제</th>
                               </tr>
                           </thead>
                           <tbody>
                            <c:if test="${empty list }">
                            	<tr>
                            		<td colspan="6">데이터가 없습니다.</td>
                            	</tr>
                            </c:if>
                            <c:if test="${!empty list }">
                            	<!-- 리스트 반복문 시작 -->
	               				<c:forEach var="map" items="${list }">
	                               <tr>
	                                   <td><input type="checkbox" class="form-check-input check-margin2" id="exampleCheck1"></td>
	                                   <td>${map['MEM_NO'] }</td>
	                                   <td>${map['MEM_NAME'] }</td>
	                                   <td>${map['DEPT_NAME'] }</td>
	                                   <td>${map['POS_NAME'] }</td>
	                                   <td>
		                                   <c:if test="${!empty map['MEM_HP1'] }">
									           <span id="hp1">${map['MEM_HP1'] }</span>
									           - <span id="hp2">${map['MEM_HP2'] }</span>
									           - <span id="hp3">${map['MEM_HP3'] }</span>
								           </c:if>
								       </td>
	                                   <td><button type="button" class="btn btn-success" onclick="location.href='/wired/employee/emplEdit?memNo=${map['MEM_NO'] }'" >수정</button>
											<button type="button" class="btn btn-danger res_btn" data-toggle="modal" data-target="#exampleModal" value="${map['MEM_NO'] }">퇴사</button>
											</td>
	                               </tr>

	               				</c:forEach>
               				<!-- 반복 끝 -->
               				</c:if>
                           </tbody>
                       </table>
                   </div>
               </div>

    </div>

    		<!-- 페이징 -->
              		<div class="row">
              			<div class="col-sm-12 col-md-5">
              				<div class="dataTables_info" id="dataTables_info" role="status">
              					Showing ${pagingInfo.firstPage } to ${pagingInfo.currentPage } of ${pagingInfo.totalPage } entries
              				</div>

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
									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-centered">
									    <div class="modal-content">
									      <div class="modal-header">
									      	<h5 class="modal-title" id="exampleModalLabel"></h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      <div class="modal-body">
									        퇴사 처리 하시겠습니까?
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-dismiss="modal" >취소</button>
									        <button type="submit" id="m_btn" class="btn btn-danger" >확인</button>
									        <!-- <input type="text" id="modal_btn" value=""> -->
									      </div>
									    </div>
									  </div>
									</div>

    <!-- /.container-fluid -->
     </div>
     </form>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp" %>

