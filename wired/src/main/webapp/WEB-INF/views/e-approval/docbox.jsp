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
					<table class="table table-bordered t-center" id="dataTable" width="100%"
						cellspacing="0">
						<col width="10%">
						<col width="15%">
						<col width="25%">
						<col width="20%">
						<col width="20%">
						<col width="10%">
						<thead>
							<tr>
								<th>번호</th>
								<th>문서양식</th>
								<th>문서제목</th>
								<th>기안일</th>
								<th>결재일</th>
								<th>결재상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
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
					<form>
					<div id='f-right' style="width: 20%;">
						<input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search" name="searchKeyword">
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
