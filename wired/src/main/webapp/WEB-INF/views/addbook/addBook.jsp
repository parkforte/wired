<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/addbook/addbook -->
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
				<input class="form-control mr-2" type="search" placeholder="부서별 검색"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</nav>

	<div>
		<!-- title1 -->
		<div class="card shadow mb-4 setW20 setMR10 f-left">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">조직도</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div id="jstree">
						<ul>
							<li>WIERD
								<ul>
									<li id="CEO">CEO</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li>인사팀
							</li>
						</ul>
						<ul>
							<li>재무팀
							</li>
						</ul>
						<ul>
							<li>법무팀
							</li>
						</ul>
						<ul>
							<li>영업팀
								<ul>
									<li id="영업 1팀">영업 1팀</li>
								</ul>
								<ul>
									<li id="영업 2팀">영업 2팀</li>
								</ul>
								<ul>
									<li id="영업 3팀">영업 3팀</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li>운영팀
								<ul>
									<li id="운영 1팀">운영 1팀</li>
								</ul>
								<ul>
									<li id="운영 2팀">운영 2팀</li>
								</ul>
								<ul>
									<li id="운영 3팀">운영 3팀</li>
								</ul>
								<ul>
									<li id="운영 4팀">운영 4팀</li>
								</ul>
								<ul>
									<li id="운영 5팀">운영 5팀</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li>개발팀
								<ul>
									<li id="백엔드 1팀">백엔드 1팀</li>
								</ul>
								<ul>
									<li id="백엔드 2팀">백엔드 2팀</li>
								</ul>
								<ul>
									<li id="프론트 1팀">프론트 1팀</li>
								</ul>
								<ul>
									<li id="프론트 2팀">프론트 2팀</li>
								</ul>
								<ul>
									<li id="디자인팀">디자인팀</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">백엔드 1팀</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>이름</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>부서명</th>
								<th>직급</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>지노지노</td>
								<td>010-2287-8929</td>
								<td>jinojino@wierd.com</td>
								<td>백엔드 1팀</td>
								<td>팀장</td>
							</tr>
						</tbody>
					</table>
					<nav class="f-right" aria-label="...">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link">Previous</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item active" aria-current="page"><a
								class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

	</div>
</div>
<!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp"%>