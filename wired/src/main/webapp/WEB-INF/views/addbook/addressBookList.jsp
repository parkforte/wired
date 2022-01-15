<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/addbook/addressBookList -->
<!-- 2 load the theme CSS file -->
<link rel="stylesheet"
	href="<c:url value='/resources/api/jsTree/dist/themes/proton/style.min.css' />" />

<style>
.setW20 {
	width: 20%;
}

.setW75 {
	width: 75%;
}

.setMR10 {
	margin-right: 10px;
}

.s-half-style {
	width: 31.5%;
}

span {
	padding-top: 11px;
	padding-left: 3px;
	padding-right: 3px;
}

.rank-margin {
	margin-top: 16px;
}
</style>
<!-- javaScript영역 -->
<!-- 4 include the jQuery library -->
<script
	src="<c:url value='/resources/api/jsTree/dist/libs/jquery.js'/> "></script>
<!-- 5 include the minified jstree source -->
<script src="<c:url value='/resources/api/jsTree/dist/jstree.min.js'/> "></script>
<script>
	$(function() {
		$('#jstree').jstree({
			'core' : {
				'themes' : {
					'name' : 'proton',
					'responsive' : true
				}
			}
		});
	});

</script>
<!-- 전자결재HOME -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">주소록</h1>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="collapse navbar-collapse" id="navbarScroll">
			<ul class="navbar-nav mr-auto my-2 my-lg-0 navbar-nav-scroll"
				style="max-height: 100px;">
			</ul>
			<form class="d-flex">
				<input class="form-control mr-2" type="search" placeholder="이름으로 검색"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</nav>
	<div>
		<!-- title1 -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">${sessionScope.memName }님의
					개인 주소록</h6>
				<nav class="f-right" aria-label="...">
					<button type="button" class="btn btn-primary"
						onclick="location.href='/wired/addbook/addressBookRegister'">추가</button>
				</nav>
			</div>
			<div class="card-body">
				<div class="table-responsive" id="dataform">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>이름</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>회사명</th>
								<th>부서명</th>
								<th>직급</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty addbookList }">
								<tr>
									<td colspan="6">데이터가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty addbookList }">
								<!-- 리스트 반복문 시작 -->
								<c:forEach var="map" items="${addbookList }">
									<tr>
										<td>${map['ADDRBOOK_NAME'] }</td>
										<td>${map['ADDRBOOK_TEL'] }</td>
										<td>${map['ADDRBOOK_EMAIL'] }</td>
										<td>${map['ADDRBOOK_COMNAME'] }</td>
										<td>${map['ADDRBOOK_DEPT'] }</td>
										<td>${map['ADDRBOOK_RANK'] }</td>

										<td><button type="button" class="btn btn-success"
												id="btEdit"
												onclick="location.href='<c:url value="/addbook/addressBookEdit?addrbookNo=${map['ADDRBOOK_NO'] }"/>'">수정</button>
											<button type="button" class="btn btn-danger" id="btDel"
												onclick="location.href='<c:url value="/addbook/addressBookDelete?addrbookNo=${map['ADDRBOOK_NO'] }"/>'">삭제</button></td>
									</tr>
								</c:forEach>
							</c:if>
							<!-- 반복 끝 -->
						</tbody>
					</table>
					<!-- 페이징 1,2,3,4,5, -->
					<div class="col-sm-12 col-md-7">
						<nav class="f-right" aria-label="...">
							<!-- 페이지 번호추가 -->
							<ul class="pagination">

								<li
									class="page-item
										<c:if test="${pagingInfo.firstPage==1 }">
											disabled
										</c:if>"><a class="page-link" href="#" 
										onclick="addressBookList(${pagingInfo.firstPage-1})">Previous</a></li>

								<!-- [1][2][3][4][5][6][7][8][9][10] -->
								<c:forEach var="i" begin="${pagingInfo.firstPage }"
									end="${pagingInfo.lastPage }">


									<li
										<c:if test="${i==pagingInfo.currentPage }">
												class="page-item active" aria-current="page"
											</c:if>
										<c:if test="${i!=pagingInfo.currentPage }">
												class="page-item"
											</c:if>><a
										class="page-link" href="#" onclick="addressBookList(${i })">${i }</a></li>
								</c:forEach>

								<li
									class="page-item
										<c:if test="${pagingInfo.lastPage==pagingInfo.totalPage }">
											disabled
										</c:if>
										"><a
									class="page-link" href="#"
									onclick="addressBookList(${pagingInfo.lastPage+1})">Next</a></li>
								<!-- 페이지 번호끝 -->
							</ul>
						</nav>
					</div>
					<input type="text" value="${pagingInfo.lastPage }" />

				</div>
			</div>
		</div>

	</div>
</div>
<!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp"%>