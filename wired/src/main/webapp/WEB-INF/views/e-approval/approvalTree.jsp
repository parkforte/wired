<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/default/defaultPage -->
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
	<h1 class="h3 mb-2 text-gray-800">전자결재 시스템</h1>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="collapse navbar-collapse" id="navbarScroll">
			<ul class="navbar-nav mr-auto my-2 my-lg-0 navbar-nav-scroll"
				style="max-height: 100px;">
				<li class="nav-item active"><a class="nav-link active" href="#">Home</a>
				</li>
				<li class="nav-item active"><a class="nav-link" href="#">문서작성</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarScrollingDropdown" role="button" data-toggle="dropdown"
					aria-expanded="false"> 문서함 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
						<li><a class="dropdown-item" href="#">결재대기</a></li>
						<li><a class="dropdown-item" href="#">결재완료</a></li>
						<li><a class="dropdown-item" href="#">결재반려</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">임시저장</a></li>
					</ul></li>
				<li class="nav-item active"><a class="nav-link" href="#">문서결재</a>
				<li class="nav-item active"><a class="nav-link" href="#">문서관리</a>
				</li>
			</ul>
			<form class="d-flex">
				<input class="form-control mr-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</nav>

	<div>
		<!-- title1 -->
		<div class="card shadow mb-4 setW20 setMR10 f-left">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">문서양식</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div id="jstree">
						<ul>
							<li>일반
								<ul>
									<li id="child_node">Child node</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li>인사
								<ul>
									<li id="child_node">Child node</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li>지원
								<ul>
									<li id="child_node">Child node</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li>휴가
								<ul>
									<li id="child_node">Child node</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li>교통비
								<ul>
									<li id="child_node">Child node</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li>Root node
								<ul>
									<li id="child_node">Child node</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li>Root node
								<ul>
									<li id="child_node">Child node</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li>Root node
								<ul>
									<li id="child_node">Child node</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">title1</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Name</th>
								<th>Position</th>
								<th>Office</th>
								<th>Age</th>
								<th>Start date</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Tiger Nixon</td>
								<td>System Architect</td>
								<td>Edinburgh</td>
								<td>61</td>
								<td>2011/04/25</td>
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
