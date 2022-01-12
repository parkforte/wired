<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/commute/commuteList -->
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

.btn-primary{
	font-size: 0.7em;
	margin-left: 2px;
}

</style>
<!-- javaScript영역 -->


<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">근태관리</h1>
	<p class="mb-4">Attendance management.</p>
	<div>
		 <!-- nav -->
         <ul class="nav">
          <li class="nav-item">
            <a class="nav-link active" id="a-hover" data-value="1" href="<c:url value='/commute/commuteList'/>">개인근태조회</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-value="2" id="a-hover" href="<c:url value='/jawon/jawonReserve?typeNo=2'/>">개인연차조회</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-value="3" id="a-hover" href="<c:url value='/commute/commuteDList'/>">부서근태조회</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-value="3" id="a-hover" href="<c:url value='/commute/commuteGraph'/>">부서근태통계</a>
          </li>
        </ul>
		<!-- title1 -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary f-left">
            		<c:if test="${!empty deptNo }">
            			부서근태조회
            		</c:if>
            		<c:if test="${empty deptNo }">
						개인근태조회
            		</c:if>
					<input type="text" value="${deptNo}">
				</h6>
				<div id="se2_sample"  class="f-right">
					<button type="button" class="btn btn-primary f-left" id="btIn"
						onclick="location.href='<c:url value="/commute/commuteIn"/>'">출근</button>
					<button type="button" class="btn btn-primary f-left"  id="btOut"
						onclick="location.href='<c:url value="/commute/commuteOut"/>'">퇴근</button>
	    		</div>
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
<!-- 							<tr> -->
<!-- 								<th>사원이름</th> -->
<!-- 								<th>부서</th> -->
<!-- 								<th>직급</th> -->
<!-- 								if문으로 연차에 값이 있으면 -->
<!-- 								<th>총연차</th> -->
<!-- 								<th>사용연차</th> -->
<!-- 							</tr> -->
						</thead>
						<tbody>
							<c:forEach var="map" items="${clist }">
								<tr>
									<td>${map['MEM_NAME'] }</td>
									<td>${map['DEPT_NAME'] }</td>
									<td>${map['POS_NAME'] }</td>
									<!-- if문으로 출퇴근시간, else if연차 -->
									<td><fmt:formatDate value="${map['COM_INDATE'] }" type="both"/></td>
									<td><fmt:formatDate value="${map['COM_OUTDATE'] }" type="both"/></td>
									<td>
										<input type="text" value="${map['COM_STATUS']}">
										<c:if test="${map['COM_STATUS'] == 'Y'}">
											<span>출근</span>
										</c:if>
										<c:if test="${map['COM_STATUS'] == 'N'}">
											<span>퇴근</span>
										</c:if>
									</td>
								</tr>
							</c:forEach>
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
