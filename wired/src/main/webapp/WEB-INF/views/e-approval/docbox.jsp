<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- 2 load the theme CSS file -->
<link rel="stylesheet"
	href="<c:url value='/resources/api/jsTree/dist/themes/proton/style.min.css' />" />

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
</style>
<!-- javaScript영역 -->

<!-- 전자결재HOME -->
<div>
<div class="container-fluid">
<%@ include file="include/navbar.jsp"%>
	<div>
		<!-- 정렬기준 -->
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
		</div>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">문서함</h6>
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
</div>

<!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp"%>
