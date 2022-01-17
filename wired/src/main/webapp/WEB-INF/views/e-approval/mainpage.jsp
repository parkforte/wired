<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>


<style>
.setW40 {
	width: 40%;
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

.f-left{
	float: left;
}
</style>
<head>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
</head>
<!-- 전자결재HOME -->
<div class="container-fluid">
<%@ include file="include/navbar.jsp"%>
	<div>
		<!-- 차트 -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">나의 문서 상태</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div class="f-center" style="width: 50%; height: 100%;">
						<!--차트가 그려질 부분-->
						<canvas id="doughnut-chart"></canvas>
						<script type="text/javascript">
						new Chart(document.getElementById("doughnut-chart"), {
						    type: 'doughnut',
						    data: {
						      labels: ["결재대기", "결재중", "승인", "반려"],
						      datasets: [
						        {
						          label: "Population (millions)",
						          backgroundColor: ["#7340e3", "#ff00ec","#00ff7b","#ffe400"],
						          data: [${state1},${state2},${state3},${state4}]
						        }
						      ]
						    }
							/* ,
						    options: {
						      title: {
						        display: true,
						        text: '나의 문서 현황'
						      }
						    } */
						});
						</script>
					</div>
				</div>
			</div>
		</div>
		<!-- 결재할 문서목록 -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">바로결재</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<c:if test="${empty confirmingList }">
						<div class="card-body">
						    <p>현재 결재대기중인 문서가 없습니다.</p>
					  	</div>
					</c:if>
					<c:if test="${!empty confirmingList }">
						<c:forEach var="map" items="${confirmingList }">
						<div class="card text-center f-left setMR10" style="width: 15rem;">
					  	<div class="card-body">
						    <h5 class="card-title"><a href="<c:url value='/e-approval/write/detail?cfNo=${map["CF_NO"]}'/>">${map["CF_TITLE"]}</a></h5>
						    <p class="card-text">기안자 : ${map["MEM_NAME"] }</p>
						    <p class="card-text">기안일 :<fmt:formatDate value='${map["CF_REGDATE"] }' pattern="yyyy-MM-dd"/></p>
						    <a href="<c:url value='/e-approval/approval?cfNo=${map["CF_NO"] }'/>" class="btn btn-primary">결재</a>
						    <a href="<c:url value='/e-approval/reject?cfNo=${map["CF_NO"] }'/>" class="btn btn-danger">반려</a>
					  	</div>
					  	</div>
					  	</c:forEach>
					  </c:if>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>
