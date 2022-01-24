<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/organChart/organizationChart -->
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
	<h1 class="h3 mb-2 text-gray-800">조직도</h1>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="collapse navbar-collapse" id="navbarScroll">
			<ul class="navbar-nav mr-auto my-2 my-lg-0 navbar-nav-scroll"
				style="max-height: 100px;">
			</ul>
		</div>
	</nav>

	<div>
		<!-- title1 -->
		<div class="card shadow mb-4 setW20 setMR10 f-left">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">WIRED 조직도</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div id="">
						<ul>
							<c:import url="/organChart/organizationChartDept"> </c:import>
							</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary" >${param.deptName }</h6>

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
								<c:if test="${empty organList }">
									<tr>
										<td colspan="5">부서를 선택하세요.</td>
									</tr>
								</c:if>
								<c:if test="${!empty organList }">
									<!-- 리스트 반복문 시작 -->
									<c:forEach var="vo" items="${organList }">
										<tr>
											<td>${vo.memName }</td>
											<td>${vo.memHp1 } - ${vo.memHp2 } - ${vo.memHp3 }</td>
											<td>${vo.memEmail1 } @ ${vo.memEmail2 }</td>
											<td>${vo.deptName }</td>
											<td>${vo.posName }</td>

										</tr>
									</c:forEach>
								</c:if>
								<!-- 반복 끝 -->
							</tbody>
					</table>
					<!-- 페이징 -->
					<div class="row">
						<div class="col-sm-12 col-md-5">
							<div class="dataTables_info" id="dataTables_info" role="status">
								Showing ${pagingInfo.firstPage } to ${pagingInfo.currentPage }
								of ${pagingInfo.totalPage } entries</div>

						</div>


				</div>
			</div>
		</div>

	</div>
</div>
<!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp"%>