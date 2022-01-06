<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- 부트스트랩 version 4.6.0 -->
<!-- 부트스트랩 icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<style type="text/css">
body {
	width: 800px;
	margin-left: 50px;
	margin-top: 50px;
}

.mrTop {
	margin: 5px;
}

.f-right {
	float: right;
}
</style>

<body>
	<div class="card shadow mb-4">
		<!-- Card Header - Dropdown -->
		<div
			class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary">결재라인 등록</h6>
		</div>

		<!-- 본문 -->
		<div class="card-body">
				<form method="post" action="<c:url value='/e-approval/confirm/searchEmpl'/>">
			<!-- 1번  -->
			<label for="formGroupExampleInput">1. 사원검색</label>
			<div class="input-group mb-3">
			  <input type="text" class="form-control" placeholder="사원명을 입력하세요" name="memName">
			  <div class="input-group-append">
			    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
			  </div>
			  </form>
			 <select class="custom-select" id="inputGroupSelect04" aria-label="Example select with button addon">
			 	<c:if test="${empty emplList }">
				    <option selected></option>
			 	</c:if>
			 	<c:if test="${!empty emplList }">
				 	<c:forEach var="map" items="${emplList }">
					    <option value="${map['MEM_NO'] }">${map['DEPT_NAME']} ${map['POS_NAME'] } ${map['MEMBER_NAME'] }</option>
				 	</c:forEach>
			 	</c:if>
			  </select>
			  <div class="input-group-append">
			    <button class="btn btn-outline-secondary" type="button">등록</button>
			  </div>
			</div>
			<div class="table-responsive">
					<label for="formGroupExampleInput">2. 결재순서설정</label>
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0" style="text-align: center">
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
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>번호</td>
								<td>부서명</td>
								<td>직급명</td>
								<td>이름</td>
								<td></td>
							</tr>
						</tbody>
					</table>
					 <div class="form-group">
					    <label for="formGroupExampleInput">3. 라인생성</label>
					    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="결재라인명을 입력하세요">
					  </div>
			<div class="f-right">
				<button type="button" class="btn btn-secondary">닫기</button>
				<button type="submit" class="btn btn-success">라인생성</button>
			</div>
		</div>
	</div>
</body>
</html>