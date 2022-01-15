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
            		부서근태통계
				</h6>

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
						                        21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
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

	</div>
</div>
<!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp"%>
