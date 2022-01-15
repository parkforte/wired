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
<!-- 전자결재HOME -->
<div class="container-fluid">
<%@ include file="include/navbar.jsp"%>
	<div>
		<!-- 차트 -->
		<div class="card shadow mb-4" style="height: 400px">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">최근 7일간 결재완료 문서건수</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div class="f-center" style="width: 50%;">
						<!--차트가 그려질 부분-->
						<canvas id="myChart"></canvas>
						<script type="text/javascript">
						    var context = document
						        .getElementById('myChart')
						        .getContext('2d');
						    var myChart = new Chart(context, {
						        type: 'bar', // 차트의 형태
						        data: { // 차트에 들어갈 데이터
						            labels: [
						                //x 축
						                '1','2','3','4','5','6','7'
						            ],
						            datasets: [
						                { //데이터
						                    label: 'test1', //차트 제목
						                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						                    data: [
						                        0,1,2,3,4,5,6 //x축 label에 대응되는 데이터 값
						                    ],
						                    backgroundColor: [
						                        //색상
						                        'rgba(255, 99, 132, 0.2)',
						                        'rgba(54, 162, 235, 0.2)',
						                        'rgba(255, 206, 86, 0.2)',
						                        'rgba(75, 192, 192, 0.2)',
						                        'rgba(153, 102, 255, 0.2)',
						                        'rgba(255, 159, 64, 0.2)'
						                    ],
						                    borderColor: [
						                        //경계선 색상
						                        'rgba(255, 99, 132, 1)',
						                        'rgba(54, 162, 235, 1)',
						                        'rgba(255, 206, 86, 1)',
						                        'rgba(75, 192, 192, 1)',
						                        'rgba(153, 102, 255, 1)',
						                        'rgba(255, 159, 64, 1)'
						                    ],
						                    borderWidth: 1 //경계선 굵기
						                }/* ,
						                {
						                    label: 'test2',
						                    fill: false,
						                    data: [
						                        8, 34, 12, 24
						                    ],
						                    backgroundColor: 'rgb(157, 109, 12)',
						                    borderColor: 'rgb(157, 109, 12)'
						                } */
						            ]
						        },
						        options: {
						            scales: {
						                yAxes: [
						                    {
						                        ticks: {
						                            beginAtZero: true
						                        }
						                    }
						                ]
						            }
						        }
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
						    <h5 class="card-title">${map["CF_TITLE"] }</h5>
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
