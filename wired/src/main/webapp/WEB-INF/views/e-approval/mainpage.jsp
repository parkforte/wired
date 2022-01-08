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
		<!-- title1 -->
		<div class="card shadow mb-4 setW40 setMR10 f-left" style="height: 400px">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">D-DAY</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
				<!--
				--emp테이블에서 사원의 입사일 90일 후의 날짜?
				select ename, hiredate, hiredate+90 from emp;

				--emp테이블에서 사원의 입사후 1년이 되는 날짜?
				select ename,hiredate,add_months(hiredate,12) from emp;

				--오늘부터 크리스마스까지 남은 일수는?
				select to_date('2021-12-25') - sysdate from dual;
				select to_date('2021-12-25') - trunc(sysdate) from dual;

				--오늘부터 크리스마스까지 남은 달수는? (months_between)
				select months_between('2021-12-25',sysdate) from dual;
				 -->
				</div>
			</div>
		</div>

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
		<!-- 결재할 문서목록 -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">결재해야 할 문서</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div class="card text-center f-left setMR10" style="width: 15rem;">
					  	<div class="card-body">
						    <h5 class="card-title">품의서</h5>
						    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
						    <a href="#" class="btn btn-primary">Go somewhere</a>
					  	</div>
					</div>

				</div>
			</div>
		</div>

	</div>
</div>
<!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp"%>
