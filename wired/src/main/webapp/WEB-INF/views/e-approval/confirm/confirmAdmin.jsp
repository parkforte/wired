<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<!-- 2 load the theme CSS file -->
<link rel="stylesheet"
	href="<c:url value='/resources/api/jsTree/dist/themes/proton/style.min.css' />" />

<style>
.setW25 {
	width: 25%;
}

.setW75 {
	width: 75%;
}

.setMR10 {
	margin-right: 10px;
}

.f-center {
	margin: 0 auto;
}
</style>
<!-- javaScript영역 -->
<script type="text/javascript">
	$(funtion(){
		$('')
	});
</script>
<!-- 전자결재HOME -->
<div>
	<div class="container-fluid">
		<%@ include file="../include/navbar.jsp"%>
		<div>
			<!-- title1 -->
			<div class="card shadow mb-4 setW25 setMR10 f-left">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">결재라인종류</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive t-center">
						<c:if test="${empty lineregList }">
							<table class="table table-bordered" id="dataTable" style="width: 100%;">
								<tr>
									<td colspan="2">비어있음</td>
								</tr>
							</table>
						</c:if>
						<c:if test="${!empty lineregList }">
							<c:forEach var="vo" items="${lineregList }">
									<table class="table table-bordered " id="dataTable" style="width: 100%;">
										<colgroup>
											<col width="70%">
											<col width="30%">
										</colgroup>
										<tr>
											<td>
											<a href="<c:url value='/e-approval/confirm/confirmAdmin?regNo=${vo.regNo }'/>">
											<i class="bi bi-clipboard">
											</i> ${vo.regName }
											</a>
											</td>
											<td>
												<!-- 종류삭제 --> <a
												href="<c:url value='/e-approval/confirm/deleteLine?regNo=${vo.regNo}'/>">
													<button type="button" class="btn btn-danger f-left">삭제</button>
											</a>
											</td>
										</tr>
									</table>
							</c:forEach>
						</c:if>
						<br>
						<div class="f-center">
							<form method="post"
								action="<c:url value='/e-approval/confirm/addLine'/>">
								<button type="button" class="btn btn-primary f-left"
									data-toggle="modal" data-target="#exampleModal"
									data-whatever="@mdo">추가</button>
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">결재라인추가</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<input type="text" class="form-control" name="regName"
														id="regName" placeholder="결재라인의 이름을 입력하세요.">
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">취소</button>
												<button type="submit" class="btn btn-primary">등록</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="card shadow mb-4">
			<!-- Card Header - Dropdown -->
			<div
				class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">상세정보</h6>
			</div>

			<!-- 본문 -->
			<div class="card-body">
				<c:if test="${empty param.regNo }">
					<div class="card mb-4 py-3 border-left-secondary">
                         <div class="card-body">
                             먼저 결재라인 종류를 선택해주세요.
                         </div>
                     </div>
				</c:if>

				<c:if test="${!empty param.regNo}">
				<!-- 1번  -->
				<label for="formGroupExampleInput">1. 사원검색</label>
				<form method="get"
					action="<c:url value='/e-approval/confirm/confirmAdmin?regNo=${param.regNo }'/>">
					<div class="input-group-append">
						<input type="text" class="form-control" placeholder="사원명을 입력하세요"
							id="memName" name="memName" value="${mem['MEM_NAME'] }">
						<input class="btn btn-outline-secondary" type="submit" value="검색">
					</div>
				</form>
				<br>
				<form method="post"
					action="<c:url value='/e-approval/confirm/lineOrder'/>">
					<div class="input-group-append">
						<select class="custom-select" id="inputGroupSelect04"
							aria-label="Example select with button addon">
							<option selected>결재순서선택</option>
							<option value="1">No.1</option>
							<option value="2">No.2</option>
						</select> <select class="custom-select" id="inputGroupSelect04"
							aria-label="Example select with button addon">
							<c:if test="${empty emplList }">
								<option selected>사원선택</option>
							</c:if>
							<c:if test="${!empty emplList }">
								<c:forEach var="map" items="${emplList }">
									<option value="${map['MEM_NO'] }">${map['DEPT_NAME']}
										${map['POS_NAME'] } ${map['MEMBER_NAME'] }</option>
								</c:forEach>
							</c:if>
						</select> <input class="btn btn-outline-secondary" type="submit" value="등록">
					</div>
				</form>
				<br>
				<div class="table-responsive">
					<label for="formGroupExampleInput">2. 결재순서확인</label>
					<table class="table table-bordered" id="dataTable"  style="width:100%; text-align: center;">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<thead>
							<tr>
								<th>결재순서</th>
								<th>부서</th>
								<th>직급</th>
								<th>이름</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${empty confirmlineList }">
							<tr>
							<td colspan="5">사원조회 후 결재순서를 등록해주세요.</td>
							</tr>
						</c:if>
						<c:if test="${!empty confirmlineList }">
						<c:forEach var="confirmVo" items="${confirmlineList }">
							<tr>
								<td>${confirmVo.lineOrder }</td>
								<td>${confirmVo.memNo }</td>
								<td>${confirmVo.memNo }</td>
								<td>${confirmVo.memNo }</td>
								<td></td>
							</tr>
						</c:forEach>
						</c:if>
						</tbody>
					</table>
				</div>
				</c:if>
			</div>
		</div>
	</div>
</div>

<!-- /.container-fluid -->

<%@ include file="../../inc/bottom.jsp"%>
