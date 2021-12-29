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


<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">근태관리</h1>
	<p class="mb-4">Attendance management.</p>
	<div>
		<!-- title1 -->
		<div class="card shadow mb-4 setW20 setMR10 f-left">
			
			<div class="card-body">
				<!-- 근태관리 페이지 메뉴바 -->
				<div class="row">
				  <div class="col-12">
				    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				      <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">개인근태조회</a>
				      <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">개인연차조회</a>
				      <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">부서근태조회</a>
				      <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">부서근태통계</a>
				    </div>
				  </div>
				  <div class="col-9">
				    <div class="tab-content" id="v-pills-tabContent">
				      <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">1</div>
				      <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">2</div>
				      <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">3</div>
				      <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">4</div>
				    </div>
				  </div>
				</div>
			
			</div>
		</div>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">개인근태조회</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>사원이름</th>
								<th>부서</th>
								<th>직급</th>
								<!-- if문으로 출퇴근시간에 값이있으면 -->
								<th>출근시간</th>
								<th>퇴근시간</th>
								<th>근무상태</th>
							</tr>
							<tr>
								<th>사원이름</th>
								<th>부서</th>
								<th>직급</th>
								<!-- if문으로 연차에 값이 있으면 -->
								<th>총연차</th>
								<th>사용연차</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>박영선</td>
								<td>서버계발</td>
								<td>사장님</td>
								<!-- if문으로 출퇴근시간, else if연차 -->
								<td>2021-12-28 09:20:21</td>
								<td>2021-12-28 23:20:21</td>
								<td>퇴근</td>
							</tr>
							<tr>
								<td>박영선</td>
								<td>서버계발</td>
								<td>사장님</td>
								<td>2021-12-28 09:20:21</td>
								<td>2021-12-28 23:20:21</td>
								<td>퇴근</td>
							</tr>
							<tr>
								<td>박영선</td>
								<td>서버계발</td>
								<td>사장님</td>
								<td>2021-12-28 09:20:21</td>
								<td>2021-12-28 23:20:21</td>
								<td>퇴근</td>
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
