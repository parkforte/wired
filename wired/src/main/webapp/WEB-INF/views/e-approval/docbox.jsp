<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>


<style>
.setW15 {
	width: 15%;
}

.setW75 {
	width: 75%;
}

.setMR10 {
	margin-right: 10px;
}

.f-center{
	margin: 0 auto;
}

.margin0{
	margin: 0 auto;
}

.inline-f{
	display: inline-flex;
}
</style>
<!-- javaScript영역 -->

<!-- 전자결재HOME -->
<div>
<div class="container-fluid">
<%@ include file="include/navbar.jsp"%>
	<div>
		<!-- 정렬기준 -->
		<!--
		<div class="card shadow mb-4 setW15 setMR10 f-left">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">정렬기준</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div class="card text-center f-center" style="width: 10rem;">
					<ul class="list-group list-group-flush nav flex-column">
						<li class="list-group-item nav-item"><i
							class="bi bi-clipboard"></i> 결재대기</li>
						<li class="list-group-item nav-item"><i
							class="bi bi-clipboard"></i> 결재완료</li>
						<li class="list-group-item nav-item"><i
							class="bi bi-clipboard"></i> 결재반려</li>
					</ul>
					</div>
				</div>
			</div>
		</div> -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">문서함</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered t-center" id="dataTable" style=" width: 100%">
						<col width="10%">
						<col width="30%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<thead>
							<tr>
								<th>번호</th>
								<th>문서제목</th>
								<th>기안일</th>
								<th>결재일</th>
								<th>결재상태</th>
							</tr>
						</thead>
						<tbody>
						 <c:if test="${empty list }">
						  	<tr>
						  		<td colspan="5">데이터가 없습니다.</td>
						  	</tr>
						  </c:if>
						  <c:if test="${!empty list }">
						  <c:forEach var="vo" items="${list }">
							<tr>
								<td>WIRED-${vo.cfNo }</td>
								<td><a href="<c:url value='/e-approval/write/detail?cfNo=${vo.cfNo }'/>">${vo.cfTitle }</a></td>
								<td><fmt:formatDate value="${vo.cfRegdate }" pattern="yyyy-MM-dd  hh:mm:ss"/></td>
								<td><fmt:formatDate value="${vo.cfOkdate }" pattern="yyyy-MM-dd  hh:mm:ss"/></td>
								<td>
								<c:if test="${vo.cfState==1 }">
									<button type="button" class="btn btn-secondary">결재대기</button>
								</c:if>
								<c:if test="${vo.cfState==2 }">
									<button type="button" class="btn btn-info">결재중</button>
								</c:if>
								<c:if test="${vo.cfState==3 }">
									<button type="button" class="btn btn-success">승인</button>
								</c:if>
								<c:if test="${vo.cfState==4 }">
									<button type="button" class="btn btn-warning">반려</button>
								</c:if>
								</td>
							</tr>
						  </c:forEach>
						  </c:if>
						</tbody>
					</table>
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
										"><a class="page-link" href="#" onclick="list(${pagingInfo.firstPage-1})">Previous</a></li>

									<!-- [1][2][3][4][5][6][7][8][9][10] -->
									<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">


										<li
											<c:if test="${i==pagingInfo.currentPage }">
												class="page-item active" aria-current="page"
											</c:if>
											<c:if test="${i!=pagingInfo.currentPage }">
												class="page-item"
											</c:if>
										><a class="page-link" href="#" onclick="list(${i })">${i }</a></li>
									</c:forEach>

										<li class="page-item
										<c:if test="${pagingInfo.lastPage==pagingInfo.totalPage }">
											disabled
										</c:if>
										"><a class="page-link" href="#" onclick="list(${pagingInfo.lastPage+1})">Next</a></li>
									<!-- 페이지 번호끝 -->
								</ul>
							</nav>
              			</div>
              			<input type="hidden" value="${pagingInfo.lastPage }"/>
              		</div>
              		<!-- 페이징 -->
					<form method="post" action="<c:url value='/e-approval/docbox'/>">
					<div id='f-right inline-f' style="width: 20%;">
						<input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search" name="searchKeyword" value="${param.searchKeyword}">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	</div>
</div>

<!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp"%>
