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
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">상세정보</h6>
				</div>

				<!-- 본문 -->
				<div class="card-body">

						<!-- 1번  -->
						<label for="formGroupExampleInput">1. 사원검색</label>
						<form method="post"
							action="<c:url value='/e-approval/confirm/searchMember'/>">
							<div class="input-group-append">
								<input type="text" name="regNo"  value="${param.regNo }">
								<input type="text" class="form-control" placeholder="사원명을 입력하세요"
									id="memName" name="memName" value="${mem['MEM_NAME'] }">
								<input class="btn btn-outline-secondary" type="submit"
									value="검색">
							</div>
						</form>
						<br>
						<form method="post"
							action="<c:url value='/e-approval/confirm/addLineOrder'/>">
							<div class="input-group-append">
								<input type="text" name="regNo" value="${param.regNo }">
								<select class="custom-select" name="lineOrder" id="lineOrder"
									aria-label="Example select with button addon">
									<option selected>결재순서선택</option>
									<option value="1">No.1</option>
									<option value="2">No.2</option>
								</select> <select class="custom-select" name="memNo" id="memNo"
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
								</select> <input class="btn btn-outline-secondary" type="submit"
									value="등록">
							</div>
						</form>
						<br>
						<div class="table-responsive">
							<label for="formGroupExampleInput">2. 결재순서확인</label>
							<table class="table table-bordered" id="dataTable"
								style="width: 100%; text-align: center;">
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
										<c:forEach var="map" items="${confirmlineList }">
											<tr>
												<td>No.${map['LINE_ORDER'] }</td>
												<td>${map['DEPT_NAME'] }</td>
												<td>${map['POS_NAME'] }</td>
												<td>${map['MEM_NAME'] }</td>
												<td>
												<a href="<c:url value='/e-approval/confirm/deleteOrder?regNo=${map["REG_NO"]}&memNo=${map["MEM_NO"]}'/>"
											class="btn btn-danger">삭제</a>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							<a href="<c:url value='/e-approval/confirm/confirmAdmin'/>"
											class="btn btn-secondary f-right">목록</a>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- /.container-fluid -->

<%@ include file="../../inc/bottom.jsp"%>